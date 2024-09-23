ProtocolDescriptor *_transferRepresentationDescriptor()
{
  return &protocol descriptor for TransferRepresentation;
}

uint64_t _callVisitTransferRepresentationType1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _callVisitTransferRepresentationType2(a1, a2, a2, a3);
}

void sub_20833DA94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_20833DB2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_20833DBC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_20833DC5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t UIFoundationLibrary()
{
  uint64_t v0;
  void *v2;

  if (!UIFoundationLibraryCore_frameworkLibrary)
    UIFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = UIFoundationLibraryCore_frameworkLibrary;
  if (!UIFoundationLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void static Never.transferRepresentation.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

_UNKNOWN **associated type witness table accessor for TransferRepresentation.Body : TransferRepresentation in Never()
{
  return &protocol witness table for Never;
}

_UNKNOWN **associated type witness table accessor for TransferRepresentation.Item : Transferable in Never()
{
  return &protocol witness table for Never;
}

void protocol witness for static Transferable.transferRepresentation.getter in conformance Never()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t static AttributedString.transferRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char *v2;
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
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
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[6];
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

  v41 = a1;
  type metadata accessor for UTType();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v2 = (char *)&v35 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataRepresentation<AttributedString>);
  v42 = v3;
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v37 = (uint64_t)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v43 = (uint64_t)&v35 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v35 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalTransferRepresentation<DataRepresentation<AttributedString>>);
  v39 = v10;
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v40 = (uint64_t)&v35 - v14;
  static UTType.flatRTFD.getter();
  v15 = type metadata accessor for AttributedString();
  v16 = lazy protocol witness table accessor for type AttributedString and conformance AttributedString(&lazy protocol witness table cache variable for type AttributedString and conformance AttributedString, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], (uint64_t)&protocol conformance descriptor for AttributedString);
  DataRepresentation.init(contentType:exporting:importing:)((uint64_t)v2, (uint64_t)&async function pointer to closure #1 in static AttributedString.flatRTFDRepresentation.getter, 0, (uint64_t)&async function pointer to closure #2 in static AttributedString.flatRTFDRepresentation.getter, 0, v15, v16, (uint64_t)v9);
  v17 = lazy protocol witness table accessor for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>(&lazy protocol witness table cache variable for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>, &demangling cache variable for type metadata for DataRepresentation<AttributedString>, (uint64_t)&protocol conformance descriptor for DataRepresentation<A>);
  TransferRepresentation.exportingCondition(_:)((uint64_t)closure #3 in static AttributedString.flatRTFDRepresentation.getter, 0, v3, v17, v13);
  v36 = v9;
  outlined destroy of DataRepresentation<AttributedString>((uint64_t)v9, &demangling cache variable for type metadata for DataRepresentation<AttributedString>);
  v38 = lazy protocol witness table accessor for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>(&lazy protocol witness table cache variable for type _ConditionalTransferRepresentation<DataRepresentation<AttributedString>> and conformance _ConditionalTransferRepresentation<A>, &demangling cache variable for type metadata for _ConditionalTransferRepresentation<DataRepresentation<AttributedString>>, (uint64_t)&protocol conformance descriptor for _ConditionalTransferRepresentation<A>);
  static TransferRepresentationBuilder.buildExpression<A>(_:)(v13, v15, v10, v38);
  outlined destroy of DataRepresentation<AttributedString>((uint64_t)v13, &demangling cache variable for type metadata for _ConditionalTransferRepresentation<DataRepresentation<AttributedString>>);
  static UTType.rtf.getter();
  v18 = v43;
  DataRepresentation.init(contentType:exporting:importing:)((uint64_t)v2, (uint64_t)&async function pointer to closure #1 in static AttributedString.rtfRepresentation.getter, 0, (uint64_t)&async function pointer to closure #2 in static AttributedString.rtfRepresentation.getter, 0, v15, v16, v43);
  v19 = v42;
  static TransferRepresentationBuilder.buildExpression<A>(_:)(v18, v15, v42, v17);
  outlined destroy of DataRepresentation<AttributedString>(v18, &demangling cache variable for type metadata for DataRepresentation<AttributedString>);
  static UTType.html.getter();
  v20 = v37;
  DataRepresentation.init(importedContentType:importing:)((uint64_t)v2, (uint64_t)&async function pointer to closure #1 in static AttributedString.htmlRepresentation.getter, 0, v15, v16, v37);
  static TransferRepresentationBuilder.buildExpression<A>(_:)(v20, v15, v19, v17);
  outlined destroy of DataRepresentation<AttributedString>(v20, &demangling cache variable for type metadata for DataRepresentation<AttributedString>);
  v21 = lazy protocol witness table accessor for type String and conformance String();
  ProxyRepresentation.init(exporting:importing:)((uint64_t)closure #1 in static AttributedString.transferRepresentation.getter, 0, (uint64_t)closure #2 in static AttributedString.transferRepresentation.getter, 0, v15, MEMORY[0x24BEE0D00], v16, v21, &v45);
  v22 = v45;
  v23 = v47;
  v24 = v49;
  v44[0] = v45;
  v44[1] = v46;
  v44[2] = v47;
  v44[3] = v48;
  v44[4] = v49;
  v44[5] = v50;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ProxyRepresentation<AttributedString, String>);
  v26 = lazy protocol witness table accessor for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>(&lazy protocol witness table cache variable for type ProxyRepresentation<AttributedString, String> and conformance ProxyRepresentation<A, B>, &demangling cache variable for type metadata for ProxyRepresentation<AttributedString, String>, (uint64_t)&protocol conformance descriptor for ProxyRepresentation<A, B>);
  static TransferRepresentationBuilder.buildExpression<A>(_:)(v44, v15, v25, v26);
  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(v22);
  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(v23);
  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(v24);
  v27 = v51;
  v28 = v53;
  v29 = v55;
  v45 = v51;
  v46 = v52;
  v47 = v53;
  v48 = v54;
  v49 = v55;
  v50 = v56;
  v34 = v25;
  v30 = v40;
  v31 = (uint64_t)v36;
  v32 = v43;
  static TransferRepresentationBuilder.buildBlock<A, B, C, D>(_:_:_:_:)(v40, (uint64_t)v36, v43, (uint64_t)&v45, v15, v39, v42, v42, v41, v34, v38);
  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(v27);
  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(v28);
  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(v29);
  outlined destroy of DataRepresentation<AttributedString>(v32, &demangling cache variable for type metadata for DataRepresentation<AttributedString>);
  outlined destroy of DataRepresentation<AttributedString>(v31, &demangling cache variable for type metadata for DataRepresentation<AttributedString>);
  return outlined destroy of DataRepresentation<AttributedString>(v30, &demangling cache variable for type metadata for _ConditionalTransferRepresentation<DataRepresentation<AttributedString>>);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x20BD054A8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t closure #1 in static AttributedString.transferRepresentation.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t (*v2)(uint64_t);
  uint64_t result;
  uint64_t v4;

  type metadata accessor for AttributedString.CharacterView();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCC290];
  MEMORY[0x24BDAC7A8]();
  AttributedString.characters.getter();
  lazy protocol witness table accessor for type AttributedString and conformance AttributedString(&lazy protocol witness table cache variable for type AttributedString.CharacterView and conformance AttributedString.CharacterView, v2, MEMORY[0x24BDCC2A8]);
  result = String.init<A>(_:)();
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t closure #2 in static AttributedString.transferRepresentation.getter()
{
  type metadata accessor for AttributeContainer();
  MEMORY[0x24BDAC7A8]();
  swift_bridgeObjectRetain();
  AttributeContainer.init()();
  return AttributedString.init(_:attributes:)();
}

uint64_t closure #1 in static AttributedString.flatRTFDRepresentation.getter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[18] = a1;
  v2 = type metadata accessor for AttributedString();
  v1[19] = v2;
  v1[20] = *(_QWORD *)(v2 - 8);
  v1[21] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #1 in static AttributedString.flatRTFDRepresentation.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t inited;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  Class isa;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v27;

  v2 = *(_QWORD *)(v0 + 160);
  v1 = *(_QWORD *)(v0 + 168);
  v4 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 152);
  type metadata accessor for NSAttributedString();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = (void *)NSAttributedString.init(_:)();
  v6 = objc_msgSend(v5, sel_length);
  v7 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(AnyHashable, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2083634C0;
  v9 = (void *)objc_opt_self();
  v10 = v5;
  v11 = objc_msgSend(v9, sel_documentType);
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v14 = v13;

  *(_QWORD *)(v0 + 120) = v12;
  *(_QWORD *)(v0 + 128) = v14;
  v15 = MEMORY[0x24BEE0D00];
  AnyHashable.init<A>(_:)();
  v16 = objc_msgSend(v9, sel_rtfd);
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v19 = v18;

  *(_QWORD *)(inited + 96) = v15;
  *(_QWORD *)(inited + 72) = v17;
  *(_QWORD *)(inited + 80) = v19;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 136) = 0;
  v21 = objc_msgSend(v7, sel_dataFromAttributedString_range_documentAttributes_error_, v10, 0, v6, isa, v0 + 136);

  v22 = *(id *)(v0 + 136);
  if (v21)
  {
    v23 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v25 = v24;

    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v23, v25);
  }
  else
  {
    v27 = v22;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<AnyHashable, Any>);
  v2 = static _DictionaryStorage.allocate(capacity:)();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    outlined init with copy of (AnyHashable, Any)(v6, (uint64_t)v15);
    result = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)outlined init with take of Any(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
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

uint64_t closure #2 in static AttributedString.flatRTFDRepresentation.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[19] = a2;
  v3[20] = a3;
  v3[18] = a1;
  return swift_task_switch();
}

uint64_t closure #2 in static AttributedString.flatRTFDRepresentation.getter()
{
  uint64_t v0;
  void *v1;
  Class isa;
  uint64_t inited;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  Class v14;
  id v15;
  void *v16;
  id v17;
  id v18;

  v1 = (void *)objc_opt_self();
  isa = Data._bridgeToObjectiveC()().super.isa;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(AnyHashable, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2083634C0;
  v4 = (void *)objc_opt_self();
  v5 = objc_msgSend(v4, sel_documentType);
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;

  *(_QWORD *)(v0 + 120) = v6;
  *(_QWORD *)(v0 + 128) = v8;
  v9 = MEMORY[0x24BEE0D00];
  AnyHashable.init<A>(_:)();
  v10 = objc_msgSend(v4, sel_rtfd);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = v12;

  *(_QWORD *)(inited + 96) = v9;
  *(_QWORD *)(inited + 72) = v11;
  *(_QWORD *)(inited + 80) = v13;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  v14 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 136) = 0;
  v15 = objc_msgSend(v1, sel_attributedStringFromData_options_documentAttributes_error_, isa, v14, 0, v0 + 136);

  v16 = *(void **)(v0 + 136);
  if (v15)
  {
    v17 = v16;
    AttributedString.init(_:)();
  }
  else
  {
    v18 = v16;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t closure #3 in static AttributedString.flatRTFDRepresentation.getter()
{
  return 1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x20BD054B4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t outlined destroy of DataRepresentation<AttributedString>(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t closure #1 in static AttributedString.rtfRepresentation.getter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[18] = a1;
  v2 = type metadata accessor for AttributedString();
  v1[19] = v2;
  v1[20] = *(_QWORD *)(v2 - 8);
  v1[21] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #1 in static AttributedString.rtfRepresentation.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t inited;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  Class isa;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v27;

  v2 = *(_QWORD *)(v0 + 160);
  v1 = *(_QWORD *)(v0 + 168);
  v4 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 152);
  type metadata accessor for NSAttributedString();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = (void *)NSAttributedString.init(_:)();
  v6 = objc_msgSend(v5, sel_length);
  v7 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(AnyHashable, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2083634C0;
  v9 = (void *)objc_opt_self();
  v10 = v5;
  v11 = objc_msgSend(v9, sel_documentType);
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v14 = v13;

  *(_QWORD *)(v0 + 120) = v12;
  *(_QWORD *)(v0 + 128) = v14;
  v15 = MEMORY[0x24BEE0D00];
  AnyHashable.init<A>(_:)();
  v16 = objc_msgSend(v9, "rtf");
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v19 = v18;

  *(_QWORD *)(inited + 96) = v15;
  *(_QWORD *)(inited + 72) = v17;
  *(_QWORD *)(inited + 80) = v19;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 136) = 0;
  v21 = objc_msgSend(v7, sel_dataFromAttributedString_range_documentAttributes_error_, v10, 0, v6, isa, v0 + 136);

  v22 = *(id *)(v0 + 136);
  if (v21)
  {
    v23 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v25 = v24;

    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v23, v25);
  }
  else
  {
    v27 = v22;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t closure #2 in static AttributedString.rtfRepresentation.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[19] = a2;
  v3[20] = a3;
  v3[18] = a1;
  return swift_task_switch();
}

uint64_t closure #2 in static AttributedString.rtfRepresentation.getter()
{
  uint64_t v0;
  void *v1;
  Class isa;
  uint64_t inited;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  Class v14;
  id v15;
  void *v16;
  id v17;
  id v18;

  v1 = (void *)objc_opt_self();
  isa = Data._bridgeToObjectiveC()().super.isa;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(AnyHashable, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2083634C0;
  v4 = (void *)objc_opt_self();
  v5 = objc_msgSend(v4, sel_documentType);
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;

  *(_QWORD *)(v0 + 120) = v6;
  *(_QWORD *)(v0 + 128) = v8;
  v9 = MEMORY[0x24BEE0D00];
  AnyHashable.init<A>(_:)();
  v10 = objc_msgSend(v4, "rtf");
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = v12;

  *(_QWORD *)(inited + 96) = v9;
  *(_QWORD *)(inited + 72) = v11;
  *(_QWORD *)(inited + 80) = v13;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  v14 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 136) = 0;
  v15 = objc_msgSend(v1, sel_attributedStringFromData_options_documentAttributes_error_, isa, v14, 0, v0 + 136);

  v16 = *(void **)(v0 + 136);
  if (v15)
  {
    v17 = v16;
    AttributedString.init(_:)();
  }
  else
  {
    v18 = v16;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t closure #1 in static AttributedString.htmlRepresentation.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[19] = a2;
  v3[20] = a3;
  v3[18] = a1;
  return swift_task_switch();
}

uint64_t closure #1 in static AttributedString.htmlRepresentation.getter()
{
  uint64_t v0;
  void *v1;
  Class isa;
  uint64_t inited;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  Class v14;
  id v15;
  void *v16;
  id v17;
  id v18;

  v1 = (void *)objc_opt_self();
  isa = Data._bridgeToObjectiveC()().super.isa;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(AnyHashable, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2083634C0;
  v4 = (void *)objc_opt_self();
  v5 = objc_msgSend(v4, sel_documentType);
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;

  *(_QWORD *)(v0 + 120) = v6;
  *(_QWORD *)(v0 + 128) = v8;
  v9 = MEMORY[0x24BEE0D00];
  AnyHashable.init<A>(_:)();
  v10 = objc_msgSend(v4, sel_html);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = v12;

  *(_QWORD *)(inited + 96) = v9;
  *(_QWORD *)(inited + 72) = v11;
  *(_QWORD *)(inited + 80) = v13;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  v14 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 136) = 0;
  v15 = objc_msgSend(v1, sel_attributedStringFromData_options_documentAttributes_error_, isa, v14, 0, v0 + 136);

  v16 = *(void **)(v0 + 136);
  if (v15)
  {
    v17 = v16;
    AttributedString.init(_:)();
  }
  else
  {
    v18 = v16;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    result = MEMORY[0x20BD054C0](&protocol conformance descriptor for String, MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    result = MEMORY[0x20BD054C0](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

uint64_t _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t associated type witness table accessor for Transferable.Representation : TransferRepresentation in AttributedString()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20833F710()
{
  return lazy protocol witness table accessor for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>(&lazy protocol witness table cache variable for type TupleTransferRepresentation<AttributedString, (_ConditionalTransferRepresentation<DataRepresentation<AttributedString>>, DataRepresentation<AttributedString>, DataRepresentation<AttributedString>, ProxyRepresentation<AttributedString, String>)> and conformance TupleTransferRepresentation<A, B>, &demangling cache variable for type metadata for TupleTransferRepresentation<AttributedString, (_ConditionalTransferRepresentation<DataRepresentation<AttributedString>>, DataRepresentation<AttributedString>, DataRepresentation<AttributedString>, ProxyRepresentation<AttributedString, String>)>, (uint64_t)&protocol conformance descriptor for TupleTransferRepresentation<A, B>);
}

uint64_t lazy protocol witness table accessor for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x20BD054C0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type AttributedString and conformance AttributedString(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x20BD054C0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
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

uint64_t outlined init with copy of (AnyHashable, Any)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (AnyHashable, Any));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
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
      v7 = MEMORY[0x20BD04ECC](v9, a1);
      outlined destroy of AnyHashable((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t outlined init with copy of AnyHashable(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t outlined destroy of AnyHashable(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

unint64_t type metadata accessor for NSAttributedString()
{
  unint64_t result;

  result = lazy cache variable for type metadata for NSAttributedString;
  if (!lazy cache variable for type metadata for NSAttributedString)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSAttributedString);
  }
  return result;
}

uint64_t ResolvedTransferRepresentation.exporter.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 32));
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v1);
  return v1;
}

uint64_t outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t ResolvedTransferRepresentation.exporter.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t result;

  v5 = (uint64_t *)(v2 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 32));
  result = _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(*v5);
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t ResolvedTransferRepresentation.importer.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 36));
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v1);
  return v1;
}

uint64_t ResolvedTransferRepresentation.importer.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t result;

  v5 = (uint64_t *)(v2 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 36));
  result = _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(*v5);
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t _TransferRepresentationOutputs.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporter:importer:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, __int128 a10, __int128 a11, uint64_t a12, uint64_t a13)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  _QWORD *v33;
  uint64_t v34;

  v32 = a4;
  v30 = a2;
  v31 = a3;
  v33 = a9;
  v28 = a11;
  v29 = a10;
  v26 = a13;
  v27 = a12;
  v18 = type metadata accessor for UTType();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v26 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ResolvedTransferRepresentation>);
  v22 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ResolvedTransferRepresentation() - 8) + 80);
  v23 = (v22 + 32) & ~v22;
  v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_2083634C0;
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, a1, v18);
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(a5);
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(a7);
  ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:)((uint64_t)v21, v30, v31, v32, a5, a6, a7, a8, v24 + v23, v29, *((uint64_t *)&v29 + 1), v28, *((uint64_t *)&v28 + 1), v27, v26);
  _TransferRepresentationOutputs.init(_:)((Swift::OpaquePointer)v24);
  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(a7);
  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(a5);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 8))(a1, v18);
  *v33 = v34;
  return result;
}

uint64_t TransferRepresentation.visibility(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;

  v8 = *(_QWORD *)(a2 - 8);
  v9 = (uint64_t *)MEMORY[0x24BDAC7A8](a1);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v9;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v4, a2);
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(a4, v11, a2);
  result = type metadata accessor for _VisibleTransferRepresentation(0, a2, a3, v13);
  *(_QWORD *)(a4 + *(int *)(result + 36)) = v12;
  return result;
}

uint64_t type metadata accessor for _VisibleTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _VisibleTransferRepresentation);
}

uint64_t static _VisibleTransferRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
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
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[2];
  char v24[16];
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;

  v23[0] = a1;
  v23[1] = a4;
  v6 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for _TransferRepresentationValue(0, v9, v9, v10);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v23 - v13;
  v16 = type metadata accessor for _VisibleTransferRepresentation(0, a2, a3, v15);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)v23 - v18;
  (*(void (**)(char *, _QWORD, uint64_t))(v17 + 16))((char *)v23 - v18, v23[0], v16);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v19, a2);
  _TransferRepresentationValue.init(_:)((uint64_t)v8, a2, (uint64_t)v14);
  (*(void (**)(uint64_t *__return_ptr, char *))(a3 + 48))(&v28, v14);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v25 = a2;
  v26 = a3;
  v27 = v19;
  v20 = type metadata accessor for ResolvedTransferRepresentation();
  v21 = _TransferRepresentationOutputs.map<A>(_:)((uint64_t)partial apply for closure #1 in static _VisibleTransferRepresentation._decomposedTransferRepresentation(_:inputs:), (uint64_t)v24, v20);
  swift_bridgeObjectRelease();
  _TransferRepresentationOutputs.init(_:)((Swift::OpaquePointer)v21);
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, v16);
}

uint64_t partial apply for closure #1 in static _VisibleTransferRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v4 = v2[2];
  v5 = v2[3];
  v6 = v2[4];
  outlined init with copy of ResolvedTransferRepresentation(a1, a2);
  v8 = *(_QWORD *)(v6 + *(int *)(type metadata accessor for _VisibleTransferRepresentation(0, v4, v5, v7) + 36));
  result = type metadata accessor for ResolvedTransferRepresentation();
  *(_QWORD *)(a2 + *(int *)(result + 44)) = v8;
  return result;
}

_UNKNOWN **associated type witness table accessor for TransferRepresentation.Body : TransferRepresentation in _VisibleTransferRepresentation<A>()
{
  return &protocol witness table for Never;
}

uint64_t associated type witness table accessor for TransferRepresentation.Item : Transferable in _VisibleTransferRepresentation<A>()
{
  return swift_getAssociatedConformanceWitness();
}

void protocol witness for TransferRepresentation.body.getter in conformance _VisibleTransferRepresentation<A>(uint64_t a1)
{
  MEMORY[0x20BD054C0](&protocol conformance descriptor for _VisibleTransferRepresentation<A>, a1);
  PrimitiveTransferRepresentation.body.getter();
}

uint64_t protocol witness for static TransferRepresentation._decomposedTransferRepresentation(_:inputs:) in conformance _VisibleTransferRepresentation<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return static _VisibleTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a3);
}

uint64_t instantiation function for generic protocol witness table for _VisibleTransferRepresentation<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x20BD054C0](&protocol conformance descriptor for _VisibleTransferRepresentation<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata instantiation function for _VisibleTransferRepresentation()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata completion function for _VisibleTransferRepresentation()
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

uint64_t *initializeBufferWithCopyOfBuffer for _VisibleTransferRepresentation(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    *(_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFF8);
  }
  return v4;
}

uint64_t destroy for _VisibleTransferRepresentation(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
}

uint64_t initializeWithCopy for _VisibleTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t assignWithCopy for _VisibleTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t initializeWithTake for _VisibleTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t assignWithTake for _VisibleTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t getEnumTagSinglePayload for _VisibleTransferRepresentation(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 >= a2)
  {
    if (v5)
      return (*(uint64_t (**)(void))(v4 + 48))();
    return 0;
  }
  if (((((*(_QWORD *)(v4 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
    v6 = 2;
  else
    v6 = a2 - v5 + 1;
  if (v6 >= 0x10000)
    v7 = 4;
  else
    v7 = 2;
  if (v6 < 0x100)
    v7 = 1;
  if (v6 >= 2)
    v8 = v7;
  else
    v8 = 0;
  return ((uint64_t (*)(void))((char *)&loc_208340300 + 4 * byte_208363510[v8]))();
}

void storeEnumTagSinglePayload for _VisibleTransferRepresentation(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  int v11;
  unsigned int v12;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7 >= a3)
  {
    v11 = 0;
    if (a2 <= v7)
      goto LABEL_14;
  }
  else
  {
    v8 = a3 - v7;
    if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v9 = v8 + 1;
    else
      v9 = 2;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    if (a2 <= v7)
LABEL_14:
      __asm { BR              X11 }
  }
  if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v12 = ~v7 + a2;
    bzero(a1, ((*(_QWORD *)(v6 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
    *a1 = v12;
  }
  __asm { BR              X10 }
}

void sub_208340440()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_208340448(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x208340450);
}

void sub_20834046C()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

void sub_208340474()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
}

uint64_t sub_20834047C(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_WORD *)(v4 + v5) = 0;
  if (!a2)
    JUMPOUT(0x208340484);
  return (*(uint64_t (**)(uint64_t))(v3 + 56))(v4);
}

void sub_20834049C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for _VisibleTransferRepresentation(255, *a1, a1[1], a4);
  JUMPOUT(0x20BD054C0);
}

uint64_t outlined init with copy of ResolvedTransferRepresentation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ResolvedTransferRepresentation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x20BD05448](a1, v6, a5);
}

uint64_t static Data.transferRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v2 = type metadata accessor for UTType();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataRepresentation<Data>);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v15 - v9;
  static UTType.data.getter();
  v11 = lazy protocol witness table accessor for type Data and conformance Data();
  v12 = MEMORY[0x24BDCDDE8];
  DataRepresentation.init(contentType:exporting:importing:)((uint64_t)v4, (uint64_t)&async function pointer to closure #1 in static Data.transferRepresentation.getter, 0, (uint64_t)&async function pointer to closure #2 in static Data.transferRepresentation.getter, 0, MEMORY[0x24BDCDDE8], v11, (uint64_t)v8);
  v13 = lazy protocol witness table accessor for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>(&lazy protocol witness table cache variable for type DataRepresentation<Data> and conformance DataRepresentation<A>, &demangling cache variable for type metadata for DataRepresentation<Data>, (uint64_t)&protocol conformance descriptor for DataRepresentation<A>);
  static TransferRepresentationBuilder.buildExpression<A>(_:)(v8, v12, v5, v13);
  outlined destroy of DataRepresentation<AttributedString>((uint64_t)v8, &demangling cache variable for type metadata for DataRepresentation<Data>);
  static TransferRepresentationBuilder.buildBlock<A>(_:)((uint64_t)v10, v5, a1);
  return outlined destroy of DataRepresentation<AttributedString>((uint64_t)v10, &demangling cache variable for type metadata for DataRepresentation<Data>);
}

uint64_t closure #1 in static Data.transferRepresentation.getter(uint64_t *a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  v3 = *a1;
  v2 = a1[1];
  outlined copy of Data._Representation(*a1, v2);
  return closure #1 in static Data.transferRepresentation.getter(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8), v1, v3, v2);
}

uint64_t closure #2 in static Data.transferRepresentation.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t closure #2 in static Data.transferRepresentation.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t *v3;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(uint64_t **)(v0 + 16);
  *v3 = v1;
  v3[1] = v2;
  outlined copy of Data._Representation(v1, v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t lazy protocol witness table accessor for type Data and conformance Data()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    result = MEMORY[0x20BD054C0](&protocol conformance descriptor for Data, MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }
  return result;
}

uint64_t protocol witness for static Transferable.transferRepresentation.getter in conformance Data@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v17;

  v6 = type metadata accessor for UTType();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataRepresentation<Data>);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v17 - v13;
  static UTType.data.getter();
  DataRepresentation.init(contentType:exporting:importing:)((uint64_t)v8, (uint64_t)&async function pointer to closure #1 in static Data.transferRepresentation.getter, 0, (uint64_t)&async function pointer to closure #2 in static Data.transferRepresentation.getter, 0, a1, a2, (uint64_t)v12);
  v15 = lazy protocol witness table accessor for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>(&lazy protocol witness table cache variable for type DataRepresentation<Data> and conformance DataRepresentation<A>, &demangling cache variable for type metadata for DataRepresentation<Data>, (uint64_t)&protocol conformance descriptor for DataRepresentation<A>);
  static TransferRepresentationBuilder.buildExpression<A>(_:)(v12, a1, v9, v15);
  outlined destroy of DataRepresentation<AttributedString>((uint64_t)v12, &demangling cache variable for type metadata for DataRepresentation<Data>);
  static TransferRepresentationBuilder.buildBlock<A>(_:)((uint64_t)v14, v9, a3);
  return outlined destroy of DataRepresentation<AttributedString>((uint64_t)v14, &demangling cache variable for type metadata for DataRepresentation<Data>);
}

uint64_t static String.transferRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v2 = type metadata accessor for UTType();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataRepresentation<String>);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v15 - v9;
  static UTType.utf8PlainText.getter();
  v11 = lazy protocol witness table accessor for type String and conformance String();
  v12 = MEMORY[0x24BEE0D00];
  DataRepresentation.init(contentType:exporting:importing:)((uint64_t)v4, (uint64_t)&async function pointer to closure #1 in static String.transferRepresentation.getter, 0, (uint64_t)&async function pointer to closure #2 in static String.transferRepresentation.getter, 0, MEMORY[0x24BEE0D00], v11, (uint64_t)v8);
  v13 = lazy protocol witness table accessor for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>(&lazy protocol witness table cache variable for type DataRepresentation<String> and conformance DataRepresentation<A>, &demangling cache variable for type metadata for DataRepresentation<String>, (uint64_t)&protocol conformance descriptor for DataRepresentation<A>);
  static TransferRepresentationBuilder.buildExpression<A>(_:)(v8, v12, v5, v13);
  outlined destroy of DataRepresentation<AttributedString>((uint64_t)v8, &demangling cache variable for type metadata for DataRepresentation<String>);
  static TransferRepresentationBuilder.buildBlock<A>(_:)((uint64_t)v10, v5, a1);
  return outlined destroy of DataRepresentation<AttributedString>((uint64_t)v10, &demangling cache variable for type metadata for DataRepresentation<String>);
}

uint64_t closure #1 in static String.transferRepresentation.getter(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = type metadata accessor for String.Encoding();
  v1[2] = v3;
  v1[3] = *(_QWORD *)(v3 - 8);
  v4 = swift_task_alloc();
  v5 = *a1;
  v6 = a1[1];
  v1[4] = v4;
  v1[5] = v5;
  v1[6] = v6;
  return swift_task_switch();
}

uint64_t closure #1 in static String.transferRepresentation.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _BYTE *v7;

  v2 = *(_QWORD *)(v0 + 24);
  v1 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 16);
  static String.Encoding.utf8.getter();
  v4 = String.data(using:allowLossyConversion:)();
  v6 = v5;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if (v6 >> 60 == 15)
  {
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *v7 = 1;
    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t, unint64_t))(v0 + 8))(v4, v6);
  }
}

uint64_t closure #2 in static String.transferRepresentation.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  type metadata accessor for String.Encoding();
  v3[5] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #2 in static String.transferRepresentation.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  _BYTE *v4;

  static String.Encoding.utf8.getter();
  v1 = String.init(data:encoding:)();
  if (v2)
  {
    v3 = *(uint64_t **)(v0 + 16);
    *v3 = v1;
    v3[1] = v2;
  }
  else
  {
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *v4 = 0;
    swift_willThrow();
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t protocol witness for static Transferable.transferRepresentation.getter in conformance String@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v17;

  v6 = type metadata accessor for UTType();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataRepresentation<String>);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v17 - v13;
  static UTType.utf8PlainText.getter();
  DataRepresentation.init(contentType:exporting:importing:)((uint64_t)v8, (uint64_t)&async function pointer to closure #1 in static String.transferRepresentation.getter, 0, (uint64_t)&async function pointer to closure #2 in static String.transferRepresentation.getter, 0, a1, a2, (uint64_t)v12);
  v15 = lazy protocol witness table accessor for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>(&lazy protocol witness table cache variable for type DataRepresentation<String> and conformance DataRepresentation<A>, &demangling cache variable for type metadata for DataRepresentation<String>, (uint64_t)&protocol conformance descriptor for DataRepresentation<A>);
  static TransferRepresentationBuilder.buildExpression<A>(_:)(v12, a1, v9, v15);
  outlined destroy of DataRepresentation<AttributedString>((uint64_t)v12, &demangling cache variable for type metadata for DataRepresentation<String>);
  static TransferRepresentationBuilder.buildBlock<A>(_:)((uint64_t)v14, v9, a3);
  return outlined destroy of DataRepresentation<AttributedString>((uint64_t)v14, &demangling cache variable for type metadata for DataRepresentation<String>);
}

uint64_t static URL.transferRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;

  v22 = a1;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalTransferRepresentation<DataRepresentation<URL>>);
  v1 = MEMORY[0x24BDAC7A8](v21);
  v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v21 - v4;
  v6 = type metadata accessor for UTType();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataRepresentation<URL>);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v21 - v13;
  static UTType.url.getter();
  v15 = type metadata accessor for URL();
  v16 = lazy protocol witness table accessor for type URL and conformance URL();
  DataRepresentation.init(contentType:exporting:importing:)((uint64_t)v8, (uint64_t)&async function pointer to closure #1 in static URL.transferRepresentation.getter, 0, (uint64_t)&async function pointer to partial apply for closure #2 in static URL.transferRepresentation.getter, 0, v15, v16, (uint64_t)v12);
  v17 = lazy protocol witness table accessor for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>(&lazy protocol witness table cache variable for type DataRepresentation<URL> and conformance DataRepresentation<A>, &demangling cache variable for type metadata for DataRepresentation<URL>, (uint64_t)&protocol conformance descriptor for DataRepresentation<A>);
  static TransferRepresentationBuilder.buildExpression<A>(_:)(v12, v15, v9, v17);
  outlined destroy of DataRepresentation<AttributedString>((uint64_t)v12, &demangling cache variable for type metadata for DataRepresentation<URL>);
  static UTType.fileURL.getter();
  DataRepresentation.init(contentType:exporting:importing:)((uint64_t)v8, (uint64_t)&async function pointer to closure #3 in static URL.transferRepresentation.getter, 0, (uint64_t)&async function pointer to partial apply for closure #4 in static URL.transferRepresentation.getter, 0, v15, v16, (uint64_t)v12);
  TransferRepresentation.exportingCondition(_:)((uint64_t)closure #5 in static URL.transferRepresentation.getter, 0, v9, v17, v3);
  outlined destroy of DataRepresentation<AttributedString>((uint64_t)v12, &demangling cache variable for type metadata for DataRepresentation<URL>);
  v18 = lazy protocol witness table accessor for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>(&lazy protocol witness table cache variable for type _ConditionalTransferRepresentation<DataRepresentation<URL>> and conformance _ConditionalTransferRepresentation<A>, &demangling cache variable for type metadata for _ConditionalTransferRepresentation<DataRepresentation<URL>>, (uint64_t)&protocol conformance descriptor for _ConditionalTransferRepresentation<A>);
  v19 = v21;
  static TransferRepresentationBuilder.buildExpression<A>(_:)(v3, v15, v21, v18);
  outlined destroy of DataRepresentation<AttributedString>((uint64_t)v3, &demangling cache variable for type metadata for _ConditionalTransferRepresentation<DataRepresentation<URL>>);
  static TransferRepresentationBuilder.buildBlock<A, B>(_:_:)((uint64_t)v14, (uint64_t)v5, v9, v19, v22);
  outlined destroy of DataRepresentation<AttributedString>((uint64_t)v5, &demangling cache variable for type metadata for _ConditionalTransferRepresentation<DataRepresentation<URL>>);
  return outlined destroy of DataRepresentation<AttributedString>((uint64_t)v14, &demangling cache variable for type metadata for DataRepresentation<URL>);
}

uint64_t closure #1 in static URL.transferRepresentation.getter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[4] = a1;
  v2 = type metadata accessor for UTType();
  v1[5] = v2;
  v1[6] = *(_QWORD *)(v2 - 8);
  v1[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #1 in static URL.transferRepresentation.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[7];
  v2 = v0[4];
  static UTType.url.getter();
  v3 = swift_task_alloc();
  v0[8] = v3;
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[9] = v4;
  *v4 = v0;
  v4[1] = closure #1 in static URL.transferRepresentation.getter;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)();
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t closure #2 in static URL.transferRepresentation.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v4 = type metadata accessor for UTType();
  v3[5] = v4;
  v3[6] = *(_QWORD *)(v4 - 8);
  v3[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #2 in static URL.transferRepresentation.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 48);
  v1 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 40);
  static UTType.url.getter();
  static URL.url(contentType:data:)();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t partial apply for closure #2 in static URL.transferRepresentation.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = partial apply for closure #2 in static URL.transferRepresentation.getter;
  return closure #2 in static URL.transferRepresentation.getter(a1, a2, a3);
}

uint64_t partial apply for closure #2 in static URL.transferRepresentation.getter()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t lazy protocol witness table accessor for type URL and conformance URL()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type URL and conformance URL;
  if (!lazy protocol witness table cache variable for type URL and conformance URL)
  {
    v1 = type metadata accessor for URL();
    result = MEMORY[0x20BD054C0](&protocol conformance descriptor for URL, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type URL and conformance URL);
  }
  return result;
}

void static URL.url(contentType:data:)()
{
  void *v0;
  Class isa;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8[2];

  v8[1] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_opt_self();
  isa = Data._bridgeToObjectiveC()().super.isa;
  v2 = UTType.identifier.getter();
  v3 = (void *)MEMORY[0x20BD04D28](v2);
  swift_bridgeObjectRelease();
  v8[0] = 0;
  v4 = objc_msgSend(v0, sel_objectWithItemProviderData_typeIdentifier_error_, isa, v3, v8);

  v5 = v8[0];
  if (v4)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = v5;

  }
  else
  {
    v7 = v8[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
}

uint64_t closure #3 in static URL.transferRepresentation.getter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[4] = a1;
  v2 = type metadata accessor for UTType();
  v1[5] = v2;
  v1[6] = *(_QWORD *)(v2 - 8);
  v1[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #3 in static URL.transferRepresentation.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[7];
  v2 = v0[4];
  static UTType.fileURL.getter();
  v3 = swift_task_alloc();
  v0[8] = v3;
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[9] = v4;
  *v4 = v0;
  v4[1] = closure #3 in static URL.transferRepresentation.getter;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)();
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 48) + 8))(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 40));
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t closure #4 in static URL.transferRepresentation.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v4 = type metadata accessor for UTType();
  v3[5] = v4;
  v3[6] = *(_QWORD *)(v4 - 8);
  v3[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #4 in static URL.transferRepresentation.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 48);
  v1 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 40);
  static UTType.fileURL.getter();
  static URL.url(contentType:data:)();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t partial apply for closure #4 in static URL.transferRepresentation.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return closure #4 in static URL.transferRepresentation.getter(a1, a2, a3);
}

uint64_t closure #5 in static URL.transferRepresentation.getter()
{
  return URL.isFileURL.getter() & 1;
}

uint64_t associated type witness table accessor for Transferable.Representation : TransferRepresentation in Data()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t associated type witness table accessor for Transferable.Representation : TransferRepresentation in String()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t associated type witness table accessor for Transferable.Representation : TransferRepresentation in URL()
{
  return swift_getOpaqueTypeConformance2();
}

void closure #1 in URL.data(contentType:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSURL aBlock;
  uint64_t v14;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Data, Error>);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  URL._bridgeToObjectiveC()(&aBlock);
  v6 = v5;
  v7 = UTType.identifier.getter();
  v8 = (void *)MEMORY[0x20BD04D28](v7);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  v9 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v10 + v9, (char *)&aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  aBlock._reserved = partial apply for closure #1 in closure #1 in URL.data(contentType:);
  v14 = v10;
  aBlock.super.isa = (Class)MEMORY[0x24BDAC760];
  aBlock._urlString = (NSString *)1107296256;
  aBlock._baseURL = (NSURL *)thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data?, @guaranteed Error?) -> ();
  aBlock._clients = &block_descriptor;
  v11 = _Block_copy(&aBlock);
  swift_release();
  v12 = objc_msgSend(v6, sel_loadDataWithTypeIdentifier_forItemProviderCompletionHandler_, v8, v11);
  _Block_release(v11);

}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data?, @guaranteed Error?) -> ()(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void (*v5)(void *, unint64_t, void *);
  id v6;
  unint64_t v7;
  unint64_t v8;
  id v9;

  v4 = a2;
  v5 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    v6 = v4;
    v4 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = v7;

  }
  else
  {
    swift_retain();
    v8 = 0xF000000000000000;
  }
  v9 = a3;
  v5(v4, v8, a3);

  outlined consume of Data?((uint64_t)v4, v8);
  return swift_release();
}

uint64_t sub_208341B58()
{
  return lazy protocol witness table accessor for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>(&lazy protocol witness table cache variable for type DataRepresentation<Data> and conformance DataRepresentation<A>, &demangling cache variable for type metadata for DataRepresentation<Data>, (uint64_t)&protocol conformance descriptor for DataRepresentation<A>);
}

uint64_t sub_208341B84()
{
  return lazy protocol witness table accessor for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>(&lazy protocol witness table cache variable for type DataRepresentation<String> and conformance DataRepresentation<A>, &demangling cache variable for type metadata for DataRepresentation<String>, (uint64_t)&protocol conformance descriptor for DataRepresentation<A>);
}

uint64_t sub_208341BB0()
{
  return lazy protocol witness table accessor for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>(&lazy protocol witness table cache variable for type TupleTransferRepresentation<URL, (DataRepresentation<URL>, _ConditionalTransferRepresentation<DataRepresentation<URL>>)> and conformance TupleTransferRepresentation<A, B>, &demangling cache variable for type metadata for TupleTransferRepresentation<URL, (DataRepresentation<URL>, _ConditionalTransferRepresentation<DataRepresentation<URL>>)>, (uint64_t)&protocol conformance descriptor for TupleTransferRepresentation<A, B>);
}

void partial apply for closure #1 in URL.data(contentType:)(uint64_t a1)
{
  closure #1 in URL.data(contentType:)(a1);
}

uint64_t sub_208341BE4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Data, Error>);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in URL.data(contentType:)(uint64_t a1, unint64_t a2, void *a3)
{
  id v6;
  _BYTE *v8;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Data, Error>);
  if (a2 >> 60 == 15)
  {
    if (a3)
    {
      v6 = a3;
    }
    else
    {
      lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
      swift_allocError();
      *v8 = 1;
    }
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Data, Error>);
    return CheckedContinuation.resume(throwing:)();
  }
  else
  {
    outlined copy of Data._Representation(a1, a2);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Data, Error>);
    return CheckedContinuation.resume(returning:)();
  }
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

unint64_t lazy protocol witness table accessor for type TransferableError and conformance TransferableError()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TransferableError and conformance TransferableError;
  if (!lazy protocol witness table cache variable for type TransferableError and conformance TransferableError)
  {
    result = MEMORY[0x20BD054C0](&protocol conformance descriptor for TransferableError, &type metadata for TransferableError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TransferableError and conformance TransferableError);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TransferableError and conformance TransferableError;
  if (!lazy protocol witness table cache variable for type TransferableError and conformance TransferableError)
  {
    result = MEMORY[0x20BD054C0](&protocol conformance descriptor for TransferableError, &type metadata for TransferableError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TransferableError and conformance TransferableError);
  }
  return result;
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

uint64_t closure #1 in static Data.transferRepresentation.getter(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t static TransferRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  return static TransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, a2, a3);
}

{
  uint64_t AssociatedTypeWitness;
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
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t AssociatedConformanceWitness;
  _QWORD v21[2];

  v21[1] = a3;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = type metadata accessor for _TransferRepresentationValue(0, AssociatedTypeWitness, v6, v7);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v21 - v11;
  v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v14 = MEMORY[0x24BDAC7A8](v10);
  v16 = (char *)v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v21 - v17;
  (*(void (**)(uint64_t, uint64_t))(a2 + 40))(a1, a2);
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, AssociatedTypeWitness);
  _TransferRepresentationValue.init(_:)((uint64_t)v16, AssociatedTypeWitness, (uint64_t)v12);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(char *))(AssociatedConformanceWitness + 48))(v12);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v18, AssociatedTypeWitness);
}

void TransferRepresentation.bodyError()()
{
  Swift::String v0;
  Swift::String v1;

  _StringGuts.grow(_:)(34);
  swift_bridgeObjectRelease();
  v0._countAndFlagsBits = _typeName(_:qualified:)();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 46;
  v1._object = (void *)0xE100000000000000;
  String.append(_:)(v1);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void static TransferRepresentationBuilder.buildExpression<A, B>(_:)()
{
  type metadata accessor for CodableRepresentation();
}

uint64_t sub_2083420C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v2, v1, a1);
}

uint64_t static TransferRepresentationBuilder.buildBlock<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, a1);
}

uint64_t static TransferRepresentationBuilder.buildBlock<A, B>(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t TupleTypeMetadata2;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v16;

  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v11 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v13 = (char *)&v16 - v12;
  v14 = (char *)&v16 + *(int *)(v11 + 48) - v12;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))((char *)&v16 - v12, a1, a3);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 16))(v14, a2, a4);
  swift_getAssociatedConformanceWitness();
  return TupleTransferRepresentation.init(_:)((uint64_t)v13, TupleTypeMetadata2, a5);
}

uint64_t static TransferRepresentationBuilder.buildBlock<A, B, C, D>(_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t TupleTypeMetadata;
  int *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
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

  v27 = a5;
  v28 = a9;
  v24 = a3;
  v25 = a4;
  v23 = a2;
  v26 = a11;
  v29 = a6;
  v30 = a7;
  v31 = a8;
  v32 = a10;
  TupleTypeMetadata = swift_getTupleTypeMetadata();
  v16 = (int *)MEMORY[0x24BDAC7A8]();
  v18 = (char *)&v23 - v17;
  v19 = (char *)&v23 + v16[12] - v17;
  v20 = (char *)&v23 + v16[16] - v17;
  v21 = (char *)&v23 + v16[20] - v17;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 16))((char *)&v23 - v17, a1, a6);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a7 - 8) + 16))(v19, v23, a7);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a8 - 8) + 16))(v20, v24, a8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a10 - 8) + 16))(v21, v25, a10);
  swift_getAssociatedConformanceWitness();
  return TupleTransferRepresentation.init(_:)((uint64_t)v18, TupleTypeMetadata, v28);
}

uint64_t dispatch thunk of TransferRepresentation.body.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of static TransferRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t type metadata instantiation function for TransferRepresentationBuilder()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for TransferRepresentationBuilder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TransferRepresentationBuilder);
}

uint64_t AtomicBox.init(wrappedValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;

  v6 = specialized AtomicBox.init(wrappedValue:)(a1, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
  return v6;
}

void AtomicBox.wrappedValue.getter(os_unfair_lock_s *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  os_unfair_lock_s *v5;
  uint64_t v6;
  char *v7;

  v5 = a1 + 4;
  v6 = *(_QWORD *)(a2 - 8);
  v7 = (char *)a1 + ((*(unsigned __int8 *)(v6 + 80) + 20) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  os_unfair_lock_lock(a1 + 4);
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 16))(a3, v7, a2);
  os_unfair_lock_unlock(v5);
}

void (*AtomicBox.wrappedValue.modify(os_unfair_lock_s **a1, os_unfair_lock_s *a2))(os_unfair_lock_s **a1)
{
  *a1 = a2;
  os_unfair_lock_lock(a2 + 4);
  return AtomicBox.wrappedValue.modify;
}

void AtomicBox.wrappedValue.modify(os_unfair_lock_s **a1)
{
  os_unfair_lock_unlock(*a1 + 4);
}

uint64_t closure #2 in static AtomicBuffer.allocate(value:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v5 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a1, v7, a3);
}

uint64_t AtomicBuffer.__deallocating_deinit()
{
  uint64_t v0;

  v0 = UnsafeMutablePointer.deinitialize(count:)();
  MEMORY[0x20BD04F08](v0);
  return swift_deallocClassInstance();
}

uint64_t specialized AtomicBox.init(wrappedValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = type metadata accessor for AtomicBuffer(0, a2, a3, a4);
  v6 = static ManagedBuffer.create(minimumCapacity:makingHeaderWith:)();
  v7 = *(_QWORD *)(v5 + class metadata base offset for AtomicBuffer);
  v8 = *(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80);
  closure #2 in static AtomicBuffer.allocate(value:)(v6 + ((v8 + 20) & ~v8), a1, v7);
  return v6;
}

uint64_t type metadata accessor for AtomicBox(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AtomicBox);
}

uint64_t type metadata completion function for AtomicBuffer()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for AtomicBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AtomicBuffer);
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

void partial apply for closure #1 in static AtomicBuffer.allocate(value:)(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t TransferRepresentation.exportingCondition(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v11 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v11 + 16))(v13, v5);
  v15 = type metadata accessor for _ConditionalTransferRepresentation(0, a3, a4, v14);
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&a5[*(int *)(v15 + 36)], v13, a3);
  *(_QWORD *)a5 = a1;
  *((_QWORD *)a5 + 1) = a2;
  return swift_retain();
}

uint64_t type metadata accessor for _ConditionalTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _ConditionalTransferRepresentation);
}

uint64_t static _ConditionalTransferRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
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
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[2];
  char v24[16];
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;

  v23[0] = a1;
  v23[1] = a4;
  v6 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for _TransferRepresentationValue(0, v9, v9, v10);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v23 - v13;
  v16 = type metadata accessor for _ConditionalTransferRepresentation(0, a2, a3, v15);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)v23 - v18;
  (*(void (**)(char *, _QWORD, uint64_t))(v17 + 16))((char *)v23 - v18, v23[0], v16);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, &v19[*(int *)(v16 + 36)], a2);
  _TransferRepresentationValue.init(_:)((uint64_t)v8, a2, (uint64_t)v14);
  (*(void (**)(uint64_t *__return_ptr, char *))(a3 + 48))(&v28, v14);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v25 = a2;
  v26 = a3;
  v27 = v19;
  v20 = type metadata accessor for ResolvedTransferRepresentation();
  v21 = _TransferRepresentationOutputs.map<A>(_:)((uint64_t)partial apply for closure #1 in static _ConditionalTransferRepresentation._decomposedTransferRepresentation(_:inputs:), (uint64_t)v24, v20);
  swift_bridgeObjectRelease();
  _TransferRepresentationOutputs.init(_:)((Swift::OpaquePointer)v21);
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, v16);
}

uint64_t closure #1 in static _ConditionalTransferRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
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
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v23 = a3;
  v24 = a4;
  v22 = a2;
  v7 = type metadata accessor for _ConditionalTransferRepresentation(0, a3, a4, a4);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v21 - v9;
  v11 = type metadata accessor for ResolvedTransferRepresentation();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of ResolvedTransferRepresentation(a1, a5);
  outlined init with copy of ResolvedTransferRepresentation(a1, (uint64_t)v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v22, v7);
  v15 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v16 = (v13 + *(unsigned __int8 *)(v8 + 80) + v15) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v17 = swift_allocObject();
  v18 = v24;
  *(_QWORD *)(v17 + 16) = v23;
  *(_QWORD *)(v17 + 24) = v18;
  outlined init with take of ResolvedTransferRepresentation((uint64_t)v14, v17 + v15);
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v17 + v16, v10, v7);
  v19 = (uint64_t *)(a5 + *(int *)(v11 + 40));
  result = _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(*v19);
  *v19 = (uint64_t)partial apply for closure #1 in closure #1 in static _ConditionalTransferRepresentation._decomposedTransferRepresentation(_:inputs:);
  v19[1] = v17;
  return result;
}

uint64_t partial apply for closure #1 in static _ConditionalTransferRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  return closure #1 in static _ConditionalTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, v2[4], v2[2], v2[3], a2);
}

uint64_t closure #1 in closure #1 in static _ConditionalTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1, uint64_t a2, uint64_t (**a3)(char *))
{
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t (*v10)(uint64_t);
  char v11;
  char v12;
  uint64_t (*v13)(char *);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];

  v17 = type metadata accessor for Logger();
  MEMORY[0x24BDAC7A8](v17);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v9 = (char *)&v15 - v8;
  v10 = *(uint64_t (**)(uint64_t))(a2
                                          + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 40));
  if (!v10
    || (v16 = v7,
        swift_retain(),
        v11 = v10(a1),
        _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe((uint64_t)v10),
        v7 = v16,
        (v11 & 1) != 0))
  {
    v13 = *a3;
    outlined init with copy of Transferable(a1, (uint64_t)v18);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
    swift_dynamicCast();
    v12 = v13(v9);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, AssociatedTypeWitness);
  }
  else
  {
    v12 = 0;
  }
  return v12 & 1;
}

void protocol witness for TransferRepresentation.body.getter in conformance _ConditionalTransferRepresentation<A>(uint64_t a1)
{
  MEMORY[0x20BD054C0](&protocol conformance descriptor for _ConditionalTransferRepresentation<A>, a1);
  PrimitiveTransferRepresentation.body.getter();
}

uint64_t protocol witness for static TransferRepresentation._decomposedTransferRepresentation(_:inputs:) in conformance _ConditionalTransferRepresentation<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return static _ConditionalTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a3);
}

uint64_t instantiation function for generic protocol witness table for _ConditionalTransferRepresentation<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x20BD054C0](&protocol conformance descriptor for _ConditionalTransferRepresentation<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata completion function for _ConditionalTransferRepresentation()
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

_QWORD *initializeBufferWithCopyOfBuffer for _ConditionalTransferRepresentation(_QWORD *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = *a2;
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 16) & (unint64_t)~v6) + *(_QWORD *)(v5 + 64) > 0x18)
  {
    *a1 = v7;
    a1 = (_QWORD *)(v7 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    v10 = a2[1];
    *a1 = v7;
    a1[1] = v10;
    v11 = ((unint64_t)a1 + v6 + 16) & ~v6;
    v12 = ((unint64_t)a2 + v6 + 16) & ~v6;
    v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_retain();
    v13(v11, v12, v4);
  }
  return a1;
}

uint64_t destroy for _ConditionalTransferRepresentation(uint64_t a1, uint64_t a2)
{
  swift_release();
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((a1 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
}

_QWORD *initializeWithCopy for _ConditionalTransferRepresentation(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  swift_retain();
  v10(v8, v9, v5);
  return a1;
}

_QWORD *assignWithCopy for _ConditionalTransferRepresentation(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_retain();
  swift_release();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 24))(((unint64_t)a1 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

_OWORD *initializeWithTake for _ConditionalTransferRepresentation(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

_OWORD *assignWithTake for _ConditionalTransferRepresentation(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;

  *a1 = *a2;
  swift_release();
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 40))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

uint64_t getEnumTagSinglePayload for _ConditionalTransferRepresentation(_QWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  char v10;
  int v11;
  unsigned int v13;
  int v14;
  uint64_t v15;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(unsigned __int8 *)(v4 + 80);
  v8 = a2 - v6;
  if (a2 <= v6)
    goto LABEL_22;
  v9 = ((v7 + 16) & ~v7) + *(_QWORD *)(v4 + 64);
  v10 = 8 * v9;
  if (v9 <= 3)
  {
    v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      v11 = *(_DWORD *)((char *)a1 + v9);
      if (!v11)
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      v11 = *(unsigned __int16 *)((char *)a1 + v9);
      if (!*(_WORD *)((char *)a1 + v9))
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_22:
      if ((v5 & 0x80000000) != 0)
        return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)a1 + v7 + 16) & ~v7);
      v15 = *a1;
      if (*a1 >= 0xFFFFFFFFuLL)
        LODWORD(v15) = -1;
      return (v15 + 1);
    }
  }
  v11 = *((unsigned __int8 *)a1 + v9);
  if (!*((_BYTE *)a1 + v9))
    goto LABEL_22;
LABEL_15:
  v14 = (v11 - 1) << v10;
  if (v9 > 3)
    v14 = 0;
  if (!(_DWORD)v9)
    return v6 + v14 + 1;
  if (v9 > 3)
    LODWORD(v9) = 4;
  return ((uint64_t (*)(void))((char *)&loc_208343220 + 4 * byte_208363700[(v9 - 1)]))();
}

void storeEnumTagSinglePayload for _ConditionalTransferRepresentation(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  size_t v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
     + *(_QWORD *)(v5 + 64);
  if (a3 > v6)
  {
    if (v7 <= 3)
    {
      v10 = ((a3 - v6 + ~(-1 << (8 * v7))) >> (8 * v7)) + 1;
      if (HIWORD(v10))
      {
        v8 = 4u;
      }
      else if (v10 >= 0x100)
      {
        v8 = 2;
      }
      else
      {
        v8 = v10 > 1;
      }
    }
    else
    {
      v8 = 1u;
    }
  }
  else
  {
    v8 = 0;
  }
  if (v6 < a2)
  {
    v9 = ~v6 + a2;
    if (v7 < 4)
    {
      if ((_DWORD)v7)
      {
        v11 = v9 & ~(-1 << (8 * v7));
        bzero(a1, v7);
        if ((_DWORD)v7 == 3)
        {
          *a1 = v11;
          *((_BYTE *)a1 + 2) = BYTE2(v11);
        }
        else if ((_DWORD)v7 == 2)
        {
          *a1 = v11;
        }
        else
        {
          *(_BYTE *)a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v7);
      *(_DWORD *)a1 = v9;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X13 }
}

uint64_t sub_208343488()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  int v10;
  char *v11;
  uint64_t v12;
  uint64_t v14;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = (int *)type metadata accessor for ResolvedTransferRepresentation();
  v4 = *((_QWORD *)v3 - 1);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v14 = *(_QWORD *)(v4 + 64);
  v7 = type metadata accessor for _ConditionalTransferRepresentation(0, v1, v2, v6);
  v8 = *(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80);
  v9 = (uint64_t *)(v0 + v5);
  v10 = *(unsigned __int8 *)(v0 + v5 + 16);
  if (v10 != 255)
    outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(*v9, v9[1], v10 & 1);
  v11 = (char *)v9 + v3[5];
  v12 = type metadata accessor for UTType();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  if (*(uint64_t *)((char *)v9 + v3[8]))
    swift_release();
  if (*(uint64_t *)((char *)v9 + v3[9]))
    swift_release();
  if (*(uint64_t *)((char *)v9 + v3[10]))
    swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0 + ((v5 + v14 + v8) & ~v8) + *(int *)(v7 + 36), v1);
  return swift_deallocObject();
}

uint64_t outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t outlined init with take of ResolvedTransferRepresentation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ResolvedTransferRepresentation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in closure #1 in static _ConditionalTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *(_QWORD *)(v1 + 16);
  v4 = *(_QWORD *)(v1 + 24);
  v5 = *(_QWORD *)(type metadata accessor for ResolvedTransferRepresentation() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = v6 + *(_QWORD *)(v5 + 64);
  v9 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for _ConditionalTransferRepresentation(0, v3, v4, v8)
                                      - 8)
                          + 80);
  return closure #1 in closure #1 in static _ConditionalTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, v1 + v6, (uint64_t (**)(char *))(v1 + ((v7 + v9) & ~v9)));
}

uint64_t outlined init with copy of Transferable(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t TransferRepresentation.suggestedFileName(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v11 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v11 + 16))(v13, v5);
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(a5, v13, a3);
  v15 = a5 + *(int *)(type metadata accessor for _FileNamedTransferRepresentation(0, a3, a4, v14) + 36);
  *(_QWORD *)v15 = a1;
  *(_QWORD *)(v15 + 8) = a2;
  *(_BYTE *)(v15 + 16) = 0;
  return swift_bridgeObjectRetain();
}

{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v11 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v11 + 16))(v13, v5);
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(a5, v13, a3);
  v15 = a5 + *(int *)(type metadata accessor for _FileNamedTransferRepresentation(0, a3, a4, v14) + 36);
  *(_QWORD *)v15 = a1;
  *(_QWORD *)(v15 + 8) = a2;
  *(_BYTE *)(v15 + 16) = 1;
  return swift_retain();
}

uint64_t type metadata accessor for _FileNamedTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _FileNamedTransferRepresentation);
}

uint64_t outlined copy of _FileNamedTransferRepresentation<A>.Storage<A>(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t static _FileNamedTransferRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
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
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[2];
  char v24[16];
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;

  v23[0] = a1;
  v23[1] = a4;
  v6 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for _TransferRepresentationValue(0, v9, v9, v10);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v23 - v13;
  v16 = type metadata accessor for _FileNamedTransferRepresentation(0, a2, a3, v15);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)v23 - v18;
  (*(void (**)(char *, _QWORD, uint64_t))(v17 + 16))((char *)v23 - v18, v23[0], v16);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v19, a2);
  _TransferRepresentationValue.init(_:)((uint64_t)v8, a2, (uint64_t)v14);
  (*(void (**)(uint64_t *__return_ptr, char *))(a3 + 48))(&v28, v14);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v25 = a2;
  v26 = a3;
  v27 = v19;
  v20 = type metadata accessor for ResolvedTransferRepresentation();
  v21 = _TransferRepresentationOutputs.map<A>(_:)((uint64_t)partial apply for closure #1 in static _FileNamedTransferRepresentation._decomposedTransferRepresentation(_:inputs:), (uint64_t)v24, v20);
  swift_bridgeObjectRelease();
  _TransferRepresentationOutputs.init(_:)((Swift::OpaquePointer)v21);
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, v16);
}

uint64_t partial apply for closure #1 in static _FileNamedTransferRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 v18;

  v4 = v2[2];
  v5 = v2[3];
  v6 = v2[4];
  outlined init with copy of ResolvedTransferRepresentation(a1, a2);
  v8 = (uint64_t *)(v6 + *(int *)(type metadata accessor for _FileNamedTransferRepresentation(0, v4, v5, v7) + 36));
  v10 = *v8;
  v9 = v8[1];
  if ((v8[2] & 1) != 0)
  {
    v11 = (_QWORD *)swift_allocObject();
    v11[2] = v4;
    v11[3] = v5;
    v11[4] = v10;
    v11[5] = v9;
    v12 = *(_QWORD *)a2;
    v13 = *(_QWORD *)(a2 + 8);
    v14 = *(_BYTE *)(a2 + 16);
    swift_retain();
    result = outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage?(v12, v13, v14);
    *(_QWORD *)a2 = partial apply for closure #1 in closure #1 in static _FileNamedTransferRepresentation._decomposedTransferRepresentation(_:inputs:);
    *(_QWORD *)(a2 + 8) = v11;
    *(_BYTE *)(a2 + 16) = 1;
  }
  else
  {
    v17 = *(_QWORD *)a2;
    v16 = *(_QWORD *)(a2 + 8);
    v18 = *(_BYTE *)(a2 + 16);
    swift_bridgeObjectRetain();
    result = outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage?(v17, v16, v18);
    *(_QWORD *)a2 = v10;
    *(_QWORD *)(a2 + 8) = v9;
    *(_BYTE *)(a2 + 16) = 0;
  }
  return result;
}

uint64_t closure #1 in closure #1 in static _FileNamedTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1, uint64_t (*a2)(char *))
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int v13;
  void (*v14)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t result;
  Swift::String v17;
  Swift::String v18;
  Swift::String v19;
  Swift::String v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  _QWORD v24[5];

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = type metadata accessor for Optional();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v21 - v8;
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v21 - v11;
  outlined init with copy of Transferable(a1, (uint64_t)v24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
  v13 = swift_dynamicCast();
  v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  if (v13)
  {
    v14(v9, 0, 1, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v9, AssociatedTypeWitness);
    v15 = a2(v12);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, AssociatedTypeWitness);
    return v15;
  }
  else
  {
    v14(v9, 1, 1, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    outlined init with copy of Transferable(a1, (uint64_t)v24);
    v22 = 0;
    v23 = 0xE000000000000000;
    _StringGuts.grow(_:)(33);
    swift_bridgeObjectRelease();
    v22 = 0x6465746365707845;
    v23 = 0xE900000000000020;
    v17._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v17);
    swift_bridgeObjectRelease();
    v18._countAndFlagsBits = 0x756F662074756220;
    v18._object = (void *)0xEB0000000020646ELL;
    String.append(_:)(v18);
    __swift_project_boxed_opaque_existential_1(v24, v24[3]);
    swift_getDynamicType();
    v19._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v19);
    swift_bridgeObjectRelease();
    v20._object = (void *)0xE90000000000002ELL;
    v20._countAndFlagsBits = 0x64616574736E6920;
    String.append(_:)(v20);
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

void protocol witness for TransferRepresentation.body.getter in conformance _FileNamedTransferRepresentation<A>(uint64_t a1)
{
  MEMORY[0x20BD054C0](&protocol conformance descriptor for _FileNamedTransferRepresentation<A>, a1);
  PrimitiveTransferRepresentation.body.getter();
}

uint64_t protocol witness for static TransferRepresentation._decomposedTransferRepresentation(_:inputs:) in conformance _FileNamedTransferRepresentation<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return static _FileNamedTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a3);
}

uint64_t instantiation function for generic protocol witness table for _FileNamedTransferRepresentation<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x20BD054C0](&protocol conformance descriptor for _FileNamedTransferRepresentation<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata completion function for _FileNamedTransferRepresentation()
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

uint64_t *initializeBufferWithCopyOfBuffer for _FileNamedTransferRepresentation(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 17 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = ((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    v11 = ((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    v12 = *(_QWORD *)v11;
    v13 = *(_QWORD *)(v11 + 8);
    v14 = *(_BYTE *)(v11 + 16);
    outlined copy of _FileNamedTransferRepresentation<A>.Storage<A>(*(_QWORD *)v11, v13, v14);
    *(_QWORD *)v10 = v12;
    *(_QWORD *)(v10 + 8) = v13;
    *(_BYTE *)(v10 + 16) = v14;
  }
  return v4;
}

uint64_t destroy for _FileNamedTransferRepresentation(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  (*(void (**)(void))(v3 + 8))();
  v4 = (a1 + *(_QWORD *)(v3 + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
  return outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(*(_QWORD *)v4, *(_QWORD *)(v4 + 8), *(_BYTE *)(v4 + 16));
}

uint64_t initializeWithCopy for _FileNamedTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  v9 = *(_QWORD *)v8;
  v10 = *(_QWORD *)(v8 + 8);
  v11 = *(_BYTE *)(v8 + 16);
  outlined copy of _FileNamedTransferRepresentation<A>.Storage<A>(*(_QWORD *)v8, v10, v11);
  *(_QWORD *)v7 = v9;
  *(_QWORD *)(v7 + 8) = v10;
  *(_BYTE *)(v7 + 16) = v11;
  return a1;
}

uint64_t assignWithCopy for _FileNamedTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  v9 = *(_QWORD *)v8;
  v10 = *(_QWORD *)(v8 + 8);
  v11 = *(_BYTE *)(v8 + 16);
  outlined copy of _FileNamedTransferRepresentation<A>.Storage<A>(*(_QWORD *)v8, v10, v11);
  v12 = *(_QWORD *)v7;
  v13 = *(_QWORD *)(v7 + 8);
  v14 = *(_BYTE *)(v7 + 16);
  *(_QWORD *)v7 = v9;
  *(_QWORD *)(v7 + 8) = v10;
  *(_BYTE *)(v7 + 16) = v11;
  outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(v12, v13, v14);
  return a1;
}

uint64_t initializeWithTake for _FileNamedTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  v9 = *(_BYTE *)(v8 + 16);
  *(_OWORD *)v7 = *(_OWORD *)v8;
  *(_BYTE *)(v7 + 16) = v9;
  return a1;
}

uint64_t assignWithTake for _FileNamedTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  v9 = *(_BYTE *)(v8 + 16);
  v10 = *(_QWORD *)v7;
  v11 = *(_QWORD *)(v7 + 8);
  v12 = *(_BYTE *)(v7 + 16);
  *(_OWORD *)v7 = *(_OWORD *)v8;
  *(_BYTE *)(v7 + 16) = v9;
  outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for _FileNamedTransferRepresentation(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v14;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0xFE)
    v6 = 254;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0xFE)
    {
      v14 = *(unsigned __int8 *)(((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v14 > 1)
        return (v14 ^ 0xFF) + 1;
      else
        return 0;
    }
    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }
  else
  {
    v8 = ((v7 + 7) & 0xFFFFFFF8) + 17;
    v9 = (a2 - v6 + 255) >> (8 * v8);
    if (v8 < 4)
      v10 = v9 + 1;
    else
      v10 = 2;
    if (v10 >= 0x10000)
      v11 = 4;
    else
      v11 = 2;
    if (v10 < 0x100)
      v11 = 1;
    if (v10 >= 2)
      v12 = v11;
    else
      v12 = 0;
    return ((uint64_t (*)(void))((char *)&loc_20834422C + 4 * byte_208363790[v12]))();
  }
}

void storeEnumTagSinglePayload for _FileNamedTransferRepresentation(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  size_t v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0xFEu)
    v6 = 254;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = ((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 17;
  if (v6 >= a3)
  {
    v10 = 0;
    if (v6 >= a2)
      goto LABEL_17;
  }
  else
  {
    if (v7 <= 3)
      v8 = ((a3 - v6 + 255) >> (8 * v7)) + 1;
    else
      v8 = 2;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    if (v6 >= a2)
LABEL_17:
      __asm { BR              X12 }
  }
  if (v7 >= 4)
    v11 = ~v6 + a2;
  else
    v11 = (~(_BYTE)v6 + a2);
  bzero(a1, v7);
  if ((_DWORD)v7 == 1)
    *a1 = v11;
  else
    *(_DWORD *)a1 = v11;
  __asm { BR              X10 }
}

void sub_2083443D4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x208344450);
}

void sub_2083443DC(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x2083443E4);
  JUMPOUT(0x208344450);
}

void sub_208344428()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x208344450);
}

void sub_208344430()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x208344450);
}

uint64_t sub_208344438(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_WORD *)(v6 + v7) = 0;
  if (!a2)
    goto LABEL_6;
  if (a3 < 0xFE)
  {
    if (a2 > 0xFE)
      JUMPOUT(0x208344444);
    *(_BYTE *)(((v6 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 16) = -(char)a2;
LABEL_6:
    JUMPOUT(0x208344450);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v6);
}

uint64_t destroy for _FileNamedTransferRepresentation.Storage(uint64_t a1)
{
  return outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t initializeBufferWithCopyOfBuffer for _FileNamedTransferRepresentation.Storage(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  outlined copy of _FileNamedTransferRepresentation<A>.Storage<A>(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for _FileNamedTransferRepresentation.Storage(uint64_t a1, uint64_t a2)
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
  outlined copy of _FileNamedTransferRepresentation<A>.Storage<A>(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(v6, v7, v8);
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

uint64_t assignWithTake for _FileNamedTransferRepresentation.Storage(uint64_t a1, uint64_t a2)
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
  outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for _FileNamedTransferRepresentation.Storage(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for _FileNamedTransferRepresentation.Storage(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t getEnumTag for _FileNamedTransferRepresentation.Storage(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t destructiveInjectEnumTag for _FileNamedTransferRepresentation.Storage(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

uint64_t type metadata accessor for _FileNamedTransferRepresentation.Storage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _FileNamedTransferRepresentation.Storage);
}

void sub_208344630(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for _FileNamedTransferRepresentation(255, *a1, a1[1], a4);
  JUMPOUT(0x20BD054C0);
}

uint64_t sub_208344658()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in static _FileNamedTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in closure #1 in static _FileNamedTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, *(uint64_t (**)(char *))(v1 + 32));
}

uint64_t outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage?(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255)
    return outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(result, a2, a3 & 1);
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

void CodableRepresentation.init<>(for:contentType:)(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];

  v19 = a4;
  v20 = a5;
  v21 = a3;
  v9 = type metadata accessor for UTType();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  v13 = type metadata accessor for JSONEncoder();
  swift_allocObject();
  v22[1] = JSONEncoder.init()();
  v14 = type metadata accessor for JSONDecoder();
  v15 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCB268];
  swift_allocObject();
  v22[0] = JSONDecoder.init()();
  v16 = lazy protocol witness table accessor for type AttributedString and conformance AttributedString(&lazy protocol witness table cache variable for type JSONEncoder and conformance JSONEncoder, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB410], MEMORY[0x24BDCB3C8]);
  v17 = lazy protocol witness table accessor for type AttributedString and conformance AttributedString(&lazy protocol witness table cache variable for type JSONDecoder and conformance JSONDecoder, v15, MEMORY[0x24BDCB230]);
  CodableRepresentation.init(for:contentType:encoder:decoder:)(v17, (uint64_t)v12, (uint64_t)v22, a2, v13, v14, v21, a6, v19, v20, v16, v17);
}

uint64_t sub_208344814()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

void CodableRepresentation.init(for:contentType:encoder:decoder:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t);
  _QWORD v24[8];
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

  v26 = a4;
  v27 = a12;
  v24[3] = a7;
  v24[4] = a11;
  v28 = a9;
  v17 = *(_QWORD *)(a6 - 8);
  v29 = a3;
  v30 = v17;
  v24[7] = *(_QWORD *)(v17 + 64);
  v25 = a10;
  v18 = MEMORY[0x24BDAC7A8](a1);
  v24[5] = *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64);
  v24[6] = (char *)v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v24[2] = (char *)v24 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = type metadata accessor for UTType();
  v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 32);
  v24[1] = a8;
  v23(a8, a2, v22);
  v31 = v26;
  v32 = a5;
  v33 = a6;
  v34 = a7;
  v35 = a9;
  v36 = v25;
  v37 = a11;
  v38 = v27;
  type metadata accessor for CodableRepresentation();
}

uint64_t sub_20834494C(uint64_t a1)
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
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  unint64_t v14;
  uint64_t (*v15)();
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (**v20)();
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  unint64_t v24;
  uint64_t (*v25)();
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
  uint64_t (**v29)();

  v10 = *(int *)(a1 + 84);
  *(_QWORD *)(v9 - 176) = a1;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v8 + v10, v3, v4);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v9 - 160) + 16))(v8 + *(int *)(a1 + 88), *(_QWORD *)(v9 - 168), v1);
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v13 = *(_QWORD *)(v9 - 256);
  v12(v13, v3, v4);
  v14 = (*(unsigned __int8 *)(v6 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v15 = (uint64_t (*)())swift_allocObject();
  *((_QWORD *)v15 + 2) = v2;
  *((_QWORD *)v15 + 3) = v4;
  v16 = *(_QWORD *)(v9 - 248);
  v17 = *(_QWORD *)(v9 - 240);
  *((_QWORD *)v15 + 4) = v1;
  *((_QWORD *)v15 + 5) = v16;
  *((_QWORD *)v15 + 6) = *(_QWORD *)(v9 - 184);
  *((_QWORD *)v15 + 7) = v5;
  *((_QWORD *)v15 + 8) = v17;
  *((_QWORD *)v15 + 9) = v7;
  v12((uint64_t)v15 + v14, v13, v4);
  v18 = *(_QWORD *)(v9 - 168);
  v19 = *(_QWORD *)(v9 - 264);
  v20 = (uint64_t (**)())(v19 + *(int *)(*(_QWORD *)(v9 - 176) + 92));
  *v20 = partial apply for closure #1 in CodableRepresentation.init(for:contentType:encoder:decoder:);
  v20[1] = v15;
  v21 = *(_QWORD *)(v9 - 160);
  v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 32);
  v23 = *(_QWORD *)(v9 - 224);
  v22(v23, v18, v1);
  v24 = (*(unsigned __int8 *)(v21 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  v25 = (uint64_t (*)())swift_allocObject();
  *((_QWORD *)v25 + 2) = *(_QWORD *)(v9 - 200);
  *((_QWORD *)v25 + 3) = v4;
  *((_QWORD *)v25 + 4) = v1;
  *((_QWORD *)v25 + 5) = v16;
  v26 = *(_QWORD *)(v9 - 208);
  *((_QWORD *)v25 + 6) = *(_QWORD *)(v9 - 184);
  *((_QWORD *)v25 + 7) = v26;
  v27 = *(_QWORD *)(v9 - 192);
  *((_QWORD *)v25 + 8) = v17;
  *((_QWORD *)v25 + 9) = v27;
  result = ((uint64_t (*)(char *, uint64_t, uint64_t))v22)((char *)v25 + v24, v23, v1);
  v29 = (uint64_t (**)())(v19 + *(int *)(*(_QWORD *)(v9 - 176) + 96));
  *v29 = partial apply for closure #2 in CodableRepresentation.init(for:contentType:encoder:decoder:);
  v29[1] = v25;
  return result;
}

void type metadata accessor for CodableRepresentation()
{
  JUMPOUT(0x20BD05448);
}

uint64_t sub_208344AC0()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 24) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 24) - 8) + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 24) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in CodableRepresentation.init(for:contentType:encoder:decoder:)()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = dispatch thunk of TopLevelEncoder.encode<A>(_:)();
  if (!v0)
    return v2;
  return result;
}

uint64_t sub_208344B68()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 32) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 32) - 8) + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 32) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for closure #2 in CodableRepresentation.init(for:contentType:encoder:decoder:)()
{
  return dispatch thunk of TopLevelDecoder.decode<A>(_:from:)();
}

void static CodableRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
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

  v25 = a3;
  v26 = a7;
  v23 = a8;
  v24 = a2;
  v21 = a1;
  v19 = a5;
  v20 = a10;
  v27 = a9;
  v18 = type metadata accessor for UTType();
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v17 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = a2;
  v29 = a3;
  v30 = a4;
  v31 = a5;
  v32 = a6;
  v33 = a7;
  v34 = a9;
  v35 = a10;
  type metadata accessor for CodableRepresentation();
}

uint64_t sub_208344CBC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  __int128 v34;
  __int128 v35;
  _BYTE v36[48];

  v7 = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v5 - 160) = a1;
  *(_QWORD *)(v5 - 216) = v7;
  MEMORY[0x24BDAC7A8](a1);
  v9 = &v36[-v8];
  *(_QWORD *)(v5 - 168) = &v36[-v8];
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v10 + 16))(&v36[-v8], *(_QWORD *)(v5 - 232), a1);
  (*(void (**)(uint64_t, _BYTE *, _QWORD))(v2 + 16))(v3, v9, *(_QWORD *)(v5 - 256));
  v11 = &v9[*(int *)(a1 + 92)];
  v12 = v11[1];
  *(_QWORD *)(v5 - 256) = *v11;
  *(_QWORD *)(v5 - 232) = v12;
  v13 = (_QWORD *)swift_allocObject();
  v14 = *(_QWORD *)(v5 - 200);
  v15 = *(_QWORD *)(v5 - 192);
  v13[2] = v14;
  v13[3] = v15;
  v16 = v4;
  v13[4] = v4;
  v17 = *(_QWORD *)(v5 - 248);
  v13[5] = v17;
  v13[6] = v1;
  v18 = v1;
  *(_QWORD *)(v5 - 264) = v1;
  v20 = *(_QWORD *)(v5 - 184);
  v19 = *(_QWORD *)(v5 - 176);
  v13[7] = v20;
  v13[8] = v19;
  v21 = *(_QWORD *)(v5 - 240);
  v22 = *(_QWORD *)(v5 - 256);
  v13[9] = v21;
  v13[10] = v22;
  v13[11] = v12;
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = v14;
  v23[3] = v15;
  v23[4] = v16;
  v23[5] = v17;
  v23[6] = v18;
  v23[7] = v20;
  v23[8] = v19;
  v23[9] = v21;
  v24 = v19;
  v23[10] = &async function pointer to partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@owned Data, @error @owned Error);
  v23[11] = v13;
  v25 = (_QWORD *)(*(_QWORD *)(v5 - 168) + *(int *)(*(_QWORD *)(v5 - 160) + 96));
  v26 = v25[1];
  *(_QWORD *)(v5 - 256) = *v25;
  v27 = (_QWORD *)swift_allocObject();
  v28 = *(_QWORD *)(v5 - 200);
  v27[2] = v28;
  v27[3] = v15;
  v27[4] = v16;
  v27[5] = v17;
  v29 = *(_QWORD *)(v5 - 264);
  v30 = *(_QWORD *)(v5 - 184);
  v27[6] = v29;
  v27[7] = v30;
  v27[8] = v24;
  v27[9] = v21;
  v27[10] = *(_QWORD *)(v5 - 256);
  v27[11] = v26;
  v31 = (_QWORD *)swift_allocObject();
  v32 = *(_QWORD *)(v5 - 192);
  v31[2] = v28;
  v31[3] = v32;
  v31[4] = v16;
  v31[5] = v17;
  v31[6] = v29;
  v31[7] = v30;
  v31[8] = *(_QWORD *)(v5 - 176);
  v31[9] = v21;
  v31[10] = &async function pointer to partial apply for thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data) -> (@out A, @error @owned Error);
  v31[11] = v27;
  swift_retain();
  swift_retain();
  *(_QWORD *)&v35 = MEMORY[0x24BDCDDE8];
  *((_QWORD *)&v35 + 1) = v17;
  *(_QWORD *)&v34 = v28;
  *((_QWORD *)&v34 + 1) = MEMORY[0x24BDCDDE8];
  _TransferRepresentationOutputs.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:)(*(_QWORD *)(v5 - 224), 0, 0, 2, (uint64_t)&async function pointer to partial apply for thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed A) -> (@owned Data, @error @owned Error), (uint64_t)v23, (uint64_t)&async function pointer to partial apply for thunk for @escaping @callee_guaranteed @Sendable @async (@guaranteed Data) -> (@out A, @error @owned Error), (uint64_t)v31, *(uint64_t **)(v5 - 208), v34, v35, (uint64_t)&protocol witness table for Data, (uint64_t)&protocol witness table for Data);
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v5 - 216) + 8))(*(_QWORD *)(v5 - 168), *(_QWORD *)(v5 - 160));
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@owned Data, @error @owned Error)(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = a2();
  return closure #1 in static Data.transferRepresentation.getter(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8), v2, v3, v4);
}

void partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@owned Data, @error @owned Error)()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@owned Data, @error @owned Error);
  __asm { BR              X8; thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@owned Data, @error @owned Error) }
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@owned Data, @error @owned Error)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  v6 = *v2;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed A) -> (@owned Data, @error @owned Error)(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  *(_QWORD *)(v3 + 16) = a1;
  v7 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v5;
  *v5 = v3;
  v5[1] = thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed A) -> (@owned Data, @error @owned Error);
  return v7(a2);
}

{
  uint64_t v3;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  *(_QWORD *)(v3 + 16) = a1;
  v7 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v5;
  *v5 = v3;
  v5[1] = thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed A) -> (@owned Data, @error @owned Error);
  return v7(a2);
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed A) -> (@owned Data, @error @owned Error)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = *v3;
  v7 = *v3;
  swift_task_dealloc();
  if (!v2)
  {
    v8 = *(_QWORD **)(v6 + 16);
    *v8 = a1;
    v8[1] = a2;
  }
  return (*(uint64_t (**)(void))(v7 + 8))();
}

void partial apply for thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed A) -> (@owned Data, @error @owned Error)()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  __asm { BR              X9; thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed A) -> (@owned Data, @error @owned Error) }
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data) -> (@out A, @error @owned Error)(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v4;

  a4(a2, a3);
  return thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data) -> (@out A, @error @owned Error)(*(uint64_t (**)(void))(v4 + 8));
}

uint64_t sub_208345240()
{
  swift_release();
  return swift_deallocObject();
}

void partial apply for thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data) -> (@out A, @error @owned Error)()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  __asm { BR              X9; thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data) -> (@out A, @error @owned Error) }
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable @async (@guaranteed Data) -> (@out A, @error @owned Error)(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v5 = *a2;
  v6 = a2[1];
  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)a3 + *a3);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = partial apply for closure #2 in static URL.transferRepresentation.getter;
  return v9(a1, v5, v6);
}

{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v5 = *a2;
  v6 = a2[1];
  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)a3 + *a3);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = partial apply for closure #2 in static URL.transferRepresentation.getter;
  return v9(a1, v5, v6);
}

void partial apply for thunk for @escaping @callee_guaranteed @Sendable @async (@guaranteed Data) -> (@out A, @error @owned Error)()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = partial apply for closure #2 in static URL.transferRepresentation.getter;
  __asm { BR              X9; thunk for @escaping @callee_guaranteed @Sendable @async (@guaranteed Data) -> (@out A, @error @owned Error) }
}

uint64_t associated type witness table accessor for TransferRepresentation.Item : Transferable in CodableRepresentation<A, B, C>(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 40);
}

void protocol witness for TransferRepresentation.body.getter in conformance CodableRepresentation<A, B, C>(uint64_t a1)
{
  MEMORY[0x20BD054C0](&protocol conformance descriptor for CodableRepresentation<A, B, C>, a1);
  PrimitiveTransferRepresentation.body.getter();
}

void protocol witness for static TransferRepresentation._decomposedTransferRepresentation(_:inputs:) in conformance CodableRepresentation<A, B, C>(uint64_t a1@<X0>, uint64_t *a2@<X2>, uint64_t a3@<X8>)
{
  static CodableRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, a2[2], a2[3], a2[4], a2[5], a2[6], a2[7], a3, a2[8], a2[9]);
}

uint64_t instantiation function for generic protocol witness table for CodableRepresentation<A, B, C>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x20BD054C0](&protocol conformance descriptor for CodableRepresentation<A, B, C>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata instantiation function for CodableRepresentation()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata completion function for CodableRepresentation()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = type metadata accessor for UTType();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      result = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for CodableRepresentation(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
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
  unsigned int v17;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t *v37;

  v6 = type metadata accessor for UTType();
  v7 = *(_QWORD *)(v6 - 8);
  v9 = *(_QWORD *)(a3 + 24);
  v8 = *(_QWORD *)(a3 + 32);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_DWORD *)(v10 + 80);
  v12 = *(_QWORD *)(v7 + 64) + v11;
  v13 = *(_QWORD *)(v8 - 8);
  v14 = *(_DWORD *)(v13 + 80);
  v15 = *(_QWORD *)(v10 + 64) + v14;
  v16 = *(_QWORD *)(v13 + 64) + 7;
  v17 = v14 | *(_DWORD *)(v7 + 80) & 0xF8 | v11;
  if (v17 > 7
    || ((*(_DWORD *)(v13 + 80) | *(_DWORD *)(v10 + 80) | *(_DWORD *)(v7 + 80)) & 0x100000) != 0
    || ((((v16 + ((v15 + (v12 & ~v11)) & ~v14)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    v20 = *a2;
    *a1 = *a2;
    v26 = (uint64_t *)(v20 + (((v17 | 7) + 16) & ~(unint64_t)(v17 | 7)));
  }
  else
  {
    v21 = ~v11;
    v22 = ~v14;
    v36 = v8;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(a1, a2, v6);
    v37 = a1;
    v23 = ((unint64_t)a1 + v12) & v21;
    v24 = ((unint64_t)a2 + v12) & v21;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 16))(v23, v24, v9);
    v25 = v23 + v15;
    v26 = v37;
    v27 = v25 & v22;
    v28 = (v24 + v15) & v22;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v13 + 16))(v25 & v22, v28, v36);
    v29 = (_QWORD *)((v16 + v27) & 0xFFFFFFFFFFFFFFF8);
    v30 = (_QWORD *)((v16 + v28) & 0xFFFFFFFFFFFFFFF8);
    v31 = v30[1];
    *v29 = *v30;
    v29[1] = v31;
    v32 = (_QWORD *)(((unint64_t)v29 + 23) & 0xFFFFFFFFFFFFFFF8);
    v33 = (_QWORD *)(((unint64_t)v30 + 23) & 0xFFFFFFFFFFFFFFF8);
    v34 = v33[1];
    *v32 = *v33;
    v32[1] = v34;
    swift_retain();
  }
  swift_retain();
  return v26;
}

uint64_t destroy for CodableRepresentation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = type metadata accessor for UTType();
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  v6 = *(_QWORD *)(v5 + 64) + a1;
  v7 = *(_QWORD *)(*(_QWORD *)(a2 + 24) - 8);
  v8 = (v6 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  (*(void (**)(unint64_t))(v7 + 8))(v8);
  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 32) - 8) + 8))((v8
                                                                                            + *(_QWORD *)(v7 + 64)
                                                                                            + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 32) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 32) - 8) + 80));
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for CodableRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;

  v6 = type metadata accessor for UTType();
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a1, a2, v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = *(_QWORD *)(v7 + 64) + v9;
  v11 = (v10 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v11, v12);
  v13 = *(_QWORD *)(v8 + 64);
  v14 = *(_QWORD *)(*(_QWORD *)(a3 + 32) - 8);
  v15 = *(unsigned __int8 *)(v14 + 80);
  v16 = v13 + v15;
  v17 = (v16 + v11) & ~v15;
  v18 = (v16 + v12) & ~v15;
  (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v17, v18);
  v19 = *(_QWORD *)(v14 + 64) + 7;
  v20 = (_QWORD *)((v19 + v17) & 0xFFFFFFFFFFFFFFF8);
  v21 = (_QWORD *)((v19 + v18) & 0xFFFFFFFFFFFFFFF8);
  v22 = v21[1];
  *v20 = *v21;
  v20[1] = v22;
  v23 = (_QWORD *)(((unint64_t)v20 + 23) & 0xFFFFFFFFFFFFFFF8);
  v24 = (_QWORD *)(((unint64_t)v21 + 23) & 0xFFFFFFFFFFFFFFF8);
  v25 = v24[1];
  *v23 = *v24;
  v23[1] = v25;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CodableRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;

  v6 = type metadata accessor for UTType();
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(a1, a2, v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = *(_QWORD *)(v7 + 64) + v9;
  v11 = (v10 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 24))(v11, v12);
  v13 = *(_QWORD *)(v8 + 64);
  v14 = *(_QWORD *)(*(_QWORD *)(a3 + 32) - 8);
  v15 = *(unsigned __int8 *)(v14 + 80);
  v16 = v13 + v15;
  v17 = (v16 + v11) & ~v15;
  v18 = (v16 + v12) & ~v15;
  (*(void (**)(uint64_t, uint64_t))(v14 + 24))(v17, v18);
  v19 = *(_QWORD *)(v14 + 64) + 7;
  v20 = (_QWORD *)((v19 + v17) & 0xFFFFFFFFFFFFFFF8);
  v21 = (_QWORD *)((v19 + v18) & 0xFFFFFFFFFFFFFFF8);
  v22 = v21[1];
  *v20 = *v21;
  v20[1] = v22;
  swift_retain();
  swift_release();
  v23 = (_QWORD *)(((unint64_t)v20 + 23) & 0xFFFFFFFFFFFFFFF8);
  v24 = (_QWORD *)(((unint64_t)v21 + 23) & 0xFFFFFFFFFFFFFFF8);
  v25 = v24[1];
  *v23 = *v24;
  v23[1] = v25;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for CodableRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  _OWORD *v20;
  _OWORD *v21;

  v6 = type metadata accessor for UTType();
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(a1, a2, v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = *(_QWORD *)(v7 + 64) + v9;
  v11 = (v10 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 32))(v11, v12);
  v13 = *(_QWORD *)(v8 + 64);
  v14 = *(_QWORD *)(*(_QWORD *)(a3 + 32) - 8);
  v15 = *(unsigned __int8 *)(v14 + 80);
  v16 = v13 + v15;
  v17 = (v16 + v11) & ~v15;
  v18 = (v16 + v12) & ~v15;
  (*(void (**)(uint64_t, uint64_t))(v14 + 32))(v17, v18);
  v19 = *(_QWORD *)(v14 + 64) + 7;
  v20 = (_OWORD *)((v19 + v17) & 0xFFFFFFFFFFFFFFF8);
  v21 = (_OWORD *)((v19 + v18) & 0xFFFFFFFFFFFFFFF8);
  *v20 = *v21;
  *(_OWORD *)(((unint64_t)v20 + 23) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v21 + 23) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t assignWithTake for CodableRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  _OWORD *v20;
  uint64_t v21;
  unint64_t v22;

  v6 = type metadata accessor for UTType();
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40))(a1, a2, v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = *(_QWORD *)(v7 + 64) + v9;
  v11 = (v10 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 40))(v11, v12);
  v13 = *(_QWORD *)(v8 + 64);
  v14 = *(_QWORD *)(*(_QWORD *)(a3 + 32) - 8);
  v15 = *(unsigned __int8 *)(v14 + 80);
  v16 = v13 + v15;
  v17 = (v16 + v11) & ~v15;
  v18 = (v16 + v12) & ~v15;
  (*(void (**)(uint64_t, uint64_t))(v14 + 40))(v17, v18);
  v19 = *(_QWORD *)(v14 + 64) + 7;
  v20 = (_OWORD *)((v19 + v17) & 0xFFFFFFFFFFFFFFF8);
  v21 = v19 + v18;
  v22 = (v21 & 0xFFFFFFFFFFFFFFF8) + 23;
  *v20 = *(_OWORD *)(v21 & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  *(_OWORD *)(((unint64_t)v20 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(v22 & 0xFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CodableRepresentation(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t (*v25)(uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  unint64_t v27;

  v6 = type metadata accessor for UTType();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = *(_QWORD *)(a3 + 32);
  v10 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v11 = *(_DWORD *)(v10 + 84);
  if (v11 <= v8)
    v12 = *(_DWORD *)(v7 + 84);
  else
    v12 = *(_DWORD *)(v10 + 84);
  v13 = *(_QWORD *)(v9 - 8);
  v14 = *(unsigned int *)(v13 + 84);
  if (v14 > v12)
    v12 = *(_DWORD *)(v13 + 84);
  if (v12 <= 0x7FFFFFFF)
    v12 = 0x7FFFFFFF;
  if (!a2)
    return 0;
  v15 = v6;
  v16 = *(unsigned __int8 *)(v10 + 80);
  v17 = *(_QWORD *)(v7 + 64) + v16;
  v18 = *(_QWORD *)(v10 + 64);
  v19 = *(unsigned __int8 *)(v13 + 80);
  v20 = *(_QWORD *)(v13 + 64) + 7;
  if (v12 < a2)
  {
    if (((((((v20 + ((v18 + v19 + (v17 & ~v16)) & ~v19)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v21 = 2;
    else
      v21 = a2 - v12 + 1;
    if (v21 >= 0x10000)
      v22 = 4;
    else
      v22 = 2;
    if (v21 < 0x100)
      v22 = 1;
    if (v21 >= 2)
      v23 = v22;
    else
      v23 = 0;
    __asm { BR              X21 }
  }
  if (v8 == v12)
  {
    v25 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v26 = a1;
    v14 = *(unsigned int *)(v7 + 84);
    v9 = v15;
    return v25(v26, v14, v9);
  }
  v26 = (v17 + a1) & ~v16;
  if (v11 == v12)
  {
    v25 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    v14 = *(unsigned int *)(v10 + 84);
    v9 = *(_QWORD *)(a3 + 24);
    return v25(v26, v14, v9);
  }
  v26 = (v26 + v18 + v19) & ~v19;
  if ((_DWORD)v14 == v12)
  {
    v25 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
    return v25(v26, v14, v9);
  }
  v27 = *(_QWORD *)((v20 + v26) & 0xFFFFFFFFFFFFF8);
  if (v27 >= 0xFFFFFFFF)
    LODWORD(v27) = -1;
  return (v27 + 1);
}

void storeEnumTagSinglePayload for CodableRepresentation(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  int v16;
  unsigned int v17;

  v8 = *(_QWORD *)(type metadata accessor for UTType() - 8);
  v9 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v9 + 84) <= *(_DWORD *)(v8 + 84))
    v10 = *(_DWORD *)(v8 + 84);
  else
    v10 = *(_DWORD *)(v9 + 84);
  v11 = *(_QWORD *)(*(_QWORD *)(a4 + 32) - 8);
  if (*(_DWORD *)(v11 + 84) > v10)
    v10 = *(_DWORD *)(v11 + 84);
  if (v10 <= 0x7FFFFFFF)
    v10 = 0x7FFFFFFF;
  v12 = *(unsigned __int8 *)(v9 + 80);
  v13 = *(unsigned __int8 *)(v11 + 80);
  if (v10 >= a3)
  {
    v16 = 0;
    if (a2 <= v10)
      goto LABEL_21;
  }
  else
  {
    if (((((*(_DWORD *)(v11 + 64)
           + 7
           + ((*(_DWORD *)(v9 + 64) + (_DWORD)v13 + ((*(_DWORD *)(v8 + 64) + (_DWORD)v12) & ~(_DWORD)v12)) & ~(_DWORD)v13)) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v14 = a3 - v10 + 1;
    else
      v14 = 2;
    if (v14 >= 0x10000)
      v15 = 4;
    else
      v15 = 2;
    if (v14 < 0x100)
      v15 = 1;
    if (v14 >= 2)
      v16 = v15;
    else
      v16 = 0;
    if (a2 <= v10)
LABEL_21:
      __asm { BR              X22 }
  }
  if (((((*(_DWORD *)(v11 + 64)
         + 7
         + ((*(_DWORD *)(v9 + 64) + (_DWORD)v13 + ((*(_DWORD *)(v8 + 64) + (_DWORD)v12) & ~(_DWORD)v12)) & ~(_DWORD)v13)) & 0xFFFFFFF8)
       + 23) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v17 = ~v10 + a2;
    bzero(a1, ((((*(_QWORD *)(v11 + 64) + 7 + ((*(_QWORD *)(v9 + 64) + v13 + ((*(_QWORD *)(v8 + 64) + v12) & ~v12)) & ~v13)) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)+ 16);
    *a1 = v17;
  }
  __asm { BR              X10 }
}

void sub_208345F64()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x208346024);
}

void sub_208345F6C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  *(_DWORD *)(v1 + v2) = 0;
  if (v0)
    JUMPOUT(0x208345F74);
  JUMPOUT(0x208346024);
}

void sub_208345FB8()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x208346024);
}

void sub_208345FC0()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x208346024);
}

void sub_208345FC8()
{
  int v0;
  int v1;
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  *(_WORD *)(v4 + v5) = 0;
  if (v3)
  {
    if (v1 != v2 && v0 != v2)
      JUMPOUT(0x208345FD4);
    JUMPOUT(0x208345FF0);
  }
  JUMPOUT(0x208346024);
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data) -> (@out A, @error @owned Error)(uint64_t (*a1)(void))
{
  return a1();
}

_QWORD *static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
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
  uint64_t AssociatedTypeWitness;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  __int128 v26;
  uint64_t AssociatedConformanceWitness;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47[16];
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _OWORD *v52;
  uint64_t v53;
  _OWORD v54[4];

  v43 = a4;
  v42 = a2;
  v44 = a6;
  v46 = type metadata accessor for ResolvedTransferRepresentation();
  v9 = *(_QWORD *)(v46 - 8);
  v10 = MEMORY[0x24BDAC7A8](v46);
  v45 = (uint64_t)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v37 - v12;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ResolvedTransferRepresentation?);
  v37 = *(_QWORD *)(v41 - 8);
  v14 = MEMORY[0x24BDAC7A8](v41);
  v16 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v37 - v17;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v21 = (char *)&v37 - v20;
  v40 = type metadata accessor for _TransferRepresentationValue(0, AssociatedTypeWitness, v22, v23);
  v39 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v25 = (char *)&v37 - v24;
  v26 = a1[1];
  v54[0] = *a1;
  v54[1] = v26;
  v54[2] = a1[2];
  v38 = *(void (**)(uint64_t, uint64_t))(a5 + 24);
  outlined retain of ProxyRepresentation<A, B>(v54, (void (*)(_QWORD, _QWORD))_sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOy, (void (*)(uint64_t, uint64_t))_sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOy, (void (*)(uint64_t, uint64_t))_sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOy);
  v38(a3, a5);
  _TransferRepresentationValue.init(_:)((uint64_t)v21, AssociatedTypeWitness, (uint64_t)v25);
  _TransferRepresentationInputs.init()();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t *__return_ptr, char *))(AssociatedConformanceWitness + 48))(&v53, v25);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v25, v40);
  v48 = v42;
  v49 = a3;
  v50 = v43;
  v51 = a5;
  v52 = v54;
  v28 = _TransferRepresentationOutputs.map<A>(_:)((uint64_t)partial apply for closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:), (uint64_t)v47, v41);
  swift_bridgeObjectRelease();
  v29 = *(_QWORD *)(v28 + 16);
  if (v29)
  {
    v30 = v28;
    v31 = v28 + ((*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80));
    v32 = *(_QWORD *)(v37 + 72);
    v43 = v30;
    swift_bridgeObjectRetain();
    v33 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      outlined init with copy of ResolvedTransferRepresentation?(v31, (uint64_t)v18);
      outlined init with take of ResolvedTransferRepresentation?((uint64_t)v18, (uint64_t)v16);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v16, 1, v46) == 1)
      {
        outlined destroy of ResolvedTransferRepresentation?((uint64_t)v16);
      }
      else
      {
        outlined init with take of ResolvedTransferRepresentation((uint64_t)v16, (uint64_t)v13);
        outlined init with take of ResolvedTransferRepresentation((uint64_t)v13, v45);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v33 = (_QWORD *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v33[2] + 1, 1, v33);
        v35 = v33[2];
        v34 = v33[3];
        if (v35 >= v34 >> 1)
          v33 = (_QWORD *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v34 > 1, v35 + 1, 1, v33);
        v33[2] = v35 + 1;
        outlined init with take of ResolvedTransferRepresentation(v45, (uint64_t)v33+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(_QWORD *)(v9 + 72) * v35);
      }
      v31 += v32;
      --v29;
    }
    while (v29);
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
    v33 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  _TransferRepresentationOutputs.init(_:)((Swift::OpaquePointer)v33);
  return outlined retain of ProxyRepresentation<A, B>(v54, (void (*)(_QWORD, _QWORD))_sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOe, (void (*)(uint64_t, uint64_t))_sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOe, (void (*)(uint64_t, uint64_t))_sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOe);
}

uint64_t closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  int *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  void *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int *v30;
  char *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t *v44;
  int *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;

  v14 = (int *)type metadata accessor for ResolvedTransferRepresentation();
  v15 = *((_QWORD *)v14 - 1);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v60 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = a1;
  outlined init with copy of ResolvedTransferRepresentation(a1, (uint64_t)v17);
  v19 = a2[2];
  v18 = a2[3];
  v62 = v15;
  v63 = a7;
  v61 = a2;
  v65 = a5;
  v66 = a4;
  v64 = a3;
  if (v19)
  {
    v20 = v18;
    v21 = (_QWORD *)swift_allocObject();
    v22 = v20;
    v23 = v21;
    v21[2] = a3;
    v21[3] = a4;
    v21[4] = a5;
    v21[5] = a6;
    v24 = &async function pointer to partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@out B, @error @owned Error);
    v21[6] = v19;
    v21[7] = v20;
  }
  else
  {
    v24 = (void *)*a2;
    if (!*a2)
      goto LABEL_7;
    v23 = (_QWORD *)a2[1];
    v25 = v18;
    swift_retain();
    v22 = v25;
    a3 = v64;
  }
  v26 = (uint64_t *)(v67 + v14[8]);
  v27 = *v26;
  if (*v26)
  {
    v28 = a3;
    v29 = v26[1];
    v60 = v22;
    v30 = v14;
    v31 = v17;
    v32 = a6;
    v33 = (_QWORD *)swift_allocObject();
    v34 = v66;
    v33[2] = v28;
    v33[3] = v34;
    v33[4] = v65;
    v33[5] = v32;
    v33[6] = v24;
    v33[7] = v23;
    v33[8] = v27;
    v33[9] = v29;
    v35 = (uint64_t *)&v31[v30[8]];
    v36 = *v35;
    outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v19);
    outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v27);
    _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(v36);
    *v35 = (uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:);
    v35[1] = (uint64_t)v33;
    a6 = v32;
    v17 = v31;
    v14 = v30;
    a2 = v61;
LABEL_7:
    v37 = a2[4];
    if (!v37)
      goto LABEL_12;
    goto LABEL_10;
  }
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v19);
  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe((uint64_t)v24);
  v37 = a2[4];
  if (!v37)
    goto LABEL_12;
LABEL_10:
  v38 = (uint64_t *)(v67 + v14[9]);
  v39 = *v38;
  if (*v38)
  {
    v40 = a2[5];
    v60 = v38[1];
    v41 = v60;
    v42 = (_QWORD *)swift_allocObject();
    v43 = v66;
    v42[2] = v64;
    v42[3] = v43;
    v42[4] = v65;
    v42[5] = a6;
    v42[6] = v39;
    v42[7] = v41;
    v42[8] = v37;
    v42[9] = v40;
    v44 = (uint64_t *)&v17[v14[9]];
    v45 = v14;
    v46 = v17;
    v47 = a6;
    v48 = *v44;
    outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v37);
    outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v39);
    v49 = v48;
    a6 = v47;
    v17 = v46;
    v14 = v45;
    a2 = v61;
    _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(v49);
    *v44 = (uint64_t)&async function pointer to partial apply for closure #2 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:);
    v44[1] = (uint64_t)v42;
  }
LABEL_12:
  v50 = v66;
  v51 = (uint64_t *)(v67 + v14[10]);
  v52 = *v51;
  if (*v51)
  {
    v53 = v51[1];
    v54 = swift_allocObject();
    *(_QWORD *)(v54 + 16) = v64;
    *(_QWORD *)(v54 + 24) = v50;
    *(_QWORD *)(v54 + 32) = v65;
    *(_QWORD *)(v54 + 40) = a6;
    v55 = *((_OWORD *)a2 + 1);
    *(_OWORD *)(v54 + 48) = *(_OWORD *)a2;
    *(_OWORD *)(v54 + 64) = v55;
    *(_OWORD *)(v54 + 80) = *((_OWORD *)a2 + 2);
    *(_QWORD *)(v54 + 96) = v52;
    *(_QWORD *)(v54 + 104) = v53;
    v56 = (uint64_t *)&v17[v14[10]];
    v57 = *v56;
    outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v52);
    outlined retain of ProxyRepresentation<A, B>(a2, (void (*)(_QWORD, _QWORD))_sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOy, (void (*)(uint64_t, uint64_t))_sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOy, (void (*)(uint64_t, uint64_t))_sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOy);
    _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(v57);
    *v56 = (uint64_t)partial apply for closure #3 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:);
    v56[1] = v54;
  }
  v58 = v63;
  outlined init with copy of ResolvedTransferRepresentation((uint64_t)v17, v63);
  (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v62 + 56))(v58, 0, 1, v14);
  return outlined destroy of ResolvedTransferRepresentation((uint64_t)v17);
}

uint64_t partial apply for closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, *(_QWORD **)(v2 + 48), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), a2);
}

uint64_t outlined init with copy of ResolvedTransferRepresentation?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ResolvedTransferRepresentation?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with take of ResolvedTransferRepresentation?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ResolvedTransferRepresentation?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of ResolvedTransferRepresentation?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ResolvedTransferRepresentation?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *outlined retain of ProxyRepresentation<A, B>(_QWORD *a1, void (*a2)(_QWORD, _QWORD), void (*a3)(uint64_t, uint64_t), void (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v7 = a1[2];
  v8 = a1[3];
  v9 = a1[4];
  v10 = a1[5];
  a2(*a1, a1[1]);
  a3(v7, v8);
  a4(v9, v10);
  return a1;
}

uint64_t closure #1 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v10;
  uint64_t v12;

  v8[24] = a8;
  v8[25] = v12;
  v8[22] = a6;
  v8[23] = a7;
  v8[20] = a4;
  v8[21] = a5;
  v8[18] = a2;
  v8[19] = a3;
  v8[17] = a1;
  v8[26] = *(_QWORD *)(a8 - 8);
  v8[27] = swift_task_alloc();
  v10 = type metadata accessor for Optional();
  v8[28] = v10;
  v8[29] = *(_QWORD *)(v10 - 8);
  v8[30] = swift_task_alloc();
  v8[31] = *(_QWORD *)(a7 - 8);
  v8[32] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #1 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  Swift::String v12;
  Swift::String v13;
  Swift::String v14;
  Swift::String v15;
  int *v16;

  outlined init with copy of Transferable(v0[18], (uint64_t)(v0 + 2));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
  if (swift_dynamicCast())
  {
    v2 = v0[31];
    v1 = v0[32];
    v3 = v0[30];
    v4 = v0[23];
    v5 = (int *)v0[19];
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v4);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v1, v3, v4);
    v16 = (int *)((char *)v5 + *v5);
    v6 = (_QWORD *)swift_task_alloc();
    v0[33] = v6;
    *v6 = v0;
    v6[1] = closure #1 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:);
    return ((uint64_t (*)(_QWORD, _QWORD))v16)(v0[27], v0[32]);
  }
  else
  {
    v8 = v0[30];
    v9 = v0[28];
    v10 = v0[29];
    v11 = v0[18];
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v0[31] + 56))(v8, 1, 1, v0[23]);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    outlined init with copy of Transferable(v11, (uint64_t)(v0 + 7));
    _StringGuts.grow(_:)(33);
    swift_bridgeObjectRelease();
    v12._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v12);
    swift_bridgeObjectRelease();
    v13._countAndFlagsBits = 0x756F662074756220;
    v13._object = (void *)0xEB0000000020646ELL;
    String.append(_:)(v13);
    __swift_project_boxed_opaque_existential_1(v0 + 7, v0[10]);
    swift_getDynamicType();
    v14._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v14);
    swift_bridgeObjectRelease();
    v15._object = (void *)0xE90000000000002ELL;
    v15._countAndFlagsBits = 0x64616574736E6920;
    String.append(_:)(v15);
    return _assertionFailure(_:_:file:line:flags:)();
  }
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 272) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int *v3;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v5;
  __int128 v7;

  v2 = *(_QWORD *)(v0 + 208);
  v1 = *(_QWORD *)(v0 + 216);
  v3 = *(int **)(v0 + 168);
  v7 = *(_OWORD *)(v0 + 192);
  *(_OWORD *)(v0 + 120) = v7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 96));
  (*(void (**)(uint64_t *, uint64_t, _QWORD))(v2 + 16))(boxed_opaque_existential_1, v1, v7);
  *(_QWORD *)&v7 = (char *)v3 + *v3;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 280) = v5;
  *v5 = v0;
  v5[1] = closure #1 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:);
  return ((uint64_t (*)(_QWORD, uint64_t))v7)(*(_QWORD *)(v0 + 136), v0 + 96);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 288) = v0;
  swift_task_dealloc();
  if (!v0)
    __swift_destroy_boxed_opaque_existential_1(v2 + 96);
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 248);
  v1 = *(_QWORD *)(v0 + 256);
  v3 = *(_QWORD *)(v0 + 184);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 208) + 8))(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 192));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 248) + 8))(*(_QWORD *)(v0 + 256), *(_QWORD *)(v0 + 184));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 248);
  v1 = *(_QWORD *)(v0 + 256);
  v3 = *(_QWORD *)(v0 + 184);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 208) + 8))(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 192));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t closure #2 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v12;
  _QWORD *v13;
  int *v15;
  uint64_t v16;

  v8[21] = a8;
  v8[22] = v16;
  v8[19] = a6;
  v8[20] = a7;
  v8[17] = a1;
  v8[18] = a5;
  v12 = type metadata accessor for Optional();
  v8[23] = v12;
  v8[24] = *(_QWORD *)(v12 - 8);
  v8[25] = swift_task_alloc();
  v8[26] = *(_QWORD *)(a8 - 8);
  v8[27] = swift_task_alloc();
  v15 = (int *)((char *)a3 + *a3);
  v13 = (_QWORD *)swift_task_alloc();
  v8[28] = v13;
  *v13 = v8;
  v13[1] = closure #2 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:);
  return ((uint64_t (*)(_QWORD *, uint64_t))v15)(v8 + 2, a2);
}

uint64_t closure #2 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 232) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  int *v8;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;
  int *v19;

  outlined init with copy of Transferable((uint64_t)(v0 + 2), (uint64_t)(v0 + 7));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
  if (swift_dynamicCast())
  {
    v2 = v0[26];
    v1 = v0[27];
    v3 = v0[25];
    v4 = v0[21];
    v5 = v0[22];
    v6 = v0[20];
    v7 = (uint64_t *)v0[17];
    v8 = (int *)v0[18];
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v4);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v1, v3, v4);
    v7[3] = v6;
    v7[4] = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
    v19 = (int *)((char *)v8 + *v8);
    v10 = (_QWORD *)swift_task_alloc();
    v0[30] = v10;
    *v10 = v0;
    v10[1] = closure #2 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:);
    return ((uint64_t (*)(uint64_t *, _QWORD))v19)(boxed_opaque_existential_1, v0[27]);
  }
  else
  {
    v12 = v0[25];
    v13 = v0[23];
    v14 = v0[24];
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v0[26] + 56))(v12, 1, 1, v0[21]);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
    outlined init with copy of Transferable((uint64_t)(v0 + 2), (uint64_t)(v0 + 12));
    _StringGuts.grow(_:)(33);
    swift_bridgeObjectRelease();
    v15._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v15);
    swift_bridgeObjectRelease();
    v16._countAndFlagsBits = 0x756F662074756220;
    v16._object = (void *)0xEB0000000020646ELL;
    String.append(_:)(v16);
    __swift_project_boxed_opaque_existential_1(v0 + 12, v0[15]);
    swift_getDynamicType();
    v17._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v17);
    swift_bridgeObjectRelease();
    v18._object = (void *)0xE90000000000002ELL;
    v18._countAndFlagsBits = 0x64616574736E6920;
    String.append(_:)(v18);
    return _assertionFailure(_:_:file:line:flags:)();
  }
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 248) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 208) + 8))(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 168));
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 136);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 208) + 8))(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 168));
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_deallocate_boxed_opaque_existential_1(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t closure #3 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1, uint64_t *a2, uint64_t (*a3)(uint64_t *), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, __CFRunLoop *a8)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
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
  char *v28;
  void (*v29)(char *);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t *);
  uint64_t v50;
  __CFRunLoop *v51;
  uint64_t v52;
  uint64_t v53[3];
  uint64_t v54;
  __CFRunLoop *v55;
  uint64_t v56;

  v51 = a8;
  v47 = a7;
  v48 = a4;
  v49 = a3;
  v12 = type metadata accessor for Optional();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v44 - v14;
  v16 = *(_QWORD *)(a5 - 8);
  v17 = MEMORY[0x24BDAC7A8](v13);
  v19 = (char *)&v44 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v44 - v21;
  v52 = a6;
  v50 = *(_QWORD *)(a6 - 8);
  v23 = MEMORY[0x24BDAC7A8](v20);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v28 = (char *)&v44 - v27;
  v29 = (void (*)(char *))a2[2];
  if (!v29)
  {
    v32 = v56;
    v33 = *a2;
    if (*a2)
    {
      v44 = v26;
      v45 = v25;
      v46 = v24;
      v34 = a2[1];
      outlined init with copy of Transferable(a1, (uint64_t)v53);
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
      swift_dynamicCast();
      a1 = (uint64_t)v51;
      v35 = v52;
      static LegacyExporterCaller.callSynchronously<A, B>(_:item:)(v33, v34, (uint64_t)v19, a5, v52, v47, v51, v15);
      if (v32)
      {
        _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(v33);
        (*(void (**)(char *, uint64_t))(v16 + 8))(v19, a5);
        return a1 & 1;
      }
      v56 = v34;
      (*(void (**)(char *, uint64_t))(v16 + 8))(v19, a5);
      v40 = v50;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48))(v15, 1, v35) != 1)
      {
        v42 = v44;
        (*(void (**)(uint64_t, char *, uint64_t))(v40 + 32))(v44, v15, v35);
        v54 = v35;
        v55 = (__CFRunLoop *)a1;
        boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v53);
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(v40 + 16))(boxed_opaque_existential_1, v42, v35);
        LOBYTE(a1) = v49(v53);
        (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v42, v35);
        v39 = v33;
        goto LABEL_8;
      }
      _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(v33);
      (*(void (**)(char *, uint64_t))(v45 + 8))(v15, v46);
    }
    LOBYTE(a1) = 1;
    return a1 & 1;
  }
  v30 = a2[3];
  outlined init with copy of Transferable(a1, (uint64_t)v53);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
  swift_dynamicCast();
  LOBYTE(a1) = v30;
  v31 = v56;
  v29(v22);
  if (!v31)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v22, a5);
    v36 = v52;
    v54 = v52;
    v55 = v51;
    v37 = __swift_allocate_boxed_opaque_existential_1(v53);
    v38 = v50;
    (*(void (**)(uint64_t *, char *, uint64_t))(v50 + 16))(v37, v28, v36);
    LOBYTE(a1) = v49(v53);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v28, v36);
    v39 = (uint64_t)v29;
LABEL_8:
    _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(v39);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
    return a1 & 1;
  }
  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe((uint64_t)v29);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v22, a5);
  return a1 & 1;
}

double ProxyRepresentation.init(importing:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  _QWORD *v14;
  double result;

  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = a5;
  v14[5] = a6;
  v14[6] = a1;
  v14[7] = a2;
  result = 0.0;
  *(_OWORD *)a7 = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_QWORD *)(a7 + 32) = &async function pointer to partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed B) -> (@out A, @error @owned Error);
  *(_QWORD *)(a7 + 40) = v14;
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed B) -> (@out A, @error @owned Error)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v3;

  a3(a2);
  return thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data) -> (@out A, @error @owned Error)(*(uint64_t (**)(void))(v3 + 8));
}

double ProxyRepresentation.init(importing:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  double result;

  result = 0.0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_QWORD *)(a3 + 32) = a1;
  *(_QWORD *)(a3 + 40) = a2;
  return result;
}

uint64_t ProxyRepresentation.init(exporting:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = result;
  a3[3] = a2;
  a3[4] = 0;
  a3[5] = 0;
  return result;
}

double ProxyRepresentation.init(exporting:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  double result;

  *(_QWORD *)a3 = a1;
  *(_QWORD *)(a3 + 8) = a2;
  result = 0.0;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  return result;
}

_QWORD *ProxyRepresentation.init(exporting:importing:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>)
{
  _QWORD *result;

  result = (_QWORD *)swift_allocObject();
  result[2] = a5;
  result[3] = a6;
  result[4] = a7;
  result[5] = a8;
  result[6] = a3;
  result[7] = a4;
  *a9 = 0;
  a9[1] = 0;
  a9[2] = a1;
  a9[3] = a2;
  a9[4] = &thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed B) -> (@out A, @error @owned Error)partial apply;
  a9[5] = result;
  return result;
}

uint64_t ProxyRepresentation.init(exporting:importing:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = 0;
  a5[3] = 0;
  a5[4] = a3;
  a5[5] = a4;
  return result;
}

{
  *a5 = 0;
  a5[1] = 0;
  a5[2] = result;
  a5[3] = a2;
  a5[4] = a3;
  a5[5] = a4;
  return result;
}

void protocol witness for TransferRepresentation.body.getter in conformance ProxyRepresentation<A, B>(uint64_t a1)
{
  MEMORY[0x20BD054C0](&protocol conformance descriptor for ProxyRepresentation<A, B>, a1);
  PrimitiveTransferRepresentation.body.getter();
}

_QWORD *protocol witness for static TransferRepresentation._decomposedTransferRepresentation(_:inputs:) in conformance ProxyRepresentation<A, B>@<X0>(_OWORD *a1@<X0>, uint64_t *a2@<X2>, uint64_t a3@<X8>)
{
  return static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, a2[2], a2[3], a2[4], a2[5], a3);
}

size_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(size_t result, int64_t a2, char a3, _QWORD *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ResolvedTransferRepresentation>);
  v10 = *(_QWORD *)(type metadata accessor for ResolvedTransferRepresentation() - 8);
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
  v15 = *(_QWORD *)(type metadata accessor for ResolvedTransferRepresentation() - 8);
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
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

uint64_t sub_208347B6C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed B) -> (@out A, @error @owned Error)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void (*v6)(uint64_t);
  _QWORD *v7;

  v6 = *(void (**)(uint64_t))(v2 + 48);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return ((uint64_t (*)(uint64_t, uint64_t, void (*)(uint64_t)))((char *)&async function pointer to thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed B) -> (@out A, @error @owned Error)
                                                                                 + async function pointer to thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed B) -> (@out A, @error @owned Error)))(a1, a2, v6);
}

uint64_t associated type witness table accessor for TransferRepresentation.Item : Transferable in ProxyRepresentation<A, B>(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 32);
}

uint64_t instantiation function for generic protocol witness table for ProxyRepresentation<A, B>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x20BD054C0](&protocol conformance descriptor for ProxyRepresentation<A, B>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata instantiation function for ProxyRepresentation()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t initializeBufferWithCopyOfBuffer for ProxyRepresentation(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

_QWORD *destroy for ProxyRepresentation(_QWORD *result)
{
  _QWORD *v1;

  v1 = result;
  if (*result)
    result = (_QWORD *)swift_release();
  if (v1[2])
    result = (_QWORD *)swift_release();
  if (v1[4])
    return (_QWORD *)swift_release();
  return result;
}

_QWORD *initializeWithCopy for ProxyRepresentation(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (*a2)
  {
    v4 = a2[1];
    *a1 = *a2;
    a1[1] = v4;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  v5 = a2[2];
  if (v5)
  {
    v6 = a2[3];
    a1[2] = v5;
    a1[3] = v6;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
  }
  v7 = a2[4];
  if (v7)
  {
    v8 = a2[5];
    a1[4] = v7;
    a1[5] = v8;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  }
  return a1;
}

_QWORD *assignWithCopy for ProxyRepresentation(_QWORD *a1, _QWORD *a2)
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

  v4 = *a2;
  if (*a1)
  {
    if (v4)
    {
      v5 = a2[1];
      *a1 = v4;
      a1[1] = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = a2[1];
    *a1 = v4;
    a1[1] = v6;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  v7 = a2[2];
  if (a1[2])
  {
    if (v7)
    {
      v8 = a2[3];
      a1[2] = v7;
      a1[3] = v8;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v7)
  {
    v9 = a2[3];
    a1[2] = v7;
    a1[3] = v9;
    swift_retain();
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_15:
  v10 = a2[4];
  if (!a1[4])
  {
    if (v10)
    {
      v12 = a2[5];
      a1[4] = v10;
      a1[5] = v12;
      swift_retain();
      return a1;
    }
LABEL_21:
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
    return a1;
  }
  if (!v10)
  {
    swift_release();
    goto LABEL_21;
  }
  v11 = a2[5];
  a1[4] = v10;
  a1[5] = v11;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

_QWORD *assignWithTake for ProxyRepresentation(_QWORD *a1, _QWORD *a2)
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

  v4 = *a2;
  if (*a1)
  {
    if (v4)
    {
      v5 = a2[1];
      *a1 = v4;
      a1[1] = v5;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = a2[1];
    *a1 = v4;
    a1[1] = v6;
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  v7 = a2[2];
  if (a1[2])
  {
    if (v7)
    {
      v8 = a2[3];
      a1[2] = v7;
      a1[3] = v8;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v7)
  {
    v9 = a2[3];
    a1[2] = v7;
    a1[3] = v9;
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_15:
  v10 = a2[4];
  if (!a1[4])
  {
    if (v10)
    {
      v12 = a2[5];
      a1[4] = v10;
      a1[5] = v12;
      return a1;
    }
LABEL_21:
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
    return a1;
  }
  if (!v10)
  {
    swift_release();
    goto LABEL_21;
  }
  v11 = a2[5];
  a1[4] = v10;
  a1[5] = v11;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ProxyRepresentation(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 48))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ProxyRepresentation(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 48) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

void type metadata accessor for ProxyRepresentation()
{
  JUMPOUT(0x20BD05448);
}

uint64_t outlined destroy of ResolvedTransferRepresentation(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ResolvedTransferRepresentation();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2083480DC()
{
  _QWORD *v0;

  if (v0[6])
    swift_release();
  if (v0[8])
    swift_release();
  if (v0[10])
    swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #3 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1)
{
  uint64_t v1;

  return closure #3 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, (uint64_t *)(v1 + 48), *(uint64_t (**)(uint64_t *))(v1 + 96), *(_QWORD *)(v1 + 104), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(__CFRunLoop **)(v1 + 40)) & 1;
}

uint64_t partial apply for closure #2 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v6 = v2[2];
  v7 = v2[3];
  v8 = (int *)v2[6];
  v9 = v2[7];
  v11 = v2[8];
  v10 = v2[9];
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v12;
  *v12 = v3;
  v12[1] = partial apply for closure #2 in static URL.transferRepresentation.getter;
  return closure #2 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, a2, v8, v9, v11, v10, v6, v7);
}

uint64_t objectdestroy_12Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[6];
  v9 = v2[7];
  v10 = v2[8];
  v11 = v2[9];
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v12;
  *v12 = v3;
  v12[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return closure #1 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, a2, v8, v9, v10, v11, v6, v7);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@out B, @error @owned Error)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[4];
  v9 = v2[5];
  v11 = v2[6];
  v10 = v2[7];
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v12;
  *v12 = v3;
  v12[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&async function pointer to thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@out B, @error @owned Error) + async function pointer to thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@out B, @error @owned Error)))(a1, a2, v11, v10, v6, v7, v8, v9);
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
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

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) - 8) + 80) & 0x20000) != 0)
    JUMPOUT(0x20BD0552CLL);
  return result;
}

uint64_t static DataTransferRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, _QWORD *a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  _QWORD v30[2];
  void *v31;
  uint64_t v32;
  char *v33;
  _QWORD *v34;

  v34 = a4;
  v7 = type metadata accessor for UTType();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for DataTransferRepresentation(0, a2, a3, v11);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v30 - v13;
  v32 = v15;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))((char *)v30 - v13, a1, v12);
  v16 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v33 = v10;
  v16(v10, v14, v7);
  v17 = (uint64_t *)&v14[*(int *)(v12 + 36)];
  v19 = *v17;
  v18 = v17[1];
  if (*v17)
  {
    v20 = (_QWORD *)swift_allocObject();
    v21 = a2;
    v20[2] = a2;
    v20[3] = a3;
    v20[4] = v19;
    v20[5] = v18;
    v31 = &async function pointer to partial apply for thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed A) -> (@owned Data, @error @owned Error);
  }
  else
  {
    v21 = a2;
    v31 = 0;
    v20 = 0;
  }
  v30[1] = v18;
  v22 = (uint64_t *)&v14[*(int *)(v12 + 40)];
  v24 = *v22;
  v23 = v22[1];
  if (*v22)
  {
    v25 = (_QWORD *)swift_allocObject();
    v25[2] = v21;
    v25[3] = a3;
    v25[4] = v24;
    v25[5] = v23;
    v26 = &async function pointer to partial apply for thunk for @escaping @callee_guaranteed @Sendable @async (@guaranteed Data) -> (@out A, @error @owned Error);
  }
  else
  {
    v26 = 0;
    v25 = 0;
  }
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v19);
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v24);
  *(_QWORD *)&v29 = MEMORY[0x24BDCDDE8];
  *((_QWORD *)&v29 + 1) = a3;
  *(_QWORD *)&v28 = v21;
  *((_QWORD *)&v28 + 1) = MEMORY[0x24BDCDDE8];
  _TransferRepresentationOutputs.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporter:importer:)((uint64_t)v33, 0, 0, 2, (uint64_t)v31, (uint64_t)v20, (uint64_t)v26, (uint64_t)v25, v34, v28, v29, (uint64_t)&protocol witness table for Data, (uint64_t)&protocol witness table for Data);
  return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v14, v12);
}

uint64_t type metadata accessor for DataTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for DataTransferRepresentation);
}

uint64_t sub_208348708()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed @Sendable @async (@guaranteed Data) -> (@out A, @error @owned Error)(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;

  v6 = *(int **)(v2 + 32);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = partial apply for closure #2 in static URL.transferRepresentation.getter;
  return ((uint64_t (*)(uint64_t, uint64_t *, int *))((char *)&async function pointer to thunk for @escaping @callee_guaranteed @Sendable @async (@guaranteed Data) -> (@out A, @error @owned Error)
                                                            + async function pointer to thunk for @escaping @callee_guaranteed @Sendable @async (@guaranteed Data) -> (@out A, @error @owned Error)))(a1, a2, v6);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed A) -> (@owned Data, @error @owned Error)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;

  v6 = *(int **)(v2 + 32);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&async function pointer to thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed A) -> (@owned Data, @error @owned Error)
                                                          + async function pointer to thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed A) -> (@owned Data, @error @owned Error)))(a1, a2, v6);
}

uint64_t DataTransferRepresentation.init(contentType:exporter:importer:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  _QWORD *v19;
  _QWORD *v20;

  v16 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(a8, a1, v16);
  result = type metadata accessor for DataTransferRepresentation(0, a6, a7, v17);
  v19 = (_QWORD *)(a8 + *(int *)(result + 36));
  *v19 = a2;
  v19[1] = a3;
  v20 = (_QWORD *)(a8 + *(int *)(result + 40));
  *v20 = a4;
  v20[1] = a5;
  return result;
}

uint64_t DataTransferRepresentation.init(exportedContentType:exporter:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  _QWORD *v16;
  _QWORD *v17;

  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a4;
  *(_QWORD *)(v12 + 24) = a5;
  v13 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(a6, a1, v13);
  result = type metadata accessor for DataTransferRepresentation(0, a4, a5, v14);
  v16 = (_QWORD *)(a6 + *(int *)(result + 36));
  *v16 = a2;
  v16[1] = a3;
  v17 = (_QWORD *)(a6 + *(int *)(result + 40));
  *v17 = &async function pointer to partial apply for closure #1 in DataTransferRepresentation.init(exportedContentType:exporter:);
  v17[1] = v12;
  return result;
}

uint64_t closure #1 in DataTransferRepresentation.init(exportedContentType:exporter:)()
{
  return swift_task_switch();
}

{
  uint64_t v0;
  _BYTE *v1;

  lazy protocol witness table accessor for type TransferableSupportError and conformance TransferableSupportError();
  swift_allocError();
  *v1 = 0;
  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_208348A10()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in DataTransferRepresentation.init(exportedContentType:exporter:)()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return swift_task_switch();
}

uint64_t DataTransferRepresentation.init(importedContentType:importer:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  _QWORD *v16;
  _QWORD *v17;

  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a4;
  *(_QWORD *)(v12 + 24) = a5;
  v13 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(a6, a1, v13);
  result = type metadata accessor for DataTransferRepresentation(0, a4, a5, v14);
  v16 = (_QWORD *)(a6 + *(int *)(result + 36));
  *v16 = &async function pointer to partial apply for closure #1 in DataTransferRepresentation.init(importedContentType:importer:);
  v16[1] = v12;
  v17 = (_QWORD *)(a6 + *(int *)(result + 40));
  *v17 = a2;
  v17[1] = a3;
  return result;
}

uint64_t closure #1 in DataTransferRepresentation.init(importedContentType:importer:)()
{
  return swift_task_switch();
}

{
  uint64_t v0;
  _BYTE *v1;

  lazy protocol witness table accessor for type TransferableSupportError and conformance TransferableSupportError();
  swift_allocError();
  *v1 = 1;
  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_208348BA0()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in DataTransferRepresentation.init(importedContentType:importer:)()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@owned Data, @error @owned Error);
  return swift_task_switch();
}

uint64_t associated type witness table accessor for TransferRepresentation.Item : Transferable in DataTransferRepresentation<A>(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 24);
}

void protocol witness for TransferRepresentation.body.getter in conformance DataTransferRepresentation<A>(uint64_t a1)
{
  MEMORY[0x20BD054C0](&protocol conformance descriptor for DataTransferRepresentation<A>, a1);
  PrimitiveTransferRepresentation.body.getter();
}

uint64_t protocol witness for static TransferRepresentation._decomposedTransferRepresentation(_:inputs:) in conformance DataTransferRepresentation<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, _QWORD *a3@<X8>)
{
  return static DataTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a3);
}

uint64_t instantiation function for generic protocol witness table for DataTransferRepresentation<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x20BD054C0](&protocol conformance descriptor for DataTransferRepresentation<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata instantiation function for DataTransferRepresentation()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata completion function for DataTransferRepresentation()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for UTType();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for DataTransferRepresentation(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;

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
    v7 = type metadata accessor for UTType();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 36);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    if (*v10)
    {
      v11 = v10[1];
      *v9 = *v10;
      v9[1] = v11;
      swift_retain();
    }
    else
    {
      *(_OWORD *)v9 = *(_OWORD *)v10;
    }
    v13 = *(int *)(a3 + 40);
    v14 = (uint64_t *)((char *)a1 + v13);
    v15 = (uint64_t *)((char *)a2 + v13);
    if (*v15)
    {
      v16 = v15[1];
      *v14 = *v15;
      v14[1] = v16;
      swift_retain();
    }
    else
    {
      *(_OWORD *)v14 = *(_OWORD *)v15;
    }
  }
  return a1;
}

uint64_t destroy for DataTransferRepresentation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for UTType();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  if (*(_QWORD *)(a1 + *(int *)(a2 + 36)))
    result = swift_release();
  if (*(_QWORD *)(a1 + *(int *)(a2 + 40)))
    return swift_release();
  return result;
}

uint64_t initializeWithCopy for DataTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  v6 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 36);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  if (*v9)
  {
    v10 = v9[1];
    *v8 = *v9;
    v8[1] = v10;
    swift_retain();
  }
  else
  {
    *(_OWORD *)v8 = *(_OWORD *)v9;
  }
  v11 = *(int *)(a3 + 40);
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  if (*v13)
  {
    v14 = v13[1];
    *v12 = *v13;
    v12[1] = v14;
    swift_retain();
  }
  else
  {
    *(_OWORD *)v12 = *(_OWORD *)v13;
  }
  return a1;
}

uint64_t assignWithCopy for DataTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 36);
  v8 = (_QWORD *)(a1 + v7);
  v9 = a2 + v7;
  v10 = *(_QWORD *)(a1 + v7);
  v11 = *(_QWORD *)(a2 + v7);
  if (v10)
  {
    if (v11)
    {
      v12 = *(_QWORD *)(v9 + 8);
      *v8 = v11;
      v8[1] = v12;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v11)
  {
    v13 = *(_QWORD *)(v9 + 8);
    *v8 = v11;
    v8[1] = v13;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)v8 = *(_OWORD *)v9;
LABEL_8:
  v14 = *(int *)(a3 + 40);
  v15 = (_QWORD *)(a1 + v14);
  v16 = (uint64_t *)(a2 + v14);
  v17 = *(_QWORD *)(a1 + v14);
  v18 = *v16;
  if (!v17)
  {
    if (v18)
    {
      v20 = v16[1];
      *v15 = v18;
      v15[1] = v20;
      swift_retain();
      return a1;
    }
LABEL_14:
    *(_OWORD *)v15 = *(_OWORD *)v16;
    return a1;
  }
  if (!v18)
  {
    swift_release();
    goto LABEL_14;
  }
  v19 = v16[1];
  *v15 = v18;
  v15[1] = v19;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for DataTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 36);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v10 = *v9;
  if (*v9)
  {
    v11 = v9[1];
    *v8 = v10;
    v8[1] = v11;
  }
  else
  {
    *(_OWORD *)v8 = *(_OWORD *)v9;
  }
  v12 = *(int *)(a3 + 40);
  v13 = (_QWORD *)(a1 + v12);
  v14 = (uint64_t *)(a2 + v12);
  v15 = *v14;
  if (*v14)
  {
    v16 = v14[1];
    *v13 = v15;
    v13[1] = v16;
  }
  else
  {
    *(_OWORD *)v13 = *(_OWORD *)v14;
  }
  return a1;
}

uint64_t assignWithTake for DataTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 36);
  v8 = (_QWORD *)(a1 + v7);
  v9 = a2 + v7;
  v10 = *(_QWORD *)(a1 + v7);
  v11 = *(_QWORD *)(a2 + v7);
  if (v10)
  {
    if (v11)
    {
      v12 = *(_QWORD *)(v9 + 8);
      *v8 = v11;
      v8[1] = v12;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v11)
  {
    v13 = *(_QWORD *)(v9 + 8);
    *v8 = v11;
    v8[1] = v13;
    goto LABEL_8;
  }
  *(_OWORD *)v8 = *(_OWORD *)v9;
LABEL_8:
  v14 = *(int *)(a3 + 40);
  v15 = (_QWORD *)(a1 + v14);
  v16 = (uint64_t *)(a2 + v14);
  v17 = *(_QWORD *)(a1 + v14);
  v18 = *v16;
  if (!v17)
  {
    if (v18)
    {
      v20 = v16[1];
      *v15 = v18;
      v15[1] = v20;
      return a1;
    }
LABEL_14:
    *(_OWORD *)v15 = *(_OWORD *)v16;
    return a1;
  }
  if (!v18)
  {
    swift_release();
    goto LABEL_14;
  }
  v19 = v16[1];
  *v15 = v18;
  v15[1] = v19;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DataTransferRepresentation()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_208349198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = type metadata accessor for UTType();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 36));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for DataTransferRepresentation()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20834922C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for UTType();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 36)) = a2;
  return result;
}

unint64_t lazy protocol witness table accessor for type TransferableSupportError and conformance TransferableSupportError()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TransferableSupportError and conformance TransferableSupportError;
  if (!lazy protocol witness table cache variable for type TransferableSupportError and conformance TransferableSupportError)
  {
    result = MEMORY[0x20BD054C0](&protocol conformance descriptor for TransferableSupportError, &type metadata for TransferableSupportError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TransferableSupportError and conformance TransferableSupportError);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TransferableSupportError and conformance TransferableSupportError;
  if (!lazy protocol witness table cache variable for type TransferableSupportError and conformance TransferableSupportError)
  {
    result = MEMORY[0x20BD054C0](&protocol conformance descriptor for TransferableSupportError, &type metadata for TransferableSupportError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TransferableSupportError and conformance TransferableSupportError);
  }
  return result;
}

uint64_t static DataRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, _QWORD *a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  _QWORD v30[2];
  void *v31;
  uint64_t v32;
  char *v33;
  _QWORD *v34;

  v34 = a4;
  v7 = type metadata accessor for UTType();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for DataRepresentation(0, a2, a3, v11);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v30 - v13;
  v32 = v15;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))((char *)v30 - v13, a1, v12);
  v16 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v33 = v10;
  v16(v10, v14, v7);
  v17 = (uint64_t *)&v14[*(int *)(v12 + 36)];
  v19 = *v17;
  v18 = v17[1];
  if (*v17)
  {
    v20 = (_QWORD *)swift_allocObject();
    v21 = a2;
    v20[2] = a2;
    v20[3] = a3;
    v20[4] = v19;
    v20[5] = v18;
    v31 = &_sx10Foundation4DataVs5Error_pIeghHnozo_xACsAD_pIeghHnrzo_16CoreTransferable0E0RzlTRTATu_0;
  }
  else
  {
    v21 = a2;
    v31 = 0;
    v20 = 0;
  }
  v30[1] = v18;
  v22 = (uint64_t *)&v14[*(int *)(v12 + 40)];
  v24 = *v22;
  v23 = v22[1];
  if (*v22)
  {
    v25 = (_QWORD *)swift_allocObject();
    v25[2] = v21;
    v25[3] = a3;
    v25[4] = v24;
    v25[5] = v23;
    v26 = &_s10Foundation4DataVxs5Error_pIeghHgrzo_ACxsAD_pIeghHnrzo_16CoreTransferable0E0RzlTRTATu_0;
  }
  else
  {
    v26 = 0;
    v25 = 0;
  }
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v19);
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v24);
  *(_QWORD *)&v29 = MEMORY[0x24BDCDDE8];
  *((_QWORD *)&v29 + 1) = a3;
  *(_QWORD *)&v28 = v21;
  *((_QWORD *)&v28 + 1) = MEMORY[0x24BDCDDE8];
  _TransferRepresentationOutputs.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporter:importer:)((uint64_t)v33, 0, 0, 2, (uint64_t)v31, (uint64_t)v20, (uint64_t)v26, (uint64_t)v25, v34, v28, v29, (uint64_t)&protocol witness table for Data, (uint64_t)&protocol witness table for Data);
  return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v14, v12);
}

uint64_t type metadata accessor for DataRepresentation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for DataRepresentation);
}

uint64_t sub_2083494F8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t DataRepresentation.init(contentType:exporting:importing:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  _QWORD *v19;
  _QWORD *v20;

  v16 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(a8, a1, v16);
  result = type metadata accessor for DataRepresentation(0, a6, a7, v17);
  v19 = (_QWORD *)(a8 + *(int *)(result + 36));
  *v19 = a2;
  v19[1] = a3;
  v20 = (_QWORD *)(a8 + *(int *)(result + 40));
  *v20 = a4;
  v20[1] = a5;
  return result;
}

uint64_t DataRepresentation.init(exportedContentType:exporting:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  _QWORD *v16;
  _QWORD *v17;

  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a4;
  *(_QWORD *)(v12 + 24) = a5;
  v13 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(a6, a1, v13);
  result = type metadata accessor for DataRepresentation(0, a4, a5, v14);
  v16 = (_QWORD *)(a6 + *(int *)(result + 36));
  *v16 = a2;
  v16[1] = a3;
  v17 = (_QWORD *)(a6 + *(int *)(result + 40));
  *v17 = &async function pointer to partial apply for closure #1 in DataRepresentation.init(exportedContentType:exporting:);
  v17[1] = v12;
  return result;
}

uint64_t sub_208349668()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in DataRepresentation.init(exportedContentType:exporting:)()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return swift_task_switch();
}

uint64_t DataRepresentation.init(importedContentType:importing:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  _QWORD *v16;
  _QWORD *v17;

  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a4;
  *(_QWORD *)(v12 + 24) = a5;
  v13 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(a6, a1, v13);
  result = type metadata accessor for DataRepresentation(0, a4, a5, v14);
  v16 = (_QWORD *)(a6 + *(int *)(result + 36));
  *v16 = &async function pointer to partial apply for closure #1 in DataRepresentation.init(importedContentType:importing:);
  v16[1] = v12;
  v17 = (_QWORD *)(a6 + *(int *)(result + 40));
  *v17 = a2;
  v17[1] = a3;
  return result;
}

uint64_t sub_208349784()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in DataRepresentation.init(importedContentType:importing:)()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@owned Data, @error @owned Error);
  return swift_task_switch();
}

void protocol witness for TransferRepresentation.body.getter in conformance DataRepresentation<A>(uint64_t a1)
{
  MEMORY[0x20BD054C0](&protocol conformance descriptor for DataRepresentation<A>, a1);
  PrimitiveTransferRepresentation.body.getter();
}

uint64_t protocol witness for static TransferRepresentation._decomposedTransferRepresentation(_:inputs:) in conformance DataRepresentation<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, _QWORD *a3@<X8>)
{
  return static DataRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a3);
}

uint64_t instantiation function for generic protocol witness table for DataRepresentation<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x20BD054C0](&protocol conformance descriptor for DataRepresentation<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata completion function for DataRepresentation()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for UTType();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DataRepresentation()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2083498D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = type metadata accessor for UTType();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 36));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for DataRepresentation()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_208349968(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for UTType();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 36)) = a2;
  return result;
}

uint64_t SentTransferredFile.allowAccessingOriginalFile.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for SentTransferredFile(0) + 20));
}

uint64_t type metadata accessor for SentTransferredFile(uint64_t a1)
{
  return type metadata accessor for SentTransferredFile(a1, (uint64_t *)&type metadata singleton initialization cache for SentTransferredFile);
}

uint64_t SentTransferredFile.init(_:allowAccessingOriginalFile:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t result;

  v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a3, a1, v6);
  result = type metadata accessor for SentTransferredFile(0);
  *(_BYTE *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t SentTransferredFile.file.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for URL();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t ReceivedTransferredFile.isOriginalFile.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ReceivedTransferredFile(0) + 20));
}

uint64_t type metadata accessor for ReceivedTransferredFile(uint64_t a1)
{
  return type metadata accessor for SentTransferredFile(a1, (uint64_t *)&type metadata singleton initialization cache for ReceivedTransferredFile);
}

uint64_t type metadata accessor for SentTransferredFile(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ReceivedTransferredFile.init(file:isOriginalFile:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t result;

  v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a3, a1, v6);
  result = type metadata accessor for ReceivedTransferredFile(0);
  *(_BYTE *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t static FileRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;

  v34 = a3;
  v35 = a2;
  v36 = a4;
  v7 = type metadata accessor for UTType();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (int *)type metadata accessor for FileRepresentation(0, a2, a3, v11);
  v13 = *((_QWORD *)v12 - 1);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v31 - v14;
  (*(void (**)(char *, uint64_t, int *))(v13 + 16))((char *)&v31 - v14, a1, v12);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, v15, v7);
  v16 = v12[10];
  v17 = (uint64_t *)&v15[v12[9]];
  v18 = *v17;
  v19 = v17[1];
  v20 = v12[12];
  v21 = (uint64_t *)&v15[v12[11]];
  v22 = *v21;
  if (*v21)
    v23 = v21[1];
  else
    v23 = 0;
  v32 = v23;
  v33 = v18;
  v24 = *(_QWORD *)&v15[v20];
  if (v24)
    v25 = *(_QWORD *)&v15[v20 + 8];
  else
    v25 = 0;
  v31 = v25;
  v26 = v15[v16];
  swift_bridgeObjectRetain();
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v22);
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v24);
  v27 = type metadata accessor for SentTransferredFile(0);
  *(_QWORD *)&v30 = type metadata accessor for ReceivedTransferredFile(0);
  *((_QWORD *)&v30 + 1) = v34;
  *((_QWORD *)&v29 + 1) = v27;
  *(_QWORD *)&v29 = v35;
  _TransferRepresentationOutputs.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:)((uint64_t)v10, v33, v19, v26, v22, v32, v24, v31, v36, v29, v30, (uint64_t)&protocol witness table for SentTransferredFile, (uint64_t)&protocol witness table for ReceivedTransferredFile);
  return (*(uint64_t (**)(char *, int *))(v13 + 8))(v15, v12);
}

uint64_t type metadata accessor for FileRepresentation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for FileRepresentation);
}

uint64_t FileRepresentation.init(contentType:shouldAttemptToOpenInPlace:exporting:importing:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;

  v16 = (int *)type metadata accessor for FileRepresentation(0, a7, a8, a4);
  v17 = v16[10];
  v18 = type metadata accessor for UTType();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(a9, a1, v18);
  *(_BYTE *)(a9 + v17) = a2;
  v20 = (_QWORD *)(a9 + v16[9]);
  *v20 = 0;
  v20[1] = 0;
  v21 = (_QWORD *)(a9 + v16[11]);
  *v21 = a3;
  v21[1] = a4;
  v22 = (_QWORD *)(a9 + v16[12]);
  *v22 = a5;
  v22[1] = a6;
  return result;
}

uint64_t FileRepresentation.init(exportedContentType:shouldAllowToOpenInPlace:exporting:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;

  v12 = (int *)type metadata accessor for FileRepresentation(0, a5, a6, a4);
  v13 = v12[10];
  v14 = type metadata accessor for UTType();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(a7, a1, v14);
  *(_BYTE *)(a7 + v13) = a2;
  v16 = (_QWORD *)(a7 + v12[9]);
  *v16 = 0;
  v16[1] = 0;
  v17 = (_QWORD *)(a7 + v12[11]);
  *v17 = a3;
  v17[1] = a4;
  v18 = (_QWORD *)(a7 + v12[12]);
  *v18 = 0;
  v18[1] = 0;
  return result;
}

uint64_t FileRepresentation.init(importedContentType:shouldAttemptToOpenInPlace:importing:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;

  v12 = (int *)type metadata accessor for FileRepresentation(0, a5, a6, a4);
  v13 = v12[10];
  v14 = type metadata accessor for UTType();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(a7, a1, v14);
  *(_BYTE *)(a7 + v13) = a2;
  v16 = (_QWORD *)(a7 + v12[9]);
  *v16 = 0;
  v16[1] = 0;
  v17 = (_QWORD *)(a7 + v12[11]);
  *v17 = 0;
  v17[1] = 0;
  v18 = (_QWORD *)(a7 + v12[12]);
  *v18 = a3;
  v18[1] = a4;
  return result;
}

void protocol witness for TransferRepresentation.body.getter in conformance FileRepresentation<A>(uint64_t a1)
{
  MEMORY[0x20BD054C0](&protocol conformance descriptor for FileRepresentation<A>, a1);
  PrimitiveTransferRepresentation.body.getter();
}

uint64_t protocol witness for static TransferRepresentation._decomposedTransferRepresentation(_:inputs:) in conformance FileRepresentation<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  return static FileRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a3);
}

uint64_t instantiation function for generic protocol witness table for FileRepresentation<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x20BD054C0](&protocol conformance descriptor for FileRepresentation<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for SentTransferredFile()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for SentTransferredFile()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_QWORD *initializeBufferWithCopyOfBuffer for SentTransferredFile(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for URL();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for SentTransferredFile(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for URL();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for SentTransferredFile(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for SentTransferredFile(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for SentTransferredFile(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for SentTransferredFile(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for ReceivedTransferredFile()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;

  v6 = type metadata accessor for URL();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 2)
    return ((v9 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ReceivedTransferredFile()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for URL();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  return result;
}

uint64_t type metadata completion function for SentTransferredFile()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t type metadata instantiation function for FileRepresentation()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata completion function for FileRepresentation()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for UTType();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for FileRepresentation(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v18 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for UTType();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[9];
    v9 = a3[10];
    v10 = (_QWORD *)((char *)a1 + v8);
    v11 = (_QWORD *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    *((_BYTE *)a1 + v9) = *((_BYTE *)a2 + v9);
    v13 = a3[11];
    v14 = (_QWORD *)((char *)a1 + v13);
    v15 = (char *)a2 + v13;
    v16 = *(_QWORD *)((char *)a2 + v13);
    swift_bridgeObjectRetain();
    if (v16)
    {
      v17 = *((_QWORD *)v15 + 1);
      *v14 = v16;
      v14[1] = v17;
      swift_retain();
    }
    else
    {
      *(_OWORD *)v14 = *(_OWORD *)v15;
    }
    v19 = a3[12];
    v20 = (_QWORD *)((char *)a1 + v19);
    v21 = (_QWORD *)((char *)a2 + v19);
    if (*v21)
    {
      v22 = v21[1];
      *v20 = *v21;
      v20[1] = v22;
      swift_retain();
    }
    else
    {
      *(_OWORD *)v20 = *(_OWORD *)v21;
    }
  }
  return a1;
}

uint64_t destroy for FileRepresentation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  result = swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + *(int *)(a2 + 44)))
    result = swift_release();
  if (*(_QWORD *)(a1 + *(int *)(a2 + 48)))
    return swift_release();
  return result;
}

uint64_t initializeWithCopy for FileRepresentation(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;

  v6 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[9];
  v8 = a3[10];
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  *(_BYTE *)(a1 + v8) = *(_BYTE *)(a2 + v8);
  v12 = a3[11];
  v13 = (_QWORD *)(a1 + v12);
  v14 = a2 + v12;
  v15 = *(_QWORD *)(a2 + v12);
  swift_bridgeObjectRetain();
  if (v15)
  {
    v16 = *(_QWORD *)(v14 + 8);
    *v13 = v15;
    v13[1] = v16;
    swift_retain();
  }
  else
  {
    *(_OWORD *)v13 = *(_OWORD *)v14;
  }
  v17 = a3[12];
  v18 = (_QWORD *)(a1 + v17);
  v19 = (_QWORD *)(a2 + v17);
  if (*v19)
  {
    v20 = v19[1];
    *v18 = *v19;
    v18[1] = v20;
    swift_retain();
  }
  else
  {
    *(_OWORD *)v18 = *(_OWORD *)v19;
  }
  return a1;
}

uint64_t assignWithCopy for FileRepresentation(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[9];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  v10 = a3[11];
  v11 = (_QWORD *)(a1 + v10);
  v12 = a2 + v10;
  v13 = *(_QWORD *)(a1 + v10);
  v14 = *(_QWORD *)(a2 + v10);
  if (v13)
  {
    if (v14)
    {
      v15 = *(_QWORD *)(v12 + 8);
      *v11 = v14;
      v11[1] = v15;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v14)
  {
    v16 = *(_QWORD *)(v12 + 8);
    *v11 = v14;
    v11[1] = v16;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)v11 = *(_OWORD *)v12;
LABEL_8:
  v17 = a3[12];
  v18 = (_QWORD *)(a1 + v17);
  v19 = (uint64_t *)(a2 + v17);
  v20 = *(_QWORD *)(a1 + v17);
  v21 = *v19;
  if (!v20)
  {
    if (v21)
    {
      v23 = v19[1];
      *v18 = v21;
      v18[1] = v23;
      swift_retain();
      return a1;
    }
LABEL_14:
    *(_OWORD *)v18 = *(_OWORD *)v19;
    return a1;
  }
  if (!v21)
  {
    swift_release();
    goto LABEL_14;
  }
  v22 = v19[1];
  *v18 = v21;
  v18[1] = v22;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for FileRepresentation(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  v8 = a3[11];
  v9 = (_QWORD *)(a1 + v8);
  v10 = (uint64_t *)(a2 + v8);
  v11 = *v10;
  if (*v10)
  {
    v12 = v10[1];
    *v9 = v11;
    v9[1] = v12;
  }
  else
  {
    *(_OWORD *)v9 = *(_OWORD *)v10;
  }
  v13 = a3[12];
  v14 = (_QWORD *)(a1 + v13);
  v15 = (uint64_t *)(a2 + v13);
  v16 = *v15;
  if (*v15)
  {
    v17 = v15[1];
    *v14 = v16;
    v14[1] = v17;
  }
  else
  {
    *(_OWORD *)v14 = *(_OWORD *)v15;
  }
  return a1;
}

uint64_t assignWithTake for FileRepresentation(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[9];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = a3[11];
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  v13 = (_QWORD *)(a1 + v12);
  v14 = a2 + v12;
  v15 = *(_QWORD *)(a2 + v12);
  if (*(_QWORD *)(a1 + v12))
  {
    if (v15)
    {
      v16 = *(_QWORD *)(v14 + 8);
      *v13 = v15;
      v13[1] = v16;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v15)
  {
    v17 = *(_QWORD *)(v14 + 8);
    *v13 = v15;
    v13[1] = v17;
    goto LABEL_8;
  }
  *(_OWORD *)v13 = *(_OWORD *)v14;
LABEL_8:
  v18 = a3[12];
  v19 = (_QWORD *)(a1 + v18);
  v20 = (uint64_t *)(a2 + v18);
  v21 = *(_QWORD *)(a1 + v18);
  v22 = *v20;
  if (!v21)
  {
    if (v22)
    {
      v24 = v20[1];
      *v19 = v22;
      v19[1] = v24;
      return a1;
    }
LABEL_14:
    *(_OWORD *)v19 = *(_OWORD *)v20;
    return a1;
  }
  if (!v22)
  {
    swift_release();
    goto LABEL_14;
  }
  v23 = v20[1];
  *v19 = v22;
  v19[1] = v23;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for FileRepresentation()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20834A9A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = type metadata accessor for UTType();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 36) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for FileRepresentation()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20834AA3C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for UTType();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 36) + 8) = a2;
  return result;
}

uint64_t _TransferRepresentationValue.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1);
}

uint64_t _TransferRepresentationValue.applying<A>(offset:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _BYTE v13[16];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = &v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(char *))(v7 + 16))(v9);
  v14 = v6;
  v15 = a4;
  v16 = a1;
  _ss15withUnsafeBytes2of_q0_x_q0_SWq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF((uint64_t)v9, (uint64_t)partial apply for closure #1 in _TransferRepresentationValue.applying<A>(offset:to:), (uint64_t)v13, v6, MEMORY[0x24BEE4078], a4, MEMORY[0x24BEE40A8], v10);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t partial apply for closure #1 in _TransferRepresentationValue.applying<A>(offset:to:)()
{
  return UnsafeRawBufferPointer.load<A>(fromByteOffset:as:)();
}

uint64_t _ss15withUnsafeBytes2of_q0_x_q0_SWq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t, char *);
  uint64_t result;
  uint64_t v18;

  v11 = *(_QWORD *)(a5 - 8);
  v12 = MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = v16(v12, v12 + *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64), v14);
  if (v8)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a8, v14, a5);
  return result;
}

_QWORD *__TupleType.indices.getter(_QWORD *result)
{
  if (*result != 769)
    return 0;
  if ((result[1] & 0x8000000000000000) == 0)
    return 0;
  __break(1u);
  return result;
}

uint64_t __TupleType.type(at:)(uint64_t result, _QWORD *a2)
{
  if (*a2 != 769 || a2[1] <= result)
    return (uint64_t)a2;
  if (result + 0x4000000000000000 < 0)
  {
    __break(1u);
  }
  else if ((unint64_t)(2 * result - 0x1000000000000000) >> 61 == 7)
  {
    return a2[2 * result + 3];
  }
  __break(1u);
  return result;
}

Swift::Int __swiftcall __TupleType.offset(at:)(Swift::Int at)
{
  uint64_t v1;
  Swift::Int result;

  if (*(_QWORD *)(v1 + 8) > at)
  {
    if (at + 0x4000000000000000 < 0)
    {
      __break(1u);
    }
    else if ((unint64_t)(2 * at - 0x1000000000000000) >> 61 == 7)
    {
      return *(_QWORD *)(v1 + 16 * at + 32);
    }
    __break(1u);
  }
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

_QWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance __TypeMetadata@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance __TypeMetadata(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t type metadata completion function for _TransferRepresentationValue()
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

uint64_t *initializeBufferWithCopyOfBuffer for _TransferRepresentationValue(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7 && *(_QWORD *)(v4 + 64) <= 0x18uLL && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    v8 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t initializeWithCopy for _TransferRepresentationValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 16))();
  return a1;
}

uint64_t assignWithCopy for _TransferRepresentationValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 24))();
  return a1;
}

uint64_t initializeWithTake for _TransferRepresentationValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 32))();
  return a1;
}

uint64_t assignWithTake for _TransferRepresentationValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))();
  return a1;
}

uint64_t getEnumTagSinglePayload for _TransferRepresentationValue(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  int v11;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = a2 - v5;
  if (a2 <= v5)
    goto LABEL_18;
  v7 = *(_QWORD *)(v4 + 64);
  v8 = 8 * v7;
  if (v7 <= 3)
  {
    v10 = ((v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      v9 = *(_DWORD *)(a1 + v7);
      if (!v9)
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      v9 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7))
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_18:
      if (v5)
        return (*(uint64_t (**)(void))(v4 + 48))();
      return 0;
    }
  }
  v9 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7))
    goto LABEL_18;
LABEL_11:
  v11 = (v9 - 1) << v8;
  if (v7 > 3)
    v11 = 0;
  if (!(_DWORD)v7)
    return v5 + v11 + 1;
  if (v7 > 3)
    LODWORD(v7) = 4;
  return ((uint64_t (*)(void))((char *)&loc_20834B018 + 4 * byte_208363B60[(v7 - 1)]))();
}

void storeEnumTagSinglePayload for _TransferRepresentationValue(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = a3 >= v7;
  v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      v13 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v13))
      {
        v11 = 4u;
      }
      else if (v13 >= 0x100)
      {
        v11 = 2;
      }
      else
      {
        v11 = v13 > 1;
      }
    }
    else
    {
      v11 = 1u;
    }
  }
  else
  {
    v11 = 0;
  }
  if (v7 < a2)
  {
    v12 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v14 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v14;
        }
        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }
    else
    {
      bzero(a1, *(_QWORD *)(v6 + 64));
      *(_DWORD *)a1 = v12;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t type metadata accessor for _TransferRepresentationValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _TransferRepresentationValue);
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for __TupleType()
{
  return &type metadata for __TupleType;
}

ValueMetadata *type metadata accessor for __EmptyTypeMetadata()
{
  return &type metadata for __EmptyTypeMetadata;
}

uint64_t getEnumTagSinglePayload for __TupleType(uint64_t a1, int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 != 1 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 2);
  if (*(_QWORD *)a1)
    v3 = -1;
  else
    v3 = 0;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for __TupleType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_QWORD *)result = a2 - 2;
    if (a3 >= 2)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for __TypeMetadata()
{
  return &type metadata for __TypeMetadata;
}

uint64_t static FileTransferRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, _QWORD *a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;

  v34 = a3;
  v35 = a2;
  v36 = a4;
  v7 = type metadata accessor for UTType();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (int *)type metadata accessor for FileTransferRepresentation(0, a2, a3, v11);
  v13 = *((_QWORD *)v12 - 1);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v31 - v14;
  (*(void (**)(char *, uint64_t, int *))(v13 + 16))((char *)&v31 - v14, a1, v12);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, v15, v7);
  v16 = v12[10];
  v17 = (uint64_t *)&v15[v12[9]];
  v18 = *v17;
  v19 = v17[1];
  v20 = v12[12];
  v21 = (uint64_t *)&v15[v12[11]];
  v22 = *v21;
  if (*v21)
    v23 = v21[1];
  else
    v23 = 0;
  v32 = v23;
  v33 = v18;
  v24 = *(_QWORD *)&v15[v20];
  if (v24)
    v25 = *(_QWORD *)&v15[v20 + 8];
  else
    v25 = 0;
  v31 = v25;
  v26 = v15[v16];
  swift_bridgeObjectRetain();
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v22);
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v24);
  v27 = type metadata accessor for SentTransferredFile(0);
  *(_QWORD *)&v30 = type metadata accessor for ReceivedTransferredFile(0);
  *((_QWORD *)&v30 + 1) = v34;
  *((_QWORD *)&v29 + 1) = v27;
  *(_QWORD *)&v29 = v35;
  _TransferRepresentationOutputs.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporter:importer:)((uint64_t)v10, v33, v19, v26, v22, v32, v24, v31, v36, v29, v30, (uint64_t)&protocol witness table for SentTransferredFile, (uint64_t)&protocol witness table for ReceivedTransferredFile);
  return (*(uint64_t (**)(char *, int *))(v13 + 8))(v15, v12);
}

uint64_t type metadata accessor for FileTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for FileTransferRepresentation);
}

uint64_t FileTransferRepresentation.init(contentType:shouldAttemptToOpenInPlace:exporter:importer:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;

  v16 = (int *)type metadata accessor for FileTransferRepresentation(0, a7, a8, a4);
  v17 = v16[10];
  v18 = type metadata accessor for UTType();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(a9, a1, v18);
  *(_BYTE *)(a9 + v17) = a2;
  v20 = (_QWORD *)(a9 + v16[9]);
  *v20 = 0;
  v20[1] = 0;
  v21 = (_QWORD *)(a9 + v16[11]);
  *v21 = a3;
  v21[1] = a4;
  v22 = (_QWORD *)(a9 + v16[12]);
  *v22 = a5;
  v22[1] = a6;
  return result;
}

uint64_t FileTransferRepresentation.init(exportedContentType:shouldAllowToOpenInPlace:exporter:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v14;

  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a5;
  *(_QWORD *)(v14 + 24) = a6;
  return FileTransferRepresentation.init(contentType:shouldAttemptToOpenInPlace:exporter:importer:)(a1, a2, a3, a4, (uint64_t)&async function pointer to partial apply for closure #1 in FileTransferRepresentation.init(exportedContentType:shouldAllowToOpenInPlace:exporter:), v14, a5, a6, a7);
}

uint64_t sub_20834B5FC()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in FileTransferRepresentation.init(exportedContentType:shouldAllowToOpenInPlace:exporter:)()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = partial apply for closure #2 in static URL.transferRepresentation.getter;
  return swift_task_switch();
}

uint64_t FileTransferRepresentation.init(importedContentType:shouldAttemptToOpenInPlace:importer:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v14;

  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a5;
  *(_QWORD *)(v14 + 24) = a6;
  return FileTransferRepresentation.init(contentType:shouldAttemptToOpenInPlace:exporter:importer:)(a1, a2, (uint64_t)&async function pointer to partial apply for closure #1 in FileTransferRepresentation.init(importedContentType:shouldAttemptToOpenInPlace:importer:), v14, a3, a4, a5, a6, a7);
}

uint64_t sub_20834B6F0()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in FileTransferRepresentation.init(importedContentType:shouldAttemptToOpenInPlace:importer:)()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return swift_task_switch();
}

void protocol witness for TransferRepresentation.body.getter in conformance FileTransferRepresentation<A>(uint64_t a1)
{
  MEMORY[0x20BD054C0](&protocol conformance descriptor for FileTransferRepresentation<A>, a1);
  PrimitiveTransferRepresentation.body.getter();
}

uint64_t protocol witness for static TransferRepresentation._decomposedTransferRepresentation(_:inputs:) in conformance FileTransferRepresentation<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, _QWORD *a3@<X8>)
{
  return static FileTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a3);
}

uint64_t instantiation function for generic protocol witness table for FileTransferRepresentation<A>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x20BD054C0](&protocol conformance descriptor for FileTransferRepresentation<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata completion function for FileTransferRepresentation()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for UTType();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for FileTransferRepresentation()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20834B84C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = type metadata accessor for UTType();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 36) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for FileTransferRepresentation()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20834B8E4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for UTType();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 36) + 8) = a2;
  return result;
}

void CodableTransferRepresentation.init<>(for:contentType:)(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];

  v19 = a4;
  v20 = a5;
  v21 = a3;
  v9 = type metadata accessor for UTType();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  v13 = type metadata accessor for JSONEncoder();
  swift_allocObject();
  v22[1] = JSONEncoder.init()();
  v14 = type metadata accessor for JSONDecoder();
  v15 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCB268];
  swift_allocObject();
  v22[0] = JSONDecoder.init()();
  v16 = lazy protocol witness table accessor for type AttributedString and conformance AttributedString(&lazy protocol witness table cache variable for type JSONEncoder and conformance JSONEncoder, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB410], MEMORY[0x24BDCB3C8]);
  v17 = lazy protocol witness table accessor for type AttributedString and conformance AttributedString(&lazy protocol witness table cache variable for type JSONDecoder and conformance JSONDecoder, v15, MEMORY[0x24BDCB230]);
  CodableTransferRepresentation.init(for:contentType:encoder:decoder:)(v17, (uint64_t)v12, (uint64_t)v22, a2, v13, v14, v21, a6, v19, v20, v16, v17);
}

uint64_t sub_20834BAA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

void CodableTransferRepresentation.init(for:contentType:encoder:decoder:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t);
  _QWORD v24[8];
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

  v26 = a4;
  v27 = a12;
  v24[3] = a7;
  v24[4] = a11;
  v28 = a9;
  v17 = *(_QWORD *)(a6 - 8);
  v29 = a3;
  v30 = v17;
  v24[7] = *(_QWORD *)(v17 + 64);
  v25 = a10;
  v18 = MEMORY[0x24BDAC7A8](a1);
  v24[5] = *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64);
  v24[6] = (char *)v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v24[2] = (char *)v24 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = type metadata accessor for UTType();
  v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 32);
  v24[1] = a8;
  v23(a8, a2, v22);
  v31 = v26;
  v32 = a5;
  v33 = a6;
  v34 = a7;
  v35 = a9;
  v36 = v25;
  v37 = a11;
  v38 = v27;
  type metadata accessor for CodableTransferRepresentation();
}

uint64_t sub_20834BBDC(uint64_t a1)
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
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  unint64_t v14;
  uint64_t (*v15)();
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (**v20)();
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  unint64_t v24;
  uint64_t (*v25)();
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
  uint64_t (**v29)();

  v10 = *(int *)(a1 + 84);
  *(_QWORD *)(v9 - 176) = a1;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v8 + v10, v3, v4);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v9 - 160) + 16))(v8 + *(int *)(a1 + 88), *(_QWORD *)(v9 - 168), v1);
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v13 = *(_QWORD *)(v9 - 256);
  v12(v13, v3, v4);
  v14 = (*(unsigned __int8 *)(v6 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v15 = (uint64_t (*)())swift_allocObject();
  *((_QWORD *)v15 + 2) = v2;
  *((_QWORD *)v15 + 3) = v4;
  v16 = *(_QWORD *)(v9 - 248);
  v17 = *(_QWORD *)(v9 - 240);
  *((_QWORD *)v15 + 4) = v1;
  *((_QWORD *)v15 + 5) = v16;
  *((_QWORD *)v15 + 6) = *(_QWORD *)(v9 - 184);
  *((_QWORD *)v15 + 7) = v5;
  *((_QWORD *)v15 + 8) = v17;
  *((_QWORD *)v15 + 9) = v7;
  v12((uint64_t)v15 + v14, v13, v4);
  v18 = *(_QWORD *)(v9 - 168);
  v19 = *(_QWORD *)(v9 - 264);
  v20 = (uint64_t (**)())(v19 + *(int *)(*(_QWORD *)(v9 - 176) + 92));
  *v20 = partial apply for closure #1 in CodableRepresentation.init(for:contentType:encoder:decoder:);
  v20[1] = v15;
  v21 = *(_QWORD *)(v9 - 160);
  v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 32);
  v23 = *(_QWORD *)(v9 - 224);
  v22(v23, v18, v1);
  v24 = (*(unsigned __int8 *)(v21 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  v25 = (uint64_t (*)())swift_allocObject();
  *((_QWORD *)v25 + 2) = *(_QWORD *)(v9 - 200);
  *((_QWORD *)v25 + 3) = v4;
  *((_QWORD *)v25 + 4) = v1;
  *((_QWORD *)v25 + 5) = v16;
  v26 = *(_QWORD *)(v9 - 208);
  *((_QWORD *)v25 + 6) = *(_QWORD *)(v9 - 184);
  *((_QWORD *)v25 + 7) = v26;
  v27 = *(_QWORD *)(v9 - 192);
  *((_QWORD *)v25 + 8) = v17;
  *((_QWORD *)v25 + 9) = v27;
  result = ((uint64_t (*)(char *, uint64_t, uint64_t))v22)((char *)v25 + v24, v23, v1);
  v29 = (uint64_t (**)())(v19 + *(int *)(*(_QWORD *)(v9 - 176) + 96));
  *v29 = partial apply for closure #2 in CodableRepresentation.init(for:contentType:encoder:decoder:);
  v29[1] = v25;
  return result;
}

void type metadata accessor for CodableTransferRepresentation()
{
  JUMPOUT(0x20BD05448);
}

uint64_t sub_20834BD50()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 24) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 24) - 8) + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 24) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_20834BDA8()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 32) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 32) - 8) + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 32) - 8) + 80)));
  return swift_deallocObject();
}

void static CodableTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
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

  v25 = a3;
  v26 = a7;
  v23 = a8;
  v24 = a2;
  v21 = a1;
  v19 = a5;
  v20 = a10;
  v27 = a9;
  v18 = type metadata accessor for UTType();
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v17 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = a2;
  v29 = a3;
  v30 = a4;
  v31 = a5;
  v32 = a6;
  v33 = a7;
  v34 = a9;
  v35 = a10;
  type metadata accessor for CodableTransferRepresentation();
}

uint64_t sub_20834BEA8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  __int128 v34;
  __int128 v35;
  _BYTE v36[48];

  v7 = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v5 - 160) = a1;
  *(_QWORD *)(v5 - 216) = v7;
  MEMORY[0x24BDAC7A8](a1);
  v9 = &v36[-v8];
  *(_QWORD *)(v5 - 168) = &v36[-v8];
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v10 + 16))(&v36[-v8], *(_QWORD *)(v5 - 232), a1);
  (*(void (**)(uint64_t, _BYTE *, _QWORD))(v2 + 16))(v3, v9, *(_QWORD *)(v5 - 256));
  v11 = &v9[*(int *)(a1 + 92)];
  v12 = v11[1];
  *(_QWORD *)(v5 - 256) = *v11;
  *(_QWORD *)(v5 - 232) = v12;
  v13 = (_QWORD *)swift_allocObject();
  v14 = *(_QWORD *)(v5 - 200);
  v15 = *(_QWORD *)(v5 - 192);
  v13[2] = v14;
  v13[3] = v15;
  v16 = v4;
  v13[4] = v4;
  v17 = *(_QWORD *)(v5 - 248);
  v13[5] = v17;
  v13[6] = v1;
  v18 = v1;
  *(_QWORD *)(v5 - 264) = v1;
  v20 = *(_QWORD *)(v5 - 184);
  v19 = *(_QWORD *)(v5 - 176);
  v13[7] = v20;
  v13[8] = v19;
  v21 = *(_QWORD *)(v5 - 240);
  v22 = *(_QWORD *)(v5 - 256);
  v13[9] = v21;
  v13[10] = v22;
  v13[11] = v12;
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = v14;
  v23[3] = v15;
  v23[4] = v16;
  v23[5] = v17;
  v23[6] = v18;
  v23[7] = v20;
  v23[8] = v19;
  v23[9] = v21;
  v24 = v19;
  v23[10] = &_sx10Foundation4DataVs5Error_pIeghnozo_xACsAD_pIeghHnozo_16CoreTransferable0E0RzSeRzSERz7Combine15TopLevelEncoderR_AG0gH7DecoderR0_AC6OutputRt_AC5InputRt0_r1_lTRTATu_0;
  v23[11] = v13;
  v25 = (_QWORD *)(*(_QWORD *)(v5 - 168) + *(int *)(*(_QWORD *)(v5 - 160) + 96));
  v26 = v25[1];
  *(_QWORD *)(v5 - 256) = *v25;
  v27 = (_QWORD *)swift_allocObject();
  v28 = *(_QWORD *)(v5 - 200);
  v27[2] = v28;
  v27[3] = v15;
  v27[4] = v16;
  v27[5] = v17;
  v29 = *(_QWORD *)(v5 - 264);
  v30 = *(_QWORD *)(v5 - 184);
  v27[6] = v29;
  v27[7] = v30;
  v27[8] = v24;
  v27[9] = v21;
  v27[10] = *(_QWORD *)(v5 - 256);
  v27[11] = v26;
  v31 = (_QWORD *)swift_allocObject();
  v32 = *(_QWORD *)(v5 - 192);
  v31[2] = v28;
  v31[3] = v32;
  v31[4] = v16;
  v31[5] = v17;
  v31[6] = v29;
  v31[7] = v30;
  v31[8] = *(_QWORD *)(v5 - 176);
  v31[9] = v21;
  v31[10] = &_s10Foundation4DataVxs5Error_pIeghgrzo_ACxsAD_pIeghHgrzo_16CoreTransferable0E0RzSeRzSERz7Combine15TopLevelEncoderR_AG0gH7DecoderR0_AC6OutputRt_AC5InputRt0_r1_lTRTATu_0;
  v31[11] = v27;
  swift_retain();
  swift_retain();
  *(_QWORD *)&v35 = MEMORY[0x24BDCDDE8];
  *((_QWORD *)&v35 + 1) = v17;
  *(_QWORD *)&v34 = v28;
  *((_QWORD *)&v34 + 1) = MEMORY[0x24BDCDDE8];
  _TransferRepresentationOutputs.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporter:importer:)(*(_QWORD *)(v5 - 224), 0, 0, 2, (uint64_t)&_sx10Foundation4DataVs5Error_pIeghHnozo_xACsAD_pIeghHnrzo_16CoreTransferable0E0RzSeRzSERz7Combine15TopLevelEncoderR_AG0gH7DecoderR0_AC6OutputRt_AC5InputRt0_r1_lTRTATu_0, (uint64_t)v23, (uint64_t)&_s10Foundation4DataVxs5Error_pIeghHgrzo_ACxsAD_pIeghHnrzo_16CoreTransferable0E0RzSeRzSERz7Combine15TopLevelEncoderR_AG0gH7DecoderR0_AC6OutputRt_AC5InputRt0_r1_lTRTATu_0, (uint64_t)v31, *(_QWORD **)(v5 - 208), v34, v35, (uint64_t)&protocol witness table for Data, (uint64_t)&protocol witness table for Data);
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v5 - 216) + 8))(*(_QWORD *)(v5 - 168), *(_QWORD *)(v5 - 160));
}

uint64_t sub_20834C0D0()
{
  swift_release();
  return swift_deallocObject();
}

void protocol witness for TransferRepresentation.body.getter in conformance CodableTransferRepresentation<A, B, C>(uint64_t a1)
{
  MEMORY[0x20BD054C0](&protocol conformance descriptor for CodableTransferRepresentation<A, B, C>, a1);
  PrimitiveTransferRepresentation.body.getter();
}

void protocol witness for static TransferRepresentation._decomposedTransferRepresentation(_:inputs:) in conformance CodableTransferRepresentation<A, B, C>(uint64_t a1@<X0>, uint64_t *a2@<X2>, uint64_t a3@<X8>)
{
  static CodableTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, a2[2], a2[3], a2[4], a2[5], a2[6], a2[7], a3, a2[8], a2[9]);
}

uint64_t instantiation function for generic protocol witness table for CodableTransferRepresentation<A, B, C>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x20BD054C0](&protocol conformance descriptor for CodableTransferRepresentation<A, B, C>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for CodableTransferRepresentation(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t (*v25)(uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  unint64_t v27;

  v6 = type metadata accessor for UTType();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = *(_QWORD *)(a3 + 32);
  v10 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v11 = *(_DWORD *)(v10 + 84);
  if (v11 <= v8)
    v12 = *(_DWORD *)(v7 + 84);
  else
    v12 = *(_DWORD *)(v10 + 84);
  v13 = *(_QWORD *)(v9 - 8);
  v14 = *(unsigned int *)(v13 + 84);
  if (v14 > v12)
    v12 = *(_DWORD *)(v13 + 84);
  if (v12 <= 0x7FFFFFFF)
    v12 = 0x7FFFFFFF;
  if (!a2)
    return 0;
  v15 = v6;
  v16 = *(unsigned __int8 *)(v10 + 80);
  v17 = *(_QWORD *)(v7 + 64) + v16;
  v18 = *(_QWORD *)(v10 + 64);
  v19 = *(unsigned __int8 *)(v13 + 80);
  v20 = *(_QWORD *)(v13 + 64) + 7;
  if (v12 < a2)
  {
    if (((((((v20 + ((v18 + v19 + (v17 & ~v16)) & ~v19)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v21 = 2;
    else
      v21 = a2 - v12 + 1;
    if (v21 >= 0x10000)
      v22 = 4;
    else
      v22 = 2;
    if (v21 < 0x100)
      v22 = 1;
    if (v21 >= 2)
      v23 = v22;
    else
      v23 = 0;
    __asm { BR              X21 }
  }
  if (v8 == v12)
  {
    v25 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v26 = a1;
    v14 = *(unsigned int *)(v7 + 84);
    v9 = v15;
    return v25(v26, v14, v9);
  }
  v26 = (v17 + a1) & ~v16;
  if (v11 == v12)
  {
    v25 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    v14 = *(unsigned int *)(v10 + 84);
    v9 = *(_QWORD *)(a3 + 24);
    return v25(v26, v14, v9);
  }
  v26 = (v26 + v18 + v19) & ~v19;
  if ((_DWORD)v14 == v12)
  {
    v25 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
    return v25(v26, v14, v9);
  }
  v27 = *(_QWORD *)((v20 + v26) & 0xFFFFFFFFFFFFF8);
  if (v27 >= 0xFFFFFFFF)
    LODWORD(v27) = -1;
  return (v27 + 1);
}

void storeEnumTagSinglePayload for CodableTransferRepresentation(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  int v16;
  unsigned int v17;

  v8 = *(_QWORD *)(type metadata accessor for UTType() - 8);
  v9 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v9 + 84) <= *(_DWORD *)(v8 + 84))
    v10 = *(_DWORD *)(v8 + 84);
  else
    v10 = *(_DWORD *)(v9 + 84);
  v11 = *(_QWORD *)(*(_QWORD *)(a4 + 32) - 8);
  if (*(_DWORD *)(v11 + 84) > v10)
    v10 = *(_DWORD *)(v11 + 84);
  if (v10 <= 0x7FFFFFFF)
    v10 = 0x7FFFFFFF;
  v12 = *(unsigned __int8 *)(v9 + 80);
  v13 = *(unsigned __int8 *)(v11 + 80);
  if (v10 >= a3)
  {
    v16 = 0;
    if (a2 <= v10)
      goto LABEL_21;
  }
  else
  {
    if (((((*(_DWORD *)(v11 + 64)
           + 7
           + ((*(_DWORD *)(v9 + 64) + (_DWORD)v13 + ((*(_DWORD *)(v8 + 64) + (_DWORD)v12) & ~(_DWORD)v12)) & ~(_DWORD)v13)) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v14 = a3 - v10 + 1;
    else
      v14 = 2;
    if (v14 >= 0x10000)
      v15 = 4;
    else
      v15 = 2;
    if (v14 < 0x100)
      v15 = 1;
    if (v14 >= 2)
      v16 = v15;
    else
      v16 = 0;
    if (a2 <= v10)
LABEL_21:
      __asm { BR              X22 }
  }
  if (((((*(_DWORD *)(v11 + 64)
         + 7
         + ((*(_DWORD *)(v9 + 64) + (_DWORD)v13 + ((*(_DWORD *)(v8 + 64) + (_DWORD)v12) & ~(_DWORD)v12)) & ~(_DWORD)v13)) & 0xFFFFFFF8)
       + 23) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v17 = ~v10 + a2;
    bzero(a1, ((((*(_QWORD *)(v11 + 64) + 7 + ((*(_QWORD *)(v9 + 64) + v13 + ((*(_QWORD *)(v8 + 64) + v12) & ~v12)) & ~v13)) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)+ 16);
    *a1 = v17;
  }
  __asm { BR              X10 }
}

void sub_20834C4C0()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x20834C580);
}

void sub_20834C4C8()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  *(_DWORD *)(v1 + v2) = 0;
  if (v0)
    JUMPOUT(0x20834C4D0);
  JUMPOUT(0x20834C580);
}

void sub_20834C514()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x20834C580);
}

void sub_20834C51C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x20834C580);
}

void sub_20834C524()
{
  int v0;
  int v1;
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  *(_WORD *)(v4 + v5) = 0;
  if (v3)
  {
    if (v1 != v2 && v0 != v2)
      JUMPOUT(0x20834C530);
    JUMPOUT(0x20834C54CLL);
  }
  JUMPOUT(0x20834C580);
}

uint64_t _TransferRepresentationOutputs.storage.getter()
{
  return swift_bridgeObjectRetain();
}

CoreTransferable::_TransferRepresentationOutputs __swiftcall _TransferRepresentationOutputs.init()()
{
  _QWORD *v0;
  CoreTransferable::_TransferRepresentationOutputs result;

  *v0 = MEMORY[0x24BEE4AF8];
  return result;
}

CoreTransferable::_TransferRepresentationOutputs __swiftcall _TransferRepresentationOutputs.init(_:)(CoreTransferable::_TransferRepresentationOutputs result)
{
  CoreTransferable::_TransferRepresentationOutputs *v1;

  v1->storage._rawValue = result.storage._rawValue;
  return result;
}

uint64_t _TransferRepresentationOutputs.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, __int128 a10, __int128 a11, uint64_t a12, uint64_t a13)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t *v33;

  v32 = a4;
  v30 = a2;
  v31 = a3;
  v33 = a9;
  v28 = a11;
  v29 = a10;
  v26 = a13;
  v27 = a12;
  v18 = type metadata accessor for UTType();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v26 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ResolvedTransferRepresentation>);
  v22 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ResolvedTransferRepresentation() - 8) + 80);
  v23 = (v22 + 32) & ~v22;
  v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_2083634C0;
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, a1, v18);
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(a5);
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(a7);
  ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:)((uint64_t)v21, v30, v31, v32, a5, a6, a7, a8, v24 + v23, v29, *((uint64_t *)&v29 + 1), v28, *((uint64_t *)&v28 + 1), v27, v26);
  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(a7);
  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(a5);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 8))(a1, v18);
  *v33 = v24;
  return result;
}

uint64_t type metadata accessor for ResolvedTransferRepresentation()
{
  uint64_t result;

  result = type metadata singleton initialization cache for ResolvedTransferRepresentation;
  if (!type metadata singleton initialization cache for ResolvedTransferRepresentation)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  int *v20;
  uint64_t *v21;
  uint64_t *v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  void *v30;
  _QWORD *v31;
  void *v32;
  uint64_t result;

  *(_QWORD *)a9 = 0;
  *(_QWORD *)(a9 + 8) = 0;
  *(_BYTE *)(a9 + 16) = -1;
  v20 = (int *)type metadata accessor for ResolvedTransferRepresentation();
  v21 = (uint64_t *)(a9 + v20[8]);
  *v21 = 0;
  v21[1] = 0;
  v22 = (uint64_t *)(a9 + v20[9]);
  *v22 = 0;
  v22[1] = 0;
  v23 = (_QWORD *)(a9 + v20[10]);
  *v23 = 0;
  v23[1] = 0;
  v24 = v20[11];
  *(_QWORD *)(a9 + v24) = *(_QWORD *)TransferRepresentationVisibility.all.unsafeMutableAddressor();
  v25 = (_QWORD *)(a9 + v20[12]);
  *v25 = 0;
  v25[1] = 0;
  v26 = a9 + v20[5];
  v27 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 32))(v26, a1, v27);
  if (a3)
  {
    *(_QWORD *)a9 = a2;
    *(_QWORD *)(a9 + 8) = a3;
    *(_BYTE *)(a9 + 16) = 0;
  }
  *(_BYTE *)(a9 + v20[6]) = a4;
  v28 = (_QWORD *)(a9 + v20[7]);
  *v28 = a11;
  v28[1] = a14;
  if (a5)
  {
    v29 = (_QWORD *)swift_allocObject();
    v29[2] = a10;
    v29[3] = a11;
    v29[4] = a12;
    v29[5] = a13;
    v29[6] = a14;
    v29[7] = a15;
    v29[8] = a5;
    v29[9] = a6;
    _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(*v21);
    v30 = &async function pointer to partial apply for closure #1 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:);
  }
  else
  {
    v30 = 0;
    v29 = 0;
  }
  *v21 = (uint64_t)v30;
  v21[1] = (uint64_t)v29;
  if (a7)
  {
    v31 = (_QWORD *)swift_allocObject();
    v31[2] = a10;
    v31[3] = a11;
    v31[4] = a12;
    v31[5] = a13;
    v31[6] = a14;
    v31[7] = a15;
    v32 = &async function pointer to partial apply for closure #2 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:);
    v31[8] = a7;
    v31[9] = a8;
  }
  else
  {
    v32 = 0;
    v31 = 0;
  }
  result = _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(*v22);
  *v22 = (uint64_t)v32;
  v22[1] = (uint64_t)v31;
  return result;
}

Swift::Void __swiftcall _TransferRepresentationOutputs.append(_:)(CoreTransferable::_TransferRepresentationOutputs a1)
{
  size_t v1;

  v1 = swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)(v1);
}

size_t specialized Array.append<A>(contentsOf:)(size_t result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  int64_t v11;

  v2 = *(_QWORD *)(result + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(v6 + 16))
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v11 = v4 + v2;
  else
    v11 = v4;
  result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(result, v11, 1, v3);
  v3 = (_QWORD *)result;
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  v7 = (v3[3] >> 1) - v3[2];
  result = type metadata accessor for ResolvedTransferRepresentation();
  if (v7 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v8 = v3[2];
  v9 = __OFADD__(v8, v2);
  v10 = v8 + v2;
  if (!v9)
  {
    v3[2] = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t _TransferRepresentationOutputs.map<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD v10[5];
  _QWORD v11[3];

  v11[2] = *v3;
  v10[2] = a3;
  v10[3] = a1;
  v10[4] = a2;
  swift_bridgeObjectRetain();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [ResolvedTransferRepresentation]);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  v7 = lazy protocol witness table accessor for type [ResolvedTransferRepresentation] and conformance [A]();
  v8 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))partial apply for thunk for @callee_guaranteed (@in_guaranteed ResolvedTransferRepresentation) -> (@out A, @error @owned Error), (uint64_t)v10, v5, a3, v6, v7, MEMORY[0x24BEE3F20], (uint64_t)v11);
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  Swift::Int v21;
  uint64_t result;
  Swift::Int v23;
  void (*v24)(char *, _QWORD);
  void (*v25)(char *);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, char *);
  uint64_t v39;
  char *v40;
  Swift::Int v41;
  uint64_t v42;
  char v43[32];
  uint64_t v44;

  v30 = a5;
  v31 = a8;
  v38 = a1;
  v39 = a2;
  v29 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v40 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v12 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v14 = (char *)&v29 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = swift_getAssociatedTypeWitness();
  v32 = *(_QWORD *)(v17 - 8);
  v33 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v29 - v18;
  v20 = dispatch thunk of Collection.count.getter();
  if (!v20)
    return static Array._allocateUninitialized(_:)();
  v36 = AssociatedTypeWitness;
  v21 = v20;
  v44 = Array.init()();
  v34 = type metadata accessor for ContiguousArray();
  ContiguousArray.reserveCapacity(_:)(v21);
  v37 = v8;
  result = dispatch thunk of Collection.startIndex.getter();
  if ((v21 & 0x8000000000000000) == 0)
  {
    v23 = v21;
    v35 = v16;
    while (v23)
    {
      v41 = v23;
      v24 = (void (*)(char *, _QWORD))dispatch thunk of Collection.subscript.read();
      v25 = *(void (**)(char *))(v11 + 16);
      v26 = v11;
      v27 = v36;
      v25(v14);
      v24(v43, 0);
      v28 = v42;
      v38(v14, v40);
      if (v28)
      {
        (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v27);
        (*(void (**)(char *, uint64_t))(v32 + 8))(v19, v33);
        swift_release();
        return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v29 + 32))(v31, v40, v30);
      }
      v42 = 0;
      (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v27);
      ContiguousArray.append(_:)();
      result = dispatch thunk of Collection.formIndex(after:)();
      v23 = v41 - 1;
      v11 = v26;
      if (v41 == 1)
      {
        (*(void (**)(char *, uint64_t))(v32 + 8))(v19, v33);
        return v44;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t (*ResolvedTransferRepresentation.SuggestedFileNameStorage.resolved(_:)(uint64_t a1))(_BYTE *)
{
  uint64_t v1;
  uint64_t (*v2)(_BYTE *);
  uint64_t v3;
  uint64_t v4;
  __int128 v6;
  uint64_t v7;
  _BYTE v8[40];

  v2 = *(uint64_t (**)(_BYTE *))v1;
  v3 = *(_QWORD *)(v1 + 8);
  if ((*(_BYTE *)(v1 + 16) & 1) != 0)
  {
    outlined init with copy of Transferable?(a1, (uint64_t)&v6);
    if (v7)
    {
      outlined init with take of Transferable(&v6, (uint64_t)v8);
      swift_retain();
      v4 = v2(v8);
      outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage((uint64_t)v2, v3, 1);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
      return (uint64_t (*)(_BYTE *))v4;
    }
    else
    {
      outlined destroy of Transferable?((uint64_t)&v6);
      return 0;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return v2;
}

uint64_t ResolvedTransferRepresentation.suggestedFileNameStorage.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 v4;

  v2 = *(_QWORD *)v1;
  v3 = *(_QWORD *)(v1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_BYTE *)(v1 + 16);
  *(_BYTE *)(a1 + 16) = v4;
  return outlined copy of ResolvedTransferRepresentation.SuggestedFileNameStorage?(v2, v3, v4);
}

uint64_t ResolvedTransferRepresentation.suggestedFileNameStorage.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  v4 = *((_BYTE *)a1 + 16);
  result = outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage?(*(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(_BYTE *)(v1 + 16));
  *(_QWORD *)v1 = v2;
  *(_QWORD *)(v1 + 8) = v3;
  *(_BYTE *)(v1 + 16) = v4;
  return result;
}

uint64_t (*ResolvedTransferRepresentation.suggestedFileNameStorage.modify())()
{
  return destructiveProjectEnumData for _FileNamedTransferRepresentation.Storage;
}

uint64_t ResolvedTransferRepresentation.contentType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 20);
  v4 = type metadata accessor for UTType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t ResolvedTransferRepresentation.contentType.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 20);
  v4 = type metadata accessor for UTType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*ResolvedTransferRepresentation.contentType.modify())()
{
  type metadata accessor for ResolvedTransferRepresentation();
  return destructiveProjectEnumData for _FileNamedTransferRepresentation.Storage;
}

uint64_t ResolvedTransferRepresentation.shouldAttemptToOpenInPlace.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 24));
}

uint64_t ResolvedTransferRepresentation.shouldAttemptToOpenInPlace.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for ResolvedTransferRepresentation();
  *(_BYTE *)(v1 + *(int *)(result + 24)) = a1;
  return result;
}

uint64_t (*ResolvedTransferRepresentation.shouldAttemptToOpenInPlace.modify())()
{
  type metadata accessor for ResolvedTransferRepresentation();
  return destructiveProjectEnumData for _FileNamedTransferRepresentation.Storage;
}

uint64_t ResolvedTransferRepresentation.representationType.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 28));
}

uint64_t ResolvedTransferRepresentation.representationType.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  _QWORD *v6;

  result = type metadata accessor for ResolvedTransferRepresentation();
  v6 = (_QWORD *)(v2 + *(int *)(result + 28));
  *v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*ResolvedTransferRepresentation.representationType.modify())()
{
  type metadata accessor for ResolvedTransferRepresentation();
  return destructiveProjectEnumData for _FileNamedTransferRepresentation.Storage;
}

uint64_t key path getter for ResolvedTransferRepresentation.exporting : ResolvedTransferRepresentation@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (uint64_t *)(a1 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 32));
  v4 = *v3;
  if (*v3)
    v5 = v3[1];
  else
    v5 = 0;
  *a2 = v4;
  a2[1] = v5;
  return outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v4);
}

uint64_t key path setter for ResolvedTransferRepresentation.exporting : ResolvedTransferRepresentation(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t result;

  v2 = *a1;
  if (*a1)
    v3 = a1[1];
  else
    v3 = 0;
  v4 = (uint64_t *)(a2 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 32));
  v5 = *v4;
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v2);
  result = _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(v5);
  *v4 = v2;
  v4[1] = v3;
  return result;
}

uint64_t ResolvedTransferRepresentation.exporting.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 32));
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v1);
  return v1;
}

uint64_t ResolvedTransferRepresentation.exporting.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t result;

  v5 = (uint64_t *)(v2 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 32));
  result = _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(*v5);
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*ResolvedTransferRepresentation.exporting.modify())()
{
  type metadata accessor for ResolvedTransferRepresentation();
  return destructiveProjectEnumData for _FileNamedTransferRepresentation.Storage;
}

uint64_t key path getter for ResolvedTransferRepresentation.importing : ResolvedTransferRepresentation@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (uint64_t *)(a1 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 36));
  v4 = *v3;
  if (*v3)
    v5 = v3[1];
  else
    v5 = 0;
  *a2 = v4;
  a2[1] = v5;
  return outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v4);
}

uint64_t key path setter for ResolvedTransferRepresentation.importing : ResolvedTransferRepresentation(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t result;

  v2 = *a1;
  if (*a1)
    v3 = a1[1];
  else
    v3 = 0;
  v4 = (uint64_t *)(a2 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 36));
  v5 = *v4;
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v2);
  result = _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(v5);
  *v4 = v2;
  v4[1] = v3;
  return result;
}

uint64_t ResolvedTransferRepresentation.importing.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 36));
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v1);
  return v1;
}

uint64_t ResolvedTransferRepresentation.importing.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t result;

  v5 = (uint64_t *)(v2 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 36));
  result = _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(*v5);
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*ResolvedTransferRepresentation.importing.modify())()
{
  type metadata accessor for ResolvedTransferRepresentation();
  return destructiveProjectEnumData for _FileNamedTransferRepresentation.Storage;
}

uint64_t key path getter for ResolvedTransferRepresentation.exportingCondition : ResolvedTransferRepresentation@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)@<X0>(_BYTE *@<X8>);

  v3 = (uint64_t *)(a1 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 40));
  v4 = *v3;
  v5 = v3[1];
  if (*v3)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed Transferable) -> (@unowned Bool, @error @owned Error);
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v4);
}

uint64_t key path setter for ResolvedTransferRepresentation.exportingCondition : ResolvedTransferRepresentation(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t *v7;
  uint64_t v8;
  uint64_t result;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed Transferable) -> (@out Bool, @error @owned Error);
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(a2 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 40));
  v8 = *v7;
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v3);
  result = _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(v8);
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  return result;
}

uint64_t ResolvedTransferRepresentation.exportingCondition.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 40));
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v1);
  return v1;
}

uint64_t ResolvedTransferRepresentation.exportingCondition.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t result;

  v5 = (uint64_t *)(v2 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 40));
  result = _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(*v5);
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*ResolvedTransferRepresentation.exportingCondition.modify())()
{
  type metadata accessor for ResolvedTransferRepresentation();
  return destructiveProjectEnumData for _FileNamedTransferRepresentation.Storage;
}

uint64_t ResolvedTransferRepresentation.visibility.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for ResolvedTransferRepresentation();
  *a1 = *(_QWORD *)(v1 + *(int *)(result + 44));
  return result;
}

uint64_t ResolvedTransferRepresentation.visibility.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v2 = *a1;
  result = type metadata accessor for ResolvedTransferRepresentation();
  *(_QWORD *)(v1 + *(int *)(result + 44)) = v2;
  return result;
}

uint64_t (*ResolvedTransferRepresentation.visibility.modify())()
{
  type metadata accessor for ResolvedTransferRepresentation();
  return destructiveProjectEnumData for _FileNamedTransferRepresentation.Storage;
}

uint64_t ResolvedTransferRepresentation.suggestedFileName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 48));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ResolvedTransferRepresentation.suggestedFileName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 48));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*ResolvedTransferRepresentation.suggestedFileName.modify())()
{
  type metadata accessor for ResolvedTransferRepresentation();
  return destructiveProjectEnumData for _FileNamedTransferRepresentation.Storage;
}

uint64_t closure #1 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v8;
  uint64_t v10;

  v6[17] = a6;
  v6[18] = v10;
  v6[15] = a4;
  v6[16] = a5;
  v6[13] = a2;
  v6[14] = a3;
  v6[12] = a1;
  v8 = type metadata accessor for Optional();
  v6[19] = v8;
  v6[20] = *(_QWORD *)(v8 - 8);
  v6[21] = swift_task_alloc();
  v6[22] = *(_QWORD *)(a5 - 8);
  v6[23] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #1 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  Swift::String v14;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  __int128 v18;

  outlined init with copy of Transferable(*(_QWORD *)(v0 + 104), v0 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
  if (swift_dynamicCast())
  {
    v2 = *(_QWORD *)(v0 + 176);
    v1 = *(_QWORD *)(v0 + 184);
    v3 = *(_QWORD *)(v0 + 168);
    v4 = *(_QWORD *)(v0 + 128);
    v5 = *(int **)(v0 + 112);
    v6 = *(_QWORD *)(v0 + 96);
    v18 = *(_OWORD *)(v0 + 136);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v4);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v1, v3, v4);
    *(_OWORD *)(v6 + 24) = v18;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)v6);
    *(_QWORD *)&v18 = (char *)v5 + *v5;
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 192) = v8;
    *v8 = v0;
    v8[1] = closure #1 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:);
    return ((uint64_t (*)(uint64_t *, _QWORD))v18)(boxed_opaque_existential_1, *(_QWORD *)(v0 + 184));
  }
  else
  {
    v10 = *(_QWORD *)(v0 + 168);
    v11 = *(_QWORD *)(v0 + 152);
    v12 = *(_QWORD *)(v0 + 160);
    v13 = *(_QWORD *)(v0 + 104);
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 176) + 56))(v10, 1, 1, *(_QWORD *)(v0 + 128));
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
    outlined init with copy of Transferable(v13, v0 + 56);
    _StringGuts.grow(_:)(33);
    swift_bridgeObjectRelease();
    v14._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v14);
    swift_bridgeObjectRelease();
    v15._countAndFlagsBits = 0x756F662074756220;
    v15._object = (void *)0xEB0000000020646ELL;
    String.append(_:)(v15);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
    swift_getDynamicType();
    v16._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v16);
    swift_bridgeObjectRelease();
    v17._object = (void *)0xE90000000000002ELL;
    v17._countAndFlagsBits = 0x64616574736E6920;
    String.append(_:)(v17);
    return _assertionFailure(_:_:file:line:flags:)();
  }
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 200) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 176) + 8))(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 128));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 96);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 176) + 8))(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 128));
  __swift_deallocate_boxed_opaque_existential_1(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t closure #2 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v10;

  v8[17] = a7;
  v8[18] = a8;
  v8[15] = a4;
  v8[16] = a5;
  v8[13] = a2;
  v8[14] = a3;
  v8[12] = a1;
  v10 = type metadata accessor for Optional();
  v8[19] = v10;
  v8[20] = *(_QWORD *)(v10 - 8);
  v8[21] = swift_task_alloc();
  v8[22] = *(_QWORD *)(a7 - 8);
  v8[23] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #2 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t *v8;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;
  Swift::String v19;
  int *v20;

  outlined init with copy of Transferable(v0[13], (uint64_t)(v0 + 2));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TransferableCurrency);
  if (swift_dynamicCast())
  {
    v2 = v0[22];
    v1 = v0[23];
    v3 = v0[21];
    v4 = v0[17];
    v5 = v0[18];
    v6 = v0[16];
    v7 = (int *)v0[14];
    v8 = (uint64_t *)v0[12];
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v4);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v1, v3, v4);
    v8[3] = v6;
    v8[4] = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v8);
    v20 = (int *)((char *)v7 + *v7);
    v10 = (_QWORD *)swift_task_alloc();
    v0[24] = v10;
    *v10 = v0;
    v10[1] = closure #2 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:);
    return ((uint64_t (*)(uint64_t *, _QWORD))v20)(boxed_opaque_existential_1, v0[23]);
  }
  else
  {
    v12 = v0[21];
    v13 = v0[19];
    v14 = v0[20];
    v15 = v0[13];
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v0[22] + 56))(v12, 1, 1, v0[17]);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
    outlined init with copy of Transferable(v15, (uint64_t)(v0 + 7));
    _StringGuts.grow(_:)(33);
    swift_bridgeObjectRelease();
    v16._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v16);
    swift_bridgeObjectRelease();
    v17._countAndFlagsBits = 0x756F662074756220;
    v17._object = (void *)0xEB0000000020646ELL;
    String.append(_:)(v17);
    __swift_project_boxed_opaque_existential_1(v0 + 7, v0[10]);
    swift_getDynamicType();
    v18._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v18);
    swift_bridgeObjectRelease();
    v19._object = (void *)0xE90000000000002ELL;
    v19._countAndFlagsBits = 0x64616574736E6920;
    String.append(_:)(v19);
    return _assertionFailure(_:_:file:line:flags:)();
  }
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 200) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 176) + 8))(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 136));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 96);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 176) + 8))(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 136));
  __swift_deallocate_boxed_opaque_existential_1(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20834DEFC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #2 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;

  v6 = v2[2];
  v7 = v2[4];
  v8 = v2[5];
  v10 = v2[8];
  v9 = v2[9];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v11;
  *v11 = v3;
  v11[1] = partial apply for closure #2 in static URL.transferRepresentation.getter;
  return closure #2 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:)(a1, a2, v10, v9, v6, v12, v7, v8);
}

uint64_t partial apply for closure #1 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v6 = v2[2];
  v7 = v2[3];
  v9 = v2[8];
  v8 = v2[9];
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v10;
  *v10 = v3;
  v10[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return closure #1 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:)(a1, a2, v9, v8, v6, v7);
}

uint64_t partial apply for thunk for @callee_guaranteed (@in_guaranteed ResolvedTransferRepresentation) -> (@out A, @error @owned Error)(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v2 + 24))();
  if (v3)
    *a2 = v3;
  return result;
}

unint64_t lazy protocol witness table accessor for type [ResolvedTransferRepresentation] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [ResolvedTransferRepresentation] and conformance [A];
  if (!lazy protocol witness table cache variable for type [ResolvedTransferRepresentation] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [ResolvedTransferRepresentation]);
    result = MEMORY[0x20BD054C0](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [ResolvedTransferRepresentation] and conformance [A]);
  }
  return result;
}

uint64_t outlined init with copy of Transferable?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Transferable?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined init with take of Transferable(__int128 *a1, uint64_t a2)
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

uint64_t outlined copy of ResolvedTransferRepresentation.SuggestedFileNameStorage?(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255)
    return outlined copy of _FileNamedTransferRepresentation<A>.Storage<A>(result, a2, a3 & 1);
  return result;
}

ValueMetadata *type metadata accessor for _TransferRepresentationOutputs()
{
  return &type metadata for _TransferRepresentationOutputs;
}

unint64_t initializeBufferWithCopyOfBuffer for ResolvedTransferRepresentation(unint64_t a1, uint64_t a2, int *a3)
{
  unint64_t v4;
  int v5;
  int v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *(_QWORD *)a2;
    *(_QWORD *)v4 = *(_QWORD *)a2;
    v4 = v8 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    v7 = *(unsigned __int8 *)(a2 + 16);
    if (v7 == 255)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
    }
    else
    {
      v9 = v7 & 1;
      v10 = *(_QWORD *)a2;
      v11 = *(_QWORD *)(a2 + 8);
      outlined copy of _FileNamedTransferRepresentation<A>.Storage<A>(*(_QWORD *)a2, v11, v7 & 1);
      *(_QWORD *)v4 = v10;
      *(_QWORD *)(v4 + 8) = v11;
      *(_BYTE *)(v4 + 16) = v9;
    }
    v12 = a3[5];
    v13 = v4 + v12;
    v14 = a2 + v12;
    v15 = type metadata accessor for UTType();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
    v16 = a3[7];
    *(_BYTE *)(v4 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
    *(_OWORD *)(v4 + v16) = *(_OWORD *)(a2 + v16);
    v17 = a3[8];
    v18 = (_QWORD *)(v4 + v17);
    v19 = (_QWORD *)(a2 + v17);
    if (*v19)
    {
      v20 = v19[1];
      *v18 = *v19;
      v18[1] = v20;
      swift_retain();
    }
    else
    {
      *(_OWORD *)v18 = *(_OWORD *)v19;
    }
    v21 = a3[9];
    v22 = (_QWORD *)(v4 + v21);
    v23 = (_QWORD *)(a2 + v21);
    if (*v23)
    {
      v24 = v23[1];
      *v22 = *v23;
      v22[1] = v24;
      swift_retain();
    }
    else
    {
      *(_OWORD *)v22 = *(_OWORD *)v23;
    }
    v25 = a3[10];
    v26 = (_QWORD *)(v4 + v25);
    v27 = (_QWORD *)(a2 + v25);
    if (*v27)
    {
      v28 = v27[1];
      *v26 = *v27;
      v26[1] = v28;
      swift_retain();
    }
    else
    {
      *(_OWORD *)v26 = *(_OWORD *)v27;
    }
    v29 = a3[12];
    *(_QWORD *)(v4 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
    v30 = (_QWORD *)(v4 + v29);
    v31 = (_QWORD *)(a2 + v29);
    v32 = v31[1];
    *v30 = *v31;
    v30[1] = v32;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for ResolvedTransferRepresentation(uint64_t a1, int *a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(unsigned __int8 *)(a1 + 16);
  if (v4 != 255)
    outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), v4 & 1);
  v5 = a1 + a2[5];
  v6 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  if (*(_QWORD *)(a1 + a2[8]))
    swift_release();
  if (*(_QWORD *)(a1 + a2[9]))
    swift_release();
  if (*(_QWORD *)(a1 + a2[10]))
    swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ResolvedTransferRepresentation(uint64_t a1, uint64_t *a2, int *a3)
{
  int v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;

  v6 = *((unsigned __int8 *)a2 + 16);
  if (v6 == 255)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
  }
  else
  {
    v7 = v6 & 1;
    v8 = *a2;
    v9 = a2[1];
    outlined copy of _FileNamedTransferRepresentation<A>.Storage<A>(*a2, v9, v6 & 1);
    *(_QWORD *)a1 = v8;
    *(_QWORD *)(a1 + 8) = v9;
    *(_BYTE *)(a1 + 16) = v7;
  }
  v10 = a3[5];
  v11 = a1 + v10;
  v12 = (uint64_t)a2 + v10;
  v13 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
  v14 = a3[7];
  *(_BYTE *)(a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
  *(_OWORD *)(a1 + v14) = *(_OWORD *)((char *)a2 + v14);
  v15 = a3[8];
  v16 = (_QWORD *)(a1 + v15);
  v17 = (uint64_t *)((char *)a2 + v15);
  if (*v17)
  {
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    swift_retain();
  }
  else
  {
    *(_OWORD *)v16 = *(_OWORD *)v17;
  }
  v19 = a3[9];
  v20 = (_QWORD *)(a1 + v19);
  v21 = (uint64_t *)((char *)a2 + v19);
  if (*v21)
  {
    v22 = v21[1];
    *v20 = *v21;
    v20[1] = v22;
    swift_retain();
  }
  else
  {
    *(_OWORD *)v20 = *(_OWORD *)v21;
  }
  v23 = a3[10];
  v24 = (_QWORD *)(a1 + v23);
  v25 = (uint64_t *)((char *)a2 + v23);
  if (*v25)
  {
    v26 = v25[1];
    *v24 = *v25;
    v24[1] = v26;
    swift_retain();
  }
  else
  {
    *(_OWORD *)v24 = *(_OWORD *)v25;
  }
  v27 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(uint64_t *)((char *)a2 + a3[11]);
  v28 = (_QWORD *)(a1 + v27);
  v29 = (uint64_t *)((char *)a2 + v27);
  v30 = v29[1];
  *v28 = *v29;
  v28[1] = v30;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ResolvedTransferRepresentation(uint64_t a1, __int128 *a2, int *a3)
{
  int v6;
  char v7;
  __int128 v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;

  v6 = *((unsigned __int8 *)a2 + 16);
  if (*(unsigned __int8 *)(a1 + 16) == 255)
  {
    if (v6 == 255)
    {
      v8 = *a2;
      *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
      *(_OWORD *)a1 = v8;
    }
    else
    {
      v15 = v6 & 1;
      v16 = *(_QWORD *)a2;
      v17 = *((_QWORD *)a2 + 1);
      outlined copy of _FileNamedTransferRepresentation<A>.Storage<A>(*(_QWORD *)a2, v17, v6 & 1);
      *(_QWORD *)a1 = v16;
      *(_QWORD *)(a1 + 8) = v17;
      *(_BYTE *)(a1 + 16) = v15;
    }
  }
  else if (v6 == 255)
  {
    outlined destroy of ResolvedTransferRepresentation.SuggestedFileNameStorage(a1);
    v7 = *((_BYTE *)a2 + 16);
    *(_OWORD *)a1 = *a2;
    *(_BYTE *)(a1 + 16) = v7;
  }
  else
  {
    v9 = v6 & 1;
    v10 = *(_QWORD *)a2;
    v11 = *((_QWORD *)a2 + 1);
    outlined copy of _FileNamedTransferRepresentation<A>.Storage<A>(*(_QWORD *)a2, v11, v6 & 1);
    v12 = *(_QWORD *)a1;
    v13 = *(_QWORD *)(a1 + 8);
    v14 = *(_BYTE *)(a1 + 16);
    *(_QWORD *)a1 = v10;
    *(_QWORD *)(a1 + 8) = v11;
    *(_BYTE *)(a1 + 16) = v9;
    outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(v12, v13, v14);
  }
  v18 = a3[5];
  v19 = a1 + v18;
  v20 = (uint64_t)a2 + v18;
  v21 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 24))(v19, v20, v21);
  *(_BYTE *)(a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
  *(_OWORD *)(a1 + a3[7]) = *(__int128 *)((char *)a2 + a3[7]);
  v22 = a3[8];
  v23 = (_QWORD *)(a1 + v22);
  v24 = (uint64_t)a2 + v22;
  v25 = *(_QWORD *)(a1 + v22);
  v26 = *(_QWORD *)((char *)a2 + v22);
  if (v25)
  {
    if (v26)
    {
      v27 = *(_QWORD *)(v24 + 8);
      *v23 = v26;
      v23[1] = v27;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v26)
  {
    v28 = *(_QWORD *)(v24 + 8);
    *v23 = v26;
    v23[1] = v28;
    swift_retain();
    goto LABEL_15;
  }
  *(_OWORD *)v23 = *(_OWORD *)v24;
LABEL_15:
  v29 = a3[9];
  v30 = (_QWORD *)(a1 + v29);
  v31 = (uint64_t)a2 + v29;
  v32 = *(_QWORD *)(a1 + v29);
  v33 = *(_QWORD *)((char *)a2 + v29);
  if (v32)
  {
    if (v33)
    {
      v34 = *(_QWORD *)(v31 + 8);
      *v30 = v33;
      v30[1] = v34;
      swift_retain();
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v33)
  {
    v35 = *(_QWORD *)(v31 + 8);
    *v30 = v33;
    v30[1] = v35;
    swift_retain();
    goto LABEL_22;
  }
  *(_OWORD *)v30 = *(_OWORD *)v31;
LABEL_22:
  v36 = a3[10];
  v37 = (_QWORD *)(a1 + v36);
  v38 = (uint64_t)a2 + v36;
  v39 = *(_QWORD *)(a1 + v36);
  v40 = *(_QWORD *)((char *)a2 + v36);
  if (!v39)
  {
    if (v40)
    {
      v42 = *(_QWORD *)(v38 + 8);
      *v37 = v40;
      v37[1] = v42;
      swift_retain();
      goto LABEL_29;
    }
LABEL_28:
    *(_OWORD *)v37 = *(_OWORD *)v38;
    goto LABEL_29;
  }
  if (!v40)
  {
    swift_release();
    goto LABEL_28;
  }
  v41 = *(_QWORD *)(v38 + 8);
  *v37 = v40;
  v37[1] = v41;
  swift_retain();
  swift_release();
LABEL_29:
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)((char *)a2 + a3[11]);
  v43 = a3[12];
  v44 = (_QWORD *)(a1 + v43);
  v45 = (_QWORD *)((char *)a2 + v43);
  *v44 = *v45;
  v44[1] = v45[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t outlined destroy of ResolvedTransferRepresentation.SuggestedFileNameStorage(uint64_t a1)
{
  outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  return a1;
}

uint64_t initializeWithTake for ResolvedTransferRepresentation(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v6 = a3[5];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  *(_OWORD *)(a1 + v10) = *(_OWORD *)(a2 + v10);
  v11 = a3[8];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (uint64_t *)(a2 + v11);
  v14 = *v13;
  if (*v13)
  {
    v15 = v13[1];
    *v12 = v14;
    v12[1] = v15;
  }
  else
  {
    *(_OWORD *)v12 = *(_OWORD *)v13;
  }
  v16 = a3[9];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (uint64_t *)(a2 + v16);
  v19 = *v18;
  if (*v18)
  {
    v20 = v18[1];
    *v17 = v19;
    v17[1] = v20;
  }
  else
  {
    *(_OWORD *)v17 = *(_OWORD *)v18;
  }
  v21 = a3[10];
  v22 = (_QWORD *)(a1 + v21);
  v23 = (uint64_t *)(a2 + v21);
  v24 = *v23;
  if (*v23)
  {
    v25 = v23[1];
    *v22 = v24;
    v22[1] = v25;
  }
  else
  {
    *(_OWORD *)v22 = *(_OWORD *)v23;
  }
  v26 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  *(_OWORD *)(a1 + v26) = *(_OWORD *)(a2 + v26);
  return a1;
}

uint64_t assignWithTake for ResolvedTransferRepresentation(uint64_t a1, uint64_t a2, int *a3)
{
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  v6 = *(unsigned __int8 *)(a1 + 16);
  if (v6 == 255)
    goto LABEL_4;
  v7 = *(unsigned __int8 *)(a2 + 16);
  if (v7 == 255)
  {
    outlined destroy of ResolvedTransferRepresentation.SuggestedFileNameStorage(a1);
LABEL_4:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
    goto LABEL_6;
  }
  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v7 & 1;
  outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(v8, v9, v6 & 1);
LABEL_6:
  v10 = a3[5];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  v14 = a3[7];
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  *(_OWORD *)(a1 + v14) = *(_OWORD *)(a2 + v14);
  v15 = a3[8];
  v16 = (_QWORD *)(a1 + v15);
  v17 = a2 + v15;
  v18 = *(_QWORD *)(a1 + v15);
  v19 = *(_QWORD *)(a2 + v15);
  if (v18)
  {
    if (v19)
    {
      v20 = *(_QWORD *)(v17 + 8);
      *v16 = v19;
      v16[1] = v20;
      swift_release();
      goto LABEL_13;
    }
    swift_release();
  }
  else if (v19)
  {
    v21 = *(_QWORD *)(v17 + 8);
    *v16 = v19;
    v16[1] = v21;
    goto LABEL_13;
  }
  *(_OWORD *)v16 = *(_OWORD *)v17;
LABEL_13:
  v22 = a3[9];
  v23 = (_QWORD *)(a1 + v22);
  v24 = a2 + v22;
  v25 = *(_QWORD *)(a1 + v22);
  v26 = *(_QWORD *)(a2 + v22);
  if (v25)
  {
    if (v26)
    {
      v27 = *(_QWORD *)(v24 + 8);
      *v23 = v26;
      v23[1] = v27;
      swift_release();
      goto LABEL_20;
    }
    swift_release();
  }
  else if (v26)
  {
    v28 = *(_QWORD *)(v24 + 8);
    *v23 = v26;
    v23[1] = v28;
    goto LABEL_20;
  }
  *(_OWORD *)v23 = *(_OWORD *)v24;
LABEL_20:
  v29 = a3[10];
  v30 = (_QWORD *)(a1 + v29);
  v31 = a2 + v29;
  v32 = *(_QWORD *)(a1 + v29);
  v33 = *(_QWORD *)(a2 + v29);
  if (!v32)
  {
    if (v33)
    {
      v35 = *(_QWORD *)(v31 + 8);
      *v30 = v33;
      v30[1] = v35;
      goto LABEL_27;
    }
LABEL_26:
    *(_OWORD *)v30 = *(_OWORD *)v31;
    goto LABEL_27;
  }
  if (!v33)
  {
    swift_release();
    goto LABEL_26;
  }
  v34 = *(_QWORD *)(v31 + 8);
  *v30 = v33;
  v30[1] = v34;
  swift_release();
LABEL_27:
  v36 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  v37 = (_QWORD *)(a1 + v36);
  v38 = (uint64_t *)(a2 + v36);
  v40 = *v38;
  v39 = v38[1];
  *v37 = v40;
  v37[1] = v39;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ResolvedTransferRepresentation()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20834EAB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for UTType();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 28));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for ResolvedTransferRepresentation()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20834EB44(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for UTType();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  return result;
}

uint64_t type metadata completion function for ResolvedTransferRepresentation()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for UTType();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t destroy for ResolvedTransferRepresentation.SuggestedFileNameStorage(uint64_t a1)
{
  return outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

ValueMetadata *type metadata accessor for ResolvedTransferRepresentation.SuggestedFileNameStorage()
{
  return &type metadata for ResolvedTransferRepresentation.SuggestedFileNameStorage;
}

ValueMetadata *type metadata accessor for _TransferRepresentationInputs()
{
  return &type metadata for _TransferRepresentationInputs;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed Transferable) -> (@out Bool, @error @owned Error)()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t var1;

  (*(void (**)(uint64_t *__return_ptr))(v0 + 16))(&var1);
  if (!v1)
    v2 = var1;
  return v2 & 1;
}

uint64_t sub_20834ECC8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed Transferable) -> (@unowned Bool, @error @owned Error)@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 16))();
  if (!v2)
    *a1 = result & 1;
  return result;
}

uint64_t one-time initialization function for transferableRunLoopMode()
{
  uint64_t result;

  result = MEMORY[0x20BD04D28](0xD000000000000017, 0x8000000208364950);
  static CFRunLoopMode.transferableRunLoopMode = result;
  return result;
}

uint64_t RunLoopSource.__deallocating_deinit()
{
  uint64_t v0;

  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(*(_QWORD *)(v0 + 120));
  return swift_deallocClassInstance();
}

uint64_t closure #1 in closure #1 in variable initialization expression of performCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[2] = a1;
  v4[3] = a4;
  type metadata accessor for MainActor();
  v4[4] = static MainActor.shared.getter();
  v4[5] = dispatch thunk of Actor.unownedExecutor.getter();
  v4[6] = v5;
  return swift_task_switch();
}

uint64_t closure #1 in closure #1 in variable initialization expression of performCallback()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(int **)(v1 + 120);
  *(_QWORD *)(v0 + 56) = v2;
  if (v2)
  {
    *(_QWORD *)(v0 + 64) = *(_QWORD *)(v1 + 128);
    v5 = (uint64_t (*)(void))((char *)v2 + *v2);
    swift_retain();
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 72) = v3;
    *v3 = v0;
    v3[1] = closure #1 in closure #1 in variable initialization expression of performCallback;
    return v5();
  }
  else
  {
    swift_release();
    **(_BYTE **)(v0 + 16) = *(_QWORD *)(v0 + 56) == 0;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 56);
  swift_task_dealloc();
  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(v1);
  return swift_task_switch();
}

{
  uint64_t v0;

  swift_release();
  **(_BYTE **)(v0 + 16) = *(_QWORD *)(v0 + 56) == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t _sScTss5NeverORs_rlE8detached8priority9operationScTyxABGScPSg_xyYaYAcntFZytSg_Tgm5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[4];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of TaskPriority?(a1, (uint64_t)v8);
  v9 = type metadata accessor for TaskPriority();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    outlined destroy of TaskPriority?((uint64_t)v8);
    if (*(_QWORD *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v11 = dispatch thunk of Actor.unownedExecutor.getter();
      v13 = v12;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (*(_QWORD *)(a3 + 16))
      goto LABEL_3;
  }
  v11 = 0;
  v13 = 0;
LABEL_6:
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a2;
  *(_QWORD *)(v14 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ()?);
  if (v13 | v11)
  {
    v16[0] = 0;
    v16[1] = 0;
    v16[2] = v11;
    v16[3] = v13;
  }
  return swift_task_create();
}

uint64_t @objc closure #1 in variable initialization expression of performCallback(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  result = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_retain();
    static TaskPriority.userInitiated.getter();
    v6 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 0, 1, v6);
    type metadata accessor for MainActor();
    swift_retain();
    v7 = static MainActor.shared.getter();
    v8 = (_QWORD *)swift_allocObject();
    v9 = MEMORY[0x24BEE6930];
    v8[2] = v7;
    v8[3] = v9;
    v8[4] = a1;
    _sScTss5NeverORs_rlE8detached8priority9operationScTyxABGScPSg_xyYaYAcntFZytSg_Tgm5((uint64_t)v5, (uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in variable initialization expression of performCallback, (uint64_t)v8);
    swift_release();
    swift_release();
    return outlined destroy of TaskPriority?((uint64_t)v5);
  }
  return result;
}

uint64_t LegacyExporterCaller.ProxyItemWrapper.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 96);
  v2 = type metadata accessor for Optional();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t LegacyExporterCaller.ProxyItemWrapper.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 56))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 96), 1, 1);
  return v0;
}

uint64_t LegacyExporterCaller.MainQueueDrainingFlag.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void static LegacyExporterCaller.callSynchronously<A, B>(_:item:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, __CFRunLoop *a7@<X6>, char *a8@<X8>)
{
  uint64_t v8;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  __CFRunLoop *v21;
  __CFRunLoop *v22;
  void *v23;
  uint64_t v24;
  id v25;
  __CFRunLoop *v26;
  __CFString *v27;
  CFRunLoopSourceRef v28;
  void *v29;
  __CFRunLoopSource *v30;
  double v31;
  CFTimeInterval v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  char *v43;
  const __CFString *v44;
  int v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  void **v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  __CFRunLoop *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  __CFRunLoop *v60;
  uint64_t v61;
  __CFRunLoopSource *v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(char *, uint64_t, uint64_t);
  uint64_t v66;
  uint64_t (*v67)(char *, uint64_t);
  int v68;
  void (*v69)(char *, uint64_t);
  __CFRunLoop *v70;
  const __CFString *v71;
  void *v72;
  id v73;
  CFRunLoopSourceRef *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  __CFRunLoop *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  char *v96;
  __CFRunLoop *v97;
  __CFString *v98;
  uint64_t v99;
  CFRunLoopSourceContext context;
  uint64_t v101;

  v97 = a7;
  v85 = a6;
  v82 = a3;
  v86 = a2;
  v84 = a1;
  v12 = type metadata accessor for Optional();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v96 = (char *)&v74 - v15;
  v83 = *(_QWORD *)(a4 - 8);
  v16 = *(_QWORD *)(v83 + 64);
  MEMORY[0x24BDAC7A8](v14);
  v95 = (char *)&v74 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = type metadata accessor for DispatchWorkItemFlags();
  v93 = *(_QWORD *)(v94 - 8);
  MEMORY[0x24BDAC7A8](v94);
  v92 = (char *)&v74 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v91 = type metadata accessor for DispatchQoS();
  v90 = *(_QWORD *)(v91 - 8);
  MEMORY[0x24BDAC7A8](v91);
  v89 = (char *)&v74 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = type metadata accessor for Date();
  v87 = *(_QWORD *)(v88 - 8);
  MEMORY[0x24BDAC7A8](v88);
  v20 = (char *)&v74 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = CFRunLoopGetMain();
  if (v21)
  {
    v22 = v21;
    v75 = v16;
    v76 = a4;
    v77 = v13;
    v101 = a5;
    v78 = v12;
    v79 = a8;
    v80 = v8;
    if (one-time initialization token for transferableRunLoopMode != -1)
      swift_once();
    v23 = (void *)static CFRunLoopMode.transferableRunLoopMode;
    type metadata accessor for RunLoopSource();
    v24 = swift_allocObject();
    *(_OWORD *)(v24 + 96) = 0u;
    *(_OWORD *)(v24 + 112) = 0u;
    *(_QWORD *)(v24 + 128) = 0;
    *(_QWORD *)(v24 + 104) = v22;
    *(_QWORD *)(v24 + 112) = v23;
    *(_QWORD *)(v24 + 16) = 0;
    *(_QWORD *)(v24 + 24) = v24;
    *(_OWORD *)(v24 + 32) = 0u;
    *(_OWORD *)(v24 + 48) = 0u;
    *(_QWORD *)(v24 + 64) = 0;
    *(_QWORD *)(v24 + 72) = @objc closure #1 in variable initialization expression of scheduleCallback;
    *(_QWORD *)(v24 + 80) = @objc closure #1 in variable initialization expression of cancelCallback;
    *(_QWORD *)(v24 + 88) = @objc closure #1 in variable initialization expression of performCallback;
    v25 = v23;
    v26 = v22;
    v27 = (__CFString *)v25;
    v98 = v27;
    context.version = 0;
    context.info = (void *)v24;
    memset(&context.retain, 0, 40);
    context.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))@objc closure #1 in variable initialization expression of scheduleCallback;
    context.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))@objc closure #1 in variable initialization expression of cancelCallback;
    context.perform = (void (__cdecl *)(void *))@objc closure #1 in variable initialization expression of performCallback;
    CFRunLoopAddCommonMode(v26, v27);
    v28 = CFRunLoopSourceCreate(0, 0, &context);
    v29 = *(void **)(v24 + 96);
    *(_QWORD *)(v24 + 96) = v28;

    v74 = (CFRunLoopSourceRef *)(v24 + 96);
    v30 = (__CFRunLoopSource *)*(id *)(v24 + 96);
    CFRunLoopAddSource(v26, v30, v27);

    v81 = v26;
    static Date.distantFuture.getter();
    Date.timeIntervalSinceNow.getter();
    v32 = v31;
    (*(void (**)(char *, uint64_t))(v87 + 8))(v20, v88);
    type metadata accessor for LegacyExporterCaller.ProxyItemWrapper(0, v101, (uint64_t)v97, v33);
    v34 = swift_allocObject();
    v35 = *(_QWORD *)v34;
    v36 = *(_QWORD *)(*(_QWORD *)v34 + 96);
    v88 = v34;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v35 + 80) - 8) + 56))(v34 + v36, 1, 1);
    type metadata accessor for LegacyExporterCaller.MainQueueDrainingFlag();
    v37 = swift_allocObject();
    *(_BYTE *)(v37 + 16) = 1;
    type metadata accessor for OS_dispatch_queue();
    v38 = (void *)static OS_dispatch_queue.main.getter();
    context.copyDescription = (CFStringRef (__cdecl *)(const void *))partial apply for closure #1 in static LegacyExporterCaller.callSynchronously<A, B>(_:item:);
    context.equal = (Boolean (__cdecl *)(const void *, const void *))v37;
    context.version = MEMORY[0x24BDAC760];
    context.info = (void *)1107296256;
    context.retain = (const void *(__cdecl *)(const void *))thunk for @escaping @callee_guaranteed @Sendable () -> ();
    context.release = (void (__cdecl *)(const void *))&block_descriptor_0;
    v39 = _Block_copy(&context);
    swift_retain();
    v40 = v89;
    static DispatchQoS.unspecified.getter();
    v99 = MEMORY[0x24BEE4AF8];
    lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
    v41 = v92;
    v42 = v94;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    MEMORY[0x20BD04E6C](0, v40, v41, v39);
    _Block_release(v39);

    (*(void (**)(char *, uint64_t))(v93 + 8))(v41, v42);
    v43 = v40;
    v44 = v98;
    (*(void (**)(char *, uint64_t))(v90 + 8))(v43, v91);
    swift_release();
    if (CFRunLoopRunInMode(v44, 0.001, 0) != kCFRunLoopRunFinished
      && CFRunLoopRunInMode(v44, 0.001, 0) != kCFRunLoopRunFinished
      && CFRunLoopRunInMode(v44, 0.001, 0) != kCFRunLoopRunFinished
      && CFRunLoopRunInMode(v44, 0.001, 0) != kCFRunLoopRunFinished
      && CFRunLoopRunInMode(v44, 0.001, 0) != kCFRunLoopRunFinished
      && CFRunLoopRunInMode(v44, 0.001, 0) != kCFRunLoopRunFinished
      && CFRunLoopRunInMode(v44, 0.001, 0) != kCFRunLoopRunFinished
      && CFRunLoopRunInMode(v44, 0.001, 0) != kCFRunLoopRunFinished
      && CFRunLoopRunInMode(v44, 0.001, 0) != kCFRunLoopRunFinished)
    {
      CFRunLoopRunInMode(v44, 0.001, 0);
    }
    v45 = *(unsigned __int8 *)(v37 + 16);
    v46 = v37;
    v47 = v96;
    if (v45 == 1)
    {
      swift_release();
      swift_release();
      swift_release();

      (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v101 - 8) + 56))(v79, 1, 1);
    }
    else
    {
      v93 = v46;
      v48 = swift_allocObject();
      v94 = v48;
      *(_QWORD *)(v48 + 16) = 0;
      v49 = (void **)(v48 + 16);
      v50 = v83;
      v51 = v76;
      (*(void (**)(char *, uint64_t, uint64_t))(v83 + 16))(v95, v82, v76);
      v52 = (*(unsigned __int8 *)(v50 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
      v92 = (char *)((v75 + v52 + 7) & 0xFFFFFFFFFFFFFFF8);
      v53 = (unint64_t)(v92 + 15) & 0xFFFFFFFFFFFFFFF8;
      v54 = swift_allocObject();
      v55 = v101;
      *(_QWORD *)(v54 + 16) = v51;
      *(_QWORD *)(v54 + 24) = v55;
      v56 = v97;
      *(_QWORD *)(v54 + 32) = v85;
      *(_QWORD *)(v54 + 40) = v56;
      v57 = v84;
      *(_QWORD *)(v54 + 48) = v88;
      *(_QWORD *)(v54 + 56) = v57;
      *(_QWORD *)(v54 + 64) = v86;
      v58 = v51;
      v59 = v88;
      (*(void (**)(unint64_t, char *, uint64_t))(v50 + 32))(v54 + v52, v95, v58);
      *(_QWORD *)&v92[v54] = v94;
      v60 = v81;
      *(_QWORD *)(v54 + v53) = v81;
      v61 = *(_QWORD *)(v24 + 120);
      *(_QWORD *)(v24 + 120) = &async function pointer to partial apply for closure #2 in static LegacyExporterCaller.callSynchronously<A, B>(_:item:);
      *(_QWORD *)(v24 + 128) = v54;
      v97 = v60;
      swift_retain();
      swift_retain();
      swift_retain();
      _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(v61);
      v62 = *(__CFRunLoopSource **)(v24 + 96);
      swift_retain();
      CFRunLoopSourceSignal(v62);
      CFRunLoopWakeUp(*(CFRunLoopRef *)(v24 + 104));
      swift_release();
      v63 = v59 + *(_QWORD *)(*(_QWORD *)v59 + 96);
      swift_beginAccess();
      swift_beginAccess();
      v64 = v77;
      v65 = *(void (**)(char *, uint64_t, uint64_t))(v77 + 16);
      v66 = v78;
      v65(v47, v63, v78);
      v67 = *(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v101 - 8) + 48);
      v68 = v67(v47, 1);
      v69 = *(void (**)(char *, uint64_t))(v64 + 8);
      if (v68 == 1)
      {
        while (1)
        {
          v69(v47, v66);
          if (*v49)
            break;
          CFRunLoopRunInMode(v98, v32, 0);
          v65(v47, v63, v66);
          if (((unsigned int (*)(char *, uint64_t, uint64_t))v67)(v47, 1, v101) != 1)
            goto LABEL_20;
        }
      }
      else
      {
LABEL_20:
        v69(v47, v66);
      }
      v70 = *(__CFRunLoop **)(v24 + 104);
      if (v70)
      {
        if (*v74)
        {
          v71 = *(const __CFString **)(v24 + 112);
          if (v71)
            CFRunLoopRemoveSource(v70, *v74, v71);
        }
      }
      swift_beginAccess();
      v72 = *v49;
      if (v72)
      {
        v73 = v72;
        swift_willThrow();
        swift_release();
        swift_release();
        swift_release();
        swift_release();

      }
      else
      {
        swift_release();
        swift_release();

        v65(v79, v63, v78);
        swift_release();
        swift_release();
      }
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 56))(a8, 1, 1, a5);
  }
}

uint64_t type metadata accessor for RunLoopSource()
{
  return objc_opt_self();
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

uint64_t closure #2 in static LegacyExporterCaller.callSynchronously<A, B>(_:item:)(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t);

  v6[9] = a5;
  v6[10] = a6;
  v6[8] = a1;
  v6[11] = *(_QWORD *)(*(_QWORD *)a1 + 80);
  v9 = type metadata accessor for Optional();
  v6[12] = v9;
  v6[13] = *(_QWORD *)(v9 - 8);
  v10 = swift_task_alloc();
  v6[14] = v10;
  v6[15] = type metadata accessor for MainActor();
  v6[16] = static MainActor.shared.getter();
  v13 = (uint64_t (*)(uint64_t, uint64_t))((char *)a2 + *a2);
  v11 = (_QWORD *)swift_task_alloc();
  v6[17] = v11;
  *v11 = v6;
  v11[1] = closure #2 in static LegacyExporterCaller.callSynchronously<A, B>(_:item:);
  return v13(v10, a4);
}

uint64_t closure #2 in static LegacyExporterCaller.callSynchronously<A, B>(_:item:)()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 144) = v0;
  swift_task_dealloc();
  dispatch thunk of Actor.unownedExecutor.getter();
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

  v2 = *(_QWORD *)(v0 + 104);
  v1 = *(_QWORD *)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 96);
  v5 = *(_QWORD *)(v0 + 64);
  swift_release();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v1, 0, 1, v4);
  v6 = v5 + *(_QWORD *)(*(_QWORD *)v5 + 96);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 40))(v6, v1, v3);
  swift_endAccess();
  CFRunLoopStop(*(CFRunLoopRef *)(v0 + 80));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(_QWORD *)(v0 + 72);
  swift_release();
  swift_beginAccess();
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = v1;

  CFRunLoopStop(*(CFRunLoopRef *)(v0 + 80));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRytSg_TG5(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRytSg_TG5TQ0_;
  return v5(v2 + 32);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRytSg_TG5TQ0_()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_BYTE **)(*v0 + 16);
  v4 = *v0;
  swift_task_dealloc();
  *v2 = *(_BYTE *)(v1 + 32);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t type metadata accessor for LegacyExporterCaller.ProxyItemWrapper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LegacyExporterCaller.ProxyItemWrapper);
}

uint64_t type metadata accessor for LegacyExporterCaller.MainQueueDrainingFlag()
{
  return objc_opt_self();
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

void partial apply for closure #1 in static LegacyExporterCaller.callSynchronously<A, B>(_:item:)()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 16) = 0;
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

unint64_t lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags;
  if (!lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags();
    result = MEMORY[0x20BD054C0](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A];
  if (!lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    result = MEMORY[0x20BD054C0](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A]);
  }
  return result;
}

uint64_t sub_2083500DC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_208350100()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();

  return swift_deallocObject();
}

uint64_t partial apply for closure #2 in static LegacyExporterCaller.callSynchronously<A, B>(_:item:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v2 = *(_QWORD *)(v0[2] - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = v0[6];
  v6 = (int *)v0[7];
  v7 = v0[8];
  v8 = (uint64_t)v0 + v3;
  v9 = *(_QWORD *)((char *)v0 + v4);
  v10 = *(_QWORD *)((char *)v0 + ((v4 + 15) & 0xFFFFFFFFFFFFF8));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v11;
  *v11 = v1;
  v11[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return closure #2 in static LegacyExporterCaller.callSynchronously<A, B>(_:item:)(v5, v6, v7, v8, v9, v10);
}

ValueMetadata *type metadata accessor for LegacyExporterCaller()
{
  return &type metadata for LegacyExporterCaller;
}

uint64_t type metadata completion function for LegacyExporterCaller.ProxyItemWrapper()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for Optional();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void type metadata accessor for CFRunLoopMode(uint64_t a1)
{
  type metadata accessor for CFRunLoopMode(a1, &lazy cache variable for type metadata for CFRunLoopMode);
}

void type metadata accessor for CFRunLoopSourceRef(uint64_t a1)
{
  type metadata accessor for CFRunLoopMode(a1, &lazy cache variable for type metadata for CFRunLoopSourceRef);
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for CFRunLoopSourceContext(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 80))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CFRunLoopSourceContext(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 80) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 80) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

void type metadata accessor for CFRunLoopSourceContext(uint64_t a1)
{
  type metadata accessor for CFRunLoopMode(a1, &lazy cache variable for type metadata for CFRunLoopSourceContext);
}

void type metadata accessor for CFRunLoopRef(uint64_t a1)
{
  type metadata accessor for CFRunLoopMode(a1, &lazy cache variable for type metadata for CFRunLoopRef);
}

uint64_t sub_2083503FC()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in variable initialization expression of performCallback(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(v1 + 32);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = partial apply for closure #2 in static URL.transferRepresentation.getter;
  return closure #1 in closure #1 in variable initialization expression of performCallback(a1, v6, v7, v4);
}

uint64_t outlined destroy of TaskPriority?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined init with copy of TaskPriority?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_208350508()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRytSg_TG5TA(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = partial apply for closure #2 in static URL.transferRepresentation.getter;
  return ((uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRytSg_TG5Tu
                                                 + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRytSg_TG5Tu))(a1, v4);
}

void type metadata accessor for CFStringRef(uint64_t a1)
{
  type metadata accessor for CFRunLoopMode(a1, &lazy cache variable for type metadata for CFStringRef);
}

void type metadata accessor for CFRunLoopMode(uint64_t a1, unint64_t *a2)
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

uint64_t static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t AssociatedTypeWitness;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t AssociatedConformanceWitness;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  uint64_t v42;
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
  char v55[16];
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  v47 = a4;
  v42 = a3;
  v46 = a2;
  v48 = a6;
  v54 = type metadata accessor for ResolvedTransferRepresentation();
  v8 = *(_QWORD *)(v54 - 8);
  v9 = MEMORY[0x24BDAC7A8](v54);
  v53 = (uint64_t)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v39 - v11;
  v45 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ResolvedTransferRepresentation?);
  v40 = *(_QWORD *)(v45 - 8);
  v13 = MEMORY[0x24BDAC7A8](v45);
  v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v39 - v16;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v20 = (char *)&v39 - v19;
  v44 = type metadata accessor for _TransferRepresentationValue(0, AssociatedTypeWitness, v21, v22);
  v43 = *(_QWORD *)(v44 - 8);
  MEMORY[0x24BDAC7A8](v44);
  v24 = (char *)&v39 - v23;
  v25 = *a1;
  v26 = a1[1];
  v27 = a1[2];
  v28 = a1[3];
  v51 = v25;
  v52 = v27;
  v49 = v26;
  v50 = v28;
  v41 = *(void (**)(uint64_t, uint64_t))(a5 + 24);
  ((void (*)(void))_sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOy)();
  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOy(v27, v28);
  v29 = v42;
  v41(v42, a5);
  _TransferRepresentationValue.init(_:)((uint64_t)v20, AssociatedTypeWitness, (uint64_t)v24);
  _TransferRepresentationInputs.init()();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t *__return_ptr, char *))(AssociatedConformanceWitness + 48))(&v64, v24);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v24, v44);
  v56 = v46;
  v57 = v29;
  v58 = v47;
  v59 = a5;
  v60 = v51;
  v61 = v49;
  v62 = v52;
  v63 = v50;
  v31 = _TransferRepresentationOutputs.map<A>(_:)((uint64_t)partial apply for closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:), (uint64_t)v55, v45);
  swift_bridgeObjectRelease();
  v32 = *(_QWORD *)(v31 + 16);
  if (v32)
  {
    v33 = v31 + ((*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80));
    v34 = *(_QWORD *)(v40 + 72);
    v47 = v31;
    swift_bridgeObjectRetain();
    v35 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      outlined init with copy of ResolvedTransferRepresentation?(v33, (uint64_t)v17);
      outlined init with take of ResolvedTransferRepresentation?((uint64_t)v17, (uint64_t)v15);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v15, 1, v54) == 1)
      {
        outlined destroy of ResolvedTransferRepresentation?((uint64_t)v15);
      }
      else
      {
        outlined init with take of ResolvedTransferRepresentation((uint64_t)v15, (uint64_t)v12);
        outlined init with take of ResolvedTransferRepresentation((uint64_t)v12, v53);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v35 = (_QWORD *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v35[2] + 1, 1, v35);
        v37 = v35[2];
        v36 = v35[3];
        if (v37 >= v36 >> 1)
          v35 = (_QWORD *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v36 > 1, v37 + 1, 1, v35);
        v35[2] = v37 + 1;
        outlined init with take of ResolvedTransferRepresentation(v53, (uint64_t)v35+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * v37);
      }
      v33 += v34;
      --v32;
    }
    while (v32);
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
    v35 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  _TransferRepresentationOutputs.init(_:)((Swift::OpaquePointer)v35);
  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOe(v51, v49);
  return _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOe(v52, v50);
}

uint64_t closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v39 = a7;
  v40 = a8;
  v37 = a10;
  v38 = a6;
  v16 = type metadata accessor for ResolvedTransferRepresentation();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of ResolvedTransferRepresentation(a1, (uint64_t)v19);
  if (a2)
  {
    v36 = a5;
    swift_retain();
    v20 = ResolvedTransferRepresentation.exporter.getter();
    if (v20)
    {
      v22 = v20;
      v23 = v21;
      v24 = (_QWORD *)swift_allocObject();
      v25 = v39;
      v24[2] = v38;
      v24[3] = v25;
      v26 = v37;
      v24[4] = v40;
      v24[5] = v26;
      v24[6] = a2;
      v24[7] = a3;
      v24[8] = v22;
      v24[9] = v23;
      ResolvedTransferRepresentation.exporter.setter((uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:), (uint64_t)v24);
    }
    else
    {
      _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOe(a2, a3);
    }
    a5 = v36;
  }
  if (a4)
  {
    swift_retain();
    v27 = ResolvedTransferRepresentation.importer.getter();
    if (v27)
    {
      v29 = v27;
      v30 = v28;
      v31 = (_QWORD *)swift_allocObject();
      v32 = v39;
      v31[2] = v38;
      v31[3] = v32;
      v33 = v37;
      v31[4] = v40;
      v31[5] = v33;
      v31[6] = v29;
      v31[7] = v30;
      v31[8] = a4;
      v31[9] = a5;
      ResolvedTransferRepresentation.importer.setter((uint64_t)&async function pointer to partial apply for closure #2 in closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:), (uint64_t)v31);
    }
    else
    {
      _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOe(a4, a5);
    }
  }
  outlined init with take of ResolvedTransferRepresentation((uint64_t)v19, a9);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v17 + 56))(a9, 0, 1, v16);
}

uint64_t partial apply for closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  return closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, v2[6], v2[7], v2[8], v2[9], v2[2], v2[3], v2[4], a2, v2[5]);
}

uint64_t closure #1 in closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v10;
  uint64_t v12;

  v8[24] = a8;
  v8[25] = v12;
  v8[22] = a6;
  v8[23] = a7;
  v8[20] = a4;
  v8[21] = a5;
  v8[18] = a2;
  v8[19] = a3;
  v8[17] = a1;
  v8[26] = *(_QWORD *)(a8 - 8);
  v8[27] = swift_task_alloc();
  v10 = type metadata accessor for Optional();
  v8[28] = v10;
  v8[29] = *(_QWORD *)(v10 - 8);
  v8[30] = swift_task_alloc();
  v8[31] = *(_QWORD *)(a7 - 8);
  v8[32] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #1 in closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  Swift::String v12;
  Swift::String v13;
  Swift::String v14;
  Swift::String v15;
  int *v16;

  outlined init with copy of Transferable(v0[18], (uint64_t)(v0 + 2));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
  if (swift_dynamicCast())
  {
    v2 = v0[31];
    v1 = v0[32];
    v3 = v0[30];
    v4 = v0[23];
    v5 = (int *)v0[19];
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v4);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v1, v3, v4);
    v16 = (int *)((char *)v5 + *v5);
    v6 = (_QWORD *)swift_task_alloc();
    v0[33] = v6;
    *v6 = v0;
    v6[1] = closure #1 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:);
    return ((uint64_t (*)(_QWORD, _QWORD))v16)(v0[27], v0[32]);
  }
  else
  {
    v8 = v0[30];
    v9 = v0[28];
    v10 = v0[29];
    v11 = v0[18];
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v0[31] + 56))(v8, 1, 1, v0[23]);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    outlined init with copy of Transferable(v11, (uint64_t)(v0 + 7));
    _StringGuts.grow(_:)(33);
    swift_bridgeObjectRelease();
    v12._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v12);
    swift_bridgeObjectRelease();
    v13._countAndFlagsBits = 0x756F662074756220;
    v13._object = (void *)0xEB0000000020646ELL;
    String.append(_:)(v13);
    __swift_project_boxed_opaque_existential_1(v0 + 7, v0[10]);
    swift_getDynamicType();
    v14._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v14);
    swift_bridgeObjectRelease();
    v15._object = (void *)0xE90000000000002ELL;
    v15._countAndFlagsBits = 0x64616574736E6920;
    String.append(_:)(v15);
    return _assertionFailure(_:_:file:line:flags:)();
  }
}

uint64_t closure #2 in closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v12;
  _QWORD *v13;
  int *v15;
  uint64_t v16;

  v8[21] = a8;
  v8[22] = v16;
  v8[19] = a6;
  v8[20] = a7;
  v8[17] = a1;
  v8[18] = a5;
  v12 = type metadata accessor for Optional();
  v8[23] = v12;
  v8[24] = *(_QWORD *)(v12 - 8);
  v8[25] = swift_task_alloc();
  v8[26] = *(_QWORD *)(a8 - 8);
  v8[27] = swift_task_alloc();
  v15 = (int *)((char *)a3 + *a3);
  v13 = (_QWORD *)swift_task_alloc();
  v8[28] = v13;
  *v13 = v8;
  v13[1] = closure #2 in closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:);
  return ((uint64_t (*)(_QWORD *, uint64_t))v15)(v8 + 2, a2);
}

uint64_t closure #2 in closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:)()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 232) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  int *v8;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;
  int *v19;

  outlined init with copy of Transferable((uint64_t)(v0 + 2), (uint64_t)(v0 + 7));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
  if (swift_dynamicCast())
  {
    v2 = v0[26];
    v1 = v0[27];
    v3 = v0[25];
    v4 = v0[21];
    v5 = v0[22];
    v6 = v0[20];
    v7 = (uint64_t *)v0[17];
    v8 = (int *)v0[18];
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v4);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v1, v3, v4);
    v7[3] = v6;
    v7[4] = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
    v19 = (int *)((char *)v8 + *v8);
    v10 = (_QWORD *)swift_task_alloc();
    v0[30] = v10;
    *v10 = v0;
    v10[1] = closure #2 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:);
    return ((uint64_t (*)(uint64_t *, _QWORD))v19)(boxed_opaque_existential_1, v0[27]);
  }
  else
  {
    v12 = v0[25];
    v13 = v0[23];
    v14 = v0[24];
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v0[26] + 56))(v12, 1, 1, v0[21]);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
    outlined init with copy of Transferable((uint64_t)(v0 + 2), (uint64_t)(v0 + 12));
    _StringGuts.grow(_:)(33);
    swift_bridgeObjectRelease();
    v15._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v15);
    swift_bridgeObjectRelease();
    v16._countAndFlagsBits = 0x756F662074756220;
    v16._object = (void *)0xEB0000000020646ELL;
    String.append(_:)(v16);
    __swift_project_boxed_opaque_existential_1(v0 + 12, v0[15]);
    swift_getDynamicType();
    v17._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v17);
    swift_bridgeObjectRelease();
    v18._object = (void *)0xE90000000000002ELL;
    v18._countAndFlagsBits = 0x64616574736E6920;
    String.append(_:)(v18);
    return _assertionFailure(_:_:file:line:flags:)();
  }
}

_QWORD *ProxyTransferRepresentation.init(importer:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  _QWORD *result;

  result = (_QWORD *)swift_allocObject();
  result[2] = a3;
  result[3] = a4;
  result[4] = a5;
  result[5] = a6;
  result[6] = a1;
  result[7] = a2;
  *a7 = 0;
  a7[1] = 0;
  a7[2] = &async function pointer to partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed B) -> (@out A);
  a7[3] = result;
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed B) -> (@out A)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v3;

  a3(a2);
  return thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data) -> (@out A, @error @owned Error)(*(uint64_t (**)(void))(v3 + 8));
}

_QWORD *ProxyTransferRepresentation.init(exporter:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  _QWORD *result;

  result = (_QWORD *)swift_allocObject();
  result[2] = a3;
  result[3] = a4;
  result[4] = a5;
  result[5] = a6;
  result[6] = a1;
  result[7] = a2;
  *a7 = &async function pointer to partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@out B);
  a7[1] = result;
  a7[2] = 0;
  a7[3] = 0;
  return result;
}

_QWORD *ProxyTransferRepresentation.init(exporter:importer:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>)
{
  _QWORD *v18;
  _QWORD *result;

  v18 = (_QWORD *)swift_allocObject();
  v18[2] = a5;
  v18[3] = a6;
  v18[4] = a7;
  v18[5] = a8;
  v18[6] = a1;
  v18[7] = a2;
  result = (_QWORD *)swift_allocObject();
  result[2] = a5;
  result[3] = a6;
  result[4] = a7;
  result[5] = a8;
  result[6] = a3;
  result[7] = a4;
  *a9 = &thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@out B)partial apply;
  a9[1] = v18;
  a9[2] = &thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed B) -> (@out A)partial apply;
  a9[3] = result;
  return result;
}

void protocol witness for TransferRepresentation.body.getter in conformance ProxyTransferRepresentation<A, B>(uint64_t a1)
{
  MEMORY[0x20BD054C0](&protocol conformance descriptor for ProxyTransferRepresentation<A, B>, a1);
  PrimitiveTransferRepresentation.body.getter();
}

uint64_t protocol witness for static TransferRepresentation._decomposedTransferRepresentation(_:inputs:) in conformance ProxyTransferRepresentation<A, B>@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X2>, uint64_t a3@<X8>)
{
  return static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, a2[2], a2[3], a2[4], a2[5], a3);
}

uint64_t sub_20835151C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed B) -> (@out A)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void (*v6)(uint64_t);
  _QWORD *v7;

  v6 = *(void (**)(uint64_t))(v2 + 48);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return ((uint64_t (*)(uint64_t, uint64_t, void (*)(uint64_t)))((char *)&async function pointer to thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed B) -> (@out A)
                                                                                 + async function pointer to thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed B) -> (@out A)))(a1, a2, v6);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@out B)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[4];
  v9 = v2[5];
  v11 = v2[6];
  v10 = v2[7];
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v12;
  *v12 = v3;
  v12[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&async function pointer to thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@out B) + async function pointer to thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@out B)))(a1, a2, v11, v10, v6, v7, v8, v9);
}

uint64_t instantiation function for generic protocol witness table for ProxyTransferRepresentation<A, B>(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x20BD054C0](&protocol conformance descriptor for ProxyTransferRepresentation<A, B>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

_QWORD *destroy for ProxyTransferRepresentation(_QWORD *result)
{
  _QWORD *v1;

  v1 = result;
  if (*result)
    result = (_QWORD *)swift_release();
  if (v1[2])
    return (_QWORD *)swift_release();
  return result;
}

_QWORD *initializeWithCopy for ProxyTransferRepresentation(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (*a2)
  {
    v4 = a2[1];
    *a1 = *a2;
    a1[1] = v4;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  v5 = a2[2];
  if (v5)
  {
    v6 = a2[3];
    a1[2] = v5;
    a1[3] = v6;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
  }
  return a1;
}

_QWORD *assignWithCopy for ProxyTransferRepresentation(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *a2;
  if (*a1)
  {
    if (v4)
    {
      v5 = a2[1];
      *a1 = v4;
      a1[1] = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = a2[1];
    *a1 = v4;
    a1[1] = v6;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  v7 = a2[2];
  if (!a1[2])
  {
    if (v7)
    {
      v9 = a2[3];
      a1[2] = v7;
      a1[3] = v9;
      swift_retain();
      return a1;
    }
LABEL_14:
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    return a1;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_14;
  }
  v8 = a2[3];
  a1[2] = v7;
  a1[3] = v8;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_QWORD *assignWithTake for ProxyTransferRepresentation(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *a2;
  if (*a1)
  {
    if (v4)
    {
      v5 = a2[1];
      *a1 = v4;
      a1[1] = v5;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = a2[1];
    *a1 = v4;
    a1[1] = v6;
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  v7 = a2[2];
  if (!a1[2])
  {
    if (v7)
    {
      v9 = a2[3];
      a1[2] = v7;
      a1[3] = v9;
      return a1;
    }
LABEL_14:
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    return a1;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_14;
  }
  v8 = a2[3];
  a1[2] = v7;
  a1[3] = v8;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ProxyTransferRepresentation(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 32))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ProxyTransferRepresentation(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

void type metadata accessor for ProxyTransferRepresentation()
{
  JUMPOUT(0x20BD05448);
}

uint64_t partial apply for closure #2 in closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v6 = v2[2];
  v7 = v2[3];
  v8 = (int *)v2[6];
  v9 = v2[7];
  v11 = v2[8];
  v10 = v2[9];
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v12;
  *v12 = v3;
  v12[1] = partial apply for closure #2 in static URL.transferRepresentation.getter;
  return closure #2 in closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, a2, v8, v9, v11, v10, v6, v7);
}

uint64_t partial apply for closure #1 in closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[6];
  v9 = v2[7];
  v10 = v2[8];
  v11 = v2[9];
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v12;
  *v12 = v3;
  v12[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return closure #1 in closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, a2, v8, v9, v10, v11, v6, v7);
}

_QWORD *static __TupleDescriptor.tupleDescription(_:)(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t (*v13)(_QWORD *, uint64_t, uint64_t);
  void (*v14)(_QWORD *, _QWORD);
  _QWORD v16[5];
  _QWORD *v17;

  v6 = destructiveProjectEnumData for _FileNamedTransferRepresentation.Storage();
  v7 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  v17 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a3 + 8);
  v10 = type metadata accessor for __TupleTypeDescription(0, a2, v8, v9);
  MEMORY[0x20BD04D04](v16, &v17, v7, MEMORY[0x24BEE0940], v10, MEMORY[0x24BEE0948]);
  swift_bridgeObjectRelease();
  v12 = (_QWORD *)v16[0];
  if (!v16[0])
  {
    v12 = __TupleTypeDescription.init(_:)(a1, a2, v8, v11);
    v16[4] = v6;
    v17 = v12;
    v13 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(a3 + 32);
    swift_bridgeObjectRetain();
    v14 = (void (*)(_QWORD *, _QWORD))v13(v16, a2, a3);
    type metadata accessor for Dictionary();
    Dictionary.subscript.setter();
    v14(v16, 0);
  }
  return v12;
}

uint64_t type metadata accessor for __TupleTypeDescription(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for __TupleTypeDescription);
}

_QWORD *__TupleTypeDescription.init(_:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  _QWORD *result;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  BOOL v13;

  type metadata accessor for TypeConformance(255, a2, a3, a4);
  swift_getTupleTypeMetadata2();
  v7 = Array.init()();
  result = __TupleType.indices.getter(a1);
  if (result == v9)
    return (_QWORD *)v7;
  v10 = (uint64_t)result;
  v11 = v9;
  if ((uint64_t)v9 >= (uint64_t)result)
  {
    if ((uint64_t)result < (uint64_t)v9)
      goto LABEL_6;
    __break(1u);
    while (v11 != (_QWORD *)++v10)
    {
LABEL_6:
      v12 = __TupleType.type(at:)(v10, a1);
      (*(void (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
      if (swift_conformsToProtocol())
        v13 = v12 == 0;
      else
        v13 = 1;
      if (!v13)
      {
        type metadata accessor for Array();
        Array.append(_:)();
      }
    }
    return (_QWORD *)v7;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for TypeConformance(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TypeConformance);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TypeConformance(uint64_t a1, int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 != 1 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2);
  if (*(_QWORD *)a1)
    v3 = -1;
  else
    v3 = 0;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for TypeConformance(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 2)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)result = 0;
  }
  return result;
}

void TupleTransferRepresentation.body.getter(uint64_t a1)
{
  MEMORY[0x20BD054C0](&protocol conformance descriptor for TupleTransferRepresentation<A, B>, a1);
  TransferRepresentation.bodyError()();
}

uint64_t TupleTransferRepresentation.value.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 24) - 8) + 16))(a2, v2);
}

uint64_t TupleTransferRepresentation.value.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 40))(v2, a1);
}

uint64_t (*TupleTransferRepresentation.value.modify())()
{
  return destructiveProjectEnumData for _FileNamedTransferRepresentation.Storage;
}

uint64_t TupleTransferRepresentation.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1);
}

uint64_t static TupleTransferRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, _QWORD *a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t *v23;
  Swift::Int v24;
  uint64_t v25;
  uint64_t v26;
  Swift::Int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  _QWORD *v32;
  _QWORD *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[4];

  v42[3] = *MEMORY[0x24BDAC8D0];
  v10 = type metadata accessor for TupleTransferRepresentation(255, a2, a3, a4);
  v13 = type metadata accessor for _TransferRepresentationValue(0, v10, v11, v12);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v32 - v15;
  v17 = type metadata accessor for TupleTransferRepresentation.Visitor(0, a2, a3, a4);
  v38 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v32 - v18;
  v20 = (_QWORD *)destructiveProjectEnumData for _FileNamedTransferRepresentation.Storage(a3);
  v21 = static __TupleDescriptor.tupleDescription(_:)(v20, (uint64_t)&type metadata for TransferRepresentationDescriptor, (uint64_t)&protocol witness table for TransferRepresentationDescriptor);
  _TransferRepresentationOutputs.init()();
  v22 = v21[2];
  if (v22)
  {
    v32 = v21;
    v33 = a5;
    v36 = v14;
    v37 = v20;
    v23 = v21 + 6;
    v34 = v16;
    v35 = v13;
    do
    {
      v24 = *(v23 - 2);
      v25 = *(v23 - 1);
      v26 = *v23;
      v23 += 3;
      v39 = v26;
      v40 = v25;
      v27 = __TupleType.offset(at:)(v24);
      v28 = v35;
      (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a1, v35);
      _TransferRepresentationOutputs.init()();
      v29 = a1;
      v30 = v42[0];
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v16, v28);
      *(_QWORD *)&v19[*(int *)(v17 + 44)] = v27;
      *(_QWORD *)&v19[*(int *)(v17 + 48)] = v30;
      a1 = v29;
      v42[0] = v19;
      v42[1] = v17;
      v42[2] = &protocol witness table for TupleTransferRepresentation<A, B>.Visitor;
      _callVisitTransferRepresentationType1((uint64_t)v42, v40, v39);
      v42[0] = *(_QWORD *)&v19[*(int *)(v17 + 48)];
      _TransferRepresentationOutputs.append(_:)((CoreTransferable::_TransferRepresentationOutputs)v42);
      (*(void (**)(char *, uint64_t))(v38 + 8))(v19, v17);
      --v22;
    }
    while (v22);
    result = swift_bridgeObjectRelease();
    a5 = v33;
  }
  else
  {
    result = swift_bridgeObjectRelease();
  }
  *a5 = v41;
  return result;
}

uint64_t type metadata accessor for TupleTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TupleTransferRepresentation);
}

uint64_t type metadata accessor for TupleTransferRepresentation.Visitor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TupleTransferRepresentation.Visitor);
}

uint64_t TupleTransferRepresentation.Visitor.visit<A>(type:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v25 = a3;
  v7 = type metadata accessor for _TransferRepresentationValue(0, a2, a3, a4);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v24 - v10;
  v12 = *(_QWORD *)(a2 - 8);
  v13 = MEMORY[0x24BDAC7A8](v9);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v24 - v16;
  v18 = *(_QWORD *)(v4 + *(int *)(a1 + 44));
  v19 = type metadata accessor for TupleTransferRepresentation(255, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32));
  v22 = type metadata accessor for _TransferRepresentationValue(0, v19, v20, v21);
  _TransferRepresentationValue.applying<A>(offset:to:)(v18, a2, v22, a2);
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, a2);
  _TransferRepresentationValue.init(_:)((uint64_t)v15, a2, (uint64_t)v11);
  (*(void (**)(uint64_t *__return_ptr, char *))(v25 + 48))(&v27, v11);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  v26 = v27;
  _TransferRepresentationOutputs.append(_:)((CoreTransferable::_TransferRepresentationOutputs)&v26);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v17, a2);
}

uint64_t protocol witness for TransferRepresentationTypeVisitor.visit<A>(type:) in conformance TupleTransferRepresentation<A, B>.Visitor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return TupleTransferRepresentation.Visitor.visit<A>(type:)(a4, a2, a3, a4);
}

void protocol witness for TransferRepresentation.body.getter in conformance TupleTransferRepresentation<A, B>(uint64_t a1)
{
  TupleTransferRepresentation.body.getter(a1);
}

uint64_t protocol witness for static TransferRepresentation._decomposedTransferRepresentation(_:inputs:) in conformance TupleTransferRepresentation<A, B>@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X2>, _QWORD *a3@<X8>)
{
  return static TupleTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, a2[2], a2[3], a2[4], a3);
}

void PrimitiveTransferRepresentation.body.getter()
{
  TransferRepresentation.bodyError()();
}

uint64_t _callVisitTransferRepresentationType2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 16) + 8))(a3, a3, a4, *(_QWORD *)(a1 + 8));
}

uint64_t one-time initialization function for _typeCache()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v4 = MEMORY[0x24BEE4B00];
  v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [ObjectIdentifier : __TupleTypeDescription<TransferRepresentationDescriptor>]);
  result = AtomicBox.init(wrappedValue:)((uint64_t)&v4, v0, v1, v2);
  static TransferRepresentationDescriptor._typeCache = result;
  return result;
}

uint64_t associated type witness table accessor for TransferRepresentation.Body : TransferRepresentation in TupleTransferRepresentation<A, B>()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t protocol witness for static __TupleDescriptor.typeCache.getter in conformance TransferRepresentationDescriptor()
{
  os_unfair_lock_s *v0;
  uint64_t v1;
  uint64_t v3;

  if (one-time initialization token for _typeCache != -1)
    swift_once();
  v0 = (os_unfair_lock_s *)static TransferRepresentationDescriptor._typeCache;
  swift_retain();
  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [ObjectIdentifier : __TupleTypeDescription<TransferRepresentationDescriptor>]);
  AtomicBox.wrappedValue.getter(v0, v1, (uint64_t)&v3);
  swift_release();
  return v3;
}

uint64_t protocol witness for static __TupleDescriptor.typeCache.setter in conformance TransferRepresentationDescriptor(uint64_t a1)
{
  os_unfair_lock_s *v2;
  void (*v3)(os_unfair_lock_s **);
  _QWORD *v4;
  os_unfair_lock_s *v6[4];

  if (one-time initialization token for _typeCache != -1)
    swift_once();
  v2 = (os_unfair_lock_s *)static TransferRepresentationDescriptor._typeCache;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [ObjectIdentifier : __TupleTypeDescription<TransferRepresentationDescriptor>]);
  v3 = AtomicBox.wrappedValue.modify(v6, v2);
  *v4 = a1;
  swift_bridgeObjectRelease();
  ((void (*)(os_unfair_lock_s **, _QWORD))v3)(v6, 0);
  return swift_release();
}

uint64_t (*protocol witness for static __TupleDescriptor.typeCache.modify in conformance TransferRepresentationDescriptor(os_unfair_lock_s ***a1))()
{
  os_unfair_lock_s **v2;
  os_unfair_lock_s *v3;

  v2 = (os_unfair_lock_s **)malloc(0x30uLL);
  *a1 = v2;
  if (one-time initialization token for _typeCache != -1)
    swift_once();
  v3 = (os_unfair_lock_s *)static TransferRepresentationDescriptor._typeCache;
  v2[4] = (os_unfair_lock_s *)static TransferRepresentationDescriptor._typeCache;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [ObjectIdentifier : __TupleTypeDescription<TransferRepresentationDescriptor>]);
  v2[5] = (os_unfair_lock_s *)AtomicBox.wrappedValue.modify(v2, v3);
  return protocol witness for static __TupleDescriptor.typeCache.modify in conformance TransferRepresentationDescriptor;
}

void static TransferRepresentationDescriptor.typeCache.modify(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 40))(*a1, 0);
  swift_release();
  free(v1);
}

uint64_t type metadata completion function for TupleTransferRepresentation()
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

uint64_t *initializeBufferWithCopyOfBuffer for TupleTransferRepresentation(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7 && *(_QWORD *)(v4 + 64) <= 0x18uLL && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    v8 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t destroy for TupleTransferRepresentation(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 8))();
}

uint64_t initializeWithCopy for TupleTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 16))();
  return a1;
}

uint64_t assignWithCopy for TupleTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 24))();
  return a1;
}

uint64_t initializeWithTake for TupleTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 32))();
  return a1;
}

uint64_t assignWithTake for TupleTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 40))();
  return a1;
}

uint64_t getEnumTagSinglePayload for TupleTransferRepresentation(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  int v11;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = a2 - v5;
  if (a2 <= v5)
    goto LABEL_18;
  v7 = *(_QWORD *)(v4 + 64);
  v8 = 8 * v7;
  if (v7 <= 3)
  {
    v10 = ((v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      v9 = *(_DWORD *)(a1 + v7);
      if (!v9)
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      v9 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7))
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_18:
      if (v5)
        return (*(uint64_t (**)(void))(v4 + 48))();
      return 0;
    }
  }
  v9 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7))
    goto LABEL_18;
LABEL_11:
  v11 = (v9 - 1) << v8;
  if (v7 > 3)
    v11 = 0;
  if (!(_DWORD)v7)
    return v5 + v11 + 1;
  if (v7 > 3)
    LODWORD(v7) = 4;
  return ((uint64_t (*)(void))((char *)&loc_2083527A8 + 4 * byte_208364170[(v7 - 1)]))();
}

void storeEnumTagSinglePayload for TupleTransferRepresentation(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = a3 >= v7;
  v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      v13 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v13))
      {
        v11 = 4u;
      }
      else if (v13 >= 0x100)
      {
        v11 = 2;
      }
      else
      {
        v11 = v13 > 1;
      }
    }
    else
    {
      v11 = 1u;
    }
  }
  else
  {
    v11 = 0;
  }
  if (v7 < a2)
  {
    v12 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v14 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v14;
        }
        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }
    else
    {
      bzero(a1, *(_QWORD *)(v6 + 64));
      *(_DWORD *)a1 = v12;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

ValueMetadata *type metadata accessor for TransferRepresentationDescriptor()
{
  return &type metadata for TransferRepresentationDescriptor;
}

void sub_2083529B8(uint64_t *a1)
{
  type metadata accessor for TupleTransferRepresentation(255, *a1, a1[1], a1[2]);
  JUMPOUT(0x20BD054C0);
}

uint64_t type metadata completion function for TupleTransferRepresentation.Visitor()
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

uint64_t *initializeBufferWithCopyOfBuffer for TupleTransferRepresentation.Visitor(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = (_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFF8);
    v11 = (_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFF8);
    *v10 = *v11;
    *(_QWORD *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for TupleTransferRepresentation.Visitor(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 8))();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TupleTransferRepresentation.Visitor(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  *(_QWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TupleTransferRepresentation.Visitor(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  *(_QWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for TupleTransferRepresentation.Visitor(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  *(_QWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t assignWithTake for TupleTransferRepresentation.Visitor(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  *(_QWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TupleTransferRepresentation.Visitor(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFF)
    {
      v12 = *(_QWORD *)((((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFF8);
      if (v12 >= 0xFFFFFFFF)
        LODWORD(v12) = -1;
      return (v12 + 1);
    }
    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }
  else
  {
    if (((((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    return ((uint64_t (*)(void))((char *)&loc_208352DDC + 4 * byte_20836417E[v10]))();
  }
}

void storeEnumTagSinglePayload for TupleTransferRepresentation.Visitor(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X12 }
  }
  if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_208352F64()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x208353048);
}

void sub_208352F6C(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x208352F74);
  JUMPOUT(0x208353048);
}

void sub_208352FE0()
{
  _BYTE *v0;
  char v1;

  *v0 = v1;
  JUMPOUT(0x208353048);
}

void sub_208353008()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x208353048);
}

void sub_208353010()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x208353048);
}

void sub_208353018(unsigned int a1@<W1>, unsigned int a2@<W2>, size_t a3@<X8>)
{
  int v3;
  char *v4;
  uint64_t v5;

  *(_WORD *)&v4[v5] = 0;
  if (a1)
  {
    if (a2 < 0x7FFFFFFF)
      JUMPOUT(0x208352FE8);
    if (a2 >= a1)
      JUMPOUT(0x208353024);
    if ((_DWORD)a3)
    {
      if (a3 <= 3)
        v3 = a3;
      else
        v3 = 4;
      bzero(v4, a3);
      __asm { BR              X10 }
    }
  }
  JUMPOUT(0x208353048);
}

void sub_20835305C()
{
  uint64_t v0;
  int v1;

  *(_WORD *)v0 = v1;
  *(_BYTE *)(v0 + 2) = BYTE2(v1);
  JUMPOUT(0x208353048);
}

void sub_20835306C()
{
  _WORD *v0;
  __int16 v1;

  *v0 = v1;
  JUMPOUT(0x208353048);
}

void sub_208353074()
{
  _DWORD *v0;
  int v1;

  *v0 = v1;
  JUMPOUT(0x208353048);
}

BOOL static TransferableError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void TransferableError.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int TransferableError.hashValue.getter()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance TransferableError(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void protocol witness for Hashable.hash(into:) in conformance TransferableError()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance TransferableError()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance TransferableError()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void *TransferRepresentationVisibility.all.unsafeMutableAddressor()
{
  return &static TransferRepresentationVisibility.all;
}

void static TransferRepresentationVisibility.all.getter(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

void *TransferRepresentationVisibility.team.unsafeMutableAddressor()
{
  return &static TransferRepresentationVisibility.team;
}

void static TransferRepresentationVisibility.team.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static TransferRepresentationVisibility.group.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

void *TransferRepresentationVisibility.ownProcess.unsafeMutableAddressor()
{
  return &static TransferRepresentationVisibility.ownProcess;
}

void static TransferRepresentationVisibility.ownProcess.getter(_QWORD *a1@<X8>)
{
  *a1 = 3;
}

BOOL static TransferRepresentationVisibility.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance TransferRepresentationVisibility(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t dispatch thunk of static Transferable.transferRepresentation.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for TransferableError()
{
  return &type metadata for TransferableError;
}

uint64_t getEnumTagSinglePayload for TransferableError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TransferableError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2083533F0 + 4 * byte_2083642B5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_208353424 + 4 * byte_2083642B0[v4]))();
}

uint64_t sub_208353424(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20835342C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x208353434);
  return result;
}

uint64_t sub_208353440(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x208353448);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_20835344C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_208353454(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for TransferableSupportError(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for TransferableSupportError(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TransferableSupportError()
{
  return &type metadata for TransferableSupportError;
}

ValueMetadata *type metadata accessor for TransferRepresentationVisibility()
{
  return &type metadata for TransferRepresentationVisibility;
}

uint64_t one-time initialization function for logger()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, logger);
  __swift_project_value_buffer(v0, (uint64_t)logger);
  return Logger.init(subsystem:category:)();
}

uint64_t logger.unsafeMutableAddressor()
{
  uint64_t v0;

  if (one-time initialization token for logger != -1)
    swift_once();
  v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)logger);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t Transferable.file(contentType:fileHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;

  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = partial apply for closure #2 in static URL.transferRepresentation.getter;
  return Transferable._file(contentType:fileHandler:)(a1, a2, a3, a4, a5);
}

uint64_t Transferable._file(contentType:fileHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6[15] = a5;
  v6[16] = v5;
  v6[13] = a3;
  v6[14] = a4;
  v6[11] = a1;
  v6[12] = a2;
  v7 = type metadata accessor for UUID();
  v6[17] = v7;
  v6[18] = *(_QWORD *)(v7 - 8);
  v6[19] = swift_task_alloc();
  v8 = type metadata accessor for URL();
  v6[20] = v8;
  v6[21] = *(_QWORD *)(v8 - 8);
  v6[22] = swift_task_alloc();
  v6[23] = swift_task_alloc();
  v6[24] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  v6[25] = swift_task_alloc();
  v6[26] = swift_task_alloc();
  v6[27] = swift_task_alloc();
  v9 = type metadata accessor for ResolvedTransferRepresentation();
  v6[28] = v9;
  v6[29] = *(_QWORD *)(v9 - 8);
  v6[30] = swift_task_alloc();
  v6[31] = swift_task_alloc();
  v6[32] = swift_task_alloc();
  v6[33] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t Transferable._file(contentType:fileHandler:)()
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
  _BYTE *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;

  v1 = static Transferable.resolvedRepresentations(for:)(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 120));
  *(_QWORD *)(v0 + 272) = v1;
  v2 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v0 + 280) = v2;
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 232);
    v4 = type metadata accessor for SentTransferredFile(0);
    v5 = 0;
    *(_QWORD *)(v0 + 288) = v4;
    *(_DWORD *)(v0 + 76) = *(_DWORD *)(v3 + 80);
    *(_QWORD *)(v0 + 296) = *(_QWORD *)(v3 + 72);
    v6 = MEMORY[0x24BDCDDE8];
    while (1)
    {
      *(_QWORD *)(v0 + 304) = v5;
      v7 = *(_QWORD *)(v0 + 288);
      v8 = *(_QWORD *)(v0 + 264);
      v9 = *(_QWORD *)(v0 + 224);
      outlined init with copy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 272)+ ((*(unsigned __int8 *)(v0 + 76) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 76))+ *(_QWORD *)(v0 + 296) * v5, v8, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
      v10 = *(_QWORD *)(v8 + *(int *)(v9 + 28));
      if (v10 == v7)
      {
        v13 = *(_QWORD *)(v0 + 216);
        v14 = *(_QWORD *)(v0 + 160);
        v15 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 168) + 56);
        *(_QWORD *)(v0 + 312) = v15;
        v15(v13, 1, 1, v14);
        v16 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 320) = v16;
        *v16 = v0;
        v16[1] = Transferable._file(contentType:fileHandler:);
        return Transferable.url(from:)(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 120));
      }
      if (v10 == v6)
        break;
      outlined destroy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 264), (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
      v5 = *(_QWORD *)(v0 + 304) + 1;
      if (v5 == *(_QWORD *)(v0 + 280))
        goto LABEL_6;
    }
    v17 = swift_task_alloc();
    *(_QWORD *)(v0 + 336) = v17;
    *(_QWORD *)v17 = v0;
    *(_QWORD *)(v17 + 8) = Transferable._file(contentType:fileHandler:);
    v18 = *(_QWORD *)(v0 + 264);
    v19 = *(_OWORD *)(v0 + 112);
    *(_QWORD *)(v17 + 136) = *(_QWORD *)(v0 + 128);
    *(_OWORD *)(v17 + 120) = v19;
    *(_QWORD *)(v17 + 112) = v18;
    return swift_task_switch();
  }
  else
  {
LABEL_6:
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *v11 = 1;
    swift_willThrow();
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
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 328) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  void (*v1)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  _BYTE *v18;
  uint64_t (*v19)(void);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;

  v1 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v0 + 312);
  v2 = *(_QWORD *)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 216);
  v4 = *(_QWORD *)(v0 + 160);
  outlined destroy of DataRepresentation<AttributedString>(v3, &demangling cache variable for type metadata for URL?);
  v1(v2, 0, 1, v4);
  outlined init with take of SentTransferredFile?(v2, v3, &demangling cache variable for type metadata for URL?);
  v5 = *(_QWORD *)(v0 + 200);
  v6 = *(_QWORD *)(v0 + 160);
  v7 = *(_QWORD *)(v0 + 168);
  outlined init with copy of URL?(*(_QWORD *)(v0 + 216), v5, &demangling cache variable for type metadata for URL?);
  v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
  v9 = *(_QWORD *)(v0 + 216);
  v10 = *(_QWORD *)(v0 + 200);
  if (v8 != 1)
  {
    v20 = *(_QWORD *)(v0 + 192);
    v21 = *(_QWORD *)(v0 + 160);
    v22 = *(_QWORD *)(v0 + 168);
    v23 = *(void (**)(uint64_t))(v0 + 96);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32))(v20, v10, v21);
    v23(v20);
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v20, v21);
    outlined destroy of DataRepresentation<AttributedString>(v9, &demangling cache variable for type metadata for URL?);
    outlined destroy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 264), (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
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
    v19 = *(uint64_t (**)(void))(v0 + 8);
    return v19();
  }
  v11 = *(_QWORD *)(v0 + 264);
  outlined destroy of DataRepresentation<AttributedString>(*(_QWORD *)(v0 + 216), &demangling cache variable for type metadata for URL?);
  outlined destroy of ResolvedTransferRepresentation(v11, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
  outlined destroy of DataRepresentation<AttributedString>(v10, &demangling cache variable for type metadata for URL?);
  v12 = *(_QWORD *)(v0 + 304) + 1;
  if (v12 == *(_QWORD *)(v0 + 280))
  {
LABEL_7:
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *v18 = 1;
    swift_willThrow();
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
    v19 = *(uint64_t (**)(void))(v0 + 8);
    return v19();
  }
  v13 = MEMORY[0x24BDCDDE8];
  while (1)
  {
    *(_QWORD *)(v0 + 304) = v12;
    v14 = *(_QWORD *)(v0 + 288);
    v15 = *(_QWORD *)(v0 + 264);
    v16 = *(_QWORD *)(v0 + 224);
    outlined init with copy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 272)+ ((*(unsigned __int8 *)(v0 + 76) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 76))+ *(_QWORD *)(v0 + 296) * v12, v15, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    v17 = *(_QWORD *)(v15 + *(int *)(v16 + 28));
    if (v17 == v14)
    {
      v25 = *(_QWORD *)(v0 + 216);
      v26 = *(_QWORD *)(v0 + 160);
      v27 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 168) + 56);
      *(_QWORD *)(v0 + 312) = v27;
      v27(v25, 1, 1, v26);
      v28 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 320) = v28;
      *v28 = v0;
      v28[1] = Transferable._file(contentType:fileHandler:);
      return Transferable.url(from:)(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 120));
    }
    if (v17 == v13)
      break;
    outlined destroy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 264), (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    v12 = *(_QWORD *)(v0 + 304) + 1;
    if (v12 == *(_QWORD *)(v0 + 280))
      goto LABEL_7;
  }
  v29 = swift_task_alloc();
  *(_QWORD *)(v0 + 336) = v29;
  *(_QWORD *)v29 = v0;
  *(_QWORD *)(v29 + 8) = Transferable._file(contentType:fileHandler:);
  v30 = *(_QWORD *)(v0 + 264);
  v31 = *(_OWORD *)(v0 + 112);
  *(_QWORD *)(v29 + 136) = *(_QWORD *)(v0 + 128);
  *(_OWORD *)(v29 + 120) = v31;
  *(_QWORD *)(v29 + 112) = v30;
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  int v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString *v17;
  void (*v18)(uint64_t, uint64_t);
  void *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t);
  id v43;
  NSURL *v44;
  void *v45;
  void *v46;
  unsigned int v47;
  void *v48;
  uint64_t v49;
  unint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE *v58;
  uint64_t (*v59)(void);
  id v60;
  void *v61;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  unint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73[2];

  v73[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(v0 + 264);
  v2 = *(unsigned __int8 *)(v1 + 16);
  if (v2 == 255)
  {
    outlined copy of Data._Representation(*(_QWORD *)(v0 + 344), *(_QWORD *)(v0 + 352));
  }
  else
  {
    *(_OWORD *)(v0 + 56) = *(_OWORD *)v1;
    v4 = *(_QWORD *)(v0 + 344);
    v3 = *(_QWORD *)(v0 + 352);
    v5 = *(_QWORD *)(v0 + 128);
    *(_BYTE *)(v0 + 72) = v2 & 1;
    v6 = *(_OWORD *)(v0 + 112);
    *(_OWORD *)(v0 + 40) = v6;
    v7 = v6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 16));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(boxed_opaque_existential_1, v5, v7);
    outlined copy of Data._Representation(v4, v3);
    ResolvedTransferRepresentation.SuggestedFileNameStorage.resolved(_:)(v0 + 16);
    v10 = v9;
    outlined destroy of DataRepresentation<AttributedString>(v0 + 16, &demangling cache variable for type metadata for Transferable?);
    if (v10)
      goto LABEL_5;
  }
  v12 = *(_QWORD *)(v0 + 144);
  v11 = *(_QWORD *)(v0 + 152);
  v13 = *(_QWORD *)(v0 + 136);
  UUID.init()();
  UUID.uuidString.getter();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_bridgeObjectRelease();
LABEL_5:
  v71 = *(void **)(v0 + 360);
  v14 = *(_QWORD *)(v0 + 176);
  v16 = *(_QWORD *)(v0 + 160);
  v15 = *(_QWORD *)(v0 + 168);
  v17 = NSTemporaryDirectory();
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  URL.init(fileURLWithPath:isDirectory:)();
  swift_bridgeObjectRelease();
  URL.appendingPathComponent(_:isDirectory:)();
  swift_bridgeObjectRelease();
  v18 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
  v18(v14, v16);
  v19 = v71;
  Data.write(to:options:)();
  v20 = *(_QWORD *)(v0 + 184);
  if (!v71)
  {
    v42 = *(void (**)(uint64_t))(v0 + 96);
    swift_bridgeObjectRelease();
    v42(v20);
    v43 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    URL._bridgeToObjectiveC()(v44);
    v46 = v45;
    *(_QWORD *)(v0 + 80) = 0;
    v47 = objc_msgSend(v43, sel_removeItemAtURL_error_, v45, v0 + 80);

    v48 = *(void **)(v0 + 80);
    v49 = *(_QWORD *)(v0 + 344);
    v50 = *(_QWORD *)(v0 + 352);
    if (v47)
    {
      v51 = v48;
      outlined consume of Data._Representation(v49, v50);
      outlined consume of Data._Representation(v49, v50);
    }
    else
    {
      v60 = v48;
      v61 = (void *)_convertNSErrorToError(_:)();

      swift_willThrow();
      outlined consume of Data._Representation(v49, v50);
      outlined consume of Data._Representation(v49, v50);

    }
    v18(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 160));
    outlined destroy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 264), (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
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
    v59 = *(uint64_t (**)(void))(v0 + 8);
    return v59();
  }
  v22 = *(_QWORD *)(v0 + 344);
  v21 = *(_QWORD *)(v0 + 352);
  v18(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 160));
  outlined consume of Data._Representation(v22, v21);
  if (one-time initialization token for logger != -1)
    swift_once();
  v23 = *(_QWORD *)(v0 + 256);
  v24 = *(_QWORD *)(v0 + 264);
  v25 = type metadata accessor for Logger();
  __swift_project_value_buffer(v25, (uint64_t)logger);
  outlined init with copy of ResolvedTransferRepresentation(v24, v23, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
  v26 = v71;
  v27 = v71;
  v28 = Logger.logObject.getter();
  v29 = static os_log_type_t.fault.getter();
  v30 = os_log_type_enabled(v28, v29);
  v31 = *(_QWORD *)(v0 + 344);
  v33 = *(_QWORD *)(v0 + 256);
  v32 = *(_QWORD *)(v0 + 264);
  if (v30)
  {
    v70 = *(_QWORD *)(v0 + 352);
    v34 = swift_slowAlloc();
    v72 = v32;
    v35 = (_QWORD *)swift_slowAlloc();
    v36 = swift_slowAlloc();
    v73[0] = v36;
    *(_DWORD *)v34 = 136315394;
    v37 = UTType.identifier.getter();
    *(_QWORD *)(v34 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v37, v38, v73);
    swift_bridgeObjectRelease();
    outlined destroy of ResolvedTransferRepresentation(v33, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    *(_WORD *)(v34 + 12) = 2112;
    v39 = v19;
    v40 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v34 + 14) = v40;
    *v35 = v40;

    _os_log_impl(&dword_20833C000, v28, v29, "Error writing data for type identifier\n%s: %@", (uint8_t *)v34, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x20BD0552C](v35, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x20BD0552C](v36, -1, -1);
    MEMORY[0x20BD0552C](v34, -1, -1);
    outlined consume of Data._Representation(v31, v70);

    v41 = v72;
  }
  else
  {
    outlined consume of Data._Representation(*(_QWORD *)(v0 + 344), *(_QWORD *)(v0 + 352));

    outlined destroy of ResolvedTransferRepresentation(v33, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    v41 = v32;
  }
  outlined destroy of ResolvedTransferRepresentation(v41, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
  v52 = *(_QWORD *)(v0 + 304) + 1;
  if (v52 == *(_QWORD *)(v0 + 280))
  {
LABEL_18:
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *v58 = 1;
    swift_willThrow();
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
    v59 = *(uint64_t (**)(void))(v0 + 8);
    return v59();
  }
  v53 = MEMORY[0x24BDCDDE8];
  while (1)
  {
    *(_QWORD *)(v0 + 304) = v52;
    v54 = *(_QWORD *)(v0 + 288);
    v55 = *(_QWORD *)(v0 + 264);
    v56 = *(_QWORD *)(v0 + 224);
    outlined init with copy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 272)+ ((*(unsigned __int8 *)(v0 + 76) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 76))+ *(_QWORD *)(v0 + 296) * v52, v55, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    v57 = *(_QWORD *)(v55 + *(int *)(v56 + 28));
    if (v57 == v54)
    {
      v63 = *(_QWORD *)(v0 + 216);
      v64 = *(_QWORD *)(v0 + 160);
      v65 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 168) + 56);
      *(_QWORD *)(v0 + 312) = v65;
      v65(v63, 1, 1, v64);
      v66 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 320) = v66;
      *v66 = v0;
      v66[1] = Transferable._file(contentType:fileHandler:);
      return Transferable.url(from:)(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 120));
    }
    if (v57 == v53)
      break;
    outlined destroy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 264), (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    v52 = *(_QWORD *)(v0 + 304) + 1;
    if (v52 == *(_QWORD *)(v0 + 280))
      goto LABEL_18;
  }
  v67 = swift_task_alloc();
  *(_QWORD *)(v0 + 336) = v67;
  *(_QWORD *)v67 = v0;
  *(_QWORD *)(v67 + 8) = Transferable._file(contentType:fileHandler:);
  v68 = *(_QWORD *)(v0 + 264);
  v69 = *(_OWORD *)(v0 + 112);
  *(_QWORD *)(v67 + 136) = *(_QWORD *)(v0 + 128);
  *(_OWORD *)(v67 + 120) = v69;
  *(_QWORD *)(v67 + 112) = v68;
  return swift_task_switch();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
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
  _BYTE *v30;
  uint64_t (*v31)(void);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t);
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46[2];

  v46[1] = *MEMORY[0x24BDAC8D0];
  if (one-time initialization token for logger != -1)
    swift_once();
  v1 = *(void **)(v0 + 328);
  v2 = *(_QWORD *)(v0 + 264);
  v3 = *(_QWORD *)(v0 + 248);
  v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)logger);
  outlined init with copy of ResolvedTransferRepresentation(v2, v3, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
  v5 = v1;
  v6 = v1;
  v7 = Logger.logObject.getter();
  v8 = static os_log_type_t.fault.getter();
  v9 = os_log_type_enabled(v7, v8);
  v10 = *(void **)(v0 + 328);
  v11 = *(_QWORD *)(v0 + 248);
  if (v9)
  {
    v12 = swift_slowAlloc();
    v13 = (_QWORD *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v46[0] = v14;
    *(_DWORD *)v12 = 136315394;
    v15 = UTType.identifier.getter();
    *(_QWORD *)(v12 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, v46);
    swift_bridgeObjectRelease();
    outlined destroy of ResolvedTransferRepresentation(v11, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    *(_WORD *)(v12 + 12) = 2112;
    v17 = v10;
    v18 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v12 + 14) = v18;
    *v13 = v18;

    _os_log_impl(&dword_20833C000, v7, v8, "Error loading URL for type identifier\n%s: %@", (uint8_t *)v12, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x20BD0552C](v13, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x20BD0552C](v14, -1, -1);
    MEMORY[0x20BD0552C](v12, -1, -1);

  }
  else
  {

    outlined destroy of ResolvedTransferRepresentation(v11, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
  }
  v19 = *(_QWORD *)(v0 + 200);
  v20 = *(_QWORD *)(v0 + 160);
  v21 = *(_QWORD *)(v0 + 168);
  outlined init with copy of URL?(*(_QWORD *)(v0 + 216), v19, &demangling cache variable for type metadata for URL?);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) != 1)
  {
    v32 = *(_QWORD *)(v0 + 216);
    v33 = *(_QWORD *)(v0 + 192);
    v34 = *(_QWORD *)(v0 + 200);
    v35 = *(_QWORD *)(v0 + 160);
    v36 = *(_QWORD *)(v0 + 168);
    v37 = *(void (**)(uint64_t))(v0 + 96);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 32))(v33, v34, v35);
    v37(v33);
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v33, v35);
    outlined destroy of DataRepresentation<AttributedString>(v32, &demangling cache variable for type metadata for URL?);
    outlined destroy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 264), (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
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
    v31 = *(uint64_t (**)(void))(v0 + 8);
    return v31();
  }
  v22 = *(_QWORD *)(v0 + 264);
  v23 = *(_QWORD *)(v0 + 200);
  outlined destroy of DataRepresentation<AttributedString>(*(_QWORD *)(v0 + 216), &demangling cache variable for type metadata for URL?);
  outlined destroy of ResolvedTransferRepresentation(v22, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
  outlined destroy of DataRepresentation<AttributedString>(v23, &demangling cache variable for type metadata for URL?);
  v24 = *(_QWORD *)(v0 + 304) + 1;
  if (v24 == *(_QWORD *)(v0 + 280))
  {
LABEL_12:
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *v30 = 1;
    swift_willThrow();
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
    v31 = *(uint64_t (**)(void))(v0 + 8);
    return v31();
  }
  v25 = MEMORY[0x24BDCDDE8];
  while (1)
  {
    *(_QWORD *)(v0 + 304) = v24;
    v26 = *(_QWORD *)(v0 + 288);
    v27 = *(_QWORD *)(v0 + 264);
    v28 = *(_QWORD *)(v0 + 224);
    outlined init with copy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 272)+ ((*(unsigned __int8 *)(v0 + 76) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 76))+ *(_QWORD *)(v0 + 296) * v24, v27, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    v29 = *(_QWORD *)(v27 + *(int *)(v28 + 28));
    if (v29 == v26)
    {
      v39 = *(_QWORD *)(v0 + 216);
      v40 = *(_QWORD *)(v0 + 160);
      v41 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 168) + 56);
      *(_QWORD *)(v0 + 312) = v41;
      v41(v39, 1, 1, v40);
      v42 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 320) = v42;
      *v42 = v0;
      v42[1] = Transferable._file(contentType:fileHandler:);
      return Transferable.url(from:)(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 120));
    }
    if (v29 == v25)
      break;
    outlined destroy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 264), (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    v24 = *(_QWORD *)(v0 + 304) + 1;
    if (v24 == *(_QWORD *)(v0 + 280))
      goto LABEL_12;
  }
  v43 = swift_task_alloc();
  *(_QWORD *)(v0 + 336) = v43;
  *(_QWORD *)v43 = v0;
  *(_QWORD *)(v43 + 8) = Transferable._file(contentType:fileHandler:);
  v44 = *(_QWORD *)(v0 + 264);
  v45 = *(_OWORD *)(v0 + 112);
  *(_QWORD *)(v43 + 136) = *(_QWORD *)(v0 + 128);
  *(_OWORD *)(v43 + 120) = v45;
  *(_QWORD *)(v43 + 112) = v44;
  return swift_task_switch();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  if (one-time initialization token for logger != -1)
    swift_once();
  v1 = *(void **)(v0 + 360);
  v2 = *(_QWORD *)(v0 + 264);
  v3 = *(_QWORD *)(v0 + 240);
  v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)logger);
  outlined init with copy of ResolvedTransferRepresentation(v2, v3, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
  v5 = v1;
  v6 = v1;
  v7 = Logger.logObject.getter();
  v8 = static os_log_type_t.fault.getter();
  v9 = os_log_type_enabled(v7, v8);
  v10 = *(void **)(v0 + 360);
  v11 = *(_QWORD *)(v0 + 264);
  v12 = *(_QWORD *)(v0 + 240);
  if (v9)
  {
    v13 = swift_slowAlloc();
    v14 = (_QWORD *)swift_slowAlloc();
    v15 = swift_slowAlloc();
    v35[0] = v15;
    *(_DWORD *)v13 = 136315394;
    v16 = UTType.identifier.getter();
    *(_QWORD *)(v13 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v17, v35);
    swift_bridgeObjectRelease();
    outlined destroy of ResolvedTransferRepresentation(v12, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    *(_WORD *)(v13 + 12) = 2112;
    v18 = v10;
    v19 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v13 + 14) = v19;
    *v14 = v19;

    _os_log_impl(&dword_20833C000, v7, v8, "Error loading data for type identifier\n%s: %@", (uint8_t *)v13, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x20BD0552C](v14, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x20BD0552C](v15, -1, -1);
    MEMORY[0x20BD0552C](v13, -1, -1);

  }
  else
  {

    outlined destroy of ResolvedTransferRepresentation(v12, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
  }

  outlined destroy of ResolvedTransferRepresentation(v11, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
  v20 = *(_QWORD *)(v0 + 304) + 1;
  if (v20 == *(_QWORD *)(v0 + 280))
  {
LABEL_11:
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *v26 = 1;
    swift_willThrow();
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
    v21 = MEMORY[0x24BDCDDE8];
    while (1)
    {
      *(_QWORD *)(v0 + 304) = v20;
      v22 = *(_QWORD *)(v0 + 288);
      v23 = *(_QWORD *)(v0 + 264);
      v24 = *(_QWORD *)(v0 + 224);
      outlined init with copy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 272)+ ((*(unsigned __int8 *)(v0 + 76) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 76))+ *(_QWORD *)(v0 + 296) * v20, v23, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
      v25 = *(_QWORD *)(v23 + *(int *)(v24 + 28));
      if (v25 == v22)
      {
        v28 = *(_QWORD *)(v0 + 216);
        v29 = *(_QWORD *)(v0 + 160);
        v30 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 168) + 56);
        *(_QWORD *)(v0 + 312) = v30;
        v30(v28, 1, 1, v29);
        v31 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 320) = v31;
        *v31 = v0;
        v31[1] = Transferable._file(contentType:fileHandler:);
        return Transferable.url(from:)(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 120));
      }
      if (v25 == v21)
        break;
      outlined destroy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 264), (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
      v20 = *(_QWORD *)(v0 + 304) + 1;
      if (v20 == *(_QWORD *)(v0 + 280))
        goto LABEL_11;
    }
    v32 = swift_task_alloc();
    *(_QWORD *)(v0 + 336) = v32;
    *(_QWORD *)v32 = v0;
    *(_QWORD *)(v32 + 8) = Transferable._file(contentType:fileHandler:);
    v33 = *(_QWORD *)(v0 + 264);
    v34 = *(_OWORD *)(v0 + 112);
    *(_QWORD *)(v32 + 136) = *(_QWORD *)(v0 + 128);
    *(_OWORD *)(v32 + 120) = v34;
    *(_QWORD *)(v32 + 112) = v33;
    return swift_task_switch();
  }
}

uint64_t Transferable._file(contentType:fileHandler:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  v4 = (_QWORD *)*v3;
  v4[43] = a1;
  v4[44] = a2;
  v4[45] = v2;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t Transferable.init(data:contentType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  v7[7] = a6;
  v7[8] = v6;
  v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  v7[4] = a3;
  v7[2] = a1;
  v8 = type metadata accessor for UTType();
  v7[9] = v8;
  v7[10] = *(_QWORD *)(v8 - 8);
  v7[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t Transferable.init(data:contentType:)()
{
  uint64_t *v0;
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[4];
  v2 = v0[3];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v0[10] + 16))(v0[11], v0[5], v0[9]);
  outlined copy of Data._Representation(v2, v1);
  v3 = (_QWORD *)swift_task_alloc();
  v0[12] = (uint64_t)v3;
  *v3 = v0;
  v3[1] = Transferable.init(data:contentType:);
  return Transferable.init(_:_:)(v0[2], v0[3], v0[4], v0[11], v0[6], v0[7]);
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 40);
  outlined consume of Data._Representation(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v3, v2);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 40);
  outlined consume of Data._Representation(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v3, v2);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t Transferable.init(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6[26] = a5;
  v6[27] = a6;
  v6[24] = a3;
  v6[25] = a4;
  v6[22] = a1;
  v6[23] = a2;
  v6[28] = type metadata accessor for SentTransferredFile(0);
  v6[29] = swift_task_alloc();
  v7 = type metadata accessor for UUID();
  v6[30] = v7;
  v6[31] = *(_QWORD *)(v7 - 8);
  v6[32] = swift_task_alloc();
  v8 = type metadata accessor for URL();
  v6[33] = v8;
  v6[34] = *(_QWORD *)(v8 - 8);
  v6[35] = swift_task_alloc();
  v6[36] = swift_task_alloc();
  v9 = type metadata accessor for Optional();
  v6[37] = v9;
  v6[38] = *(_QWORD *)(v9 - 8);
  v6[39] = swift_task_alloc();
  v6[40] = swift_task_alloc();
  v10 = type metadata accessor for ResolvedTransferRepresentation();
  v6[41] = v10;
  v6[42] = *(_QWORD *)(v10 - 8);
  v6[43] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t Transferable.init(_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int **v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSString *v30;
  void (*v31)(uint64_t, uint64_t);
  int *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);

  v1 = static Transferable.resolvedRepresentations(for:)(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 216));
  *(_QWORD *)(v0 + 352) = v1;
  v2 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v0 + 360) = v2;
  if (!v2)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    v14 = *(_QWORD *)(v0 + 192);
    v15 = *(_QWORD *)(v0 + 200);
    v16 = *(_QWORD *)(v0 + 184);
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *v17 = 0;
    swift_willThrow();
    outlined consume of Data._Representation(v16, v14);
    v18 = type metadata accessor for UTType();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v15, v18);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v3 = 0;
  v4 = *(_QWORD *)(v0 + 336);
  *(_DWORD *)(v0 + 440) = *(_DWORD *)(v4 + 80);
  *(_QWORD *)(v0 + 368) = *(_QWORD *)(v4 + 72);
  v5 = MEMORY[0x24BDCDDE8];
  while (1)
  {
    *(_QWORD *)(v0 + 376) = v3;
    v6 = *(_QWORD *)(v0 + 344);
    v7 = *(_QWORD *)(v0 + 328);
    outlined init with copy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 352)+ ((*(unsigned __int8 *)(v0 + 440) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 440))+ *(_QWORD *)(v0 + 368) * v3, v6, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    v8 = (int **)(v6 + *(int *)(v7 + 36));
    v9 = *v8;
    *(_QWORD *)(v0 + 384) = *v8;
    *(_QWORD *)(v0 + 392) = v8[1];
    v10 = *(_QWORD *)(v0 + 344);
    if (v9)
      break;
    outlined destroy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 344), (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
LABEL_4:
    v3 = *(_QWORD *)(v0 + 376) + 1;
    if (v3 == *(_QWORD *)(v0 + 360))
      goto LABEL_9;
  }
  v11 = *(int *)(*(_QWORD *)(v0 + 328) + 28);
  *(_DWORD *)(v0 + 444) = v11;
  v12 = *(_QWORD *)(v10 + v11);
  if (v12 == v5)
  {
    v21 = *(_QWORD *)(v0 + 184);
    v20 = *(_QWORD *)(v0 + 192);
    *(_QWORD *)(v0 + 160) = v5;
    *(_QWORD *)(v0 + 168) = &protocol witness table for Data;
    *(_QWORD *)(v0 + 136) = v21;
    *(_QWORD *)(v0 + 144) = v20;
    outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?((uint64_t)v9);
    outlined copy of Data._Representation(v21, v20);
    v39 = (uint64_t (*)(uint64_t, uint64_t))((char *)v9 + *v9);
    v22 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 400) = v22;
    *v22 = v0;
    v22[1] = Transferable.init(_:_:);
    v23 = v0 + 96;
    v24 = v0 + 136;
    return v39(v23, v24);
  }
  v13 = *(_QWORD *)(v0 + 224);
  swift_retain();
  if (v12 != v13)
  {
    outlined destroy of ResolvedTransferRepresentation(v10, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe((uint64_t)v9);
    goto LABEL_4;
  }
  v25 = *(_QWORD *)(v0 + 280);
  v26 = *(_QWORD *)(v0 + 272);
  v28 = *(_QWORD *)(v0 + 248);
  v27 = *(_QWORD *)(v0 + 256);
  v29 = *(_QWORD *)(v0 + 240);
  v38 = *(_QWORD *)(v0 + 264);
  v30 = NSTemporaryDirectory();
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  URL.init(fileURLWithPath:isDirectory:)();
  swift_bridgeObjectRelease();
  UUID.init()();
  UUID.uuidString.getter();
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
  URL.appendingPathComponent(_:isDirectory:)();
  swift_bridgeObjectRelease();
  v31 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
  *(_QWORD *)(v0 + 416) = v31;
  v31(v25, v38);
  Data.write(to:options:)();
  v32 = *(int **)(v0 + 384);
  v33 = *(_QWORD *)(v0 + 280);
  v35 = *(_QWORD *)(v0 + 224);
  v34 = *(_QWORD *)(v0 + 232);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 272) + 16))(v33, *(_QWORD *)(v0 + 288), *(_QWORD *)(v0 + 264));
  SentTransferredFile.init(_:allowAccessingOriginalFile:)(v33, 1, v34);
  *(_QWORD *)(v0 + 80) = v35;
  *(_QWORD *)(v0 + 88) = &protocol witness table for SentTransferredFile;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
  outlined init with copy of ResolvedTransferRepresentation(v34, (uint64_t)boxed_opaque_existential_1, type metadata accessor for SentTransferredFile);
  v39 = (uint64_t (*)(uint64_t, uint64_t))((char *)v32 + *v32);
  v37 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 424) = v37;
  *v37 = v0;
  v37[1] = Transferable.init(_:_:);
  v23 = v0 + 16;
  v24 = v0 + 56;
  return v39(v23, v24);
}

{
  void *v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 408) = v0;
  swift_task_dealloc();
  if (v0)

  else
    __swift_destroy_boxed_opaque_existential_1(v2 + 136);
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int **v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSString *v24;
  void (*v25)(uint64_t, uint64_t);
  int *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(void);
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 320);
  v2 = *(_QWORD *)(v0 + 208);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
  v3 = swift_dynamicCast();
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v4 + 56))(v1, v3 ^ 1u, 1, v2);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v1, 1, v2);
  v6 = *(_QWORD *)(v0 + 344);
  if (v5 == 1)
  {
    v7 = *(void **)(v0 + 408);
    v8 = *(int *)(v0 + 444);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 304) + 8))(*(_QWORD *)(v0 + 320), *(_QWORD *)(v0 + 296));
    if (*(_QWORD *)(v6 + v8) != *(_QWORD *)(v0 + 224))
    {
      v9 = *(int **)(v0 + 384);
      v10 = *(_QWORD *)(v0 + 344);
      v11 = MEMORY[0x24BDCDDE8];
      while (2)
      {
        outlined destroy of ResolvedTransferRepresentation(v10, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
        _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe((uint64_t)v9);
        while (1)
        {
          v12 = *(_QWORD *)(v0 + 376) + 1;
          if (v12 == *(_QWORD *)(v0 + 360))
          {
            swift_bridgeObjectRelease();
            v43 = *(_QWORD *)(v0 + 192);
            v44 = *(_QWORD *)(v0 + 200);
            v45 = *(_QWORD *)(v0 + 184);
            lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
            swift_allocError();
            *v46 = 0;
            swift_willThrow();
            outlined consume of Data._Representation(v45, v43);
            v47 = type metadata accessor for UTType();
            (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 8))(v44, v47);
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            v42 = *(uint64_t (**)(void))(v0 + 8);
            return v42();
          }
          *(_QWORD *)(v0 + 376) = v12;
          v13 = *(_QWORD *)(v0 + 344);
          v14 = *(_QWORD *)(v0 + 328);
          outlined init with copy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 352)+ ((*(unsigned __int8 *)(v0 + 440) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 440))+ *(_QWORD *)(v0 + 368) * v12, v13, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
          v15 = (int **)(v13 + *(int *)(v14 + 36));
          v9 = *v15;
          *(_QWORD *)(v0 + 384) = *v15;
          *(_QWORD *)(v0 + 392) = v15[1];
          v10 = *(_QWORD *)(v0 + 344);
          if (v9)
            break;
          outlined destroy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 344), (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
        }
        v16 = *(int *)(*(_QWORD *)(v0 + 328) + 28);
        *(_DWORD *)(v0 + 444) = v16;
        v17 = *(_QWORD *)(v10 + v16);
        if (v17 == v11)
        {
          v49 = *(_QWORD *)(v0 + 184);
          v48 = *(_QWORD *)(v0 + 192);
          *(_QWORD *)(v0 + 160) = v11;
          *(_QWORD *)(v0 + 168) = &protocol witness table for Data;
          *(_QWORD *)(v0 + 136) = v49;
          *(_QWORD *)(v0 + 144) = v48;
          outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?((uint64_t)v9);
          outlined copy of Data._Representation(v49, v48);
          v53 = (uint64_t (*)(uint64_t, uint64_t))((char *)v9 + *v9);
          v50 = (_QWORD *)swift_task_alloc();
          *(_QWORD *)(v0 + 400) = v50;
          *v50 = v0;
          v50[1] = Transferable.init(_:_:);
          v32 = v0 + 96;
          v33 = v0 + 136;
          return v53(v32, v33);
        }
        v18 = *(_QWORD *)(v0 + 224);
        swift_retain();
        if (v17 != v18)
          continue;
        break;
      }
    }
    v19 = *(_QWORD *)(v0 + 280);
    v20 = *(_QWORD *)(v0 + 256);
    v51 = *(_QWORD *)(v0 + 272);
    v52 = *(_QWORD *)(v0 + 264);
    v22 = *(_QWORD *)(v0 + 240);
    v21 = *(_QWORD *)(v0 + 248);
    v23 = v7;
    v24 = NSTemporaryDirectory();
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    URL.init(fileURLWithPath:isDirectory:)();
    swift_bridgeObjectRelease();
    UUID.init()();
    UUID.uuidString.getter();
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
    URL.appendingPathComponent(_:isDirectory:)();
    swift_bridgeObjectRelease();
    v25 = *(void (**)(uint64_t, uint64_t))(v51 + 8);
    *(_QWORD *)(v0 + 416) = v25;
    v25(v19, v52);
    Data.write(to:options:)();
    if (v23)

    v26 = *(int **)(v0 + 384);
    v27 = *(_QWORD *)(v0 + 280);
    v29 = *(_QWORD *)(v0 + 224);
    v28 = *(_QWORD *)(v0 + 232);
    (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 272) + 16))(v27, *(_QWORD *)(v0 + 288), *(_QWORD *)(v0 + 264));
    SentTransferredFile.init(_:allowAccessingOriginalFile:)(v27, 1, v28);
    *(_QWORD *)(v0 + 80) = v29;
    *(_QWORD *)(v0 + 88) = &protocol witness table for SentTransferredFile;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
    outlined init with copy of ResolvedTransferRepresentation(v28, (uint64_t)boxed_opaque_existential_1, type metadata accessor for SentTransferredFile);
    v53 = (uint64_t (*)(uint64_t, uint64_t))((char *)v26 + *v26);
    v31 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 424) = v31;
    *v31 = v0;
    v31[1] = Transferable.init(_:_:);
    v32 = v0 + 16;
    v33 = v0 + 56;
    return v53(v32, v33);
  }
  v36 = *(_QWORD *)(v0 + 192);
  v35 = *(_QWORD *)(v0 + 200);
  v37 = *(_QWORD *)(v0 + 184);
  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(*(_QWORD *)(v0 + 384));
  outlined consume of Data._Representation(v37, v36);
  v38 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 8))(v35, v38);
  outlined destroy of ResolvedTransferRepresentation(v6, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
  v39 = *(_QWORD *)(v0 + 320);
  v40 = *(_QWORD *)(v0 + 208);
  v41 = *(_QWORD *)(v0 + 176);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v41, v39, v40);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v42 = *(uint64_t (**)(void))(v0 + 8);
  return v42();
}

{
  void *v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 432) = v0;
  swift_task_dealloc();
  if (v0)

  else
    __swift_destroy_boxed_opaque_existential_1(v2 + 56);
  return swift_task_switch();
}

{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t (*v17)(void);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int **v27;
  int *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSString *v41;
  void (*v42)(uint64_t, uint64_t);
  int *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 416);
  v2 = *(_QWORD *)(v0 + 344);
  v3 = *(_QWORD *)(v0 + 312);
  v4 = *(_QWORD *)(v0 + 288);
  v5 = *(_QWORD *)(v0 + 264);
  v6 = *(_QWORD *)(v0 + 232);
  v7 = *(_QWORD *)(v0 + 208);
  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(*(_QWORD *)(v0 + 384));
  outlined destroy of ResolvedTransferRepresentation(v6, type metadata accessor for SentTransferredFile);
  v1(v4, v5);
  outlined destroy of ResolvedTransferRepresentation(v2, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
  v8 = swift_dynamicCast();
  v9 = *(_QWORD *)(v7 - 8);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v9 + 56))(v3, v8 ^ 1u, 1, v7);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v3, 1, v7) != 1)
  {
    v18 = *(_QWORD *)(v0 + 200);
    outlined consume of Data._Representation(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 192));
    v19 = type metadata accessor for UTType();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v18, v19);
    v20 = *(_QWORD *)(v0 + 312);
    v21 = *(_QWORD *)(v0 + 208);
    v22 = *(_QWORD *)(v0 + 176);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v22, v20, v21);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v17 = *(uint64_t (**)(void))(v0 + 8);
    return v17();
  }
  v10 = *(void **)(v0 + 432);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 304) + 8))(*(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 296));
  v11 = *(_QWORD *)(v0 + 376) + 1;
  if (v11 == *(_QWORD *)(v0 + 360))
  {
LABEL_3:
    swift_bridgeObjectRelease();
    v12 = *(_QWORD *)(v0 + 192);
    v13 = *(_QWORD *)(v0 + 200);
    v14 = *(_QWORD *)(v0 + 184);
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *v15 = 0;
    swift_willThrow();
    outlined consume of Data._Representation(v14, v12);
    v16 = type metadata accessor for UTType();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v13, v16);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v17 = *(uint64_t (**)(void))(v0 + 8);
    return v17();
  }
  v24 = MEMORY[0x24BDCDDE8];
  while (1)
  {
    *(_QWORD *)(v0 + 376) = v11;
    v25 = *(_QWORD *)(v0 + 344);
    v26 = *(_QWORD *)(v0 + 328);
    outlined init with copy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 352)+ ((*(unsigned __int8 *)(v0 + 440) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 440))+ *(_QWORD *)(v0 + 368) * v11, v25, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    v27 = (int **)(v25 + *(int *)(v26 + 36));
    v28 = *v27;
    *(_QWORD *)(v0 + 384) = *v27;
    *(_QWORD *)(v0 + 392) = v27[1];
    v29 = *(_QWORD *)(v0 + 344);
    if (v28)
      break;
    outlined destroy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 344), (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
LABEL_8:
    v11 = *(_QWORD *)(v0 + 376) + 1;
    if (v11 == *(_QWORD *)(v0 + 360))
      goto LABEL_3;
  }
  v30 = *(int *)(*(_QWORD *)(v0 + 328) + 28);
  *(_DWORD *)(v0 + 444) = v30;
  v31 = *(_QWORD *)(v29 + v30);
  if (v31 == v24)
  {
    v34 = *(_QWORD *)(v0 + 184);
    v33 = *(_QWORD *)(v0 + 192);
    *(_QWORD *)(v0 + 160) = v24;
    *(_QWORD *)(v0 + 168) = &protocol witness table for Data;
    *(_QWORD *)(v0 + 136) = v34;
    *(_QWORD *)(v0 + 144) = v33;
    outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?((uint64_t)v28);
    outlined copy of Data._Representation(v34, v33);
    v52 = (uint64_t (*)(uint64_t, uint64_t))((char *)v28 + *v28);
    v35 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 400) = v35;
    *v35 = v0;
    v35[1] = Transferable.init(_:_:);
    v36 = v0 + 96;
    v37 = v0 + 136;
    return v52(v36, v37);
  }
  v32 = *(_QWORD *)(v0 + 224);
  swift_retain();
  if (v31 != v32)
  {
    outlined destroy of ResolvedTransferRepresentation(v29, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe((uint64_t)v28);
    goto LABEL_8;
  }
  v38 = *(_QWORD *)(v0 + 280);
  v39 = *(_QWORD *)(v0 + 256);
  v50 = *(_QWORD *)(v0 + 272);
  v51 = *(_QWORD *)(v0 + 264);
  v40 = *(_QWORD *)(v0 + 248);
  v49 = *(_QWORD *)(v0 + 240);
  v41 = NSTemporaryDirectory();
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  URL.init(fileURLWithPath:isDirectory:)();
  swift_bridgeObjectRelease();
  UUID.init()();
  UUID.uuidString.getter();
  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v39, v49);
  URL.appendingPathComponent(_:isDirectory:)();
  swift_bridgeObjectRelease();
  v42 = *(void (**)(uint64_t, uint64_t))(v50 + 8);
  *(_QWORD *)(v0 + 416) = v42;
  v42(v38, v51);
  Data.write(to:options:)();
  if (v10)

  v43 = *(int **)(v0 + 384);
  v44 = *(_QWORD *)(v0 + 280);
  v46 = *(_QWORD *)(v0 + 224);
  v45 = *(_QWORD *)(v0 + 232);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 272) + 16))(v44, *(_QWORD *)(v0 + 288), *(_QWORD *)(v0 + 264));
  SentTransferredFile.init(_:allowAccessingOriginalFile:)(v44, 1, v45);
  *(_QWORD *)(v0 + 80) = v46;
  *(_QWORD *)(v0 + 88) = &protocol witness table for SentTransferredFile;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
  outlined init with copy of ResolvedTransferRepresentation(v45, (uint64_t)boxed_opaque_existential_1, type metadata accessor for SentTransferredFile);
  v52 = (uint64_t (*)(uint64_t, uint64_t))((char *)v43 + *v43);
  v48 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 424) = v48;
  *v48 = v0;
  v48[1] = Transferable.init(_:_:);
  v36 = v0 + 16;
  v37 = v0 + 56;
  return v52(v36, v37);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int **v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSString *v20;
  void (*v21)(uint64_t, uint64_t);
  int *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 320);
  v2 = *(_QWORD *)(v0 + 208);
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  v3 = *(int *)(v0 + 444);
  v4 = *(_QWORD *)(v0 + 344);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 304) + 8))(*(_QWORD *)(v0 + 320), *(_QWORD *)(v0 + 296));
  if (*(_QWORD *)(v4 + v3) != *(_QWORD *)(v0 + 224))
  {
    v5 = *(int **)(v0 + 384);
    v6 = *(_QWORD *)(v0 + 344);
    v7 = MEMORY[0x24BDCDDE8];
    while (2)
    {
      outlined destroy of ResolvedTransferRepresentation(v6, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
      _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe((uint64_t)v5);
      while (1)
      {
        v8 = *(_QWORD *)(v0 + 376) + 1;
        if (v8 == *(_QWORD *)(v0 + 360))
        {
          swift_bridgeObjectRelease();
          v31 = *(_QWORD *)(v0 + 192);
          v32 = *(_QWORD *)(v0 + 200);
          v33 = *(_QWORD *)(v0 + 184);
          lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
          swift_allocError();
          *v34 = 0;
          swift_willThrow();
          outlined consume of Data._Representation(v33, v31);
          v35 = type metadata accessor for UTType();
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 8))(v32, v35);
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          return (*(uint64_t (**)(void))(v0 + 8))();
        }
        *(_QWORD *)(v0 + 376) = v8;
        v9 = *(_QWORD *)(v0 + 344);
        v10 = *(_QWORD *)(v0 + 328);
        outlined init with copy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 352)+ ((*(unsigned __int8 *)(v0 + 440) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 440))+ *(_QWORD *)(v0 + 368) * v8, v9, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
        v11 = (int **)(v9 + *(int *)(v10 + 36));
        v5 = *v11;
        *(_QWORD *)(v0 + 384) = *v11;
        *(_QWORD *)(v0 + 392) = v11[1];
        v6 = *(_QWORD *)(v0 + 344);
        if (v5)
          break;
        outlined destroy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 344), (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
      }
      v12 = *(int *)(*(_QWORD *)(v0 + 328) + 28);
      *(_DWORD *)(v0 + 444) = v12;
      v13 = *(_QWORD *)(v6 + v12);
      if (v13 == v7)
      {
        v37 = *(_QWORD *)(v0 + 184);
        v36 = *(_QWORD *)(v0 + 192);
        *(_QWORD *)(v0 + 160) = v7;
        *(_QWORD *)(v0 + 168) = &protocol witness table for Data;
        *(_QWORD *)(v0 + 136) = v37;
        *(_QWORD *)(v0 + 144) = v36;
        outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?((uint64_t)v5);
        outlined copy of Data._Representation(v37, v36);
        v40 = (uint64_t (*)(uint64_t, uint64_t))((char *)v5 + *v5);
        v38 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 400) = v38;
        *v38 = v0;
        v38[1] = Transferable.init(_:_:);
        v28 = v0 + 96;
        v29 = v0 + 136;
        return v40(v28, v29);
      }
      v14 = *(_QWORD *)(v0 + 224);
      swift_retain();
      if (v13 != v14)
        continue;
      break;
    }
  }
  v15 = *(_QWORD *)(v0 + 280);
  v16 = *(_QWORD *)(v0 + 272);
  v18 = *(_QWORD *)(v0 + 248);
  v17 = *(_QWORD *)(v0 + 256);
  v19 = *(_QWORD *)(v0 + 240);
  v39 = *(_QWORD *)(v0 + 264);
  v20 = NSTemporaryDirectory();
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  URL.init(fileURLWithPath:isDirectory:)();
  swift_bridgeObjectRelease();
  UUID.init()();
  UUID.uuidString.getter();
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
  URL.appendingPathComponent(_:isDirectory:)();
  swift_bridgeObjectRelease();
  v21 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
  *(_QWORD *)(v0 + 416) = v21;
  v21(v15, v39);
  Data.write(to:options:)();
  v22 = *(int **)(v0 + 384);
  v23 = *(_QWORD *)(v0 + 280);
  v25 = *(_QWORD *)(v0 + 224);
  v24 = *(_QWORD *)(v0 + 232);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 272) + 16))(v23, *(_QWORD *)(v0 + 288), *(_QWORD *)(v0 + 264));
  SentTransferredFile.init(_:allowAccessingOriginalFile:)(v23, 1, v24);
  *(_QWORD *)(v0 + 80) = v25;
  *(_QWORD *)(v0 + 88) = &protocol witness table for SentTransferredFile;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
  outlined init with copy of ResolvedTransferRepresentation(v24, (uint64_t)boxed_opaque_existential_1, type metadata accessor for SentTransferredFile);
  v40 = (uint64_t (*)(uint64_t, uint64_t))((char *)v22 + *v22);
  v27 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 424) = v27;
  *v27 = v0;
  v27[1] = Transferable.init(_:_:);
  v28 = v0 + 16;
  v29 = v0 + 56;
  return v40(v28, v29);
}

{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int **v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSString *v34;
  void (*v35)(uint64_t, uint64_t);
  int *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  uint64_t (*v45)(uint64_t, uint64_t);

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 416);
  v2 = *(_QWORD *)(v0 + 344);
  v3 = *(_QWORD *)(v0 + 312);
  v4 = *(_QWORD *)(v0 + 288);
  v5 = *(_QWORD *)(v0 + 264);
  v6 = *(_QWORD *)(v0 + 232);
  v7 = *(_QWORD *)(v0 + 208);
  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(*(_QWORD *)(v0 + 384));
  outlined destroy of ResolvedTransferRepresentation(v6, type metadata accessor for SentTransferredFile);
  v1(v4, v5);
  outlined destroy of ResolvedTransferRepresentation(v2, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v3, 1, 1, v7);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 304) + 8))(*(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 296));
  v8 = *(_QWORD *)(v0 + 376) + 1;
  if (v8 == *(_QWORD *)(v0 + 360))
  {
LABEL_2:
    swift_bridgeObjectRelease();
    v9 = *(_QWORD *)(v0 + 192);
    v10 = *(_QWORD *)(v0 + 200);
    v11 = *(_QWORD *)(v0 + 184);
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *v12 = 0;
    swift_willThrow();
    outlined consume of Data._Representation(v11, v9);
    v13 = type metadata accessor for UTType();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v10, v13);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v15 = MEMORY[0x24BDCDDE8];
  while (1)
  {
    *(_QWORD *)(v0 + 376) = v8;
    v16 = *(_QWORD *)(v0 + 344);
    v17 = *(_QWORD *)(v0 + 328);
    outlined init with copy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 352)+ ((*(unsigned __int8 *)(v0 + 440) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 440))+ *(_QWORD *)(v0 + 368) * v8, v16, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    v18 = (int **)(v16 + *(int *)(v17 + 36));
    v19 = *v18;
    *(_QWORD *)(v0 + 384) = *v18;
    *(_QWORD *)(v0 + 392) = v18[1];
    v20 = *(_QWORD *)(v0 + 344);
    if (v19)
      break;
    outlined destroy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 344), (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
LABEL_5:
    v8 = *(_QWORD *)(v0 + 376) + 1;
    if (v8 == *(_QWORD *)(v0 + 360))
      goto LABEL_2;
  }
  v21 = *(int *)(*(_QWORD *)(v0 + 328) + 28);
  *(_DWORD *)(v0 + 444) = v21;
  v22 = *(_QWORD *)(v20 + v21);
  if (v22 == v15)
  {
    v25 = *(_QWORD *)(v0 + 184);
    v24 = *(_QWORD *)(v0 + 192);
    *(_QWORD *)(v0 + 160) = v15;
    *(_QWORD *)(v0 + 168) = &protocol witness table for Data;
    *(_QWORD *)(v0 + 136) = v25;
    *(_QWORD *)(v0 + 144) = v24;
    outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?((uint64_t)v19);
    outlined copy of Data._Representation(v25, v24);
    v45 = (uint64_t (*)(uint64_t, uint64_t))((char *)v19 + *v19);
    v26 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 400) = v26;
    *v26 = v0;
    v26[1] = Transferable.init(_:_:);
    v27 = v0 + 96;
    v28 = v0 + 136;
    v29 = v45;
    return v29(v27, v28);
  }
  v23 = *(_QWORD *)(v0 + 224);
  swift_retain();
  if (v22 != v23)
  {
    outlined destroy of ResolvedTransferRepresentation(v20, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe((uint64_t)v19);
    goto LABEL_5;
  }
  v30 = *(_QWORD *)(v0 + 280);
  v31 = *(_QWORD *)(v0 + 256);
  v42 = *(_QWORD *)(v0 + 272);
  v43 = *(_QWORD *)(v0 + 264);
  v33 = *(_QWORD *)(v0 + 240);
  v32 = *(_QWORD *)(v0 + 248);
  v34 = NSTemporaryDirectory();
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  URL.init(fileURLWithPath:isDirectory:)();
  swift_bridgeObjectRelease();
  UUID.init()();
  UUID.uuidString.getter();
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
  URL.appendingPathComponent(_:isDirectory:)();
  swift_bridgeObjectRelease();
  v35 = *(void (**)(uint64_t, uint64_t))(v42 + 8);
  *(_QWORD *)(v0 + 416) = v35;
  v35(v30, v43);
  Data.write(to:options:)();
  v36 = *(int **)(v0 + 384);
  v37 = *(_QWORD *)(v0 + 280);
  v39 = *(_QWORD *)(v0 + 224);
  v38 = *(_QWORD *)(v0 + 232);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 272) + 16))(v37, *(_QWORD *)(v0 + 288), *(_QWORD *)(v0 + 264));
  SentTransferredFile.init(_:allowAccessingOriginalFile:)(v37, 1, v38);
  *(_QWORD *)(v0 + 80) = v39;
  *(_QWORD *)(v0 + 88) = &protocol witness table for SentTransferredFile;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
  outlined init with copy of ResolvedTransferRepresentation(v38, (uint64_t)boxed_opaque_existential_1, type metadata accessor for SentTransferredFile);
  v44 = (uint64_t (*)(uint64_t, uint64_t))((char *)v36 + *v36);
  v41 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 424) = v41;
  *v41 = v0;
  v41[1] = Transferable.init(_:_:);
  v29 = v44;
  v27 = v0 + 16;
  v28 = v0 + 56;
  return v29(v27, v28);
}

uint64_t Transferable.data(contentType:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = Transferable.data(contentType:);
  return Transferable._data(contentType:)(a1, a2, a3);
}

uint64_t Transferable.data(contentType:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *v3;
  v7 = swift_task_dealloc();
  if (!v2)
  {
    v7 = a1;
    v8 = a2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
}

uint64_t Transferable._data(contentType:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[14] = a3;
  v4[15] = v3;
  v4[12] = a1;
  v4[13] = a2;
  v5 = type metadata accessor for SentTransferredFile(0);
  v4[16] = v5;
  v4[17] = *(_QWORD *)(v5 - 8);
  v4[18] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SentTransferredFile?);
  v4[19] = swift_task_alloc();
  v4[20] = swift_task_alloc();
  v4[21] = swift_task_alloc();
  v6 = type metadata accessor for ResolvedTransferRepresentation();
  v4[22] = v6;
  v4[23] = *(_QWORD *)(v6 - 8);
  v4[24] = swift_task_alloc();
  v4[25] = swift_task_alloc();
  v4[26] = swift_task_alloc();
  v4[27] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t Transferable._data(contentType:)()
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
  void (*v12)(uint64_t, uint64_t, uint64_t);
  int **v13;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  _BYTE *v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v32;
  uint64_t (*v33)(uint64_t, uint64_t);

  v1 = static Transferable.resolvedRepresentations(for:)(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 112));
  *(_QWORD *)(v0 + 224) = v1;
  v2 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v0 + 232) = v2;
  if (!v2)
  {
LABEL_12:
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *v27 = 0;
    swift_willThrow();
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
  v3 = 0;
  v4 = *(_QWORD *)(v0 + 184);
  *(_DWORD *)(v0 + 328) = *(_DWORD *)(v4 + 80);
  *(_QWORD *)(v0 + 240) = *(_QWORD *)(v4 + 72);
  v5 = MEMORY[0x24BDCDDE8];
  while (1)
  {
    *(_QWORD *)(v0 + 248) = v3;
    v6 = *(_QWORD *)(v0 + 216);
    v7 = *(_QWORD *)(v0 + 176);
    outlined init with copy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 224)+ ((*(unsigned __int8 *)(v0 + 328) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 328))+ *(_QWORD *)(v0 + 240) * v3, v6, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    v8 = *(_QWORD *)(v6 + *(int *)(v7 + 28));
    if (v8 == v5)
    {
      v23 = swift_task_alloc();
      *(_QWORD *)(v0 + 256) = v23;
      *(_QWORD *)v23 = v0;
      *(_QWORD *)(v23 + 8) = Transferable._data(contentType:);
      v24 = *(_QWORD *)(v0 + 216);
      v25 = *(_OWORD *)(v0 + 104);
      *(_QWORD *)(v23 + 136) = *(_QWORD *)(v0 + 120);
      *(_OWORD *)(v23 + 120) = v25;
      *(_QWORD *)(v23 + 112) = v24;
      return swift_task_switch();
    }
    v9 = *(_QWORD *)(v0 + 216);
    if (v8 == *(_QWORD *)(v0 + 128))
      break;
    outlined destroy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 216), (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
LABEL_4:
    v3 = *(_QWORD *)(v0 + 248) + 1;
    if (v3 == *(_QWORD *)(v0 + 232))
      goto LABEL_12;
  }
  v10 = *(_QWORD *)(v0 + 168);
  v11 = *(_QWORD *)(v0 + 176);
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 136) + 56);
  *(_QWORD *)(v0 + 288) = v12;
  v12(v10, 1, 1);
  v13 = (int **)(v9 + *(int *)(v11 + 32));
  v14 = *v13;
  *(_QWORD *)(v0 + 296) = *v13;
  *(_QWORD *)(v0 + 304) = v13[1];
  if (!v14)
  {
    v15 = *(_QWORD *)(v0 + 160);
    v16 = *(_QWORD *)(v0 + 128);
    outlined destroy of DataRepresentation<AttributedString>(*(_QWORD *)(v0 + 168), &demangling cache variable for type metadata for SentTransferredFile?);
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    *(_QWORD *)(v0 + 48) = 0;
    outlined destroy of DataRepresentation<AttributedString>(v0 + 16, &demangling cache variable for type metadata for TransferableCurrency?);
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v12)(v15, 1, 1, v16);
    outlined init with take of SentTransferredFile?(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 168), &demangling cache variable for type metadata for SentTransferredFile?);
    v17 = *(_QWORD *)(v0 + 152);
    v18 = *(_QWORD *)(v0 + 128);
    v19 = *(_QWORD *)(v0 + 136);
    outlined init with copy of URL?(*(_QWORD *)(v0 + 168), v17, &demangling cache variable for type metadata for SentTransferredFile?);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) != 1)
    {
      outlined init with take of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 144), type metadata accessor for SentTransferredFile);
      Data.init(contentsOf:options:)();
      __asm { BR              X9 }
    }
    v20 = *(_QWORD *)(v0 + 216);
    v21 = *(_QWORD *)(v0 + 152);
    outlined destroy of DataRepresentation<AttributedString>(*(_QWORD *)(v0 + 168), &demangling cache variable for type metadata for SentTransferredFile?);
    outlined destroy of ResolvedTransferRepresentation(v20, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    outlined destroy of DataRepresentation<AttributedString>(v21, &demangling cache variable for type metadata for SentTransferredFile?);
    goto LABEL_4;
  }
  v28 = *(_QWORD *)(v0 + 120);
  v29 = *(_OWORD *)(v0 + 104);
  *(_OWORD *)(v0 + 80) = v29;
  v30 = v29;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(boxed_opaque_existential_1, v28, v30);
  v33 = (uint64_t (*)(uint64_t, uint64_t))((char *)v14 + *v14);
  swift_retain();
  v32 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 312) = v32;
  *v32 = v0;
  v32[1] = Transferable._data(contentType:);
  return v33(v0 + 16, v0 + 56);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 320) = v0;
  swift_task_dealloc();
  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(*(_QWORD *)(v2 + 296));
  if (!v0)
    __swift_destroy_boxed_opaque_existential_1(v2 + 56);
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
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
  uint64_t (*v39)(uint64_t);
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t, uint64_t);
  int **v43;
  int *v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE *v47;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  id v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  uint64_t v62;

  v1 = v0 + 16;
  v2 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v0 + 288);
  v3 = *(_QWORD *)(v0 + 160);
  v4 = *(_QWORD *)(v0 + 128);
  outlined destroy of DataRepresentation<AttributedString>(*(_QWORD *)(v0 + 168), &demangling cache variable for type metadata for SentTransferredFile?);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TransferableCurrency);
  v5 = swift_dynamicCast();
  v2(v3, v5 ^ 1u, 1, v4);
  v6 = *(void **)(v0 + 320);
  v7 = MEMORY[0x24BDCDDE8];
  v8 = type metadata accessor for SentTransferredFile;
  while (2)
  {
    outlined init with take of SentTransferredFile?(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 168), &demangling cache variable for type metadata for SentTransferredFile?);
    v9 = *(_QWORD *)(v0 + 152);
    v10 = *(_QWORD *)(v0 + 128);
    v11 = *(_QWORD *)(v0 + 136);
    outlined init with copy of URL?(*(_QWORD *)(v0 + 168), v9, &demangling cache variable for type metadata for SentTransferredFile?);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
    {
      v12 = *(_QWORD *)(v0 + 216);
      v13 = *(_QWORD *)(v0 + 152);
      outlined destroy of DataRepresentation<AttributedString>(*(_QWORD *)(v0 + 168), &demangling cache variable for type metadata for SentTransferredFile?);
      outlined destroy of ResolvedTransferRepresentation(v12, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
      outlined destroy of DataRepresentation<AttributedString>(v13, &demangling cache variable for type metadata for SentTransferredFile?);
    }
    else
    {
      outlined init with take of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 144), v8);
      Data.init(contentsOf:options:)();
      v60 = v6;
      if (!v6)
        __asm { BR              X9 }
      v58 = v1;
      if (one-time initialization token for logger != -1)
        swift_once();
      v15 = *(_QWORD *)(v0 + 216);
      v16 = *(_QWORD *)(v0 + 192);
      v17 = type metadata accessor for Logger();
      __swift_project_value_buffer(v17, (uint64_t)logger);
      outlined init with copy of ResolvedTransferRepresentation(v15, v16, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
      v18 = v6;
      v19 = v6;
      v20 = Logger.logObject.getter();
      v21 = static os_log_type_t.fault.getter();
      v22 = os_log_type_enabled(v20, v21);
      v23 = *(_QWORD *)(v0 + 192);
      if (v22)
      {
        v24 = swift_slowAlloc();
        v25 = (_QWORD *)swift_slowAlloc();
        v57 = swift_slowAlloc();
        v62 = v57;
        *(_DWORD *)v24 = 136315394;
        v26 = UTType.identifier.getter();
        *(_QWORD *)(v24 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v26, v27, &v62);
        swift_bridgeObjectRelease();
        outlined destroy of ResolvedTransferRepresentation(v23, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
        *(_WORD *)(v24 + 12) = 2112;
        v28 = v60;
        v29 = _swift_stdlib_bridgeErrorToNSError();
        *(_QWORD *)(v24 + 14) = v29;
        *v25 = v29;

        _os_log_impl(&dword_20833C000, v20, v21, "Error loading data for type identifier\n%s: %@", (uint8_t *)v24, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        MEMORY[0x20BD0552C](v25, -1, -1);
        swift_arrayDestroy();
        v8 = type metadata accessor for SentTransferredFile;
        MEMORY[0x20BD0552C](v57, -1, -1);
        MEMORY[0x20BD0552C](v24, -1, -1);

      }
      else
      {

        outlined destroy of ResolvedTransferRepresentation(v23, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
      }
      v1 = v58;
      v30 = *(_QWORD *)(v0 + 216);
      v31 = *(_QWORD *)(v0 + 168);
      outlined destroy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 144), v8);
      outlined destroy of DataRepresentation<AttributedString>(v31, &demangling cache variable for type metadata for SentTransferredFile?);
      outlined destroy of ResolvedTransferRepresentation(v30, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
      v6 = 0;
    }
    while (1)
    {
      v32 = *(_QWORD *)(v0 + 248) + 1;
      if (v32 == *(_QWORD *)(v0 + 232))
      {
        swift_bridgeObjectRelease();
        lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
        swift_allocError();
        *v47 = 0;
        swift_willThrow();
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
      *(_QWORD *)(v0 + 248) = v32;
      v33 = *(_QWORD *)(v0 + 216);
      v34 = *(_QWORD *)(v0 + 176);
      outlined init with copy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 224)+ ((*(unsigned __int8 *)(v0 + 328) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 328))+ *(_QWORD *)(v0 + 240) * v32, v33, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
      v35 = *(_QWORD *)(v33 + *(int *)(v34 + 28));
      if (v35 == v7)
      {
        v49 = swift_task_alloc();
        *(_QWORD *)(v0 + 256) = v49;
        *(_QWORD *)v49 = v0;
        *(_QWORD *)(v49 + 8) = Transferable._data(contentType:);
        v50 = *(_QWORD *)(v0 + 216);
        v51 = *(_OWORD *)(v0 + 104);
        *(_QWORD *)(v49 + 136) = *(_QWORD *)(v0 + 120);
        *(_OWORD *)(v49 + 120) = v51;
        *(_QWORD *)(v49 + 112) = v50;
        return swift_task_switch();
      }
      v36 = *(_QWORD *)(v0 + 216);
      if (v35 == *(_QWORD *)(v0 + 128))
        break;
      outlined destroy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 216), (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    }
    v59 = v6;
    v37 = v7;
    v38 = v1;
    v39 = v8;
    v40 = *(_QWORD *)(v0 + 168);
    v41 = *(_QWORD *)(v0 + 176);
    v42 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 136) + 56);
    *(_QWORD *)(v0 + 288) = v42;
    v42(v40, 1, 1);
    v43 = (int **)(v36 + *(int *)(v41 + 32));
    v44 = *v43;
    *(_QWORD *)(v0 + 296) = *v43;
    *(_QWORD *)(v0 + 304) = v43[1];
    if (!v44)
    {
      v45 = *(_QWORD *)(v0 + 160);
      v46 = *(_QWORD *)(v0 + 128);
      outlined destroy of DataRepresentation<AttributedString>(*(_QWORD *)(v0 + 168), &demangling cache variable for type metadata for SentTransferredFile?);
      *(_OWORD *)v38 = 0u;
      *(_OWORD *)(v38 + 16) = 0u;
      *(_QWORD *)(v38 + 32) = 0;
      outlined destroy of DataRepresentation<AttributedString>(v38, &demangling cache variable for type metadata for TransferableCurrency?);
      ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v42)(v45, 1, 1, v46);
      v8 = v39;
      v1 = v38;
      v7 = v37;
      v6 = v59;
      continue;
    }
    break;
  }
  v52 = *(_QWORD *)(v0 + 120);
  v53 = *(_OWORD *)(v0 + 104);
  *(_OWORD *)(v0 + 80) = v53;
  v54 = v53;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 16))(boxed_opaque_existential_1, v52, v54);
  v61 = (uint64_t (*)(uint64_t, uint64_t))((char *)v44 + *v44);
  swift_retain();
  v56 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 312) = v56;
  *v56 = v0;
  v56[1] = Transferable._data(contentType:);
  return v61(v38, v0 + 56);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t, uint64_t);
  int **v29;
  int *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  uint64_t v49;

  if (one-time initialization token for logger != -1)
    swift_once();
  v1 = *(void **)(v0 + 280);
  v3 = *(_QWORD *)(v0 + 208);
  v2 = *(_QWORD *)(v0 + 216);
  v47 = type metadata accessor for Logger();
  __swift_project_value_buffer(v47, (uint64_t)logger);
  outlined init with copy of ResolvedTransferRepresentation(v2, v3, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
  v4 = v1;
  v5 = v1;
  v6 = Logger.logObject.getter();
  v7 = static os_log_type_t.fault.getter();
  v8 = os_log_type_enabled(v6, v7);
  v9 = *(void **)(v0 + 280);
  v10 = *(_QWORD *)(v0 + 208);
  if (v8)
  {
    v11 = swift_slowAlloc();
    v12 = (_QWORD *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    v49 = v13;
    *(_DWORD *)v11 = 136315394;
    v14 = UTType.identifier.getter();
    *(_QWORD *)(v11 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v14, v15, &v49);
    swift_bridgeObjectRelease();
    outlined destroy of ResolvedTransferRepresentation(v10, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    *(_WORD *)(v11 + 12) = 2112;
    v16 = v9;
    v17 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v11 + 14) = v17;
    *v12 = v17;

    _os_log_impl(&dword_20833C000, v6, v7, "Error loading data for type identifier\n%s: %@", (uint8_t *)v11, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x20BD0552C](v12, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x20BD0552C](v13, -1, -1);
    MEMORY[0x20BD0552C](v11, -1, -1);

  }
  else
  {

    outlined destroy of ResolvedTransferRepresentation(v10, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
  }
  outlined destroy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 216), (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
  v18 = *(_QWORD *)(v0 + 248) + 1;
  if (v18 == *(_QWORD *)(v0 + 232))
  {
LABEL_7:
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *v19 = 0;
    swift_willThrow();
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
  v21 = MEMORY[0x24BDCDDE8];
  while (1)
  {
    *(_QWORD *)(v0 + 248) = v18;
    v22 = *(_QWORD *)(v0 + 216);
    v23 = *(_QWORD *)(v0 + 176);
    outlined init with copy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 224)+ ((*(unsigned __int8 *)(v0 + 328) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 328))+ *(_QWORD *)(v0 + 240) * v18, v22, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    v24 = *(_QWORD *)(v22 + *(int *)(v23 + 28));
    if (v24 == v21)
    {
      v39 = swift_task_alloc();
      *(_QWORD *)(v0 + 256) = v39;
      *(_QWORD *)v39 = v0;
      *(_QWORD *)(v39 + 8) = Transferable._data(contentType:);
      v40 = *(_QWORD *)(v0 + 216);
      v41 = *(_OWORD *)(v0 + 104);
      *(_QWORD *)(v39 + 136) = *(_QWORD *)(v0 + 120);
      *(_OWORD *)(v39 + 120) = v41;
      *(_QWORD *)(v39 + 112) = v40;
      return swift_task_switch();
    }
    v25 = *(_QWORD *)(v0 + 216);
    if (v24 == *(_QWORD *)(v0 + 128))
      break;
    outlined destroy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 216), (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
LABEL_10:
    v18 = *(_QWORD *)(v0 + 248) + 1;
    if (v18 == *(_QWORD *)(v0 + 232))
      goto LABEL_7;
  }
  v26 = *(_QWORD *)(v0 + 168);
  v27 = *(_QWORD *)(v0 + 176);
  v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 136) + 56);
  *(_QWORD *)(v0 + 288) = v28;
  v28(v26, 1, 1);
  v29 = (int **)(v25 + *(int *)(v27 + 32));
  v30 = *v29;
  *(_QWORD *)(v0 + 296) = *v29;
  *(_QWORD *)(v0 + 304) = v29[1];
  if (!v30)
  {
    v31 = *(_QWORD *)(v0 + 160);
    v32 = *(_QWORD *)(v0 + 128);
    outlined destroy of DataRepresentation<AttributedString>(*(_QWORD *)(v0 + 168), &demangling cache variable for type metadata for SentTransferredFile?);
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    *(_QWORD *)(v0 + 48) = 0;
    outlined destroy of DataRepresentation<AttributedString>(v0 + 16, &demangling cache variable for type metadata for TransferableCurrency?);
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v28)(v31, 1, 1, v32);
    outlined init with take of SentTransferredFile?(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 168), &demangling cache variable for type metadata for SentTransferredFile?);
    v33 = *(_QWORD *)(v0 + 152);
    v34 = *(_QWORD *)(v0 + 128);
    v35 = *(_QWORD *)(v0 + 136);
    outlined init with copy of URL?(*(_QWORD *)(v0 + 168), v33, &demangling cache variable for type metadata for SentTransferredFile?);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34) != 1)
    {
      outlined init with take of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 144), type metadata accessor for SentTransferredFile);
      Data.init(contentsOf:options:)();
      __asm { BR              X9 }
    }
    v36 = *(_QWORD *)(v0 + 216);
    v37 = *(_QWORD *)(v0 + 152);
    outlined destroy of DataRepresentation<AttributedString>(*(_QWORD *)(v0 + 168), &demangling cache variable for type metadata for SentTransferredFile?);
    outlined destroy of ResolvedTransferRepresentation(v36, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    outlined destroy of DataRepresentation<AttributedString>(v37, &demangling cache variable for type metadata for SentTransferredFile?);
    goto LABEL_10;
  }
  v42 = *(_QWORD *)(v0 + 120);
  v43 = *(_OWORD *)(v0 + 104);
  *(_OWORD *)(v0 + 80) = v43;
  v44 = v43;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 16))(boxed_opaque_existential_1, v42, v44);
  v48 = (uint64_t (*)(uint64_t, uint64_t))((char *)v30 + *v30);
  swift_retain();
  v46 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 312) = v46;
  *v46 = v0;
  v46[1] = Transferable._data(contentType:);
  return v48(v0 + 16, v0 + 56);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t, uint64_t);
  int **v33;
  int *v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE *v37;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t *);
  uint64_t v50;

  v47 = (uint64_t *)(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  if (one-time initialization token for logger != -1)
    swift_once();
  v1 = *(void **)(v0 + 320);
  v2 = *(_QWORD *)(v0 + 216);
  v3 = *(_QWORD *)(v0 + 200);
  v48 = type metadata accessor for Logger();
  __swift_project_value_buffer(v48, (uint64_t)logger);
  outlined init with copy of ResolvedTransferRepresentation(v2, v3, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
  v4 = v1;
  v5 = v1;
  v6 = Logger.logObject.getter();
  v7 = static os_log_type_t.fault.getter();
  v8 = os_log_type_enabled(v6, v7);
  v9 = *(void **)(v0 + 320);
  v10 = *(_QWORD *)(v0 + 200);
  if (v8)
  {
    v11 = swift_slowAlloc();
    v12 = (_QWORD *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    v50 = v13;
    *(_DWORD *)v11 = 136315394;
    v14 = UTType.identifier.getter();
    *(_QWORD *)(v11 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v14, v15, &v50);
    swift_bridgeObjectRelease();
    outlined destroy of ResolvedTransferRepresentation(v10, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    *(_WORD *)(v11 + 12) = 2112;
    v16 = v9;
    v17 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v11 + 14) = v17;
    *v12 = v17;

    _os_log_impl(&dword_20833C000, v6, v7, "Error loading URL for type identifier\n%s: %@", (uint8_t *)v11, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x20BD0552C](v12, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x20BD0552C](v13, -1, -1);
    MEMORY[0x20BD0552C](v11, -1, -1);

  }
  else
  {

    outlined destroy of ResolvedTransferRepresentation(v10, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
  }
  while (2)
  {
    v18 = *(_QWORD *)(v0 + 152);
    v19 = *(_QWORD *)(v0 + 128);
    v20 = *(_QWORD *)(v0 + 136);
    outlined init with copy of URL?(*(_QWORD *)(v0 + 168), v18, &demangling cache variable for type metadata for SentTransferredFile?);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19) != 1)
    {
      outlined init with take of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 144), type metadata accessor for SentTransferredFile);
      Data.init(contentsOf:options:)();
      __asm { BR              X10 }
    }
    v21 = *(_QWORD *)(v0 + 216);
    v22 = *(_QWORD *)(v0 + 152);
    outlined destroy of DataRepresentation<AttributedString>(*(_QWORD *)(v0 + 168), &demangling cache variable for type metadata for SentTransferredFile?);
    outlined destroy of ResolvedTransferRepresentation(v21, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    outlined destroy of DataRepresentation<AttributedString>(v22, &demangling cache variable for type metadata for SentTransferredFile?);
    v24 = *(_QWORD *)(v0 + 248) + 1;
    if (v24 == *(_QWORD *)(v0 + 232))
    {
LABEL_17:
      swift_bridgeObjectRelease();
      lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
      swift_allocError();
      *v37 = 0;
      swift_willThrow();
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
      v25 = MEMORY[0x24BDCDDE8];
      while (1)
      {
        *(_QWORD *)(v0 + 248) = v24;
        v26 = *(_QWORD *)(v0 + 216);
        v27 = *(_QWORD *)(v0 + 176);
        outlined init with copy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 224)+ ((*(unsigned __int8 *)(v0 + 328) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 328))+ *(_QWORD *)(v0 + 240) * v24, v26, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
        v28 = *(_QWORD *)(v26 + *(int *)(v27 + 28));
        if (v28 == v25)
        {
          v39 = swift_task_alloc();
          *(_QWORD *)(v0 + 256) = v39;
          *(_QWORD *)v39 = v0;
          *(_QWORD *)(v39 + 8) = Transferable._data(contentType:);
          v40 = *(_QWORD *)(v0 + 216);
          v41 = *(_OWORD *)(v0 + 104);
          *(_QWORD *)(v39 + 136) = *(_QWORD *)(v0 + 120);
          *(_OWORD *)(v39 + 120) = v41;
          *(_QWORD *)(v39 + 112) = v40;
          return swift_task_switch();
        }
        v29 = *(_QWORD *)(v0 + 216);
        if (v28 == *(_QWORD *)(v0 + 128))
          break;
        outlined destroy of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 216), (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
        v24 = *(_QWORD *)(v0 + 248) + 1;
        if (v24 == *(_QWORD *)(v0 + 232))
          goto LABEL_17;
      }
      v30 = *(_QWORD *)(v0 + 168);
      v31 = *(_QWORD *)(v0 + 176);
      v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 136) + 56);
      *(_QWORD *)(v0 + 288) = v32;
      v32(v30, 1, 1);
      v33 = (int **)(v29 + *(int *)(v31 + 32));
      v34 = *v33;
      *(_QWORD *)(v0 + 296) = *v33;
      *(_QWORD *)(v0 + 304) = v33[1];
      if (!v34)
      {
        v35 = *(_QWORD *)(v0 + 160);
        v36 = *(_QWORD *)(v0 + 128);
        outlined destroy of DataRepresentation<AttributedString>(*(_QWORD *)(v0 + 168), &demangling cache variable for type metadata for SentTransferredFile?);
        *(_OWORD *)(v0 + 16) = 0u;
        *(_OWORD *)(v0 + 32) = 0u;
        *(_QWORD *)(v0 + 48) = 0;
        outlined destroy of DataRepresentation<AttributedString>(v0 + 16, &demangling cache variable for type metadata for TransferableCurrency?);
        ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v32)(v35, 1, 1, v36);
        outlined init with take of SentTransferredFile?(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 168), &demangling cache variable for type metadata for SentTransferredFile?);
        continue;
      }
      v42 = *(_QWORD *)(v0 + 120);
      v43 = *(_OWORD *)(v0 + 104);
      *(_OWORD *)(v0 + 80) = v43;
      v44 = v43;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v47);
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 16))(boxed_opaque_existential_1, v42, v44);
      v49 = (uint64_t (*)(uint64_t, uint64_t *))((char *)v34 + *v34);
      swift_retain();
      v46 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 312) = v46;
      *v46 = v0;
      v46[1] = Transferable._data(contentType:);
      return v49(v0 + 16, v47);
    }
  }
}

uint64_t Transferable._data(contentType:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  v4 = (_QWORD *)*v3;
  v4[33] = a1;
  v4[34] = a2;
  v4[35] = v2;
  swift_task_dealloc();
  return swift_task_switch();
}

void Transferable._data(contentType:)()
{
  __asm { BR              X10 }
}

uint64_t sub_2083577D0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, os_log_type_t type, os_log_t log, uint64_t a13, __int128 a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  _BYTE *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t, uint64_t);
  int **v44;
  int *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  id v58;
  NSObject *v59;
  os_log_type_t v60;
  _BOOL4 v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  uint64_t v73;
  __int128 v74;
  uint64_t v75;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v77;
  _QWORD *v78;
  os_log_type_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  uint64_t v83;

  outlined destroy of ResolvedTransferRepresentation(*(_QWORD *)(v30 + 216), (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
  v31 = *(_QWORD *)(v30 + 264);
  if ((v29 & 0xFF000000000000) != 0)
  {
    v80 = *(_QWORD *)(v30 + 272);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v30 + 8))(v31, v80);
  }
  outlined consume of Data._Representation(*(_QWORD *)(v30 + 264), *(_QWORD *)(v30 + 272));
  v33 = *(_QWORD *)(v30 + 248) + 1;
  if (v33 == *(_QWORD *)(v30 + 232))
  {
LABEL_4:
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *v34 = 0;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v30 + 8))();
  }
  v35 = *(void **)(v30 + 280);
  v36 = MEMORY[0x24BDCDDE8];
  while (1)
  {
    *(_QWORD *)(v30 + 248) = v33;
    v37 = *(_QWORD *)(v30 + 216);
    v38 = *(_QWORD *)(v30 + 176);
    outlined init with copy of ResolvedTransferRepresentation(*(_QWORD *)(v30 + 224)+ ((*(unsigned __int8 *)(v30 + 328) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 328))+ *(_QWORD *)(v30 + 240) * v33, v37, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    v39 = *(_QWORD *)(v37 + *(int *)(v38 + 28));
    if (v39 == v36)
    {
      v70 = swift_task_alloc();
      *(_QWORD *)(v30 + 256) = v70;
      *(_QWORD *)v70 = v30;
      *(_QWORD *)(v70 + 8) = Transferable._data(contentType:);
      v71 = *(_QWORD *)(v30 + 216);
      v72 = *(_OWORD *)(v30 + 104);
      *(_QWORD *)(v70 + 136) = *(_QWORD *)(v30 + 120);
      *(_OWORD *)(v70 + 120) = v72;
      *(_QWORD *)(v70 + 112) = v71;
      return swift_task_switch();
    }
    v40 = *(_QWORD *)(v30 + 216);
    if (v39 == *(_QWORD *)(v30 + 128))
      break;
    outlined destroy of ResolvedTransferRepresentation(*(_QWORD *)(v30 + 216), (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
LABEL_7:
    v33 = *(_QWORD *)(v30 + 248) + 1;
    if (v33 == *(_QWORD *)(v30 + 232))
      goto LABEL_4;
  }
  v41 = *(_QWORD *)(v30 + 168);
  v42 = *(_QWORD *)(v30 + 176);
  v43 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 + 136) + 56);
  *(_QWORD *)(v30 + 288) = v43;
  v43(v41, 1, 1);
  v44 = (int **)(v40 + *(int *)(v42 + 32));
  v45 = *v44;
  *(_QWORD *)(v30 + 296) = *v44;
  *(_QWORD *)(v30 + 304) = v44[1];
  if (!v45)
  {
    v46 = *(_QWORD *)(v30 + 160);
    v47 = *(_QWORD *)(v30 + 128);
    outlined destroy of DataRepresentation<AttributedString>(*(_QWORD *)(v30 + 168), &demangling cache variable for type metadata for SentTransferredFile?);
    *(_OWORD *)v28 = 0u;
    *(_OWORD *)(v28 + 16) = 0u;
    *(_QWORD *)(v28 + 32) = 0;
    outlined destroy of DataRepresentation<AttributedString>(v28, &demangling cache variable for type metadata for TransferableCurrency?);
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v43)(v46, 1, 1, v47);
    outlined init with take of SentTransferredFile?(*(_QWORD *)(v30 + 160), *(_QWORD *)(v30 + 168), &demangling cache variable for type metadata for SentTransferredFile?);
    v48 = *(_QWORD *)(v30 + 152);
    v49 = *(_QWORD *)(v30 + 128);
    v50 = *(_QWORD *)(v30 + 136);
    outlined init with copy of URL?(*(_QWORD *)(v30 + 168), v48, &demangling cache variable for type metadata for SentTransferredFile?);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v50 + 48))(v48, 1, v49) == 1)
    {
      v51 = *(_QWORD *)(v30 + 216);
      v52 = *(_QWORD *)(v30 + 152);
      outlined destroy of DataRepresentation<AttributedString>(*(_QWORD *)(v30 + 168), &demangling cache variable for type metadata for SentTransferredFile?);
      outlined destroy of ResolvedTransferRepresentation(v51, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
      outlined destroy of DataRepresentation<AttributedString>(v52, &demangling cache variable for type metadata for SentTransferredFile?);
    }
    else
    {
      outlined init with take of ResolvedTransferRepresentation(*(_QWORD *)(v30 + 152), *(_QWORD *)(v30 + 144), type metadata accessor for SentTransferredFile);
      Data.init(contentsOf:options:)();
      if (!v35)
        __asm { BR              X9 }
      if (one-time initialization token for logger != -1)
        swift_once();
      v54 = *(_QWORD *)(v30 + 216);
      v55 = *(_QWORD *)(v30 + 192);
      v56 = type metadata accessor for Logger();
      __swift_project_value_buffer(v56, (uint64_t)logger);
      outlined init with copy of ResolvedTransferRepresentation(v54, v55, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
      v57 = v35;
      v58 = v35;
      v59 = Logger.logObject.getter();
      v60 = static os_log_type_t.fault.getter();
      v61 = os_log_type_enabled(v59, v60);
      v62 = *(_QWORD *)(v30 + 192);
      if (v61)
      {
        v79 = v60;
        v63 = swift_slowAlloc();
        v78 = (_QWORD *)swift_slowAlloc();
        v81 = swift_slowAlloc();
        v83 = v81;
        *(_DWORD *)v63 = 136315394;
        v64 = UTType.identifier.getter();
        *(_QWORD *)(v63 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v64, v65, &v83);
        swift_bridgeObjectRelease();
        outlined destroy of ResolvedTransferRepresentation(v62, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
        *(_WORD *)(v63 + 12) = 2112;
        v66 = v35;
        v67 = _swift_stdlib_bridgeErrorToNSError();
        *(_QWORD *)(v63 + 14) = v67;
        *v78 = v67;

        _os_log_impl(&dword_20833C000, v59, v79, "Error loading data for type identifier\n%s: %@", (uint8_t *)v63, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        MEMORY[0x20BD0552C](v78, -1, -1);
        swift_arrayDestroy();
        MEMORY[0x20BD0552C](v81, -1, -1);
        MEMORY[0x20BD0552C](v63, -1, -1);

      }
      else
      {

        outlined destroy of ResolvedTransferRepresentation(v62, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
      }
      v68 = *(_QWORD *)(v30 + 216);
      v69 = *(_QWORD *)(v30 + 168);
      outlined destroy of ResolvedTransferRepresentation(*(_QWORD *)(v30 + 144), type metadata accessor for SentTransferredFile);
      outlined destroy of DataRepresentation<AttributedString>(v69, &demangling cache variable for type metadata for SentTransferredFile?);
      outlined destroy of ResolvedTransferRepresentation(v68, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
      v35 = 0;
    }
    goto LABEL_7;
  }
  v73 = *(_QWORD *)(v30 + 120);
  v74 = *(_OWORD *)(v30 + 104);
  *(_OWORD *)(v30 + 80) = v74;
  v75 = v74;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v30 + 56));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v75 - 8) + 16))(boxed_opaque_existential_1, v73, v75);
  v82 = (uint64_t (*)(uint64_t, uint64_t))((char *)v45 + *v45);
  swift_retain();
  v77 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v30 + 312) = v77;
  *v77 = v30;
  v77[1] = Transferable._data(contentType:);
  return v82(v28, v30 + 56);
}

uint64_t static Transferable._readableContentTypes.getter(uint64_t a1, uint64_t a2)
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
  uint64_t AssociatedTypeWitness;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(char *, char *, uint64_t);
  uint64_t AssociatedConformanceWitness;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  int64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v4 = type metadata accessor for UTType();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v58 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = type metadata accessor for ResolvedTransferRepresentation();
  v56 = *(_QWORD *)(v59 - 8);
  v7 = MEMORY[0x24BDAC7A8](v59);
  v55 = (uint64_t)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v57 = (uint64_t)&v48 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v48 - v11;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v16 = type metadata accessor for _TransferRepresentationValue(0, AssociatedTypeWitness, v14, v15);
  v53 = *(_QWORD *)(v16 - 8);
  v54 = v16;
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v48 - v18;
  v20 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v21 = MEMORY[0x24BDAC7A8](v17);
  v23 = (char *)&v48 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v48 - v24;
  v26 = *(void (**)(uint64_t, uint64_t))(a2 + 24);
  v52 = a1;
  v26(a1, a2);
  swift_getDynamicType();
  v27 = *(void (**)(char *, char *, uint64_t))(v20 + 16);
  v49 = v25;
  v27(v23, v25, AssociatedTypeWitness);
  _TransferRepresentationValue.init(_:)((uint64_t)v23, AssociatedTypeWitness, (uint64_t)v19);
  _TransferRepresentationInputs.init()();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t *__return_ptr, char *))(AssociatedConformanceWitness + 48))(&v61, v19);
  result = (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v19, v54);
  v30 = v61;
  v31 = MEMORY[0x24BEE4AF8];
  v60 = MEMORY[0x24BEE4AF8];
  v54 = *(_QWORD *)(v61 + 16);
  v50 = v20;
  v51 = AssociatedTypeWitness;
  if (v54)
  {
    v32 = 0;
    v33 = v58;
    v53 = v61;
    while (v32 < *(_QWORD *)(v30 + 16))
    {
      v34 = v5;
      v35 = v4;
      v36 = (*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
      v37 = *(_QWORD *)(v56 + 72);
      outlined init with copy of ResolvedTransferRepresentation(v30 + v36 + v37 * v32, (uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
      if (*(_QWORD *)&v12[*(int *)(v59 + 36)])
      {
        outlined init with take of ResolvedTransferRepresentation((uint64_t)v12, v57, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v31 + 16) + 1, 1);
        v31 = v60;
        v39 = *(_QWORD *)(v60 + 16);
        v38 = *(_QWORD *)(v60 + 24);
        if (v39 >= v38 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v38 > 1, v39 + 1, 1);
          v31 = v60;
        }
        *(_QWORD *)(v31 + 16) = v39 + 1;
        result = outlined init with take of ResolvedTransferRepresentation(v57, v31 + v36 + v39 * v37, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
        v33 = v58;
        v30 = v53;
      }
      else
      {
        result = outlined destroy of ResolvedTransferRepresentation((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
      }
      ++v32;
      v4 = v35;
      v5 = v34;
      if (v54 == v32)
      {
        v40 = v60;
        v31 = MEMORY[0x24BEE4AF8];
        goto LABEL_14;
      }
    }
    __break(1u);
  }
  else
  {
    v40 = MEMORY[0x24BEE4AF8];
    v33 = v58;
LABEL_14:
    swift_bridgeObjectRelease();
    v41 = *(_QWORD *)(v40 + 16);
    if (v41)
    {
      v61 = v31;
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v41, 0);
      v42 = v40 + ((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80));
      v43 = *(_QWORD *)(v56 + 72);
      do
      {
        v44 = v55;
        outlined init with copy of ResolvedTransferRepresentation(v42, v55, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v33, v44 + *(int *)(v59 + 20), v4);
        outlined destroy of ResolvedTransferRepresentation(v44, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
        v31 = v61;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v31 + 16) + 1, 1);
          v31 = v61;
        }
        v46 = *(_QWORD *)(v31 + 16);
        v45 = *(_QWORD *)(v31 + 24);
        if (v46 >= v45 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v45 > 1, v46 + 1, 1);
          v31 = v61;
        }
        *(_QWORD *)(v31 + 16) = v46 + 1;
        v47 = v31
            + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
            + *(_QWORD *)(v5 + 72) * v46;
        v33 = v58;
        (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v47, v58, v4);
        v61 = v31;
        v42 += v43;
        --v41;
      }
      while (v41);
    }
    swift_release();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v49, v51);
    return v31;
  }
  return result;
}

uint64_t static Transferable._writableContentTypes.getter(uint64_t a1, uint64_t a2)
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
  uint64_t AssociatedTypeWitness;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(char *, char *, uint64_t);
  uint64_t AssociatedConformanceWitness;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  int64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v4 = type metadata accessor for UTType();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v58 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = type metadata accessor for ResolvedTransferRepresentation();
  v56 = *(_QWORD *)(v59 - 8);
  v7 = MEMORY[0x24BDAC7A8](v59);
  v55 = (uint64_t)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v57 = (uint64_t)&v48 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v48 - v11;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v16 = type metadata accessor for _TransferRepresentationValue(0, AssociatedTypeWitness, v14, v15);
  v53 = *(_QWORD *)(v16 - 8);
  v54 = v16;
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v48 - v18;
  v20 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v21 = MEMORY[0x24BDAC7A8](v17);
  v23 = (char *)&v48 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v48 - v24;
  v26 = *(void (**)(uint64_t, uint64_t))(a2 + 24);
  v52 = a1;
  v26(a1, a2);
  swift_getDynamicType();
  v27 = *(void (**)(char *, char *, uint64_t))(v20 + 16);
  v49 = v25;
  v27(v23, v25, AssociatedTypeWitness);
  _TransferRepresentationValue.init(_:)((uint64_t)v23, AssociatedTypeWitness, (uint64_t)v19);
  _TransferRepresentationInputs.init()();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t *__return_ptr, char *))(AssociatedConformanceWitness + 48))(&v61, v19);
  result = (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v19, v54);
  v30 = v61;
  v31 = MEMORY[0x24BEE4AF8];
  v60 = MEMORY[0x24BEE4AF8];
  v54 = *(_QWORD *)(v61 + 16);
  v50 = v20;
  v51 = AssociatedTypeWitness;
  if (v54)
  {
    v32 = 0;
    v33 = v58;
    v53 = v61;
    while (v32 < *(_QWORD *)(v30 + 16))
    {
      v34 = v5;
      v35 = v4;
      v36 = (*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
      v37 = *(_QWORD *)(v56 + 72);
      outlined init with copy of ResolvedTransferRepresentation(v30 + v36 + v37 * v32, (uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
      if (*(_QWORD *)&v12[*(int *)(v59 + 32)])
      {
        outlined init with take of ResolvedTransferRepresentation((uint64_t)v12, v57, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v31 + 16) + 1, 1);
        v31 = v60;
        v39 = *(_QWORD *)(v60 + 16);
        v38 = *(_QWORD *)(v60 + 24);
        if (v39 >= v38 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v38 > 1, v39 + 1, 1);
          v31 = v60;
        }
        *(_QWORD *)(v31 + 16) = v39 + 1;
        result = outlined init with take of ResolvedTransferRepresentation(v57, v31 + v36 + v39 * v37, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
        v33 = v58;
        v30 = v53;
      }
      else
      {
        result = outlined destroy of ResolvedTransferRepresentation((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
      }
      ++v32;
      v4 = v35;
      v5 = v34;
      if (v54 == v32)
      {
        v40 = v60;
        v31 = MEMORY[0x24BEE4AF8];
        goto LABEL_14;
      }
    }
    __break(1u);
  }
  else
  {
    v40 = MEMORY[0x24BEE4AF8];
    v33 = v58;
LABEL_14:
    swift_bridgeObjectRelease();
    v41 = *(_QWORD *)(v40 + 16);
    if (v41)
    {
      v61 = v31;
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v41, 0);
      v42 = v40 + ((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80));
      v43 = *(_QWORD *)(v56 + 72);
      do
      {
        v44 = v55;
        outlined init with copy of ResolvedTransferRepresentation(v42, v55, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v33, v44 + *(int *)(v59 + 20), v4);
        outlined destroy of ResolvedTransferRepresentation(v44, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
        v31 = v61;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v31 + 16) + 1, 1);
          v31 = v61;
        }
        v46 = *(_QWORD *)(v31 + 16);
        v45 = *(_QWORD *)(v31 + 24);
        if (v46 >= v45 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v45 > 1, v46 + 1, 1);
          v31 = v61;
        }
        *(_QWORD *)(v31 + 16) = v46 + 1;
        v47 = v31
            + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
            + *(_QWORD *)(v5 + 72) * v46;
        v33 = v58;
        (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v47, v58, v4);
        v61 = v31;
        v42 += v43;
        --v41;
      }
      while (v41);
    }
    swift_release();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v49, v51);
    return v31;
  }
  return result;
}

uint64_t static Transferable.resolvedRepresentations(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness;
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
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t AssociatedConformanceWitness;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[16];
  uint64_t v25;
  uint64_t v26;

  v23 = a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = type metadata accessor for _TransferRepresentationValue(0, AssociatedTypeWitness, v6, v7);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v22 - v11;
  v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v14 = MEMORY[0x24BDAC7A8](v10);
  v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v22 - v17;
  (*(void (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
  swift_getDynamicType();
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, AssociatedTypeWitness);
  _TransferRepresentationValue.init(_:)((uint64_t)v16, AssociatedTypeWitness, (uint64_t)v12);
  _TransferRepresentationInputs.init()();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t *__return_ptr, char *))(AssociatedConformanceWitness + 48))(&v26, v12);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  v25 = v23;
  v20 = specialized _ArrayProtocol.filter(_:)((uint64_t (*)(char *))partial apply for closure #1 in static Transferable.resolvedRepresentations(for:), (uint64_t)v24, v26);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v18, AssociatedTypeWitness);
  return v20;
}

uint64_t Transferable.url(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v5[15] = a4;
  v5[16] = v4;
  v5[13] = a2;
  v5[14] = a3;
  v5[12] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SentTransferredFile?);
  v5[17] = swift_task_alloc();
  v6 = type metadata accessor for SentTransferredFile(0);
  v5[18] = v6;
  v5[19] = *(_QWORD *)(v6 - 8);
  v5[20] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t Transferable.url(from:)()
{
  uint64_t v0;
  uint64_t v1;
  int **v2;
  int *v3;
  uint64_t v4;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v6;
  _BYTE *v8;
  __int128 v9;

  v1 = *(_QWORD *)(v0 + 104);
  v2 = (int **)(v1 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 32));
  v3 = *v2;
  *(_QWORD *)(v0 + 168) = *v2;
  *(_QWORD *)(v0 + 176) = v2[1];
  if (v3)
  {
    v4 = *(_QWORD *)(v0 + 128);
    v9 = *(_OWORD *)(v0 + 112);
    *(_OWORD *)(v0 + 80) = v9;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
    (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(boxed_opaque_existential_1, v4);
    *(_QWORD *)&v9 = (char *)v3 + *v3;
    swift_retain();
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 184) = v6;
    *v6 = v0;
    v6[1] = Transferable.url(from:);
    return ((uint64_t (*)(uint64_t, uint64_t))v9)(v0 + 16, v0 + 56);
  }
  else
  {
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *v8 = 1;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 192) = v0;
  swift_task_dealloc();
  if (!v0)
    __swift_destroy_boxed_opaque_existential_1(v2 + 56);
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  char v2;
  void (*v3)(uint64_t, uint64_t, uint64_t, _QWORD);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;

  v1 = *(_QWORD *)(v0 + 152);
  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(*(_QWORD *)(v0 + 168));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TransferableCurrency);
  v2 = swift_dynamicCast();
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v1 + 56);
  if ((v2 & 1) != 0)
  {
    v4 = *(_QWORD *)(v0 + 160);
    v5 = *(_QWORD *)(v0 + 136);
    v6 = *(_QWORD *)(v0 + 96);
    v3(v5, 0, 1, *(_QWORD *)(v0 + 144));
    outlined init with take of ResolvedTransferRepresentation(v5, v4, type metadata accessor for SentTransferredFile);
    v7 = type metadata accessor for URL();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v6, v4, v7);
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 136);
    v3(v8, 1, 1, *(_QWORD *)(v0 + 144));
    outlined destroy of DataRepresentation<AttributedString>(v8, &demangling cache variable for type metadata for SentTransferredFile?);
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *v9 = 1;
    swift_willThrow();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;

  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(*(_QWORD *)(v0 + 168));
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t Transferable.data(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[16] = a3;
  v4[17] = v3;
  v4[14] = a1;
  v4[15] = a2;
  return swift_task_switch();
}

uint64_t Transferable.data(from:)()
{
  uint64_t v0;
  uint64_t v1;
  int **v2;
  int *v3;
  uint64_t v4;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v6;
  _BYTE *v8;
  __int128 v9;

  v1 = *(_QWORD *)(v0 + 112);
  v2 = (int **)(v1 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 32));
  v3 = *v2;
  *(_QWORD *)(v0 + 144) = *v2;
  *(_QWORD *)(v0 + 152) = v2[1];
  if (v3)
  {
    v4 = *(_QWORD *)(v0 + 136);
    v9 = *(_OWORD *)(v0 + 120);
    *(_OWORD *)(v0 + 80) = v9;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
    (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(boxed_opaque_existential_1, v4);
    *(_QWORD *)&v9 = (char *)v3 + *v3;
    swift_retain();
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 160) = v6;
    *v6 = v0;
    v6[1] = Transferable.data(from:);
    return ((uint64_t (*)(uint64_t, uint64_t))v9)(v0 + 16, v0 + 56);
  }
  else
  {
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *v8 = 1;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 168) = v0;
  swift_task_dealloc();
  if (!v0)
    __swift_destroy_boxed_opaque_existential_1(v2 + 56);
  return swift_task_switch();
}

{
  uint64_t v0;
  _BYTE *v2;

  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(*(_QWORD *)(v0 + 144));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TransferableCurrency);
  if ((swift_dynamicCast() & 1) != 0)
    return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 104));
  lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
  swift_allocError();
  *v2 = 1;
  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;

  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(*(_QWORD *)(v0 + 144));
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t specialized _ArrayProtocol.filter(_:)(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v7 = type metadata accessor for ResolvedTransferRepresentation();
  v24 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v23 = (uint64_t)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v20 - v11;
  v13 = MEMORY[0x24BEE4AF8];
  v25 = MEMORY[0x24BEE4AF8];
  v22 = *(_QWORD *)(a3 + 16);
  if (v22)
  {
    v14 = 0;
    v15 = MEMORY[0x24BEE4AF8];
    v20[1] = a2;
    v21 = a3;
    v20[0] = a1;
    while (v14 < *(_QWORD *)(a3 + 16))
    {
      v16 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
      v13 = *(_QWORD *)(v24 + 72);
      outlined init with copy of ResolvedTransferRepresentation(a3 + v16 + v13 * v14, (uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
      v17 = a1(v12);
      if (v3)
      {
        outlined destroy of ResolvedTransferRepresentation((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
        swift_release();
        swift_bridgeObjectRelease();
        return v13;
      }
      if ((v17 & 1) != 0)
      {
        outlined init with take of ResolvedTransferRepresentation((uint64_t)v12, v23, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v15 + 16) + 1, 1);
        v15 = v25;
        v19 = *(_QWORD *)(v25 + 16);
        v18 = *(_QWORD *)(v25 + 24);
        if (v19 >= v18 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v18 > 1, v19 + 1, 1);
          v15 = v25;
        }
        *(_QWORD *)(v15 + 16) = v19 + 1;
        result = outlined init with take of ResolvedTransferRepresentation(v23, v15 + v16 + v19 * v13, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
        a3 = v21;
        a1 = (uint64_t (*)(char *))v20[0];
      }
      else
      {
        result = outlined destroy of ResolvedTransferRepresentation((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
      }
      if (v22 == ++v14)
      {
        v13 = v25;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v13;
  }
  return result;
}

uint64_t closure #1 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)(uint64_t a1, unint64_t a2, void *a3, void (*a4)(uint64_t *), uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  id v17;
  _QWORD v19[2];

  v19[0] = a6;
  v19[1] = a7;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  v10 = type metadata accessor for Result();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (_QWORD *)((char *)v19 - v12);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v14);
  if (a2 >> 60 != 15)
    __asm { BR              X10 }
  if (a3)
  {
    v15 = (uint64_t)a3;
  }
  else
  {
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    v15 = swift_allocError();
    *v16 = 0;
  }
  *v13 = v15;
  swift_storeEnumTagMultiPayload();
  v17 = a3;
  a4(v13);
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t closure #1 in closure #1 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v8[17] = v12;
  v8[18] = v13;
  v8[15] = a7;
  v8[16] = a8;
  v8[13] = a5;
  v8[14] = a6;
  v8[12] = a4;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  v9 = type metadata accessor for Result();
  v8[19] = v9;
  v8[20] = *(_QWORD *)(v9 - 8);
  v8[21] = swift_task_alloc();
  v10 = type metadata accessor for Optional();
  v8[22] = v10;
  v8[23] = *(_QWORD *)(v10 - 8);
  v8[24] = swift_task_alloc();
  v8[25] = *(_QWORD *)(v13 - 8);
  v8[26] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #1 in closure #1 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  int *v3;
  _QWORD *v4;
  int *v6;

  v1 = v0[14];
  v2 = v0[15];
  v3 = (int *)v0[12];
  v0[10] = MEMORY[0x24BDCDDE8];
  v0[11] = &protocol witness table for Data;
  v0[7] = v1;
  v0[8] = v2;
  outlined copy of Data._Representation(v1, v2);
  v6 = (int *)((char *)v3 + *v3);
  v4 = (_QWORD *)swift_task_alloc();
  v0[27] = v4;
  *v4 = v0;
  v4[1] = closure #1 in closure #1 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:);
  return ((uint64_t (*)(_QWORD *, _QWORD *))v6)(v0 + 2, v0 + 7);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 224) = v0;
  swift_task_dealloc();
  if (!v0)
    __swift_destroy_boxed_opaque_existential_1(v2 + 56);
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  char v2;
  void (*v3)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t *);
  uint64_t v19;
  _BYTE *v20;

  v1 = *(_QWORD *)(v0 + 200);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
  v2 = swift_dynamicCast();
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 56);
  if ((v2 & 1) != 0)
  {
    v5 = *(_QWORD *)(v0 + 200);
    v4 = *(_QWORD *)(v0 + 208);
    v6 = *(_QWORD *)(v0 + 192);
    v8 = *(_QWORD *)(v0 + 160);
    v7 = *(_QWORD *)(v0 + 168);
    v10 = *(_QWORD *)(v0 + 144);
    v9 = *(_QWORD *)(v0 + 152);
    v11 = *(void (**)(uint64_t))(v0 + 128);
    v3(v6, 0, 1, v10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v4, v6, v10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v7, v4, v10);
    swift_storeEnumTagMultiPayload();
    v11(v7);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v10);
  }
  else
  {
    v13 = *(_QWORD *)(v0 + 184);
    v12 = *(_QWORD *)(v0 + 192);
    v15 = *(uint64_t **)(v0 + 168);
    v14 = *(_QWORD *)(v0 + 176);
    v16 = *(_QWORD *)(v0 + 152);
    v17 = *(_QWORD *)(v0 + 160);
    v18 = *(void (**)(uint64_t *))(v0 + 128);
    v3(v12, 1, 1, *(_QWORD *)(v0 + 144));
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    v19 = swift_allocError();
    *v20 = 0;
    *v15 = v19;
    swift_storeEnumTagMultiPayload();
    v18(v15);
    (*(void (**)(uint64_t *, uint64_t))(v17 + 8))(v15, v16);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(_QWORD *);
  id v6;

  v1 = *(void **)(v0 + 224);
  v3 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD **)(v0 + 168);
  v4 = *(_QWORD *)(v0 + 152);
  v5 = *(void (**)(_QWORD *))(v0 + 128);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  *v2 = v1;
  swift_storeEnumTagMultiPayload();
  v6 = v1;
  v5(v2);

  (*(void (**)(_QWORD *, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = type metadata accessor for TaskPriority();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  outlined destroy of DataRepresentation<AttributedString>(a1, &demangling cache variable for type metadata for TaskPriority?);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t closure #2 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)(uint64_t a1, int a2, void *a3, void (*a4)(uint64_t *), void (*a5)(uint64_t *), uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
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
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  void (*v30)(uint64_t *);
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  void (**v39)(uint64_t *);
  void (*v40)(uint64_t *);
  _BYTE *v42;
  id v43;
  void *v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t *);
  void (*v55)(uint64_t *);

  v50 = a6;
  v51 = a7;
  v54 = a4;
  v55 = a5;
  v44 = a3;
  v45 = a2;
  v52 = a1;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v10);
  v53 = (uint64_t)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for ReceivedTransferredFile(0);
  v46 = *(_QWORD *)(v12 - 8);
  v13 = *(_QWORD *)(v46 + 64);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v47 = (uint64_t)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v48 = (uint64_t)&v44 - v15;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  v49 = a8;
  v16 = type metadata accessor for Result();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (uint64_t *)((char *)&v44 - v18);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v44 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = type metadata accessor for URL();
  v24 = *(_QWORD *)(v23 - 8);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v44 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v44 - v28;
  outlined init with copy of URL?(v52, (uint64_t)v22, &demangling cache variable for type metadata for URL?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23) == 1)
  {
    v30 = v54;
    outlined destroy of DataRepresentation<AttributedString>((uint64_t)v22, &demangling cache variable for type metadata for URL?);
    v31 = v44;
    if (v44)
    {
      v32 = (uint64_t)v44;
    }
    else
    {
      lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
      v32 = swift_allocError();
      *v42 = 0;
    }
    *v19 = v32;
    swift_storeEnumTagMultiPayload();
    v43 = v31;
    v30(v19);
    return (*(uint64_t (**)(uint64_t *, uint64_t))(v17 + 8))(v19, v16);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v29, v22, v23);
    (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v27, v29, v23);
    v33 = v48;
    ReceivedTransferredFile.init(file:isOriginalFile:)((uint64_t)v27, v45 & 1, v48);
    v34 = type metadata accessor for TaskPriority();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v53, 1, 1, v34);
    v35 = v47;
    outlined init with copy of ResolvedTransferRepresentation(v33, v47, type metadata accessor for ReceivedTransferredFile);
    v36 = (*(unsigned __int8 *)(v46 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80);
    v37 = (_QWORD *)swift_allocObject();
    v37[2] = 0;
    v37[3] = 0;
    v37[4] = v49;
    v37[5] = a9;
    v38 = v51;
    v37[6] = v50;
    v37[7] = v38;
    outlined init with take of ResolvedTransferRepresentation(v35, (uint64_t)v37 + v36, type metadata accessor for ReceivedTransferredFile);
    v39 = (void (**)(uint64_t *))((char *)v37 + ((v13 + v36 + 7) & 0xFFFFFFFFFFFFFFF8));
    v40 = v55;
    *v39 = v54;
    v39[1] = v40;
    swift_retain();
    swift_retain();
    _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(v53, (uint64_t)&async function pointer to partial apply for closure #1 in closure #2 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:), (uint64_t)v37);
    swift_release();
    outlined destroy of ResolvedTransferRepresentation(v33, type metadata accessor for ReceivedTransferredFile);
    return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v29, v23);
  }
}

uint64_t closure #1 in closure #2 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v8[16] = a8;
  v8[17] = v12;
  v8[14] = a6;
  v8[15] = a7;
  v8[12] = a4;
  v8[13] = a5;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  v9 = type metadata accessor for Result();
  v8[18] = v9;
  v8[19] = *(_QWORD *)(v9 - 8);
  v8[20] = swift_task_alloc();
  v10 = type metadata accessor for Optional();
  v8[21] = v10;
  v8[22] = *(_QWORD *)(v10 - 8);
  v8[23] = swift_task_alloc();
  v8[24] = *(_QWORD *)(v12 - 8);
  v8[25] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #1 in closure #2 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)()
{
  uint64_t *v0;
  uint64_t v1;
  int *v2;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t *, uint64_t *);

  v1 = v0[14];
  v2 = (int *)v0[12];
  v0[10] = type metadata accessor for ReceivedTransferredFile(0);
  v0[11] = (uint64_t)&protocol witness table for ReceivedTransferredFile;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v0 + 7);
  outlined init with copy of ResolvedTransferRepresentation(v1, (uint64_t)boxed_opaque_existential_1, type metadata accessor for ReceivedTransferredFile);
  v6 = (uint64_t (*)(uint64_t *, uint64_t *))((char *)v2 + *v2);
  v4 = (_QWORD *)swift_task_alloc();
  v0[26] = (uint64_t)v4;
  *v4 = v0;
  v4[1] = closure #1 in closure #2 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:);
  return v6(v0 + 2, v0 + 7);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 216) = v0;
  swift_task_dealloc();
  if (!v0)
    __swift_destroy_boxed_opaque_existential_1(v2 + 56);
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  char v2;
  void (*v3)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t *);
  uint64_t v19;
  _BYTE *v20;

  v1 = *(_QWORD *)(v0 + 192);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
  v2 = swift_dynamicCast();
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 56);
  if ((v2 & 1) != 0)
  {
    v5 = *(_QWORD *)(v0 + 192);
    v4 = *(_QWORD *)(v0 + 200);
    v6 = *(_QWORD *)(v0 + 184);
    v8 = *(_QWORD *)(v0 + 152);
    v7 = *(_QWORD *)(v0 + 160);
    v10 = *(_QWORD *)(v0 + 136);
    v9 = *(_QWORD *)(v0 + 144);
    v11 = *(void (**)(uint64_t))(v0 + 120);
    v3(v6, 0, 1, v10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v4, v6, v10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v7, v4, v10);
    swift_storeEnumTagMultiPayload();
    v11(v7);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v10);
  }
  else
  {
    v13 = *(_QWORD *)(v0 + 176);
    v12 = *(_QWORD *)(v0 + 184);
    v15 = *(uint64_t **)(v0 + 160);
    v14 = *(_QWORD *)(v0 + 168);
    v16 = *(_QWORD *)(v0 + 144);
    v17 = *(_QWORD *)(v0 + 152);
    v18 = *(void (**)(uint64_t *))(v0 + 120);
    v3(v12, 1, 1, *(_QWORD *)(v0 + 136));
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    v19 = swift_allocError();
    *v20 = 0;
    *v15 = v19;
    swift_storeEnumTagMultiPayload();
    v18(v15);
    (*(void (**)(uint64_t *, uint64_t))(v17 + 8))(v15, v16);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(_QWORD *);
  id v6;

  v1 = *(void **)(v0 + 216);
  v3 = *(_QWORD *)(v0 + 152);
  v2 = *(_QWORD **)(v0 + 160);
  v4 = *(_QWORD *)(v0 + 144);
  v5 = *(void (**)(_QWORD *))(v0 + 120);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  *v2 = v1;
  swift_storeEnumTagMultiPayload();
  v6 = v1;
  v5(v2);

  (*(void (**)(_QWORD *, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed URL?, @unowned Bool, @guaranteed Error?) -> ()(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void (*v11)(char *, uint64_t, void *);
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v16;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(void (**)(char *, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    v12 = type metadata accessor for URL();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 0, 1, v12);
  }
  else
  {
    v13 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  }
  swift_retain();
  v14 = a4;
  v11(v10, a3, a4);
  swift_release();

  return outlined destroy of DataRepresentation<AttributedString>((uint64_t)v10, &demangling cache variable for type metadata for URL?);
}

uint64_t closure #3 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)(uint64_t a1, void *a2, void (*a3)(uint64_t *), void (*a4)(uint64_t *), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  void (*v31)(uint64_t *);
  void *v32;
  uint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  void (*v35)(char *, char *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  void (**v47)(uint64_t *);
  void (*v48)(uint64_t *);
  void (*v49)(uint64_t, uint64_t);
  _BYTE *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(uint64_t *);
  void (*v69)(uint64_t *);

  v62 = a8;
  v63 = a5;
  v64 = a6;
  v65 = a1;
  v68 = a3;
  v69 = a4;
  v58 = a2;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v9);
  v67 = (uint64_t)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for ReceivedTransferredFile(0);
  v59 = *(_QWORD *)(v11 - 8);
  v12 = *(_QWORD *)(v59 + 64);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v60 = (uint64_t)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v66 = (uint64_t)&v54 - v14;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  v61 = a7;
  v15 = type metadata accessor for Result();
  v56 = *(_QWORD *)(v15 - 8);
  v57 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v17 = (uint64_t *)((char *)&v54 - v16);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for URL();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(_QWORD *)(v22 + 64);
  v24 = MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v54 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v54 - v27;
  MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v54 - v29;
  outlined init with copy of URL?(v65, (uint64_t)v20, &demangling cache variable for type metadata for URL?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21) == 1)
  {
    v31 = v68;
    outlined destroy of DataRepresentation<AttributedString>((uint64_t)v20, &demangling cache variable for type metadata for URL?);
    v32 = v58;
    if (v58)
    {
      v33 = (uint64_t)v58;
    }
    else
    {
      lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
      v33 = swift_allocError();
      *v51 = 0;
    }
    *v17 = v33;
    v52 = v57;
    swift_storeEnumTagMultiPayload();
    v53 = v32;
    v31(v17);
    return (*(uint64_t (**)(uint64_t *, uint64_t))(v56 + 8))(v17, v52);
  }
  else
  {
    v34 = *(void (**)(char *, char *, uint64_t))(v22 + 32);
    v55 = v30;
    v34(v30, v20, v21);
    static NSItemProvider.LoadingRequest.copyToCaches(_:)((uint64_t)v30, v28);
    v35 = *(void (**)(char *, char *, uint64_t))(v22 + 16);
    v35(v25, v28, v21);
    v36 = v66;
    ReceivedTransferredFile.init(file:isOriginalFile:)((uint64_t)v25, 0, v66);
    v37 = type metadata accessor for TaskPriority();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56))(v67, 1, 1, v37);
    v35(v25, v28, v21);
    v65 = (uint64_t)v28;
    v38 = v60;
    outlined init with copy of ResolvedTransferRepresentation(v36, v60, type metadata accessor for ReceivedTransferredFile);
    v39 = (*(unsigned __int8 *)(v22 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
    v40 = (v23 + v39 + 7) & 0xFFFFFFFFFFFFFFF8;
    v41 = (*(unsigned __int8 *)(v59 + 80) + v40 + 16) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80);
    v42 = (v12 + v41 + 7) & 0xFFFFFFFFFFFFFFF8;
    v43 = (char *)swift_allocObject();
    *((_QWORD *)v43 + 2) = 0;
    *((_QWORD *)v43 + 3) = 0;
    v44 = v62;
    *((_QWORD *)v43 + 4) = v61;
    *((_QWORD *)v43 + 5) = v44;
    v34(&v43[v39], v25, v21);
    v45 = &v43[v40];
    v46 = v64;
    *(_QWORD *)v45 = v63;
    *((_QWORD *)v45 + 1) = v46;
    outlined init with take of ResolvedTransferRepresentation(v38, (uint64_t)&v43[v41], type metadata accessor for ReceivedTransferredFile);
    v47 = (void (**)(uint64_t *))&v43[v42];
    v48 = v69;
    *v47 = v68;
    v47[1] = v48;
    swift_retain();
    swift_retain();
    _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(v67, (uint64_t)&async function pointer to partial apply for closure #1 in closure #3 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:), (uint64_t)v43);
    swift_release();
    outlined destroy of ResolvedTransferRepresentation(v66, type metadata accessor for ReceivedTransferredFile);
    v49 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
    v49(v65, v21);
    return ((uint64_t (*)(char *, uint64_t))v49)(v55, v21);
  }
}

uint64_t static NSItemProvider.LoadingRequest.copyToCaches(_:)@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int (*v41)(char *, uint64_t, uint64_t);
  id v42;
  uint64_t v43;
  void *v44;
  unsigned int v45;
  id v46;
  id v47;
  void *v48;
  unsigned int v49;
  char *v50;
  id v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  unsigned int v57;
  NSURL *v58;
  char *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  void (*v65)(char *, uint64_t);
  Swift::String v66;
  char *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  Swift::String v71;
  char *v72;
  char *v73;
  void (*v74)(uint64_t, char *, uint64_t);
  void *v75;
  void *v76;
  NSURL *v77;
  void *v78;
  void *v79;
  unsigned int v80;
  id v81;
  uint64_t v82;
  id v83;
  void *v84;
  uint64_t v85;
  id v86;
  id v87;
  NSObject *v88;
  os_log_type_t v89;
  uint8_t *v90;
  _QWORD *v91;
  id v92;
  void *v93;
  uint64_t v95;
  char *v96;
  char *v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  char *v103;
  char *v104;
  uint64_t v105;
  id v106;
  char *v107;
  uint64_t v108;
  id v109;
  uint64_t v110;
  uint64_t v111;

  v105 = a1;
  v103 = a2;
  v111 = *MEMORY[0x24BDAC8D0];
  v2 = type metadata accessor for UUID();
  v99 = *(_QWORD *)(v2 - 8);
  v100 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v98 = (char *)&v95 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v102 = type metadata accessor for URL.DirectoryHint();
  v4 = *(_QWORD *)(v102 - 8);
  MEMORY[0x24BDAC7A8](v102);
  v6 = (char *)&v95 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for URL();
  v108 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v97 = (char *)&v95 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v101 = (char *)&v95 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v96 = (char *)&v95 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v104 = (char *)&v95 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v95 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v95 - v19;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v95 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v22);
  v27 = (char *)&v95 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v107 = (char *)&v95 - v28;
  v29 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v109 = 0;
  v106 = v29;
  v30 = objc_msgSend(v29, sel_URLForDirectory_inDomain_appropriateForURL_create_error_, 13, 1, 0, 1, &v109);
  v31 = v109;
  if (v30)
  {
    v32 = v30;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    v33 = v31;

    v34 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v35 = objc_msgSend(v34, sel_bundleIdentifier);

    if (v35)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)();

    }
    v40 = (uint64_t)v107;
    URL.appendingPathComponent(_:)();
    swift_bridgeObjectRelease();
    v39 = v108;
    (*(void (**)(char *, uint64_t))(v108 + 8))(v20, v7);
    v38 = 0;
  }
  else
  {
    v36 = v109;
    v37 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    v38 = 1;
    v40 = (uint64_t)v107;
    v39 = v108;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v39 + 56))(v40, v38, 1, v7);
  outlined init with copy of URL?(v40, (uint64_t)v27, &demangling cache variable for type metadata for URL?);
  v41 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48);
  if (v41(v27, 1, v7) == 1)
  {
    outlined destroy of DataRepresentation<AttributedString>((uint64_t)v27, &demangling cache variable for type metadata for URL?);
    v42 = v106;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v18, v27, v7);
    v43 = URL.path.getter();
    v44 = (void *)MEMORY[0x20BD04D28](v43);
    swift_bridgeObjectRelease();
    v109 = 0;
    v42 = v106;
    v45 = objc_msgSend(v106, sel_createDirectoryAtPath_withIntermediateDirectories_attributes_error_, v44, 1, 0, &v109);

    if (v45)
    {
      v46 = v109;
    }
    else
    {
      v47 = v109;
      v48 = (void *)_convertNSErrorToError(_:)();

      swift_willThrow();
    }
    v39 = v108;
    (*(void (**)(char *, uint64_t))(v108 + 8))(v18, v7);
    v40 = (uint64_t)v107;
  }
  outlined init with copy of URL?(v40, (uint64_t)v24, &demangling cache variable for type metadata for URL?);
  v49 = v41(v24, 1, v7);
  v50 = v103;
  if (v49 == 1)
  {
    v51 = objc_msgSend(v42, sel_currentDirectoryPath);
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    v52 = v104;
    URL.init(fileURLWithPath:)();
    v40 = (uint64_t)v107;
    swift_bridgeObjectRelease();
    outlined destroy of DataRepresentation<AttributedString>((uint64_t)v24, &demangling cache variable for type metadata for URL?);
  }
  else
  {
    v52 = v104;
    (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v104, v24, v7);
  }
  v109 = (id)URL.lastPathComponent.getter();
  v110 = v53;
  v54 = v102;
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDCD7A0], v102);
  lazy protocol witness table accessor for type String and conformance String();
  URL.appending<A>(component:directoryHint:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v54);
  swift_bridgeObjectRelease();
  v55 = URL.path.getter();
  v56 = (void *)MEMORY[0x20BD04D28](v55);
  swift_bridgeObjectRelease();
  v57 = objc_msgSend(v42, sel_fileExistsAtPath_, v56);

  if (v57)
  {
    v59 = v96;
    URL.deletingPathExtension()();
    v60 = (void *)URL.lastPathComponent.getter();
    v62 = v61;
    v63 = v52;
    v64 = v108;
    v65 = *(void (**)(char *, uint64_t))(v108 + 8);
    v65(v59, v7);
    v109 = v60;
    v110 = v62;
    v66._countAndFlagsBits = 45;
    v66._object = (void *)0xE100000000000000;
    String.append(_:)(v66);
    v67 = v98;
    UUID.init()();
    v68 = UUID.uuidString.getter();
    v70 = v69;
    (*(void (**)(char *, uint64_t))(v99 + 8))(v67, v100);
    v71._countAndFlagsBits = v68;
    v71._object = v70;
    String.append(_:)(v71);
    swift_bridgeObjectRelease();
    v72 = v97;
    URL.appendingPathComponent(_:)();
    swift_bridgeObjectRelease();
    URL.pathExtension.getter();
    v73 = v101;
    URL.appendingPathExtension(_:)();
    swift_bridgeObjectRelease();
    v65(v72, v7);
    v65(v50, v7);
    v74 = *(void (**)(uint64_t, char *, uint64_t))(v64 + 32);
    v52 = v63;
    v42 = v106;
    v40 = (uint64_t)v107;
    v74((uint64_t)v50, v73, v7);
  }
  URL._bridgeToObjectiveC()(v58);
  v76 = v75;
  URL._bridgeToObjectiveC()(v77);
  v79 = v78;
  v109 = 0;
  v80 = objc_msgSend(v42, sel_copyItemAtURL_toURL_error_, v76, v78, &v109);

  if (v80)
  {
    v81 = v109;

    v82 = v108;
  }
  else
  {
    v83 = v109;
    v84 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    if (one-time initialization token for logger != -1)
      swift_once();
    v85 = type metadata accessor for Logger();
    __swift_project_value_buffer(v85, (uint64_t)logger);
    v86 = v84;
    v87 = v84;
    v88 = Logger.logObject.getter();
    v89 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v88, v89))
    {
      v90 = (uint8_t *)swift_slowAlloc();
      v91 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v90 = 138412290;
      v92 = v84;
      v93 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v109 = v93;
      v52 = v104;
      v40 = (uint64_t)v107;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *v91 = v93;

      _os_log_impl(&dword_20833C000, v88, v89, "Error copying file: %@", v90, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x20BD0552C](v91, -1, -1);
      MEMORY[0x20BD0552C](v90, -1, -1);

    }
    else
    {

    }
    v82 = v108;

  }
  (*(void (**)(char *, uint64_t))(v82 + 8))(v52, v7);
  return outlined destroy of DataRepresentation<AttributedString>(v40, &demangling cache variable for type metadata for URL?);
}

uint64_t closure #1 in closure #3 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v8[17] = v12;
  v8[18] = v13;
  v8[15] = a7;
  v8[16] = a8;
  v8[13] = a5;
  v8[14] = a6;
  v8[12] = a4;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  v9 = type metadata accessor for Result();
  v8[19] = v9;
  v8[20] = *(_QWORD *)(v9 - 8);
  v8[21] = swift_task_alloc();
  v10 = type metadata accessor for Optional();
  v8[22] = v10;
  v8[23] = *(_QWORD *)(v10 - 8);
  v8[24] = swift_task_alloc();
  v8[25] = *(_QWORD *)(v13 - 8);
  v8[26] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #1 in closure #3 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)()
{
  uint64_t *v0;
  uint64_t v1;
  int *v2;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t *, uint64_t *);

  v1 = v0[15];
  v2 = (int *)v0[13];
  v0[10] = type metadata accessor for ReceivedTransferredFile(0);
  v0[11] = (uint64_t)&protocol witness table for ReceivedTransferredFile;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v0 + 7);
  outlined init with copy of ResolvedTransferRepresentation(v1, (uint64_t)boxed_opaque_existential_1, type metadata accessor for ReceivedTransferredFile);
  v6 = (uint64_t (*)(uint64_t *, uint64_t *))((char *)v2 + *v2);
  v4 = (_QWORD *)swift_task_alloc();
  v0[27] = (uint64_t)v4;
  *v4 = v0;
  v4[1] = closure #1 in closure #3 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:);
  return v6(v0 + 2, v0 + 7);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 224) = v0;
  swift_task_dealloc();
  if (!v0)
    __swift_destroy_boxed_opaque_existential_1(v2 + 56);
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  char v2;
  void (*v3)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t *);
  uint64_t v19;
  _BYTE *v20;

  v1 = *(_QWORD *)(v0 + 200);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
  v2 = swift_dynamicCast();
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 56);
  if ((v2 & 1) != 0)
  {
    v5 = *(_QWORD *)(v0 + 200);
    v4 = *(_QWORD *)(v0 + 208);
    v6 = *(_QWORD *)(v0 + 192);
    v8 = *(_QWORD *)(v0 + 160);
    v7 = *(_QWORD *)(v0 + 168);
    v10 = *(_QWORD *)(v0 + 144);
    v9 = *(_QWORD *)(v0 + 152);
    v11 = *(void (**)(uint64_t))(v0 + 128);
    v3(v6, 0, 1, v10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v4, v6, v10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v7, v4, v10);
    swift_storeEnumTagMultiPayload();
    v11(v7);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v10);
  }
  else
  {
    v13 = *(_QWORD *)(v0 + 184);
    v12 = *(_QWORD *)(v0 + 192);
    v15 = *(uint64_t **)(v0 + 168);
    v14 = *(_QWORD *)(v0 + 176);
    v16 = *(_QWORD *)(v0 + 152);
    v17 = *(_QWORD *)(v0 + 160);
    v18 = *(void (**)(uint64_t *))(v0 + 128);
    v3(v12, 1, 1, *(_QWORD *)(v0 + 144));
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    v19 = swift_allocError();
    *v20 = 0;
    *v15 = v19;
    swift_storeEnumTagMultiPayload();
    v18(v15);
    (*(void (**)(uint64_t *, uint64_t))(v17 + 8))(v15, v16);
  }
  $defer #1 <A>() in closure #1 in closure #3 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(_QWORD *);
  id v6;

  v1 = *(void **)(v0 + 224);
  v3 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD **)(v0 + 168);
  v4 = *(_QWORD *)(v0 + 152);
  v5 = *(void (**)(_QWORD *))(v0 + 128);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  *v2 = v1;
  swift_storeEnumTagMultiPayload();
  v6 = v1;
  v5(v2);

  (*(void (**)(_QWORD *, uint64_t))(v3 + 8))(v2, v4);
  $defer #1 <A>() in closure #1 in closure #3 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void $defer #1 <A>() in closure #1 in closure #3 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)()
{
  id v0;
  NSURL *v1;
  void *v2;
  void *v3;
  unsigned int v4;
  id v5;
  id v6;
  void *v7;
  id v8[2];

  v8[1] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  URL._bridgeToObjectiveC()(v1);
  v3 = v2;
  v8[0] = 0;
  v4 = objc_msgSend(v0, sel_removeItemAtURL_error_, v2, v8);

  if (v4)
  {
    v5 = v8[0];
  }
  else
  {
    v6 = v8[0];
    v7 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
  }
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed URL?, @guaranteed Error?) -> ()(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void (*v9)(char *, void *);
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(void (**)(char *, void *))(a1 + 32);
  if (a2)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    v10 = type metadata accessor for URL();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 0, 1, v10);
  }
  else
  {
    v11 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  }
  swift_retain();
  v12 = a3;
  v9(v8, a3);
  swift_release();

  return outlined destroy of DataRepresentation<AttributedString>((uint64_t)v8, &demangling cache variable for type metadata for URL?);
}

uint64_t static NSItemProvider.Loader.loadData<A>(exporting:transferable:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[24] = a6;
  v7[25] = a7;
  v7[22] = a4;
  v7[23] = a5;
  v7[20] = a2;
  v7[21] = a3;
  v7[19] = a1;
  return swift_task_switch();
}

uint64_t static NSItemProvider.Loader.loadData<A>(exporting:transferable:completionHandler:)()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v4;
  __int128 v6;

  v1 = *(int **)(v0 + 152);
  if (!v1)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v2 = *(_QWORD *)(v0 + 168);
  v6 = *(_OWORD *)(v0 + 192);
  *(_OWORD *)(v0 + 80) = v6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
  (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(boxed_opaque_existential_1, v2);
  *(_QWORD *)&v6 = (char *)v1 + *v1;
  swift_retain();
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 208) = v4;
  *v4 = v0;
  v4[1] = static NSItemProvider.Loader.loadData<A>(exporting:transferable:completionHandler:);
  return ((uint64_t (*)(uint64_t, uint64_t))v6)(v0 + 16, v0 + 56);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 216) = v0;
  swift_task_dealloc();
  if (!v0)
    __swift_destroy_boxed_opaque_existential_1(v2 + 56);
  return swift_task_switch();
}

{
  uint64_t v0;
  void (*v1)(uint64_t, unint64_t, _QWORD);
  uint64_t v2;
  int v3;
  uint64_t v4;
  unint64_t v5;

  v1 = *(void (**)(uint64_t, unint64_t, _QWORD))(v0 + 176);
  v2 = *(_QWORD *)(v0 + 152);
  outlined init with copy of Transferable(v0 + 16, v0 + 96);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TransferableCurrency);
  v3 = swift_dynamicCast();
  if (v3)
    v4 = *(_QWORD *)(v0 + 136);
  else
    v4 = 0;
  if (v3)
    v5 = *(_QWORD *)(v0 + 144);
  else
    v5 = 0xF000000000000000;
  v1(v4, v5, 0);
  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(v2);
  outlined consume of Data?(v4, v5);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  void *v1;
  void (*v2)(_QWORD, unint64_t, void *);
  uint64_t v3;
  id v4;

  v1 = *(void **)(v0 + 216);
  v2 = *(void (**)(_QWORD, unint64_t, void *))(v0 + 176);
  v3 = *(_QWORD *)(v0 + 152);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  v4 = v1;
  v2(0, 0xF000000000000000, v1);
  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(v3);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t static NSItemProvider.Loader.loadFile<A>(exporting:transferable:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[22] = a6;
  v7[23] = a7;
  v7[20] = a4;
  v7[21] = a5;
  v7[18] = a2;
  v7[19] = a3;
  v7[17] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SentTransferredFile?);
  v7[24] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  v7[25] = swift_task_alloc();
  v7[26] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t static NSItemProvider.Loader.loadFile<A>(exporting:transferable:completionHandler:)()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v4;
  __int128 v6;

  v1 = *(int **)(v0 + 136);
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 152);
    v6 = *(_OWORD *)(v0 + 176);
    *(_OWORD *)(v0 + 80) = v6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
    (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(boxed_opaque_existential_1, v2);
    *(_QWORD *)&v6 = (char *)v1 + *v1;
    swift_retain();
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v4;
    *v4 = v0;
    v4[1] = static NSItemProvider.Loader.loadFile<A>(exporting:transferable:completionHandler:);
    return ((uint64_t (*)(uint64_t, uint64_t))v6)(v0 + 16, v0 + 56);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 224) = v0;
  swift_task_dealloc();
  if (!v0)
    __swift_destroy_boxed_opaque_existential_1(v2 + 56);
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  int v2;
  void (*v3)(_QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  outlined init with copy of Transferable(v0 + 16, v0 + 96);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TransferableCurrency);
  v1 = type metadata accessor for SentTransferredFile(0);
  v2 = swift_dynamicCast();
  v3 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 56);
  v4 = *(_QWORD *)(v0 + 208);
  v5 = *(_QWORD *)(v0 + 192);
  if (v2)
  {
    v3(*(_QWORD *)(v0 + 192), 0, 1, v1);
    v6 = type metadata accessor for URL();
    v7 = *(_QWORD *)(v6 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v4, v5, v6);
    outlined destroy of ResolvedTransferRepresentation(v5, type metadata accessor for SentTransferredFile);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v7 + 56))(v4, 0, 1, v6);
  }
  else
  {
    v3(*(_QWORD *)(v0 + 192), 1, 1, v1);
    outlined destroy of DataRepresentation<AttributedString>(v5, &demangling cache variable for type metadata for SentTransferredFile?);
    v8 = type metadata accessor for URL();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v4, 1, 1, v8);
  }
  v9 = *(_QWORD *)(v0 + 208);
  v10 = *(_QWORD *)(v0 + 136);
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v0 + 160))(v9, 1, 0);
  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(v10);
  outlined destroy of DataRepresentation<AttributedString>(v9, &demangling cache variable for type metadata for URL?);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, void *);
  uint64_t v4;
  uint64_t v5;
  id v6;

  v1 = *(void **)(v0 + 224);
  v2 = *(_QWORD *)(v0 + 200);
  v3 = *(void (**)(uint64_t, uint64_t, void *))(v0 + 160);
  v4 = *(_QWORD *)(v0 + 136);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  v5 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v2, 1, 1, v5);
  v6 = v1;
  v3(v2, 1, v1);
  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(v4);

  outlined destroy of DataRepresentation<AttributedString>(v2, &demangling cache variable for type metadata for URL?);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t static NSItemProvider.Loader.shouldExport<A>(condition:item:)(uint64_t (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *boxed_opaque_existential_1;
  char v9;
  uint64_t v11[5];

  if (a1)
  {
    v11[3] = a4;
    v11[4] = a5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v11);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 16))(boxed_opaque_existential_1, a3, a4);
    swift_retain();
    v9 = a1(v11);
    _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe((uint64_t)a1);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  }
  else
  {
    v9 = 1;
  }
  return v9 & 1;
}

id NSItemProvider.init<A>(transferable:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8;
  _QWORD *v9;
  id v10;

  v8 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = a1;
  v9[5] = a2;
  v10 = v8;
  swift_retain();
  NSItemProvider.register<A>(_:)((void (*)(void))partial apply for implicit closure #1 in NSItemProvider.init<A>(transferable:), (uint64_t)v9, a3, a4);
  swift_release();

  swift_release();
  return v10;
}

uint64_t sub_20835DBC0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in NSItemProvider.init<A>(transferable:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t NSItemProvider.register<A>(_:)(void (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  int *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t AssociatedTypeWitness;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  void (*v40)(char *, char *, uint64_t);
  uint64_t v41;
  void (*v42)(__int128 *__return_ptr, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  void *v66;
  uint64_t v67;
  char v68;
  void (*v69)(char *, char *, uint64_t);
  char *v70;
  uint64_t *boxed_opaque_existential_1;
  uint64_t (*v72)(_BYTE *);
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t (*v81)(uint64_t *);
  uint64_t v82;
  char v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  unint64_t v90;
  char *v91;
  uint64_t v92;
  char *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  unint64_t v100;
  char *v101;
  uint64_t v102;
  char *v103;
  void *v104;
  void *v105;
  const void *v106;
  uint64_t v108;
  char *v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void (*v114)(void);
  char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  void *DynamicType;
  uint64_t v125;
  int *v126;
  char *v127;
  uint64_t v128;
  id v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t (*v132)(uint64_t, uint64_t);
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char v137;
  __int128 aBlock;
  __int128 v139;
  uint64_t (*v140)(uint64_t, uint64_t);
  char *v141;

  v113 = a2;
  v114 = a1;
  v130 = *(_QWORD *)(a3 - 8);
  v6 = MEMORY[0x24BDAC7A8](a1);
  v127 = (char *)&v108 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v128 = v7;
  MEMORY[0x24BDAC7A8](v6);
  v133 = (uint64_t)&v108 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ResolvedTransferRepresentation?);
  MEMORY[0x24BDAC7A8](v9);
  v112 = (uint64_t)&v108 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v117 = type metadata accessor for Optional();
  v116 = *(_QWORD *)(v117 - 8);
  v11 = MEMORY[0x24BDAC7A8](v117);
  v115 = (char *)&v108 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v109 = (char *)&v108 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v110 = (char *)&v108 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v123 = (char *)&v108 - v17;
  v18 = (int *)type metadata accessor for ResolvedTransferRepresentation();
  v119 = *((_QWORD *)v18 - 1);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v108 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)&v108 - v23;
  v25 = MEMORY[0x24BDAC7A8](v22);
  v111 = (uint64_t)&v108 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v28 = (char *)&v108 - v27;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v134 = type metadata accessor for _TransferRepresentationValue(0, AssociatedTypeWitness, v30, v31);
  v126 = *(int **)(v134 - 8);
  v32 = MEMORY[0x24BDAC7A8](v134);
  v125 = (uint64_t)&v108 - v33;
  v34 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v35 = MEMORY[0x24BDAC7A8](v32);
  v37 = (char *)&v108 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v35);
  v39 = (char *)&v108 - v38;
  (*(void (**)(uint64_t, uint64_t))(a4 + 24))(a3, a4);
  DynamicType = (void *)swift_getDynamicType();
  v121 = v34;
  v40 = *(void (**)(char *, char *, uint64_t))(v34 + 16);
  v120 = v39;
  v40(v37, v39, AssociatedTypeWitness);
  v41 = v125;
  _TransferRepresentationValue.init(_:)((uint64_t)v37, AssociatedTypeWitness, v125);
  _TransferRepresentationInputs.init()();
  v131 = a3;
  v132 = (uint64_t (*)(uint64_t, uint64_t))a4;
  v42 = *(void (**)(__int128 *__return_ptr, uint64_t))(swift_getAssociatedConformanceWitness() + 48);
  v122 = AssociatedTypeWitness;
  v42(&aBlock, v41);
  (*((void (**)(uint64_t, uint64_t))v126 + 1))(v41, v134);
  v43 = *(_QWORD *)(aBlock + 16);
  if (!v43)
  {
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v121 + 8))(v120, v122);
  }
  v44 = aBlock + ((*(unsigned __int8 *)(v119 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v119 + 80));
  v134 = *(_QWORD *)(v119 + 72);
  v118 = aBlock;
  swift_bridgeObjectRetain();
  v45 = v44;
  v46 = v43;
  do
  {
    outlined init with copy of ResolvedTransferRepresentation(v45, (uint64_t)v28, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    v47 = *(_QWORD *)&v28[v18[8]];
    outlined destroy of ResolvedTransferRepresentation((uint64_t)v28, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    if (v47)
    {
      swift_bridgeObjectRelease();
      v48 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v130 + 56);
      v48(v123, 1, 1, v131);
      swift_bridgeObjectRetain();
      v49 = v44;
      v50 = v43;
      while (1)
      {
        outlined init with copy of ResolvedTransferRepresentation(v49, (uint64_t)v24, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
        if (v24[16] != 255)
          break;
        outlined destroy of ResolvedTransferRepresentation((uint64_t)v24, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
        v49 += v134;
        if (!--v50)
        {
          v51 = 1;
          v52 = v115;
          v53 = v112;
          goto LABEL_12;
        }
      }
      v53 = v112;
      outlined init with take of ResolvedTransferRepresentation((uint64_t)v24, v112, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
      v51 = 0;
      v52 = v115;
LABEL_12:
      v54 = v119;
      (*(void (**)(uint64_t, uint64_t, uint64_t, int *))(v119 + 56))(v53, v51, 1, v18);
      swift_bridgeObjectRelease();
      v55 = (*(uint64_t (**)(uint64_t, uint64_t, int *))(v54 + 48))(v53, 1, v18);
      v126 = v18;
      if (v55 == 1)
      {
        outlined destroy of DataRepresentation<AttributedString>(v53, &demangling cache variable for type metadata for ResolvedTransferRepresentation?);
        v57 = v130;
        v56 = v131;
      }
      else
      {
        v58 = v111;
        v59 = outlined init with take of ResolvedTransferRepresentation(v53, v111, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
        v60 = v110;
        ((void (*)(uint64_t))v114)(v59);
        v61 = v116;
        v62 = v123;
        v63 = v117;
        v125 = *(_QWORD *)(v116 + 8);
        ((void (*)(char *, uint64_t))v125)(v123, v117);
        v64 = v131;
        v48(v60, 0, 1, v131);
        (*(void (**)(char *, char *, uint64_t))(v61 + 32))(v62, v60, v63);
        v65 = *(unsigned __int8 *)(v58 + 16);
        if (v65 == 255)
        {
          v66 = 0;
          v56 = v64;
          v18 = v126;
          v52 = v115;
          v57 = v130;
        }
        else
        {
          v67 = *(_QWORD *)(v58 + 8);
          DynamicType = *(void **)v58;
          v135 = (uint64_t)DynamicType;
          v136 = v67;
          v68 = v65 & 1;
          v137 = v65 & 1;
          v69 = *(void (**)(char *, char *, uint64_t))(v61 + 16);
          v70 = v109;
          v69(v109, v62, v63);
          v57 = v130;
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v130 + 48))(v70, 1, v64) == 1)
          {
            outlined copy of _FileNamedTransferRepresentation<A>.Storage<A>((uint64_t)DynamicType, v67, v68);
            ((void (*)(char *, uint64_t))v125)(v70, v63);
            v140 = 0;
            aBlock = 0u;
            v139 = 0u;
          }
          else
          {
            *((_QWORD *)&v139 + 1) = v64;
            v140 = v132;
            boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&aBlock);
            (*(void (**)(uint64_t *, char *, uint64_t))(v57 + 32))(boxed_opaque_existential_1, v70, v64);
            outlined copy of _FileNamedTransferRepresentation<A>.Storage<A>((uint64_t)DynamicType, v67, v68);
          }
          v56 = v64;
          v18 = v126;
          v52 = v115;
          v58 = v111;
          v72 = ResolvedTransferRepresentation.SuggestedFileNameStorage.resolved(_:)((uint64_t)&aBlock);
          v74 = v73;
          outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(v135, v136, v137);
          outlined destroy of DataRepresentation<AttributedString>((uint64_t)&aBlock, &demangling cache variable for type metadata for Transferable?);
          if (v74)
          {
            v66 = (void *)MEMORY[0x20BD04D28](v72, v74);
            swift_bridgeObjectRelease();
          }
          else
          {
            v66 = 0;
          }
        }
        objc_msgSend(v129, sel_setSuggestedName_, v66);

        outlined destroy of ResolvedTransferRepresentation(v58, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
      }
      v75 = v117;
      v76 = v116;
      (*(void (**)(char *, char *, uint64_t))(v116 + 16))(v52, v123, v117);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v57 + 48))(v52, 1, v56) == 1)
      {
        v114();
        (*(void (**)(char *, uint64_t))(v76 + 8))(v52, v75);
      }
      else
      {
        (*(void (**)(uint64_t, char *, uint64_t))(v57 + 32))(v133, v52, v56);
      }
      while (1)
      {
        outlined init with copy of ResolvedTransferRepresentation(v44, (uint64_t)v21, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
        v77 = (uint64_t *)&v21[v18[8]];
        v78 = *v77;
        if (!*v77)
          break;
        v79 = v77[1];
        v80 = &v21[v18[10]];
        v81 = *(uint64_t (**)(uint64_t *))v80;
        v82 = *((_QWORD *)v80 + 1);
        outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v78);
        outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?((uint64_t)v81);
        v83 = static NSItemProvider.Loader.shouldExport<A>(condition:item:)(v81, v82, v133, v56, (uint64_t)v132);
        _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe((uint64_t)v81);
        if ((v83 & 1) != 0)
        {
          v84 = *(_QWORD *)&v21[v18[7]];
          if (v84 == MEMORY[0x24BDCDDE8])
          {
            v86 = UTType.identifier.getter();
            v125 = MEMORY[0x20BD04D28](v86);
            swift_bridgeObjectRelease();
            *(_QWORD *)&aBlock = *(_QWORD *)&v21[v18[11]];
            DynamicType = (void *)TransferRepresentationVisibility.itemProviderVisibility.getter();
            v88 = v130;
            v87 = v131;
            v89 = v127;
            (*(void (**)(char *, uint64_t, uint64_t))(v130 + 16))(v127, v133, v131);
            v90 = (*(unsigned __int8 *)(v88 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v88 + 80);
            v91 = (char *)swift_allocObject();
            v92 = (uint64_t)v132;
            *((_QWORD *)v91 + 2) = v87;
            *((_QWORD *)v91 + 3) = v92;
            *((_QWORD *)v91 + 4) = v78;
            *((_QWORD *)v91 + 5) = v79;
            v93 = v89;
            v18 = v126;
            (*(void (**)(char *, char *, uint64_t))(v88 + 32))(&v91[v90], v93, v87);
            v140 = partial apply for closure #3 in NSItemProvider.register<A>(_:);
            v141 = v91;
            *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
            *((_QWORD *)&aBlock + 1) = 1107296256;
            *(_QWORD *)&v139 = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed @Sendable (@guaranteed Data?, @guaranteed Error?) -> ()) -> (@owned NSProgress?);
            *((_QWORD *)&v139 + 1) = &block_descriptor_15;
            v94 = _Block_copy(&aBlock);
            swift_retain();
            v56 = v87;
            swift_release();
            v95 = (void *)v125;
            objc_msgSend(v129, sel_registerDataRepresentationForTypeIdentifier_visibility_loadHandler_, v125, DynamicType, v94);
            _Block_release(v94);

            goto LABEL_37;
          }
          if (v84 == type metadata accessor for SentTransferredFile(0))
          {
            v125 = v21[v18[6]] & 1;
            v96 = UTType.identifier.getter();
            DynamicType = (void *)MEMORY[0x20BD04D28](v96);
            swift_bridgeObjectRelease();
            *(_QWORD *)&aBlock = *(_QWORD *)&v21[v18[11]];
            v119 = TransferRepresentationVisibility.itemProviderVisibility.getter();
            v98 = v130;
            v97 = v131;
            v99 = v127;
            (*(void (**)(char *, uint64_t, uint64_t))(v130 + 16))(v127, v133, v131);
            v100 = (*(unsigned __int8 *)(v98 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v98 + 80);
            v101 = (char *)swift_allocObject();
            v102 = (uint64_t)v132;
            *((_QWORD *)v101 + 2) = v97;
            *((_QWORD *)v101 + 3) = v102;
            *((_QWORD *)v101 + 4) = v78;
            *((_QWORD *)v101 + 5) = v79;
            v103 = v99;
            v18 = v126;
            (*(void (**)(char *, char *, uint64_t))(v98 + 32))(&v101[v100], v103, v97);
            v140 = partial apply for closure #4 in NSItemProvider.register<A>(_:);
            v141 = v101;
            *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
            *((_QWORD *)&aBlock + 1) = 1107296256;
            *(_QWORD *)&v139 = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed @Sendable (@in_guaranteed URL?, @unowned Bool, @guaranteed Error?) -> ()) -> (@owned NSProgress?);
            *((_QWORD *)&v139 + 1) = &block_descriptor_1;
            v104 = _Block_copy(&aBlock);
            swift_retain();
            swift_release();
            v105 = DynamicType;
            objc_msgSend(v129, sel_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler_, DynamicType, v125, v119, v104);
            v106 = v104;
            v56 = v97;
            _Block_release(v106);

LABEL_37:
            _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(v78);
            v85 = (uint64_t)v21;
LABEL_38:
            outlined destroy of ResolvedTransferRepresentation(v85, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
            goto LABEL_28;
          }
          outlined destroy of ResolvedTransferRepresentation((uint64_t)v21, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
          _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(v78);
          v56 = v131;
        }
        else
        {
          outlined destroy of ResolvedTransferRepresentation((uint64_t)v21, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
          _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(v78);
        }
LABEL_28:
        v44 += v134;
        if (!--v43)
        {
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v130 + 8))(v133, v56);
          (*(void (**)(char *, uint64_t))(v116 + 8))(v123, v117);
          return (*(uint64_t (**)(char *, uint64_t))(v121 + 8))(v120, v122);
        }
      }
      v85 = (uint64_t)v21;
      goto LABEL_38;
    }
    v45 += v134;
    --v46;
  }
  while (v46);
  swift_bridgeObjectRelease_n();
  return (*(uint64_t (**)(char *, uint64_t))(v121 + 8))(v120, v122);
}

uint64_t TransferRepresentationVisibility.itemProviderVisibility.getter()
{
  uint64_t result;
  Swift::String v1;

  TransferRepresentationVisibility.all.unsafeMutableAddressor();
  lazy protocol witness table accessor for type TransferRepresentationVisibility and conformance TransferRepresentationVisibility();
  if ((dispatch thunk of static Equatable.== infix(_:_:)() & 1) != 0)
    return 0;
  TransferRepresentationVisibility.ownProcess.unsafeMutableAddressor();
  if ((dispatch thunk of static Equatable.== infix(_:_:)() & 1) != 0)
    return 3;
  TransferRepresentationVisibility.team.unsafeMutableAddressor();
  if ((dispatch thunk of static Equatable.== infix(_:_:)() & 1) != 0)
    return 1;
  _StringGuts.grow(_:)(17);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t closure #3 in NSItemProvider.register<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v23;
  uint64_t v24;

  v23 = a7;
  v24 = a1;
  v12 = *(_QWORD *)(a6 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v16, 1, 1, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a5, a6);
  v18 = (*(unsigned __int8 *)(v12 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v19 = (char *)swift_allocObject();
  *((_QWORD *)v19 + 2) = 0;
  *((_QWORD *)v19 + 3) = 0;
  v20 = v23;
  *((_QWORD *)v19 + 4) = a6;
  *((_QWORD *)v19 + 5) = v20;
  *((_QWORD *)v19 + 6) = a3;
  *((_QWORD *)v19 + 7) = a4;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v19[v18], (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a6);
  v21 = &v19[(v13 + v18 + 7) & 0xFFFFFFFFFFFFFFF8];
  *(_QWORD *)v21 = v24;
  *((_QWORD *)v21 + 1) = a2;
  swift_retain();
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v16, (uint64_t)&async function pointer to partial apply for closure #1 in closure #3 in NSItemProvider.register<A>(_:), (uint64_t)v19);
  return swift_release();
}

uint64_t closure #1 in closure #3 in NSItemProvider.register<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v14;
  uint64_t v16;
  uint64_t v17;

  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v14;
  *v14 = v8;
  v14[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  v14[24] = v16;
  v14[25] = v17;
  v14[22] = a7;
  v14[23] = a8;
  v14[20] = a5;
  v14[21] = a6;
  v14[19] = a4;
  return swift_task_switch();
}

id thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed @Sendable (@guaranteed Data?, @guaranteed Error?) -> ()) -> (@owned NSProgress?)(uint64_t a1, void *a2)
{
  return thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed @Sendable (@guaranteed Data?, @guaranteed Error?) -> ()) -> (@owned NSProgress?)(a1, a2, (uint64_t)&unk_24C097CA8, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSData?, @unowned NSError?) -> ());
}

void thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSData?, @unowned NSError?) -> ()(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  Class isa;
  uint64_t v7;
  id v8;

  if (a2 >> 60 != 15)
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    if (a3)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  isa = 0;
  if (!a3)
    goto LABEL_5;
LABEL_3:
  v7 = _convertErrorToNSError(_:)();
LABEL_6:
  v8 = (id)v7;
  (*(void (**)(uint64_t, Class))(a4 + 16))(a4, isa);

}

uint64_t closure #4 in NSItemProvider.register<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v25;
  uint64_t v26;

  v25 = a7;
  v26 = a1;
  v12 = *(_QWORD *)(a6 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  static TaskPriority.userInitiated.getter();
  v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 0, 1, v18);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a5, a6);
  v19 = (*(unsigned __int8 *)(v12 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v20 = (v13 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  v21 = (char *)swift_allocObject();
  *((_QWORD *)v21 + 2) = 0;
  *((_QWORD *)v21 + 3) = 0;
  v22 = v25;
  *((_QWORD *)v21 + 4) = a6;
  *((_QWORD *)v21 + 5) = v22;
  *((_QWORD *)v21 + 6) = a3;
  *((_QWORD *)v21 + 7) = a4;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v21[v19], v14, a6);
  v23 = &v21[v20];
  *(_QWORD *)v23 = v26;
  *((_QWORD *)v23 + 1) = a2;
  swift_retain();
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v17, (uint64_t)&async function pointer to partial apply for closure #1 in closure #4 in NSItemProvider.register<A>(_:), (uint64_t)v21);
  return swift_release();
}

uint64_t closure #1 in closure #4 in NSItemProvider.register<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v14;
  uint64_t v16;
  uint64_t v17;

  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v14;
  *v14 = v8;
  v14[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return static NSItemProvider.Loader.loadFile<A>(exporting:transferable:completionHandler:)(a4, a5, a6, a7, a8, v16, v17);
}

id thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed @Sendable (@in_guaranteed URL?, @unowned Bool, @guaranteed Error?) -> ()) -> (@owned NSProgress?)(uint64_t a1, void *a2)
{
  return thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed @Sendable (@guaranteed Data?, @guaranteed Error?) -> ()) -> (@owned NSProgress?)(a1, a2, (uint64_t)&unk_24C097CF8, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSURL?, @unowned Bool, @unowned NSError?) -> ());
}

id thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed @Sendable (@guaranteed Data?, @guaranteed Error?) -> ()) -> (@owned NSProgress?)(uint64_t a1, void *aBlock, uint64_t a3, uint64_t a4)
{
  uint64_t (*v5)(uint64_t, uint64_t);
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  v6 = _Block_copy(aBlock);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  swift_retain();
  v8 = (void *)v5(a4, v7);
  swift_release();
  swift_release();
  return v8;
}

void thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSURL?, @unowned Bool, @unowned NSError?) -> ()(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  NSURL *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of URL?(a1, (uint64_t)v10, &demangling cache variable for type metadata for URL?);
  v11 = type metadata accessor for URL();
  v12 = *(_QWORD *)(v11 - 8);
  v14 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) != 1)
  {
    URL._bridgeToObjectiveC()(v13);
    v14 = v15;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
  }
  if (a3)
    v16 = (void *)_convertErrorToNSError(_:)();
  else
    v16 = 0;
  (*(void (**)(uint64_t, void *, _QWORD, void *))(a4 + 16))(a4, v14, a2 & 1, v16);

}

uint64_t NSItemProvider.registerTransferable<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5[22] = a4;
  v5[23] = v4;
  v5[20] = a2;
  v5[21] = a3;
  v5[19] = a1;
  v6 = *(_QWORD *)(a3 - 8);
  v5[24] = v6;
  v5[25] = *(_QWORD *)(v6 + 64);
  v5[26] = swift_task_alloc();
  v5[27] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ResolvedTransferRepresentation?);
  v5[28] = swift_task_alloc();
  v7 = type metadata accessor for Optional();
  v5[29] = v7;
  v5[30] = *(_QWORD *)(v7 - 8);
  v5[31] = swift_task_alloc();
  v5[32] = swift_task_alloc();
  v5[33] = swift_task_alloc();
  v5[34] = swift_task_alloc();
  v8 = type metadata accessor for ResolvedTransferRepresentation();
  v5[35] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v5[36] = v9;
  v5[37] = *(_QWORD *)(v9 + 64);
  v5[38] = swift_task_alloc();
  v5[39] = swift_task_alloc();
  v5[40] = swift_task_alloc();
  v5[41] = swift_task_alloc();
  v5[42] = swift_task_alloc();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5[43] = AssociatedTypeWitness;
  v13 = type metadata accessor for _TransferRepresentationValue(0, AssociatedTypeWitness, v11, v12);
  v5[44] = v13;
  v5[45] = *(_QWORD *)(v13 - 8);
  v5[46] = swift_task_alloc();
  v5[47] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v5[48] = swift_task_alloc();
  v5[49] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t NSItemProvider.registerTransferable<A>(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedConformanceWitness;
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
  void (*v21)(uint64_t, uint64_t, uint64_t, uint64_t);
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
  void (*v34)(uint64_t);
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  int v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *boxed_opaque_existential_1;
  char v54;
  uint64_t (*v55)(_BYTE *);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t (*v66)();
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t (*v71)();
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t *);
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  void *v111;
  unint64_t v112;
  uint64_t v113;
  __int128 v114;
  __int128 v115;
  void (*v116)(uint64_t, uint64_t, uint64_t, uint64_t);
  __int128 v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  char v126;

  v2 = *(_QWORD *)(v0 + 384);
  v1 = *(_QWORD *)(v0 + 392);
  v3 = *(_QWORD *)(v0 + 368);
  v4 = *(_QWORD *)(v0 + 376);
  v5 = *(_QWORD *)(v0 + 360);
  v122 = *(_QWORD *)(v0 + 352);
  v6 = *(_QWORD *)(v0 + 344);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 176) + 24))(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 176));
  swift_getDynamicType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1, v6);
  _TransferRepresentationValue.init(_:)(v2, v6, v3);
  _TransferRepresentationInputs.init()();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(AssociatedConformanceWitness + 48))(&v124, v3);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v122);
  v8 = v124;
  v9 = *(_QWORD *)(v124 + 16);
  if (!v9)
  {
    swift_bridgeObjectRelease();
    goto LABEL_39;
  }
  v120 = (uint64_t *)(v0 + 112);
  v11 = *(_QWORD *)(v0 + 280);
  v10 = *(_QWORD *)(v0 + 288);
  v112 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v12 = v124 + v112;
  v123 = *(_QWORD *)(v10 + 72);
  swift_bridgeObjectRetain();
  v13 = v8 + v112;
  v14 = v9;
  do
  {
    v15 = *(_QWORD *)(v0 + 336);
    outlined init with copy of ResolvedTransferRepresentation(v13, v15, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    v16 = *(_QWORD *)(v15 + *(int *)(v11 + 32));
    outlined destroy of ResolvedTransferRepresentation(v15, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    if (v16)
    {
      v17 = *(_QWORD *)(v0 + 320);
      v18 = *(_QWORD *)(v0 + 272);
      v19 = *(_QWORD *)(v0 + 192);
      v20 = *(_QWORD *)(v0 + 168);
      swift_bridgeObjectRelease();
      v21 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56);
      v21(v18, 1, 1, v20);
      swift_bridgeObjectRetain();
      v22 = v12;
      v23 = v9;
      while (1)
      {
        outlined init with copy of ResolvedTransferRepresentation(v22, *(_QWORD *)(v0 + 320), (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
        v24 = *(_QWORD *)(v0 + 320);
        if (*(unsigned __int8 *)(v17 + 16) != 255)
          break;
        outlined destroy of ResolvedTransferRepresentation(v24, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
        v22 += v123;
        if (!--v23)
        {
          v25 = 1;
          goto LABEL_12;
        }
      }
      outlined init with take of ResolvedTransferRepresentation(v24, *(_QWORD *)(v0 + 224), (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
      v25 = 0;
LABEL_12:
      v26 = *(_QWORD *)(v0 + 280);
      v27 = *(_QWORD *)(v0 + 288);
      v28 = *(_QWORD *)(v0 + 224);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 56))(v28, v25, 1, v26);
      swift_bridgeObjectRelease();
      v119 = v11;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v27 + 48))(v28, 1, v26) == 1)
      {
        outlined destroy of DataRepresentation<AttributedString>(*(_QWORD *)(v0 + 224), &demangling cache variable for type metadata for ResolvedTransferRepresentation?);
      }
      else
      {
        v29 = *(_QWORD *)(v0 + 328);
        v31 = *(_QWORD *)(v0 + 264);
        v30 = *(_QWORD *)(v0 + 272);
        v116 = v21;
        v33 = *(_QWORD *)(v0 + 232);
        v32 = *(_QWORD *)(v0 + 240);
        v113 = *(_QWORD *)(v0 + 168);
        v34 = *(void (**)(uint64_t))(v0 + 152);
        v35 = outlined init with take of ResolvedTransferRepresentation(*(_QWORD *)(v0 + 224), v29, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
        v34(v35);
        v36 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
        v36(v30, v33);
        v116(v31, 0, 1, v113);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 32))(v30, v31, v33);
        v37 = *(unsigned __int8 *)(v29 + 16);
        if (v37 == 255)
        {
          v38 = 0;
          v11 = v119;
        }
        else
        {
          v39 = *(_QWORD *)v29;
          v40 = *(_QWORD *)(v29 + 8);
          v41 = *(_QWORD *)(v0 + 272);
          v42 = *(_QWORD *)(v0 + 256);
          v43 = *(_QWORD *)(v0 + 232);
          v44 = *(_QWORD *)(v0 + 240);
          v45 = *(_QWORD *)(v0 + 192);
          v46 = *(_QWORD *)(v0 + 168);
          v124 = *(_QWORD *)v29;
          v125 = v40;
          v47 = v37 & 1;
          v126 = v37 & 1;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 16))(v42, v41, v43);
          v48 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v45 + 48))(v42, 1, v46);
          v49 = *(_QWORD *)(v0 + 256);
          if (v48 == 1)
          {
            v50 = *(_QWORD *)(v0 + 232);
            outlined copy of _FileNamedTransferRepresentation<A>.Storage<A>(v39, v40, v47);
            v36(v49, v50);
            v51 = v0 + 112;
            *(_QWORD *)(v0 + 144) = 0;
            *(_OWORD *)v120 = 0u;
            *(_OWORD *)(v0 + 128) = 0u;
          }
          else
          {
            v52 = *(_QWORD *)(v0 + 192);
            v117 = *(_OWORD *)(v0 + 168);
            *(_OWORD *)(v0 + 136) = v117;
            boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v120);
            (*(void (**)(uint64_t *, uint64_t, _QWORD))(v52 + 32))(boxed_opaque_existential_1, v49, v117);
            v54 = v47;
            v51 = v0 + 112;
            outlined copy of _FileNamedTransferRepresentation<A>.Storage<A>(v39, v40, v54);
          }
          v11 = v119;
          v55 = ResolvedTransferRepresentation.SuggestedFileNameStorage.resolved(_:)(v51);
          v57 = v56;
          outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(v124, v125, v126);
          outlined destroy of DataRepresentation<AttributedString>(v51, &demangling cache variable for type metadata for Transferable?);
          if (v57)
          {
            v38 = (void *)MEMORY[0x20BD04D28](v55, v57);
            swift_bridgeObjectRelease();
          }
          else
          {
            v38 = 0;
          }
        }
        v58 = *(_QWORD *)(v0 + 328);
        objc_msgSend(*(id *)(v0 + 184), sel_setSuggestedName_, v38);

        outlined destroy of ResolvedTransferRepresentation(v58, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
      }
      v59 = *(_QWORD *)(v0 + 248);
      v60 = *(_QWORD *)(v0 + 192);
      v61 = *(_QWORD *)(v0 + 168);
      (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 240) + 16))(v59, *(_QWORD *)(v0 + 272), *(_QWORD *)(v0 + 232));
      v62 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v60 + 48))(v59, 1, v61);
      v63 = *(_QWORD *)(v0 + 248);
      if (v62 == 1)
      {
        v64 = *(_QWORD *)(v0 + 232);
        v65 = *(_QWORD *)(v0 + 240);
        (*(void (**)(void))(v0 + 152))();
        (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v63, v64);
      }
      else
      {
        (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 192) + 32))(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 168));
      }
      v106 = *(_QWORD *)(v0 + 296) + v112;
      v66 = type metadata accessor for ResolvedTransferRepresentation;
      v67 = *(_QWORD *)(v0 + 280);
      v105 = *(_QWORD *)(v0 + 192);
      v118 = v67;
      while (1)
      {
        v68 = *(_QWORD *)(v0 + 312);
        outlined init with copy of ResolvedTransferRepresentation(v12, v68, (uint64_t (*)(_QWORD))v66);
        v69 = *(_QWORD *)(v68 + *(int *)(v11 + 32));
        v70 = *(_QWORD *)(v0 + 312);
        if (v69)
        {
          v121 = v9;
          v71 = v66;
          v72 = *(_QWORD *)(v0 + 216);
          v74 = *(_QWORD *)(v0 + 168);
          v73 = *(_QWORD *)(v0 + 176);
          v75 = (uint64_t *)(v70 + *(int *)(v67 + 40));
          v76 = v67;
          v77 = (uint64_t (*)(uint64_t *))*v75;
          v78 = v75[1];
          outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(*v75);
          LOBYTE(v72) = static NSItemProvider.Loader.shouldExport<A>(condition:item:)(v77, v78, v72, v74, v73);
          _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe((uint64_t)v77);
          v70 = *(_QWORD *)(v0 + 312);
          if ((v72 & 1) != 0)
          {
            v79 = *(_QWORD *)(v70 + *(int *)(v76 + 28));
            if (v79 == MEMORY[0x24BDCDDE8])
            {
              v80 = *(_QWORD *)(v0 + 304);
              v81 = *(_QWORD *)(v0 + 208);
              v82 = *(_QWORD *)(v0 + 216);
              v110 = *(void **)(v0 + 184);
              v114 = *(_OWORD *)(v0 + 168);
              v83 = UTType.identifier.getter();
              v84 = MEMORY[0x20BD04D28](v83);
              swift_bridgeObjectRelease();
              v124 = *(_QWORD *)(v70 + *(int *)(v118 + 44));
              v108 = TransferRepresentationVisibility.itemProviderVisibility.getter();
              v66 = v71;
              outlined init with copy of ResolvedTransferRepresentation(v70, v80, (uint64_t (*)(_QWORD))v71);
              (*(void (**)(uint64_t, uint64_t, _QWORD))(v105 + 16))(v81, v82, v114);
              v85 = (v106 + *(unsigned __int8 *)(v105 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v105 + 80);
              v86 = swift_allocObject();
              *(_OWORD *)(v86 + 16) = v114;
              outlined init with take of ResolvedTransferRepresentation(v80, v86 + v112, (uint64_t (*)(_QWORD))v71);
              v87 = v86 + v85;
              v88 = (void *)v84;
              (*(void (**)(unint64_t, uint64_t, _QWORD))(v105 + 32))(v87, v81, v114);
              *(_QWORD *)(v0 + 96) = partial apply for closure #3 in NSItemProvider.registerTransferable<A>(_:);
              *(_QWORD *)(v0 + 104) = v86;
              v67 = v118;
              *(_QWORD *)(v0 + 64) = MEMORY[0x24BDAC760];
              *(_QWORD *)(v0 + 72) = 1107296256;
              *(_QWORD *)(v0 + 80) = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed @Sendable (@guaranteed Data?, @guaranteed Error?) -> ()) -> (@owned NSProgress?);
              *(_QWORD *)(v0 + 88) = &block_descriptor_27;
              v89 = _Block_copy((const void *)(v0 + 64));
              swift_release();
              objc_msgSend(v110, sel_registerDataRepresentationForTypeIdentifier_visibility_loadHandler_, v84, v108, v89);
LABEL_37:
              v9 = v121;
              _Block_release(v89);

              v70 = *(_QWORD *)(v0 + 312);
              goto LABEL_29;
            }
            v67 = v76;
            if (v79 == type metadata accessor for SentTransferredFile(0))
            {
              v90 = *(_QWORD *)(v0 + 304);
              v92 = *(_QWORD *)(v0 + 208);
              v91 = *(_QWORD *)(v0 + 216);
              v109 = *(_BYTE *)(v70 + *(int *)(v76 + 24)) & 1;
              v111 = *(void **)(v0 + 184);
              v115 = *(_OWORD *)(v0 + 168);
              v93 = UTType.identifier.getter();
              v94 = MEMORY[0x20BD04D28](v93);
              swift_bridgeObjectRelease();
              v124 = *(_QWORD *)(v70 + *(int *)(v67 + 44));
              v107 = TransferRepresentationVisibility.itemProviderVisibility.getter();
              outlined init with copy of ResolvedTransferRepresentation(v70, v90, (uint64_t (*)(_QWORD))v71);
              (*(void (**)(uint64_t, uint64_t, _QWORD))(v105 + 16))(v92, v91, v115);
              v95 = (v106 + *(unsigned __int8 *)(v105 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v105 + 80);
              v96 = swift_allocObject();
              *(_OWORD *)(v96 + 16) = v115;
              outlined init with take of ResolvedTransferRepresentation(v90, v96 + v112, (uint64_t (*)(_QWORD))v71);
              v97 = v96 + v95;
              v88 = (void *)v94;
              (*(void (**)(unint64_t, uint64_t, _QWORD))(v105 + 32))(v97, v92, v115);
              *(_QWORD *)(v0 + 48) = partial apply for closure #4 in NSItemProvider.registerTransferable<A>(_:);
              *(_QWORD *)(v0 + 56) = v96;
              v66 = v71;
              v67 = v118;
              *(_QWORD *)(v0 + 16) = MEMORY[0x24BDAC760];
              *(_QWORD *)(v0 + 24) = 1107296256;
              *(_QWORD *)(v0 + 32) = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed @Sendable (@in_guaranteed URL?, @unowned Bool, @guaranteed Error?) -> ()) -> (@owned NSProgress?);
              *(_QWORD *)(v0 + 40) = &block_descriptor_21;
              v89 = _Block_copy((const void *)(v0 + 16));
              swift_release();
              objc_msgSend(v111, sel_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler_, v94, v109, v107, v89);
              goto LABEL_37;
            }
            v66 = v71;
          }
          else
          {
            v66 = v71;
            v67 = v76;
          }
          v9 = v121;
        }
LABEL_29:
        outlined destroy of ResolvedTransferRepresentation(v70, (uint64_t (*)(_QWORD))v66);
        v12 += v123;
        --v9;
        v11 = v119;
        if (!v9)
        {
          v98 = *(_QWORD *)(v0 + 272);
          v99 = *(_QWORD *)(v0 + 232);
          v100 = *(_QWORD *)(v0 + 240);
          v101 = *(_QWORD *)(v0 + 216);
          v102 = *(_QWORD *)(v0 + 192);
          v103 = *(_QWORD *)(v0 + 168);
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v102 + 8))(v101, v103);
          (*(void (**)(uint64_t, uint64_t))(v100 + 8))(v98, v99);
          goto LABEL_39;
        }
      }
    }
    v13 += v123;
    --v14;
  }
  while (v14);
  swift_bridgeObjectRelease_n();
LABEL_39:
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 376) + 8))(*(_QWORD *)(v0 + 392), *(_QWORD *)(v0 + 344));
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
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t closure #3 in NSItemProvider.registerTransferable<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
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
  unint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v26 = a2;
  v27 = a6;
  v25 = a4;
  v28 = a1;
  v8 = *(_QWORD *)(a5 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v10 = type metadata accessor for ResolvedTransferRepresentation();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v16, 1, 1, v17);
  outlined init with copy of ResolvedTransferRepresentation(a3, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v25, a5);
  v18 = (*(unsigned __int8 *)(v11 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v19 = (v12 + *(unsigned __int8 *)(v8 + 80) + v18) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v20 = (char *)swift_allocObject();
  *((_QWORD *)v20 + 2) = 0;
  *((_QWORD *)v20 + 3) = 0;
  v21 = v27;
  *((_QWORD *)v20 + 4) = a5;
  *((_QWORD *)v20 + 5) = v21;
  outlined init with take of ResolvedTransferRepresentation((uint64_t)v13, (uint64_t)&v20[v18], (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v20[v19], (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a5);
  v22 = &v20[(v9 + v19 + 7) & 0xFFFFFFFFFFFFFFF8];
  v23 = v26;
  *(_QWORD *)v22 = v28;
  *((_QWORD *)v22 + 1) = v23;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v16, (uint64_t)&async function pointer to partial apply for closure #1 in closure #3 in NSItemProvider.registerTransferable<A>(_:), (uint64_t)v20);
  return swift_release();
}

uint64_t closure #1 in closure #3 in NSItemProvider.registerTransferable<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v10;

  v8[6] = a8;
  v8[7] = v10;
  v8[4] = a6;
  v8[5] = a7;
  v8[2] = a4;
  v8[3] = a5;
  return swift_task_switch();
}

uint64_t closure #1 in closure #3 in NSItemProvider.registerTransferable<A>(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = (uint64_t *)(v1 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 32));
  v4 = *v2;
  v3 = v2[1];
  v5 = swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v5;
  *(_QWORD *)v5 = v0;
  *(_QWORD *)(v5 + 8) = closure #1 in closure #3 in NSItemProvider.registerTransferable<A>(_:);
  v6 = *(_OWORD *)(v0 + 24);
  v7 = *(_OWORD *)(v0 + 40);
  *(_QWORD *)(v5 + 200) = *(_QWORD *)(v0 + 56);
  *(_OWORD *)(v5 + 184) = v7;
  *(_OWORD *)(v5 + 168) = v6;
  *(_QWORD *)(v5 + 152) = v4;
  *(_QWORD *)(v5 + 160) = v3;
  return swift_task_switch();
}

uint64_t closure #4 in NSItemProvider.registerTransferable<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
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
  unint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v26 = a4;
  v27 = a6;
  v28 = a1;
  v9 = *(_QWORD *)(a5 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v11 = type metadata accessor for ResolvedTransferRepresentation();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  static TaskPriority.userInitiated.getter();
  v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 0, 1, v18);
  outlined init with copy of ResolvedTransferRepresentation(a3, (uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v26, a5);
  v19 = (*(unsigned __int8 *)(v12 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v20 = (v13 + *(unsigned __int8 *)(v9 + 80) + v19) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v21 = (char *)swift_allocObject();
  *((_QWORD *)v21 + 2) = 0;
  *((_QWORD *)v21 + 3) = 0;
  v22 = v27;
  *((_QWORD *)v21 + 4) = a5;
  *((_QWORD *)v21 + 5) = v22;
  outlined init with take of ResolvedTransferRepresentation((uint64_t)v14, (uint64_t)&v21[v19], (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v21[v20], (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a5);
  v23 = &v21[(v10 + v20 + 7) & 0xFFFFFFFFFFFFFFF8];
  *(_QWORD *)v23 = v28;
  *((_QWORD *)v23 + 1) = a2;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v17, (uint64_t)&async function pointer to partial apply for closure #1 in closure #4 in NSItemProvider.registerTransferable<A>(_:), (uint64_t)v21);
  return swift_release();
}

uint64_t closure #1 in closure #4 in NSItemProvider.registerTransferable<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v10;

  v8[6] = a8;
  v8[7] = v10;
  v8[4] = a6;
  v8[5] = a7;
  v8[2] = a4;
  v8[3] = a5;
  return swift_task_switch();
}

uint64_t closure #1 in closure #4 in NSItemProvider.registerTransferable<A>(_:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[2];
  v2 = (uint64_t *)(v1 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 32));
  v4 = *v2;
  v3 = v2[1];
  v5 = (_QWORD *)swift_task_alloc();
  v0[8] = v5;
  *v5 = v0;
  v5[1] = closure #1 in closure #4 in NSItemProvider.registerTransferable<A>(_:);
  return static NSItemProvider.Loader.loadFile<A>(exporting:transferable:completionHandler:)(v4, v3, v0[3], v0[4], v0[5], v0[6], v0[7]);
}

{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t NSItemProvider.load<A>(from:at:completionHandler:)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  _BYTE *v27;
  uint64_t v28;
  void *v29;
  id v30;
  unsigned int v31;
  uint64_t *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  _BYTE *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  _BYTE *v46;
  uint64_t v47;
  void *v48;
  _QWORD *v49;
  uint64_t v50;
  void *v51;
  id v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  id v59;
  _BYTE v60[4];
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(uint64_t *);
  uint64_t v66;
  _BYTE *v67;
  uint64_t v68;
  id v69;
  _BYTE *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t aBlock;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  _QWORD *v79;

  v72 = a6;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  v71 = a5;
  v11 = type metadata accessor for Result();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (uint64_t *)&v60[-v13];
  v15 = type metadata accessor for UTType();
  v68 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v67 = &v60[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = (int *)type metadata accessor for ResolvedTransferRepresentation();
  v18 = *(_QWORD *)(*((_QWORD *)v17 - 1) + 64);
  v19 = MEMORY[0x24BDAC7A8](v17);
  result = MEMORY[0x24BDAC7A8](v19);
  v70 = &v60[-v23];
  v73 = a1;
  if (*(_QWORD *)(a1 + 16) <= a2)
  {
    lazy protocol witness table accessor for type TransferableSupportError and conformance TransferableSupportError();
    v35 = swift_allocError();
    *v36 = 0;
    *v14 = v35;
    swift_storeEnumTagMultiPayload();
    a3(v14);
    return (*(uint64_t (**)(uint64_t *, uint64_t))(v12 + 8))(v14, v11);
  }
  else
  {
    v65 = a3;
    v66 = a4;
    if (a2 < 0)
    {
      __break(1u);
    }
    else
    {
      v24 = v22;
      v64 = v15;
      v25 = *(unsigned __int8 *)(v21 + 80);
      v26 = v70;
      outlined init with copy of ResolvedTransferRepresentation(v73 + ((v25 + 32) & ~v25) + *(_QWORD *)(v21 + 72) * a2, (uint64_t)v70, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
      v27 = &v26[v17[5]];
      v28 = UTType.identifier.getter();
      v29 = (void *)MEMORY[0x20BD04D28](v28);
      swift_bridgeObjectRelease();
      v30 = v69;
      v31 = objc_msgSend(v69, sel_hasRepresentationConformingToTypeIdentifier_fileOptions_, v29, 0);

      if (v31 && (v32 = (uint64_t *)&v26[v17[9]], (v33 = *v32) != 0))
      {
        v62 = v32[1];
        v63 = v33;
        if (*(_QWORD *)&v26[v17[7]] == MEMORY[0x24BDCDDE8])
        {
          v61 = 0;
        }
        else
        {
          if ((v26[v17[6]] & 1) != 0)
            v34 = 1;
          else
            v34 = 2;
          v61 = v34;
        }
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v68 + 16))(v67, v27, v64);
        outlined init with copy of ResolvedTransferRepresentation((uint64_t)v26, v24, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
        v37 = (v25 + 48) & ~v25;
        v38 = (v18 + v37 + 7) & 0xFFFFFFFFFFFFFFF8;
        v39 = (v38 + 15) & 0xFFFFFFFFFFFFFFF8;
        v40 = (_QWORD *)swift_allocObject();
        v41 = v72;
        v40[2] = v71;
        v40[3] = v41;
        v42 = v66;
        v40[4] = v65;
        v40[5] = v42;
        outlined init with take of ResolvedTransferRepresentation(v24, (uint64_t)v40 + v37, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
        *(_QWORD *)((char *)v40 + v38) = v30;
        *(_QWORD *)((char *)v40 + v39) = v73;
        *(_QWORD *)((char *)v40 + ((v39 + 15) & 0xFFFFFFFFFFFFFFF8)) = a2;
        v44 = v62;
        v43 = v63;
        outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v63);
        swift_retain();
        v45 = v30;
        swift_bridgeObjectRetain();
        if ((_BYTE)v61)
        {
          v46 = v67;
          if (v61 == 1)
          {
            v47 = UTType.identifier.getter();
            v48 = (void *)MEMORY[0x20BD04D28](v47);
            swift_bridgeObjectRelease();
            v49 = (_QWORD *)swift_allocObject();
            v50 = v72;
            v49[2] = v71;
            v49[3] = v50;
            v49[4] = partial apply for closure #1 in NSItemProvider.load<A>(from:at:completionHandler:);
            v49[5] = v40;
            v49[6] = v43;
            v49[7] = v44;
            v78 = partial apply for closure #2 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:);
            v79 = v49;
            aBlock = MEMORY[0x24BDAC760];
            v75 = 1107296256;
            v76 = thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed URL?, @unowned Bool, @guaranteed Error?) -> ();
            v77 = &block_descriptor_42;
            v51 = _Block_copy(&aBlock);
            swift_retain();
            swift_retain();
            swift_release();
            v52 = objc_msgSend(v45, sel_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler_, v48, v51);
          }
          else
          {
            v56 = UTType.identifier.getter();
            v48 = (void *)MEMORY[0x20BD04D28](v56);
            swift_bridgeObjectRelease();
            v57 = (_QWORD *)swift_allocObject();
            v58 = v72;
            v57[2] = v71;
            v57[3] = v58;
            v57[4] = partial apply for closure #1 in NSItemProvider.load<A>(from:at:completionHandler:);
            v57[5] = v40;
            v57[6] = v43;
            v57[7] = v44;
            v78 = partial apply for closure #3 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:);
            v79 = v57;
            aBlock = MEMORY[0x24BDAC760];
            v75 = 1107296256;
            v76 = thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed URL?, @guaranteed Error?) -> ();
            v77 = &block_descriptor_36;
            v51 = _Block_copy(&aBlock);
            swift_retain();
            swift_retain();
            swift_release();
            v52 = objc_msgSend(v45, sel_loadFileRepresentationForTypeIdentifier_completionHandler_, v48, v51);
          }
        }
        else
        {
          v46 = v67;
          v53 = UTType.identifier.getter();
          v48 = (void *)MEMORY[0x20BD04D28](v53);
          swift_bridgeObjectRelease();
          v54 = (_QWORD *)swift_allocObject();
          v55 = v72;
          v54[2] = v71;
          v54[3] = v55;
          v54[4] = partial apply for closure #1 in NSItemProvider.load<A>(from:at:completionHandler:);
          v54[5] = v40;
          v54[6] = v43;
          v54[7] = v44;
          v78 = partial apply for closure #1 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:);
          v79 = v54;
          aBlock = MEMORY[0x24BDAC760];
          v75 = 1107296256;
          v76 = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data?, @guaranteed Error?) -> ();
          v77 = &block_descriptor_48;
          v51 = _Block_copy(&aBlock);
          swift_retain();
          swift_retain();
          swift_release();
          v52 = objc_msgSend(v45, sel_loadDataRepresentationForTypeIdentifier_completionHandler_, v48, v51);
        }
        v26 = v70;
        v59 = v52;
        _Block_release(v51);

        swift_release();
        _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_ly10Foundation16AttributedStringVSSIseghHnrzo_SgWOe(v43);
        (*(void (**)(_BYTE *, uint64_t))(v68 + 8))(v46, v64);
      }
      else
      {
        NSItemProvider.load<A>(from:at:completionHandler:)(v73, a2 + 1, v65, v66, v71, v72);
      }
      return outlined destroy of ResolvedTransferRepresentation((uint64_t)v26, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    }
  }
  return result;
}

void closure #1 in NSItemProvider.load<A>(from:at:completionHandler:)(uint64_t a1, void (*a2)(_QWORD), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void **v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(_QWORD);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v47 = a7;
  v48 = a4;
  v44 = a6;
  v45 = a5;
  v43 = type metadata accessor for ResolvedTransferRepresentation();
  v13 = MEMORY[0x24BDAC7A8](v43);
  v46 = (uint64_t)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(_QWORD *)(a8 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  v18 = type metadata accessor for Result();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v39 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v24 = (void **)((char *)&v39 - v23);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))((char *)&v39 - v23, a1, v18);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v40 = a8;
    v41 = a2;
    v42 = a3;
    v25 = *v24;
    if (one-time initialization token for logger != -1)
      swift_once();
    v26 = type metadata accessor for Logger();
    __swift_project_value_buffer(v26, (uint64_t)logger);
    v27 = v46;
    outlined init with copy of ResolvedTransferRepresentation(v48, v46, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
    v28 = v25;
    v29 = v25;
    v30 = Logger.logObject.getter();
    v31 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = swift_slowAlloc();
      v33 = (_QWORD *)swift_slowAlloc();
      v34 = swift_slowAlloc();
      v50 = v34;
      *(_DWORD *)v32 = 136315394;
      v35 = UTType.identifier.getter();
      v49 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v35, v36, &v50);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      outlined destroy of ResolvedTransferRepresentation(v27, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
      *(_WORD *)(v32 + 12) = 2112;
      v37 = v25;
      v38 = _swift_stdlib_bridgeErrorToNSError();
      v49 = v38;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *v33 = v38;

      _os_log_impl(&dword_20833C000, v30, v31, "Error loading\n%s:\n%@", (uint8_t *)v32, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x20BD0552C](v33, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x20BD0552C](v34, -1, -1);
      MEMORY[0x20BD0552C](v32, -1, -1);
    }
    else
    {
      outlined destroy of ResolvedTransferRepresentation(v27, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);

    }
    if (__OFADD__(v47, 1))
    {
      __break(1u);
    }
    else
    {
      NSItemProvider.load<A>(from:at:completionHandler:)(v44, v47 + 1, v41, v42, v40, a9);

    }
  }
  else
  {
    (*(void (**)(char *, void **, uint64_t))(v15 + 32))(v17, v24, a8);
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v22, v17, a8);
    swift_storeEnumTagMultiPayload();
    a2(v22);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v18);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, a8);
  }
}

id NSItemProvider.loadTransferable<A>(type:completionHandler:)(uint64_t a1, void (*a2)(uint64_t *), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t AssociatedTypeWitness;
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
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t AssociatedConformanceWitness;
  id v22;
  void (*v24)(uint64_t *);
  uint64_t v25;
  uint64_t v26;

  v25 = a3;
  v24 = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = type metadata accessor for _TransferRepresentationValue(0, AssociatedTypeWitness, v8, v9);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v24 - v13;
  v15 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v16 = MEMORY[0x24BDAC7A8](v12);
  v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v24 - v19;
  (*(void (**)(uint64_t, uint64_t))(a5 + 24))(a4, a5);
  swift_getDynamicType();
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v18, v20, AssociatedTypeWitness);
  _TransferRepresentationValue.init(_:)((uint64_t)v18, AssociatedTypeWitness, (uint64_t)v14);
  _TransferRepresentationInputs.init()();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t *__return_ptr, char *))(AssociatedConformanceWitness + 48))(&v26, v14);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  NSItemProvider.load<A>(from:at:completionHandler:)(v26, 0, v24, v25, a4, a5);
  swift_bridgeObjectRelease();
  v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1768]), sel_init);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v20, AssociatedTypeWitness);
  return v22;
}

uint64_t partial apply for closure #4 in NSItemProvider.register<A>(_:)(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #4 in NSItemProvider.register<A>(_:)(a1, a2, (void (*)(uint64_t, uint64_t, _QWORD, _QWORD, char *))closure #4 in NSItemProvider.register<A>(_:));
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

uint64_t objectdestroy_8Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t partial apply for closure #3 in NSItemProvider.register<A>(_:)(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #4 in NSItemProvider.register<A>(_:)(a1, a2, (void (*)(uint64_t, uint64_t, _QWORD, _QWORD, char *))closure #3 in NSItemProvider.register<A>(_:));
}

uint64_t partial apply for closure #4 in NSItemProvider.register<A>(_:)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, _QWORD, _QWORD, char *))
{
  char *v3;
  uint64_t v4;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(*((_QWORD *)v3 + 2) - 8) + 80);
  a3(a1, a2, *((_QWORD *)v3 + 4), *((_QWORD *)v3 + 5), &v3[(v4 + 48) & ~v4]);
  return 0;
}

unint64_t lazy protocol witness table accessor for type TransferRepresentationVisibility and conformance TransferRepresentationVisibility()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TransferRepresentationVisibility and conformance TransferRepresentationVisibility;
  if (!lazy protocol witness table cache variable for type TransferRepresentationVisibility and conformance TransferRepresentationVisibility)
  {
    result = MEMORY[0x20BD054C0](&protocol conformance descriptor for TransferRepresentationVisibility, &type metadata for TransferRepresentationVisibility);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TransferRepresentationVisibility and conformance TransferRepresentationVisibility);
  }
  return result;
}

uint64_t partial apply for closure #4 in NSItemProvider.registerTransferable<A>(_:)(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #4 in NSItemProvider.registerTransferable<A>(_:)(a1, a2, (void (*)(uint64_t, uint64_t, unint64_t, unint64_t, uint64_t, uint64_t))closure #4 in NSItemProvider.registerTransferable<A>(_:));
}

uint64_t objectdestroy_17Tm()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  int v9;
  char *v10;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = (int *)type metadata accessor for ResolvedTransferRepresentation();
  v3 = *((_QWORD *)v2 - 1);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = *(_QWORD *)(v3 + 64);
  v6 = *(_QWORD *)(v1 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = (uint64_t *)(v0 + v4);
  v9 = *(unsigned __int8 *)(v0 + v4 + 16);
  if (v9 != 255)
    outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(*v8, v8[1], v9 & 1);
  v10 = (char *)v8 + v2[5];
  v11 = type metadata accessor for UTType();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  if (*(uint64_t *)((char *)v8 + v2[8]))
    swift_release();
  if (*(uint64_t *)((char *)v8 + v2[9]))
    swift_release();
  if (*(uint64_t *)((char *)v8 + v2[10]))
    swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + ((v4 + v5 + v7) & ~v7), v1);
  return swift_deallocObject();
}

uint64_t partial apply for closure #3 in NSItemProvider.registerTransferable<A>(_:)(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #4 in NSItemProvider.registerTransferable<A>(_:)(a1, a2, (void (*)(uint64_t, uint64_t, unint64_t, unint64_t, uint64_t, uint64_t))closure #3 in NSItemProvider.registerTransferable<A>(_:));
}

uint64_t partial apply for closure #4 in NSItemProvider.registerTransferable<A>(_:)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, unint64_t, unint64_t, uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v7 = *(_QWORD *)(v3 + 16);
  v8 = *(_QWORD *)(v3 + 24);
  v9 = *(_QWORD *)(type metadata accessor for ResolvedTransferRepresentation() - 8);
  v10 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v11 = *(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80);
  a3(a1, a2, v3 + v10, v3 + ((v10 + *(_QWORD *)(v9 + 64) + v11) & ~v11), v7, v8);
  return 0;
}

uint64_t sub_208361054()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  int v6;
  char *v7;
  uint64_t v8;

  v1 = (int *)type metadata accessor for ResolvedTransferRepresentation();
  v2 = *((_QWORD *)v1 - 1);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  swift_release();
  v5 = (uint64_t *)(v0 + v3);
  v6 = *(unsigned __int8 *)(v0 + v3 + 16);
  if (v6 != 255)
    outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(*v5, v5[1], v6 & 1);
  v7 = (char *)v5 + v1[5];
  v8 = type metadata accessor for UTType();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  if (*(uint64_t *)((char *)v5 + v1[8]))
    swift_release();
  if (*(uint64_t *)((char *)v5 + v1[9]))
    swift_release();
  if (*(uint64_t *)((char *)v5 + v1[10]))
    swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void partial apply for closure #1 in NSItemProvider.load<A>(from:at:completionHandler:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = *(_QWORD *)(v1 + 16);
  v4 = *(_QWORD *)(v1 + 24);
  v5 = *(_QWORD *)(type metadata accessor for ResolvedTransferRepresentation() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = (*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  closure #1 in NSItemProvider.load<A>(from:at:completionHandler:)(a1, *(void (**)(_QWORD))(v1 + 32), *(_QWORD *)(v1 + 40), v1 + v6, *(_QWORD *)(v1 + v7), *(_QWORD *)(v1 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v1 + ((((v7 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFF8)), v3, v4);
}

uint64_t partial apply for closure #3 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)(uint64_t a1, void *a2)
{
  uint64_t v2;

  return closure #3 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)(a1, a2, *(void (**)(uint64_t *))(v2 + 32), *(void (**)(uint64_t *))(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t partial apply for closure #2 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)(uint64_t a1, int a2, void *a3)
{
  uint64_t v3;

  return closure #2 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)(a1, a2, a3, *(void (**)(uint64_t *))(v3 + 32), *(void (**)(uint64_t *))(v3 + 40), *(_QWORD *)(v3 + 48), *(_QWORD *)(v3 + 56), *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24));
}

uint64_t objectdestroy_32Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v3;

  return closure #1 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)(a1, a2, a3, *(void (**)(uint64_t *))(v3 + 32), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 48), *(_QWORD *)(v3 + 56));
}

uint64_t sub_2083612B0()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  outlined consume of Data._Representation(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = v0[6];
  v3 = v0[7];
  v4 = v0[8];
  v5 = v0[9];
  v6 = v0[10];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return closure #1 in closure #1 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)((uint64_t)v7, v8, v9, v2, v3, v4, v5, v6);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TQ0_;
  return v6(a1);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TQ0_()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_208361420()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TA(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = partial apply for closure #2 in static URL.transferRepresentation.getter;
  return ((uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5Tu
                                                 + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5Tu))(a1, v4);
}

uint64_t sub_2083614B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ReceivedTransferredFile(0) - 8) + 80);
  v2 = (v1 + 64) & ~v1;
  swift_unknownObjectRelease();
  swift_release();
  v3 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v0 + v2, v3);
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #2 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v2 = *(_QWORD *)(type metadata accessor for ReceivedTransferredFile(0) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v0 + 48);
  v5 = *(_QWORD *)(v0 + 56);
  v6 = v0 + v3;
  v7 = (uint64_t *)(v0 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  v8 = *v7;
  v9 = v7[1];
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v10;
  *v10 = v1;
  v10[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return closure #1 in closure #2 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)((uint64_t)v10, v11, v12, v4, v5, v6, v8, v9);
}

uint64_t sub_2083615FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(unint64_t, uint64_t);

  v1 = type metadata accessor for URL();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ReceivedTransferredFile(0) - 8) + 80);
  v6 = (v4 + v5 + 16) & ~v5;
  swift_unknownObjectRelease();
  v7 = *(void (**)(unint64_t, uint64_t))(v2 + 8);
  v7(v0 + v3, v1);
  swift_release();
  v7(v0 + v6, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #3 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *(_QWORD *)(type metadata accessor for URL() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = *(_QWORD *)(type metadata accessor for ReceivedTransferredFile(0) - 8);
  v6 = (v4 + *(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = v0 + v3;
  v8 = v0 + v4;
  v9 = *(_QWORD *)(v0 + v4);
  v10 = *(_QWORD *)(v8 + 8);
  v11 = v0 + v6;
  v12 = *(_QWORD *)(v0 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v13;
  *v13 = v1;
  v13[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return closure #1 in closure #3 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)((uint64_t)v13, v14, v15, v7, v9, v10, v11, v12);
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
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
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            UnsafeMutableRawBufferPointer.subscript.setter();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = _StringGuts._allocateForDeconstruct()(a5, a6);
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
  v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    result = _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
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
      v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = _StringGuts.copyUTF8(into:)();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      v2 = String.UTF8View._foreignCount()();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
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

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
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
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t partial apply for closure #1 in closure #3 in NSItemProvider.registerTransferable<A>(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  unint64_t v9;
  __int128 v10;

  v2 = *(_QWORD *)(type metadata accessor for ResolvedTransferRepresentation() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v3 + *(_QWORD *)(v2 + 64);
  v5 = v0 + v3;
  v6 = swift_task_alloc();
  v7 = *(_OWORD *)(v0 + 32);
  v8 = *(_QWORD *)(*(_QWORD *)(v0 + 32) - 8);
  v9 = (v4 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v10 = *(_OWORD *)(v0 + ((*(_QWORD *)(v8 + 64) + v9 + 7) & 0xFFFFFFFFFFFFF8));
  *(_QWORD *)(v1 + 16) = v6;
  *(_QWORD *)v6 = v1;
  *(_QWORD *)(v6 + 8) = partial apply for closure #4 in static URL.transferRepresentation.getter;
  *(_OWORD *)(v6 + 32) = v10;
  *(_OWORD *)(v6 + 48) = v7;
  *(_QWORD *)(v6 + 16) = v5;
  *(_QWORD *)(v6 + 24) = v0 + v9;
  return swift_task_switch();
}

uint64_t objectdestroy_70Tm()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  int v9;
  char *v10;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = (int *)type metadata accessor for ResolvedTransferRepresentation();
  v3 = *((_QWORD *)v2 - 1);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = *(_QWORD *)(v3 + 64);
  v6 = *(_QWORD *)(v1 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  swift_unknownObjectRelease();
  v8 = (uint64_t *)(v0 + v4);
  v9 = *(unsigned __int8 *)(v0 + v4 + 16);
  if (v9 != 255)
    outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(*v8, v8[1], v9 & 1);
  v10 = (char *)v8 + v2[5];
  v11 = type metadata accessor for UTType();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  if (*(uint64_t *)((char *)v8 + v2[8]))
    swift_release();
  if (*(uint64_t *)((char *)v8 + v2[9]))
    swift_release();
  if (*(uint64_t *)((char *)v8 + v2[10]))
    swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + ((v4 + v5 + v7) & ~v7), v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #4 in NSItemProvider.registerTransferable<A>(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  unint64_t v9;
  __int128 v10;

  v2 = *(_QWORD *)(type metadata accessor for ResolvedTransferRepresentation() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v3 + *(_QWORD *)(v2 + 64);
  v5 = v0 + v3;
  v6 = swift_task_alloc();
  v7 = *(_OWORD *)(v0 + 32);
  v8 = *(_QWORD *)(*(_QWORD *)(v0 + 32) - 8);
  v9 = (v4 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v10 = *(_OWORD *)(v0 + ((*(_QWORD *)(v8 + 64) + v9 + 7) & 0xFFFFFFFFFFFFF8));
  *(_QWORD *)(v1 + 16) = v6;
  *(_QWORD *)v6 = v1;
  *(_QWORD *)(v6 + 8) = partial apply for closure #2 in static URL.transferRepresentation.getter;
  *(_OWORD *)(v6 + 32) = v10;
  *(_OWORD *)(v6 + 48) = v7;
  *(_QWORD *)(v6 + 16) = v5;
  *(_QWORD *)(v6 + 24) = v0 + v9;
  return swift_task_switch();
}

uint64_t outlined destroy of ResolvedTransferRepresentation(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2083621A4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSData?, @unowned NSError?) -> ()(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;

  thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSData?, @unowned NSError?) -> ()(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t partial apply for closure #1 in closure #3 in NSItemProvider.register<A>(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;

  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = (_QWORD *)swift_task_alloc();
  v11 = *(_OWORD *)(v0 + 32);
  v5 = *(_QWORD *)(v11 - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = v0 + v6;
  v10 = *(_OWORD *)(v0 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8));
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  v8 = swift_task_alloc();
  v4[2] = v8;
  *(_QWORD *)v8 = v4;
  *(_QWORD *)(v8 + 8) = partial apply for closure #4 in static URL.transferRepresentation.getter;
  *(_OWORD *)(v8 + 176) = v10;
  *(_OWORD *)(v8 + 192) = v11;
  *(_QWORD *)(v8 + 160) = v3;
  *(_QWORD *)(v8 + 168) = v7;
  *(_QWORD *)(v8 + 152) = v2;
  return swift_task_switch();
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSURL?, @unowned Bool, @unowned NSError?) -> ()(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v3;

  thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSURL?, @unowned Bool, @unowned NSError?) -> ()(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t objectdestroy_85Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #4 in NSItemProvider.register<A>(_:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;

  v2 = v0[4];
  v3 = v0[5];
  v4 = *(_QWORD *)(v2 - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = v0[6];
  v7 = v0[7];
  v8 = (uint64_t)v0 + v5;
  v9 = (_QWORD *)((char *)v0 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  v10 = *v9;
  v11 = v9[1];
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v12;
  *v12 = v1;
  v12[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  v13 = (_QWORD *)swift_task_alloc();
  v12[2] = v13;
  *v13 = v12;
  v13[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return static NSItemProvider.Loader.loadFile<A>(exporting:transferable:completionHandler:)(v6, v7, v8, v10, v11, v2, v3);
}

uint64_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (_QWORD *)*v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<ResolvedTransferRepresentation>, (uint64_t (*)(_QWORD))type metadata accessor for ResolvedTransferRepresentation);
  *v3 = result;
  return result;
}

{
  uint64_t *v3;
  uint64_t result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (_QWORD *)*v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<UTType>, (uint64_t (*)(_QWORD))MEMORY[0x24BEE63B8]);
  *v3 = result;
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1)
    goto LABEL_34;
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (char *)v16 + v20;
  v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v16 < a4 || v21 >= &v22[*(_QWORD *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v23 = *(_QWORD *)(v19 + 72) * v11;
  v24 = &v21[v23];
  v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t outlined init with copy of URL?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t outlined init with take of ResolvedTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t partial apply for closure #1 in static Transferable.resolvedRepresentations(for:)()
{
  type metadata accessor for ResolvedTransferRepresentation();
  return static UTType.== infix(_:_:)() & 1;
}

uint64_t outlined init with copy of ResolvedTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t outlined init with take of SentTransferredFile?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
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

uint64_t JSONDecoder.init()()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t JSONEncoder.init()()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t AttributedString.characters.getter()
{
  return MEMORY[0x24BDCC268]();
}

uint64_t type metadata accessor for AttributedString.CharacterView()
{
  return MEMORY[0x24BDCC290]();
}

uint64_t type metadata accessor for AttributedString()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t AttributedString.init(_:attributes:)()
{
  return MEMORY[0x24BDCC5D8]();
}

uint64_t AttributedString.init(_:)()
{
  return MEMORY[0x24BDCC618]();
}

uint64_t AttributeContainer.init()()
{
  return MEMORY[0x24BDCC890]();
}

uint64_t type metadata accessor for AttributeContainer()
{
  return MEMORY[0x24BDCC898]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t URL.isFileURL.getter()
{
  return MEMORY[0x24BDCD748]();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t URL.pathExtension.getter()
{
  return MEMORY[0x24BDCD810]();
}

uint64_t URL.init(fileURLWithPath:isDirectory:)()
{
  return MEMORY[0x24BDCD860]();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t URL.lastPathComponent.getter()
{
  return MEMORY[0x24BDCD898]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
  MEMORY[0x24BDCD8D0](retstr);
}

uint64_t URL.deletingPathExtension()()
{
  return MEMORY[0x24BDCD908]();
}

uint64_t URL.appendingPathComponent(_:isDirectory:)()
{
  return MEMORY[0x24BDCD918]();
}

uint64_t URL.appendingPathComponent(_:)()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t URL.appendingPathExtension(_:)()
{
  return MEMORY[0x24BDCD938]();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t URL.path.getter()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t URL.appending<A>(component:directoryHint:)()
{
  return MEMORY[0x24BDCDAA8]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t Data.init(contentsOf:options:)()
{
  return MEMORY[0x24BDCDB78]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x24BDCDCA0]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t Data.write(to:options:)()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t static Date.distantFuture.getter()
{
  return MEMORY[0x24BDCE2F8]();
}

uint64_t Date.timeIntervalSinceNow.getter()
{
  return MEMORY[0x24BDCE628]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t UTType.identifier.getter()
{
  return MEMORY[0x24BEE6190]();
}

uint64_t static UTType.utf8PlainText.getter()
{
  return MEMORY[0x24BEE61E8]();
}

uint64_t static UTType.== infix(_:_:)()
{
  return MEMORY[0x24BEE6258]();
}

uint64_t static UTType.rtf.getter()
{
  return MEMORY[0x24BEE6280]();
}

uint64_t static UTType.url.getter()
{
  return MEMORY[0x24BEE6290]();
}

uint64_t static UTType.data.getter()
{
  return MEMORY[0x24BEE62A8]();
}

uint64_t static UTType.html.getter()
{
  return MEMORY[0x24BEE62C8]();
}

uint64_t static UTType.fileURL.getter()
{
  return MEMORY[0x24BEE6350]();
}

uint64_t static UTType.flatRTFD.getter()
{
  return MEMORY[0x24BEE6378]();
}

uint64_t type metadata accessor for UTType()
{
  return MEMORY[0x24BEE63B8]();
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

uint64_t dispatch thunk of TopLevelDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x24BDB9BF0]();
}

uint64_t dispatch thunk of TopLevelEncoder.encode<A>(_:)()
{
  return MEMORY[0x24BDB9C08]();
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

uint64_t Array.init()()
{
  return MEMORY[0x24BEE01B8]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x24BDCF808]();
}

uint64_t type metadata accessor for Dictionary()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t Dictionary.subscript.getter()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t Dictionary.subscript.setter()
{
  return MEMORY[0x24BEE04B0]();
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

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t String.init<A>(_:)()
{
  return MEMORY[0x24BEE0DC8]();
}

uint64_t UnsafeRawBufferPointer.load<A>(fromByteOffset:as:)()
{
  return MEMORY[0x24BEE0F78]();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t Array.append(_:)()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t static MainActor.shared.getter()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t type metadata accessor for MainActor()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t static TaskPriority.userInitiated.getter()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x24BEE6990]();
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

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t NSAttributedString.init(_:)()
{
  return MEMORY[0x24BDCFFF8]();
}

uint64_t UnsafeMutablePointer.deinitialize(count:)()
{
  return MEMORY[0x24BEE1C00]();
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

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x24BEE22C0]();
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

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2510](a1);
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t static ManagedBuffer.create(minimumCapacity:makingHeaderWith:)()
{
  return MEMORY[0x24BEE2788]();
}

uint64_t ManagedBuffer.deinit()
{
  return MEMORY[0x24BEE27B0]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

Swift::Void __swiftcall ContiguousArray.reserveCapacity(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2950](a1);
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

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F40]();
}

{
  return MEMORY[0x24BEE2F48]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t withCheckedThrowingContinuation<A>(isolation:function:_:)()
{
  return MEMORY[0x24BEE70E0]();
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

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x24BEE42F8](a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t type metadata accessor for Result()
{
  return MEMORY[0x24BEE4408]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x24BEE4A98]();
}

void CFRunLoopAddCommonMode(CFRunLoopRef rl, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2B8](rl, mode);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC348](rl, source, mode);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x24BDBC360](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC370](allocator, order, context);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
  MEMORY[0x24BDBC380](source);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC388](rl);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC3B8](rl);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
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

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_conformsToProtocol()
{
  return MEMORY[0x24BEE4BE8]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

