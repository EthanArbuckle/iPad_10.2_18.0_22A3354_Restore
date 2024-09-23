uint64_t WhereAmIView.model.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v1 + 24);
  v2 = *(_QWORD *)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 56);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 8);
  *(_QWORD *)(a1 + 24) = v3;
  *(_QWORD *)(a1 + 32) = v2;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(v1 + 40);
  *(_QWORD *)(a1 + 56) = v4;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(v1 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id WhereAmIView.logObject.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 80);
}

uint64_t WhereAmIView.mapView.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v0 = type metadata accessor for MapAspectRatio();
  MEMORY[0x24BDAC7A8](v0);
  (*(void (**)(char *, _QWORD))(v2 + 104))((char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x24BEADC58]);
  return MapView.init(markers:annotations:mapItemIdentifiers:polyline:aspectRatio:cameraDistance:showsUserLocation:)();
}

uint64_t WhereAmIView.personRFPin.getter()
{
  type metadata accessor for RFMapMarker(0, &lazy cache variable for type metadata for RFMapMarker);
  return RFMapMarker.init(coordinate:title:image:tint:)();
}

uint64_t WhereAmIView.shareButton.getter@<X0>(uint64_t a1@<X8>)
{
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t result;
  void (*v38)(char *, char *, uint64_t);
  char *v39;
  void (*v40)(char *, char *, uint64_t);
  char *v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;

  v2 = v1;
  v73 = a1;
  v3 = type metadata accessor for SeparatorStyle();
  v74 = *(_QWORD *)(v3 - 8);
  v75 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v72 = (char *)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = type metadata accessor for RFButtonStyle();
  v67 = *(_QWORD *)(v71 - 8);
  MEMORY[0x24BDAC7A8](v71);
  v64 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for ButtonContainerView();
  v65 = *(_QWORD *)(v6 - 8);
  v66 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v63 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.buttonStyle<A>(_:)>>.0);
  v69 = *(_QWORD *)(v8 - 8);
  v70 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v68 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for WhereAmIView();
  v60 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v61 = v11;
  v62 = (uint64_t)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for CharacterSet();
  v76 = *(_QWORD *)(v12 - 8);
  v77 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v57 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = type metadata accessor for URL();
  v18 = *(_QWORD *)(v79 - 8);
  v19 = *(_QWORD *)(v18 + 64);
  v20 = MEMORY[0x24BDAC7A8](v79);
  v59 = (char *)&v57 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v78 = (char *)&v57 - v21;
  v22 = v2[10];
  v23 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_23CC7E000, v22, v23, "RF Share Button", v24, 2u);
    MEMORY[0x2426308F0](v24, -1, -1);
  }
  v25 = v2[6];
  v26 = v2[7];
  v27 = v2[8];
  v28 = v2[9];
  v29 = (char *)v2 + *(int *)(v10 + 36);
  v30 = *(_QWORD *)v29;
  v31 = v29[8];
  swift_bridgeObjectRetain();
  outlined copy of Environment<VRXIdiom>.Content(v30, v31);
  specialized Environment.wrappedValue.getter(v30, v31);
  outlined consume of Environment<VRXIdiom>.Content(v30, v31);
  v80 = v25;
  v81 = v26;
  v82 = v27;
  v83 = v28;
  v32 = VRXIdiom.isWatchOS.getter();
  v80 = StandardMapData.makePunchoutURI(includeLabel:)((v32 & 1) == 0);
  v81 = v33;
  static CharacterSet.urlQueryAllowed.getter();
  lazy protocol witness table accessor for type String and conformance String();
  StringProtocol.addingPercentEncoding(withAllowedCharacters:)();
  v35 = v34;
  (*(void (**)(char *, uint64_t))(v76 + 8))(v14, v77);
  swift_bridgeObjectRelease();
  if (v35)
  {
    URL.init(string:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v36 = v79;
  }
  else
  {
    v36 = v79;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v17, 1, 1, v79);
    swift_bridgeObjectRelease();
  }
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48))(v17, 1, v36);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v38 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
    v39 = v78;
    v38(v78, v17, v36);
    v40 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
    v58 = v18;
    v41 = v59;
    v40(v59, v39, v36);
    v42 = v62;
    outlined init with copy of WhereAmIView((uint64_t)v2, v62);
    v43 = (*(unsigned __int8 *)(v18 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
    v44 = (v19 + *(unsigned __int8 *)(v60 + 80) + v43) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80);
    v45 = swift_allocObject();
    v38((char *)(v45 + v43), v41, v36);
    outlined init with take of WhereAmIView(v42, v45 + v44);
    v46 = v63;
    ButtonContainerView.init(buttons:)();
    v47 = v64;
    static PrimitiveButtonStyle<>.rfButton.getter();
    v48 = lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type ButtonContainerView and conformance ButtonContainerView, (uint64_t (*)(uint64_t))MEMORY[0x24BEADF00], MEMORY[0x24BEADEE0]);
    v49 = lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type RFButtonStyle and conformance RFButtonStyle, (uint64_t (*)(uint64_t))MEMORY[0x24BEADB80], MEMORY[0x24BEADB78]);
    v50 = v68;
    v51 = v66;
    v52 = v71;
    View.buttonStyle<A>(_:)();
    (*(void (**)(char *, uint64_t))(v67 + 8))(v47, v52);
    (*(void (**)(char *, unint64_t))(v65 + 8))(v46, v51);
    v54 = v74;
    v53 = v75;
    v55 = v72;
    (*(void (**)(char *, _QWORD, uint64_t))(v74 + 104))(v72, *MEMORY[0x24BEAB510], v75);
    v80 = v51;
    v81 = v52;
    v82 = v48;
    v83 = v49;
    swift_getOpaqueTypeConformance2();
    v56 = v70;
    View.separators(_:isOverride:)();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v55, v53);
    (*(void (**)(char *, uint64_t))(v69 + 8))(v50, v56);
    (*(void (**)(char *, uint64_t))(v58 + 8))(v78, v79);
    return swift_release();
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242630860]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for WhereAmIView()
{
  uint64_t result;

  result = type metadata singleton initialization cache for WhereAmIView;
  if (!type metadata singleton initialization cache for WhereAmIView)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t closure #1 in WhereAmIView.shareButton.getter(uint64_t a1, uint64_t a2)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t KeyPath;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  unint64_t v66;

  v51 = a1;
  v52 = a2;
  v2 = type metadata accessor for Locale();
  v62 = *(_QWORD *)(v2 - 8);
  v63 = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v48 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v64 = (char *)&v48 - v5;
  v6 = type metadata accessor for ButtonItemButtonStyle.Role();
  v53 = *(_QWORD *)(v6 - 8);
  v54 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for WhereAmIView();
  v49 = *(_QWORD *)(v9 - 8);
  v10 = *(_QWORD *)(v49 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for URL();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ShareLink<CollectionOfOne<URL>, Never, Never, DefaultShareLinkLabel>);
  v50 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.buttonRole(_:)>>.0);
  v57 = *(_QWORD *)(v19 - 8);
  v58 = v19;
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v48 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.buttonRole(_:)>>.0, _EnvironmentKeyWritingModifier<Locale>>);
  MEMORY[0x24BDAC7A8](v60);
  v23 = (char *)&v48 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.privacySensitive(_:)>>.0);
  v59 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v56 = (char *)&v48 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AnyView>);
  v55 = swift_allocObject();
  *(_OWORD *)(v55 + 16) = xmmword_23CCA3820;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v51, v12);
  outlined init with copy of WhereAmIView(v52, (uint64_t)v11);
  v25 = (*(unsigned __int8 *)(v49 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
  v26 = swift_allocObject();
  outlined init with take of WhereAmIView((uint64_t)v11, v26 + v25);
  ShareLink<>.init<>(item:subject:message:onPresentationChanged:)();
  v28 = v53;
  v27 = v54;
  (*(void (**)(char *, _QWORD, uint64_t))(v53 + 104))(v8, *MEMORY[0x24BEAD980], v54);
  lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type ShareLink<CollectionOfOne<URL>, Never, Never, DefaultShareLinkLabel> and conformance ShareLink<A, B, C, D>, &demangling cache variable for type metadata for ShareLink<CollectionOfOne<URL>, Never, Never, DefaultShareLinkLabel>, MEMORY[0x24BDF5350]);
  View.buttonRole(_:)();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v8, v27);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v18, v16);
  KeyPath = swift_getKeyPath();
  v30 = objc_msgSend((id)objc_opt_self(), sel_sharedPreferences);
  v31 = objc_msgSend(v30, sel_languageCode);

  if (v31)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    v33 = v62;
    v32 = v63;
  }
  else
  {
    v34 = v48;
    static Locale.current.getter();
    Locale.identifier.getter();
    v33 = v62;
    v35 = v34;
    v32 = v63;
    (*(void (**)(char *, uint64_t))(v62 + 8))(v35, v63);
  }
  v36 = v64;
  Locale.init(identifier:)();
  v37 = v60;
  v38 = (uint64_t *)&v23[*(int *)(v60 + 36)];
  v39 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<Locale>);
  (*(void (**)(char *, char *, uint64_t))(v33 + 16))((char *)v38 + *(int *)(v39 + 28), v36, v32);
  *v38 = KeyPath;
  v41 = v57;
  v40 = v58;
  (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v23, v21, v58);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v36, v32);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v21, v40);
  v42 = lazy protocol witness table accessor for type ModifiedContent<<<opaque return type of View.buttonRole(_:)>>.0, _EnvironmentKeyWritingModifier<Locale>> and conformance <> ModifiedContent<A, B>();
  v43 = v56;
  View.privacySensitive(_:)();
  outlined destroy of Environment<Locale>.Content((uint64_t)v23, &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.buttonRole(_:)>>.0, _EnvironmentKeyWritingModifier<Locale>>);
  v65 = v37;
  v66 = v42;
  swift_getOpaqueTypeConformance2();
  v44 = v61;
  v45 = View.eraseToAnyView()();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v43, v44);
  v46 = v55;
  *(_QWORD *)(v55 + 32) = v45;
  v65 = v46;
  specialized Array._endMutation()();
  return v65;
}

void closure #1 in closure #1 in WhereAmIView.shareButton.getter(char a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a2 + *(int *)(type metadata accessor for WhereAmIView() + 40));
  if ((a1 & 1) != 0)
  {
    if (v3)
    {
      v4 = v3;
      dispatch thunk of Context.willBeginEditing()();
LABEL_6:

      return;
    }
  }
  else if (v3)
  {
    v4 = v3;
    dispatch thunk of Context.didEndEditing()();
    goto LABEL_6;
  }
  type metadata accessor for Context();
  lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type Context and conformance Context, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE578], MEMORY[0x24BEAE528]);
  EnvironmentObject.error()();
  __break(1u);
}

uint64_t key path getter for EnvironmentValues.locale : EnvironmentValues()
{
  return EnvironmentValues.locale.getter();
}

uint64_t key path setter for EnvironmentValues.locale : EnvironmentValues(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = type metadata accessor for Locale();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return EnvironmentValues.locale.setter();
}

uint64_t WhereAmIView.header.getter()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return PrimaryHeaderRichView.init(text1:text2:text3:text4:thumbnail:addTint:)();
}

uint64_t WhereAmIView.body.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v1 = type metadata accessor for WhereAmIView();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  outlined init with copy of WhereAmIView(v0, (uint64_t)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  outlined init with take of WhereAmIView((uint64_t)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)>);
  v7 = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>, &demangling cache variable for type metadata for TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)>, MEMORY[0x24BDF5420]);
  return MEMORY[0x2426301E8](partial apply for closure #1 in WhereAmIView.body.getter, v5, v6, v7);
}

uint64_t closure #1 in WhereAmIView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t);
  uint64_t v43;
  uint64_t (*v44)(uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t OpaqueTypeConformance2;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(char *, char *, uint64_t);
  uint64_t v55;
  char *v56;
  void (*v57)(char *, char *, uint64_t);
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(char *, uint64_t);
  void (*v63)(char *, uint64_t);
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;

  v72 = a1;
  v83 = a2;
  v2 = type metadata accessor for SeparatorStyle();
  v75 = *(_QWORD *)(v2 - 8);
  v76 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v74 = (char *)&v65 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.separators(_:isOverride:)>>.0);
  v82 = *(_QWORD *)(v80 - 8);
  MEMORY[0x24BDAC7A8](v80);
  v73 = (uint64_t)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.separators(_:isOverride:)>>.0);
  v88 = *(_QWORD *)(v81 - 8);
  v5 = MEMORY[0x24BDAC7A8](v81);
  v77 = (char *)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v86 = (char *)&v65 - v7;
  v79 = type metadata accessor for PrimaryHeaderRichView();
  v87 = *(_QWORD *)(v79 - 8);
  v8 = MEMORY[0x24BDAC7A8](v79);
  v78 = (char *)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v89 = (char *)&v65 - v10;
  v71 = type metadata accessor for WhereAmIView();
  v66 = *(_QWORD *)(v71 - 8);
  v11 = *(_QWORD *)(v66 + 64);
  MEMORY[0x24BDAC7A8](v71);
  v12 = type metadata accessor for MapAspectRatio();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for MapView();
  v67 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v65 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.onTapGesture(count:perform:)>>.0);
  v68 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v65 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.mapScope(_:)>>.0);
  v69 = *(_QWORD *)(v70 - 8);
  MEMORY[0x24BDAC7A8](v70);
  v23 = (char *)&v65 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v84 = (uint64_t)&v65 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v25);
  v85 = (uint64_t)&v65 - v27;
  (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BEADC58], v12);
  MapView.init(markers:annotations:mapItemIdentifiers:polyline:aspectRatio:cameraDistance:showsUserLocation:)();
  outlined init with copy of WhereAmIView(v72, (uint64_t)&v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v28 = (*(unsigned __int8 *)(v66 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80);
  v29 = swift_allocObject();
  outlined init with take of WhereAmIView((uint64_t)&v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v29 + v28);
  v30 = lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type MapView and conformance MapView, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE5A8], MEMORY[0x24BEAE598]);
  View.onTapGesture(count:perform:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v67 + 8))(v18, v16);
  Namespace.wrappedValue.getter();
  v90 = v16;
  v91 = v30;
  swift_getOpaqueTypeConformance2();
  View.mapScope(_:)();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v21, v19);
  v31 = static Alignment.center.getter();
  v32 = v84;
  v34 = specialized View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, v84, 0.0, 1, 157.0, 0, v31, v33);
  (*(void (**)(char *, uint64_t, double))(v69 + 8))(v23, v70, v34);
  v35 = v85;
  outlined init with take of ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>(v32, v85);
  WhereAmIView.header.getter();
  v36 = v73;
  WhereAmIView.shareButton.getter(v73);
  v38 = v74;
  v37 = v75;
  v39 = v76;
  (*(void (**)(char *, _QWORD, uint64_t))(v75 + 104))(v74, *MEMORY[0x24BEAB510], v76);
  v40 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for <<opaque return type of View.buttonStyle<A>(_:)>>.0);
  v41 = type metadata accessor for ButtonContainerView();
  v42 = (uint64_t (*)(uint64_t))MEMORY[0x24BEADF00];
  v43 = type metadata accessor for RFButtonStyle();
  v44 = (uint64_t (*)(uint64_t))MEMORY[0x24BEADB80];
  v45 = lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type ButtonContainerView and conformance ButtonContainerView, v42, MEMORY[0x24BEADEE0]);
  v46 = lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type RFButtonStyle and conformance RFButtonStyle, v44, MEMORY[0x24BEADB78]);
  v90 = v41;
  v91 = v43;
  v92 = v45;
  v93 = v46;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v90 = v40;
  v91 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  v48 = v77;
  v49 = v80;
  View.separators(_:isOverride:)();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v38, v39);
  (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v36, v49);
  v50 = v88;
  v51 = v86;
  v52 = v81;
  (*(void (**)(char *, char *, uint64_t))(v88 + 32))(v86, v48, v81);
  v53 = v84;
  outlined init with copy of Environment<ColorScheme>.Content(v35, v84, &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>);
  v54 = *(void (**)(char *, char *, uint64_t))(v87 + 16);
  v56 = v78;
  v55 = v79;
  v54(v78, v89, v79);
  v57 = *(void (**)(char *, char *, uint64_t))(v50 + 16);
  v58 = v51;
  v59 = v52;
  v57(v48, v58, v52);
  v60 = v83;
  outlined init with copy of Environment<ColorScheme>.Content(v53, v83, &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>);
  v61 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0));
  v54((char *)(v60 + *(int *)(v61 + 48)), v56, v55);
  v57((char *)(v60 + *(int *)(v61 + 64)), v48, v59);
  v62 = *(void (**)(char *, uint64_t))(v88 + 8);
  v62(v86, v59);
  v63 = *(void (**)(char *, uint64_t))(v87 + 8);
  v63(v89, v55);
  outlined destroy of Environment<Locale>.Content(v85, &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>);
  v62(v48, v59);
  v63(v56, v55);
  return outlined destroy of Environment<Locale>.Content(v53, &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>);
}

uint64_t closure #1 in closure #1 in WhereAmIView.body.getter(_QWORD *a1)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for InteractionType?);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ActionProperty?);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for StandardActionHandler?);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for WhereAmIView();
  ActionHandler.wrappedValue.getter();
  v12 = type metadata accessor for StandardActionHandler();
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12) == 1)
    return outlined destroy of Environment<Locale>.Content((uint64_t)v10, &demangling cache variable for type metadata for StandardActionHandler?);
  v31 = v7;
  v34 = v13;
  v35 = v12;
  v36 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ActionElementConvertible>);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_23CCA3820;
  v16 = type metadata accessor for Command();
  v17 = MEMORY[0x24BEAD1F0];
  v33 = v16;
  *(_QWORD *)(v15 + 56) = v16;
  *(_QWORD *)(v15 + 64) = v17;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v15 + 32));
  v18 = a1[6];
  v19 = a1[7];
  v20 = a1[8];
  v21 = a1[9];
  v22 = (char *)a1 + *(int *)(v11 + 36);
  v23 = *(_QWORD *)v22;
  v24 = v22[8];
  swift_bridgeObjectRetain();
  outlined copy of Environment<VRXIdiom>.Content(v23, v24);
  specialized Environment.wrappedValue.getter(v23, v24);
  outlined consume of Environment<VRXIdiom>.Content(v23, v24);
  v37 = v18;
  v38 = v19;
  v39 = v20;
  v40 = v21;
  v25 = VRXIdiom.isWatchOS.getter();
  StandardMapData.makePunchoutURI(includeLabel:)((v25 & 1) == 0);
  if (one-time initialization token for appName != -1)
    swift_once();
  swift_bridgeObjectRetain();
  v26 = boxed_opaque_existential_1;
  AppPunchout.init(punchOutUri:bundleId:appDisplayName:)();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t *, _QWORD))(*(_QWORD *)(v33 - 8) + 104))(v26, *MEMORY[0x24BEAD190]);
  v27 = (uint64_t)v31;
  ActionProperty.init(_:)();
  v28 = type metadata accessor for ActionProperty();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v27, 0, 1, v28);
  v29 = type metadata accessor for InteractionType();
  v30 = (uint64_t)v36;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v36, 1, 1, v29);
  StandardActionHandler.perform(_:interactionType:)();
  outlined destroy of Environment<Locale>.Content(v30, &demangling cache variable for type metadata for InteractionType?);
  outlined destroy of Environment<Locale>.Content(v27, &demangling cache variable for type metadata for ActionProperty?);
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v10, v35);
}

uint64_t WhereAmIView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t result;
  uint64_t v12;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_QWORD *)(a2 + 16) = v3;
  *(_QWORD *)(a2 + 24) = v4;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_QWORD *)(a2 + 48) = v5;
  *(_QWORD *)(a2 + 56) = v6;
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  type metadata accessor for RFMapMarker(0, (unint64_t *)&lazy cache variable for type metadata for OS_os_log);
  *(_QWORD *)(a2 + 80) = OS_os_log.init(subsystem:category:)();
  v7 = (int *)type metadata accessor for WhereAmIView();
  ActionHandler.init()();
  *(_QWORD *)(a2 + v7[7]) = 0;
  v8 = (uint64_t *)(a2 + v7[8]);
  *v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<Locale>.Content);
  swift_storeEnumTagMultiPayload();
  v9 = a2 + v7[9];
  *(_QWORD *)v9 = swift_getKeyPath();
  *(_BYTE *)(v9 + 8) = 0;
  v10 = (uint64_t *)(a2 + v7[10]);
  type metadata accessor for Context();
  lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type Context and conformance Context, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE578], MEMORY[0x24BEAE528]);
  result = EnvironmentObject.init()();
  *v10 = result;
  v10[1] = v12;
  return result;
}

uint64_t key path getter for EnvironmentValues.currentIdiom : EnvironmentValues@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.currentIdiom.getter();
  *a1 = result;
  return result;
}

uint64_t key path setter for EnvironmentValues.currentIdiom : EnvironmentValues()
{
  return EnvironmentValues.currentIdiom.setter();
}

uint64_t protocol witness for static View._viewListCount(inputs:) in conformance WhereAmIView()
{
  return static View._viewListCount(inputs:)();
}

uint64_t protocol witness for View.body.getter in conformance WhereAmIView(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](a1);
  outlined init with copy of WhereAmIView(v1, (uint64_t)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  outlined init with take of WhereAmIView((uint64_t)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)>);
  v7 = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>, &demangling cache variable for type metadata for TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)>, MEMORY[0x24BDF5420]);
  return MEMORY[0x2426301E8](partial apply for closure #1 in WhereAmIView.body.getter, v5, v6, v7);
}

uint64_t static WhereAmIView_Previews.previews.getter()
{
  if (one-time initialization token for myLocation != -1)
    swift_once();
  type metadata accessor for WhereAmIView();
  lazy protocol witness table accessor for type GeoDataModels.WhereAmIDataModel and conformance GeoDataModels.WhereAmIDataModel();
  lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type WhereAmIView and conformance WhereAmIView, (uint64_t (*)(uint64_t))type metadata accessor for WhereAmIView, (uint64_t)&protocol conformance descriptor for WhereAmIView);
  swift_bridgeObjectRetain();
  return SnippetPreview.init(snippetModel:content:)();
}

uint64_t implicit closure #1 in static WhereAmIView_Previews.previews.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t result;
  uint64_t v11;

  v4 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)a2 = *(_QWORD *)a1;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 8);
  *(_QWORD *)(a2 + 24) = v4;
  *(_QWORD *)(a2 + 32) = v3;
  *(_OWORD *)(a2 + 40) = *(_OWORD *)(a1 + 40);
  *(_QWORD *)(a2 + 56) = v5;
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  type metadata accessor for RFMapMarker(0, (unint64_t *)&lazy cache variable for type metadata for OS_os_log);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  *(_QWORD *)(a2 + 80) = OS_os_log.init(subsystem:category:)();
  v6 = (int *)type metadata accessor for WhereAmIView();
  ActionHandler.init()();
  *(_QWORD *)(a2 + v6[7]) = 0;
  v7 = (uint64_t *)(a2 + v6[8]);
  *v7 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<Locale>.Content);
  swift_storeEnumTagMultiPayload();
  v8 = a2 + v6[9];
  *(_QWORD *)v8 = swift_getKeyPath();
  *(_BYTE *)(v8 + 8) = 0;
  v9 = (uint64_t *)(a2 + v6[10]);
  type metadata accessor for Context();
  lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type Context and conformance Context, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE578], MEMORY[0x24BEAE528]);
  result = EnvironmentObject.init()();
  *v9 = result;
  v9[1] = v11;
  return result;
}

uint64_t protocol witness for static _PreviewProvider._previews.getter in conformance WhereAmIView_Previews()
{
  lazy protocol witness table accessor for type WhereAmIView_Previews and conformance WhereAmIView_Previews();
  return static PreviewProvider._previews.getter();
}

uint64_t protocol witness for static _PreviewProvider._platform.getter in conformance WhereAmIView_Previews()
{
  lazy protocol witness table accessor for type WhereAmIView_Previews and conformance WhereAmIView_Previews();
  return static PreviewProvider._platform.getter();
}

double one-time initialization function for myLocation()
{
  double result;

  myLocation.label._countAndFlagsBits = 0xD000000000000010;
  myLocation.label._object = (void *)0x800000023CCA67B0;
  result = 37.3349;
  *(_OWORD *)&myLocation.latitude = xmmword_23CCA3830;
  return result;
}

uint64_t default argument 0 of View.avatarShadows(style:)@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for default != -1)
    swift_once();
  return outlined init with copy of AvatarBubbleShadowStyle((uint64_t)&static AvatarBubbleShadowStyle.default, a1);
}

uint64_t default argument 1 of static AvatarView_PreviewProvider.bubbleView(showTail:isLive:style:)()
{
  return 0;
}

double default argument 2 of static AvatarView_PreviewProvider.bubbleView(showTail:isLive:style:)()
{
  if (one-time initialization token for default != -1)
    swift_once();
  return *(double *)&sc.displayName._countAndFlagsBits;
}

uint64_t default argument 1 of static AvatarView_PreviewProvider.preview<A>(showTail:isLive:style:strokeColor:content:)()
{
  return 0;
}

uint64_t default argument 3 of static AvatarView_PreviewProvider.preview<A>(showTail:isLive:style:strokeColor:content:)()
{
  if (one-time initialization token for avatarStrokeColor != -1)
    swift_once();
  return swift_retain();
}

double default argument 2 of static AvatarView_PreviewProvider.preview<A>(showTail:isLive:style:strokeColor:content:)()
{
  if (one-time initialization token for default != -1)
    swift_once();
  return *(double *)&sc.displayName._countAndFlagsBits;
}

uint64_t specialized Environment.wrappedValue.getter(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v4 = type metadata accessor for EnvironmentValues();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) == 0)
  {
    swift_retain();
    v8 = static os_log_type_t.fault.getter();
    v9 = static Log.runtimeIssuesLog.getter();
    if (os_log_type_enabled(v9, v8))
    {
      v10 = swift_slowAlloc();
      v11 = swift_slowAlloc();
      v14 = v11;
      *(_DWORD *)v10 = 136315138;
      *(_QWORD *)(v10 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0x6D6F696449585256, 0xE800000000000000, &v14);
      _os_log_impl(&dword_23CC7E000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2426308F0](v11, -1, -1);
      MEMORY[0x2426308F0](v10, -1, -1);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath();
    outlined consume of Environment<VRXIdiom>.Content(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v14;
  }
  return a1;
}

uint64_t outlined copy of Environment<VRXIdiom>.Content(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_retain();
  return result;
}

uint64_t outlined consume of Environment<VRXIdiom>.Content(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_release();
  return result;
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    result = MEMORY[0x242630878](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

uint64_t outlined init with copy of WhereAmIView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for WhereAmIView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23CC82F40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = type metadata accessor for URL();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = (int *)type metadata accessor for WhereAmIView();
  v6 = *(unsigned __int8 *)(*((_QWORD *)v5 - 1) + 80);
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  v7 = v0 + ((v3 + v4 + v6) & ~v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v8 = v7 + v5[6];
  v9 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = v7 + v5[8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<Locale>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = type metadata accessor for Locale();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  }
  else
  {
    swift_release();
  }
  outlined consume of Environment<VRXIdiom>.Content(*(_QWORD *)(v7 + v5[9]), *(_BYTE *)(v7 + v5[9] + 8));

  return swift_deallocObject();
}

uint64_t outlined init with take of WhereAmIView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for WhereAmIView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in WhereAmIView.shareButton.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(type metadata accessor for URL() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for WhereAmIView() - 8) + 80);
  return closure #1 in WhereAmIView.shareButton.getter(v0 + v2, v0 + ((v2 + v3 + v4) & ~v4));
}

uint64_t specialized Environment.wrappedValue.getter@<X0>(uint64_t a1@<X8>)
{
  return specialized Environment.wrappedValue.getter(&demangling cache variable for type metadata for Environment<ColorScheme>.Content, (uint64_t (*)(_QWORD))MEMORY[0x24BDEB420], 0x686353726F6C6F43, 0xEB00000000656D65, a1);
}

{
  return specialized Environment.wrappedValue.getter(&demangling cache variable for type metadata for Environment<LayoutDirection>.Content, (uint64_t (*)(_QWORD))MEMORY[0x24BDED138], 0x694474756F79614CLL, 0xEF6E6F6974636572, a1);
}

uint64_t specialized Environment.wrappedValue.getter@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  os_log_type_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;

  v24 = a4;
  v9 = v5;
  v11 = type metadata accessor for EnvironmentValues();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of Environment<ColorScheme>.Content(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    v20 = static os_log_type_t.fault.getter();
    v21 = static Log.runtimeIssuesLog.getter();
    if (os_log_type_enabled(v21, v20))
    {
      v22 = swift_slowAlloc();
      v23 = swift_slowAlloc();
      v25 = v23;
      *(_DWORD *)v22 = 136315138;
      *(_QWORD *)(v22 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a3, v24, &v25);
      _os_log_impl(&dword_23CC7E000, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2426308F0](v23, -1, -1);
      MEMORY[0x2426308F0](v22, -1, -1);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t serialize(_:at:)(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24263086C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for RFMapMarker(uint64_t a1, unint64_t *a2)
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

unint64_t lazy protocol witness table accessor for type GeoDataModels.WhereAmIDataModel and conformance GeoDataModels.WhereAmIDataModel()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel and conformance GeoDataModels.WhereAmIDataModel;
  if (!lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel and conformance GeoDataModels.WhereAmIDataModel)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.WhereAmIDataModel, &type metadata for GeoDataModels.WhereAmIDataModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel and conformance GeoDataModels.WhereAmIDataModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel and conformance GeoDataModels.WhereAmIDataModel;
  if (!lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel and conformance GeoDataModels.WhereAmIDataModel)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.WhereAmIDataModel, &type metadata for GeoDataModels.WhereAmIDataModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel and conformance GeoDataModels.WhereAmIDataModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel and conformance GeoDataModels.WhereAmIDataModel;
  if (!lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel and conformance GeoDataModels.WhereAmIDataModel)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.WhereAmIDataModel, &type metadata for GeoDataModels.WhereAmIDataModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel and conformance GeoDataModels.WhereAmIDataModel);
  }
  return result;
}

uint64_t outlined init with copy of AvatarBubbleShadowStyle(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for AvatarBubbleShadowStyle(a2, a1);
  return a2;
}

uint64_t associated type witness table accessor for View.Body : View in WhereAmIView()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t lazy protocol witness table accessor for type WhereAmIView_Previews and conformance WhereAmIView_Previews()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type WhereAmIView_Previews and conformance WhereAmIView_Previews;
  if (!lazy protocol witness table cache variable for type WhereAmIView_Previews and conformance WhereAmIView_Previews)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for WhereAmIView_Previews, &type metadata for WhereAmIView_Previews);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type WhereAmIView_Previews and conformance WhereAmIView_Previews);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type WhereAmIView_Previews and conformance WhereAmIView_Previews;
  if (!lazy protocol witness table cache variable for type WhereAmIView_Previews and conformance WhereAmIView_Previews)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for WhereAmIView_Previews, &type metadata for WhereAmIView_Previews);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type WhereAmIView_Previews and conformance WhereAmIView_Previews);
  }
  return result;
}

uint64_t associated type witness table accessor for PreviewProvider.Previews : View in WhereAmIView_Previews()
{
  return swift_getOpaqueTypeConformance2();
}

_QWORD *initializeBufferWithCopyOfBuffer for WhereAmIView(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  id v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v33;
  uint64_t v34;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v20 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    v8 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v8;
    v9 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v9;
    v10 = a2[7];
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_QWORD *)(a1 + 56) = v10;
    *(_OWORD *)(a1 + 64) = *((_OWORD *)a2 + 4);
    v11 = (void *)a2[10];
    v12 = a3[6];
    v33 = (uint64_t)a2 + v12;
    v34 = a1 + v12;
    *(_QWORD *)(a1 + 80) = v11;
    v13 = type metadata accessor for ActionHandler();
    v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15 = v11;
    v14(v34, v33, v13);
    v16 = a3[8];
    *(_QWORD *)((char *)v4 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    v17 = (_QWORD *)((char *)v4 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<Locale>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v19 = type metadata accessor for Locale();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
    }
    else
    {
      *v17 = *v18;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v21 = a3[9];
    v22 = (char *)v4 + v21;
    v23 = (uint64_t)a2 + v21;
    v24 = *(_QWORD *)v23;
    v25 = *(_BYTE *)(v23 + 8);
    outlined copy of Environment<VRXIdiom>.Content(*(_QWORD *)v23, v25);
    *(_QWORD *)v22 = v24;
    v22[8] = v25;
    v26 = a3[10];
    v27 = (_QWORD *)((char *)v4 + v26);
    v28 = (uint64_t)a2 + v26;
    v30 = *(void **)v28;
    v29 = *(_QWORD *)(v28 + 8);
    *v27 = v30;
    v27[1] = v29;
    v31 = v30;
  }
  return v4;
}

void destroy for WhereAmIView(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v4 = a1 + a2[6];
  v5 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = a1 + a2[8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<Locale>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = type metadata accessor for Locale();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  outlined consume of Environment<VRXIdiom>.Content(*(_QWORD *)(a1 + a2[9]), *(_BYTE *)(a1 + a2[9] + 8));

}

uint64_t initializeWithCopy for WhereAmIView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  id v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v31;
  uint64_t v32;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  v8 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  v9 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v9;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  v10 = *(void **)(a2 + 80);
  v11 = a3[6];
  v31 = a2 + v11;
  v32 = a1 + v11;
  *(_QWORD *)(a1 + 80) = v10;
  v12 = type metadata accessor for ActionHandler();
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14 = v10;
  v13(v32, v31, v12);
  v15 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<Locale>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v18 = type metadata accessor for Locale();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
  }
  else
  {
    *v16 = *v17;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v19 = a3[9];
  v20 = a1 + v19;
  v21 = a2 + v19;
  v22 = *(_QWORD *)v21;
  v23 = *(_BYTE *)(v21 + 8);
  outlined copy of Environment<VRXIdiom>.Content(*(_QWORD *)v21, v23);
  *(_QWORD *)v20 = v22;
  *(_BYTE *)(v20 + 8) = v23;
  v24 = a3[10];
  v25 = (_QWORD *)(a1 + v24);
  v26 = a2 + v24;
  v28 = *(void **)v26;
  v27 = *(_QWORD *)(v26 + 8);
  *v25 = v28;
  v25[1] = v27;
  v29 = v28;
  return a1;
}

_QWORD *assignWithCopy for WhereAmIView(_QWORD *a1, _QWORD *a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  _QWORD *v25;
  char *v26;
  void *v27;
  void *v28;
  id v29;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  v6 = (void *)a2[10];
  v7 = (void *)a1[10];
  a1[10] = v6;
  v8 = v6;

  v9 = a3[6];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = type metadata accessor for ActionHandler();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  if (a1 != a2)
  {
    v13 = a3[8];
    v14 = (_QWORD *)((char *)a1 + v13);
    v15 = (_QWORD *)((char *)a2 + v13);
    outlined destroy of Environment<Locale>.Content((uint64_t)a1 + v13, &demangling cache variable for type metadata for Environment<Locale>.Content);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<Locale>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v16 = type metadata accessor for Locale();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    }
    else
    {
      *v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v17 = a3[9];
  v18 = (char *)a1 + v17;
  v19 = (char *)a2 + v17;
  v20 = *(_QWORD *)v19;
  v21 = v19[8];
  outlined copy of Environment<VRXIdiom>.Content(*(_QWORD *)v19, v21);
  v22 = *(_QWORD *)v18;
  v23 = v18[8];
  *(_QWORD *)v18 = v20;
  v18[8] = v21;
  outlined consume of Environment<VRXIdiom>.Content(v22, v23);
  v24 = a3[10];
  v25 = (_QWORD *)((char *)a1 + v24);
  v26 = (char *)a2 + v24;
  v27 = *(void **)((char *)a1 + v24);
  v28 = *(void **)v26;
  *v25 = *(_QWORD *)v26;
  v29 = v28;

  v25[1] = *((_QWORD *)v26 + 1);
  return a1;
}

uint64_t initializeWithTake for WhereAmIView(uint64_t a1, __int128 *a2, int *a3)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v6 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v6;
  *(_OWORD *)(a1 + 64) = a2[4];
  v8 = *a2;
  v7 = a2[1];
  *(_QWORD *)(a1 + 80) = *((_QWORD *)a2 + 10);
  v9 = a3[6];
  v10 = a1 + v9;
  v11 = (uint64_t)a2 + v9;
  *(_OWORD *)a1 = v8;
  *(_OWORD *)(a1 + 16) = v7;
  v12 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  v13 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  v14 = (void *)(a1 + v13);
  v15 = (char *)a2 + v13;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<Locale>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v17 = type metadata accessor for Locale();
    (*(void (**)(void *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v14, v15, v17);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  v18 = a3[9];
  v19 = a3[10];
  v20 = a1 + v18;
  v21 = (uint64_t)a2 + v18;
  *(_QWORD *)v20 = *(_QWORD *)v21;
  *(_BYTE *)(v20 + 8) = *(_BYTE *)(v21 + 8);
  *(_OWORD *)(a1 + v19) = *(__int128 *)((char *)a2 + v19);
  return a1;
}

uint64_t assignWithTake for WhereAmIView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  void *v29;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v9;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  v10 = *(void **)(a1 + 80);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);

  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  if (a1 != a2)
  {
    v15 = a3[8];
    v16 = (void *)(a1 + v15);
    v17 = (const void *)(a2 + v15);
    outlined destroy of Environment<Locale>.Content(a1 + v15, &demangling cache variable for type metadata for Environment<Locale>.Content);
    v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<Locale>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v19 = type metadata accessor for Locale();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v16, v17, v19);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
  }
  v20 = a3[9];
  v21 = a1 + v20;
  v22 = (uint64_t *)(a2 + v20);
  v23 = *v22;
  LOBYTE(v22) = *((_BYTE *)v22 + 8);
  v24 = *(_QWORD *)v21;
  v25 = *(_BYTE *)(v21 + 8);
  *(_QWORD *)v21 = v23;
  *(_BYTE *)(v21 + 8) = (_BYTE)v22;
  outlined consume of Environment<VRXIdiom>.Content(v24, v25);
  v26 = a3[10];
  v27 = (_QWORD *)(a1 + v26);
  v28 = (_QWORD *)(a2 + v26);
  v29 = *(void **)(a1 + v26);
  *v27 = *v28;

  v27[1] = v28[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for WhereAmIView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CC83E30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for ActionHandler();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 24);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<Locale>);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 32);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for WhereAmIView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CC83EE0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 24) = (a2 - 1);
  }
  else
  {
    v8 = type metadata accessor for ActionHandler();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 24);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<Locale>);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 32);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

void type metadata completion function for WhereAmIView()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for ActionHandler();
  if (v0 <= 0x3F)
  {
    type metadata accessor for Environment<Locale>.Content();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void type metadata accessor for Environment<Locale>.Content()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for Environment<Locale>.Content)
  {
    type metadata accessor for Locale();
    v0 = type metadata accessor for Environment.Content();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Environment<Locale>.Content);
  }
}

ValueMetadata *type metadata accessor for WhereAmIView_Previews()
{
  return &type metadata for WhereAmIView_Previews;
}

uint64_t sub_23CC840A0()
{
  return lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type MapView and conformance MapView, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE5A8], MEMORY[0x24BEAE598]);
}

uint64_t sub_23CC840CC()
{
  uint64_t (*v0)(uint64_t);
  uint64_t (*v1)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for <<opaque return type of View.buttonStyle<A>(_:)>>.0);
  type metadata accessor for ButtonContainerView();
  v0 = (uint64_t (*)(uint64_t))MEMORY[0x24BEADF00];
  type metadata accessor for RFButtonStyle();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x24BEADB80];
  lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type ButtonContainerView and conformance ButtonContainerView, v0, MEMORY[0x24BEADEE0]);
  lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type RFButtonStyle and conformance RFButtonStyle, v1, MEMORY[0x24BEADB78]);
  swift_getOpaqueTypeConformance2();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23CC8419C()
{
  return lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type PrimaryHeaderRichView and conformance PrimaryHeaderRichView, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE048], MEMORY[0x24BEAE030]);
}

uint64_t lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x242630878](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23CC84208()
{
  return lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type ComponentStack<TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)>> and conformance ComponentStack<A>, &demangling cache variable for type metadata for ComponentStack<TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)>>, MEMORY[0x24BEADBF8]);
}

uint64_t sub_23CC84234()
{
  return lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type SnippetPreview<GeoDataModels.WhereAmIDataModel, WhereAmIView> and conformance SnippetPreview<A, B>, &demangling cache variable for type metadata for SnippetPreview<GeoDataModels.WhereAmIDataModel, WhereAmIView>, MEMORY[0x24BEAD9E8]);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  type metadata accessor for CGPoint(a1, &lazy cache variable for type metadata for CGPoint);
}

uint64_t getEnumTagSinglePayload for CGSize(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CGSize(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  type metadata accessor for CGPoint(a1, &lazy cache variable for type metadata for CGSize);
}

void type metadata accessor for VRXIdiom(uint64_t a1)
{
  type metadata accessor for CGPoint(a1, &lazy cache variable for type metadata for VRXIdiom);
}

void type metadata accessor for CGPoint(uint64_t a1, unint64_t *a2)
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

uint64_t partial apply for closure #1 in WhereAmIView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for WhereAmIView() - 8) + 80);
  return closure #1 in WhereAmIView.body.getter(v1 + ((v3 + 16) & ~v3), a1);
}

unint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12[3];
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

unint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  unint64_t result;
  uint64_t v10;
  unint64_t v11;
  _QWORD v12[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          result = 0;
          *((_BYTE *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
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
    result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    result = _StringObject.sharedUTF8.getter();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
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

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  char v5;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_9;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
      result = _StringGuts.copyUTF8(into:)();
      if ((v5 & 1) != 0)
        break;
      if (result == v2)
        return (uint64_t)v3;
      __break(1u);
LABEL_9:
      v2 = String.UTF8View._foreignCount()();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
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

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t partial apply for closure #1 in closure #1 in WhereAmIView.body.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for WhereAmIView() - 8) + 80);
  return closure #1 in closure #1 in WhereAmIView.body.getter((_QWORD *)(v0 + ((v1 + 16) & ~v1)));
}

uint64_t outlined init with take of ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of Environment<ColorScheme>.Content(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
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

uint64_t objectdestroy_2Tm()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (int *)type metadata accessor for WhereAmIView();
  v2 = *(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v4 = v3 + v1[6];
  v5 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = v3 + v1[8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<Locale>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = type metadata accessor for Locale();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  outlined consume of Environment<VRXIdiom>.Content(*(_QWORD *)(v3 + v1[9]), *(_BYTE *)(v3 + v1[9] + 8));

  return swift_deallocObject();
}

void partial apply for closure #1 in closure #1 in WhereAmIView.shareButton.getter(char a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for WhereAmIView() - 8) + 80);
  closure #1 in closure #1 in WhereAmIView.shareButton.getter(a1, v1 + ((v3 + 16) & ~v3));
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<<<opaque return type of View.buttonRole(_:)>>.0, _EnvironmentKeyWritingModifier<Locale>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = lazy protocol witness table cache variable for type ModifiedContent<<<opaque return type of View.buttonRole(_:)>>.0, _EnvironmentKeyWritingModifier<Locale>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<<<opaque return type of View.buttonRole(_:)>>.0, _EnvironmentKeyWritingModifier<Locale>> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.buttonRole(_:)>>.0, _EnvironmentKeyWritingModifier<Locale>>);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ShareLink<CollectionOfOne<URL>, Never, Never, DefaultShareLinkLabel>);
    v2[3] = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type ShareLink<CollectionOfOne<URL>, Never, Never, DefaultShareLinkLabel> and conformance ShareLink<A, B, C, D>, &demangling cache variable for type metadata for ShareLink<CollectionOfOne<URL>, Never, Never, DefaultShareLinkLabel>, MEMORY[0x24BDF5350]);
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type _EnvironmentKeyWritingModifier<Locale> and conformance _EnvironmentKeyWritingModifier<A>, &demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<Locale>, MEMORY[0x24BDF1020]);
    result = MEMORY[0x242630878](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<<<opaque return type of View.buttonRole(_:)>>.0, _EnvironmentKeyWritingModifier<Locale>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x242630878](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t outlined destroy of Environment<Locale>.Content(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void SiriFindMyUIBundle.__allocating_init()()
{
  swift_deletedMethodError();
  __break(1u);
}

double specialized View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  double result;

  *(_QWORD *)&result = specialized View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &demangling cache variable for type metadata for <<opaque return type of View.mapScope(_:)>>.0, &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>).n128_u64[0];
  return result;
}

__n128 specialized View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v17;
  uint64_t *v19;
  void *v28;
  uint64_t v29;
  _OWORD *v30;
  __n128 result;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __n128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  v19 = a16;
  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    v28 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();

    v19 = a16;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  v29 = __swift_instantiateConcreteTypeFromMangledName(v19);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(a9, v17, v29);
  v30 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(a17) + 36));
  v30[4] = v36;
  v30[5] = v37;
  v30[6] = v38;
  *v30 = v32;
  v30[1] = v33;
  result = v35;
  v30[2] = v34;
  v30[3] = v35;
  return result;
}

uint64_t ParkingLocationView.model.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + 40);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(_QWORD *)(v1 + 72);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v1 + 24);
  *(_QWORD *)(a1 + 40) = v2;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(v1 + 48);
  *(_QWORD *)(a1 + 64) = v3;
  *(_QWORD *)(a1 + 72) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id ParkingLocationView.logObject.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 80);
}

id ParkingLocationView.navCommand.getter()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE84E80]), sel_init);
  objc_msgSend(v1, sel_setLat_, *(double *)(v0 + 48));
  objc_msgSend(v1, sel_setLng_, *(double *)(v0 + 56));
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE84D60]), sel_init);
  objc_msgSend(v2, sel_setLocation_, v1);
  v4 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  v5 = (void *)MEMORY[0x2426302F0](v4, v3);
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setName_, v5);

  objc_msgSend(v2, sel_setDirectionsMode_, 2);
  return v2;
}

uint64_t ParkingLocationView.parkingPin.getter()
{
  id v0;

  type metadata accessor for RFMapMarker(0, &lazy cache variable for type metadata for RFMapMarker);
  v0 = objc_allocWithZone(MEMORY[0x24BE84B30]);
  swift_bridgeObjectRetain();
  objc_msgSend(objc_msgSend(v0, sel_init), sel_setName_, 8);
  return RFMapMarker.init(coordinate:title:image:tint:)();
}

uint64_t ParkingLocationView.mapView.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  id v5;
  _QWORD v7[2];

  v0 = type metadata accessor for MapAspectRatio();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_23CCA3A30;
  type metadata accessor for RFMapMarker(0, &lazy cache variable for type metadata for RFMapMarker);
  v5 = objc_allocWithZone(MEMORY[0x24BE84B30]);
  swift_bridgeObjectRetain();
  objc_msgSend(objc_msgSend(v5, sel_init), sel_setName_, 8);
  *(_QWORD *)(v4 + 32) = RFMapMarker.init(coordinate:title:image:tint:)();
  v7[1] = v4;
  specialized Array._endMutation()();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEADC58], v0);
  return MapView.init(markers:annotations:mapItemIdentifiers:polyline:aspectRatio:cameraDistance:showsUserLocation:)();
}

uint64_t ParkingLocationView.directionsButton.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  unint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v2 = v1;
  v41 = a1;
  v3 = type metadata accessor for SeparatorStyle();
  v42 = *(_QWORD *)(v3 - 8);
  v43 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v40 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for RFButtonStyle();
  v6 = *(_QWORD *)(v5 - 8);
  v36 = v5;
  v37 = v6;
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for ButtonContainerView();
  v10 = *(_QWORD *)(v9 - 8);
  v34 = v9;
  v35 = v10;
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.buttonStyle<A>(_:)>>.0);
  v38 = *(_QWORD *)(v13 - 8);
  v39 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for ParkingLocationView();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(_QWORD *)(v17 + 64);
  MEMORY[0x24BDAC7A8](v16);
  v19 = *(NSObject **)(v2 + 80);
  v20 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_23CC7E000, v19, v20, "RF directions Button", v21, 2u);
    MEMORY[0x2426308F0](v21, -1, -1);
  }
  outlined init with copy of ParkingLocationView(v2, (uint64_t)&v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  v22 = (*(unsigned __int8 *)(v17 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  v23 = swift_allocObject();
  outlined init with take of ParkingLocationView((uint64_t)&v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), v23 + v22);
  ButtonContainerView.init(buttons:)();
  v24 = v8;
  static PrimitiveButtonStyle<>.rfButton.getter();
  v25 = lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type ButtonContainerView and conformance ButtonContainerView, (uint64_t (*)(uint64_t))MEMORY[0x24BEADF00], MEMORY[0x24BEADEE0]);
  v26 = lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type RFButtonStyle and conformance RFButtonStyle, (uint64_t (*)(uint64_t))MEMORY[0x24BEADB80], MEMORY[0x24BEADB78]);
  v27 = v34;
  v28 = v36;
  View.buttonStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v24, v28);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v12, v27);
  v30 = v42;
  v29 = v43;
  v31 = v40;
  (*(void (**)(char *, _QWORD, uint64_t))(v42 + 104))(v40, *MEMORY[0x24BEAB510], v43);
  v44 = v27;
  v45 = v28;
  v46 = v25;
  v47 = v26;
  swift_getOpaqueTypeConformance2();
  v32 = v39;
  View.separators(_:isOverride:)();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v29);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v15, v32);
  return swift_release();
}

uint64_t type metadata accessor for ParkingLocationView()
{
  uint64_t result;

  result = type metadata singleton initialization cache for ParkingLocationView;
  if (!type metadata singleton initialization cache for ParkingLocationView)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t closure #1 in ParkingLocationView.directionsButton.getter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
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
  char *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t OpaqueTypeConformance2;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
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

  v2 = type metadata accessor for ButtonItemButtonStyle.Role();
  v31 = *(_QWORD *)(v2 - 8);
  v32 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for ParkingLocationView();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Button<Label<Label<Text, Image>, EmptyView>>);
  v30 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.buttonRole(_:)>>.0);
  v33 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.privacySensitive(_:)>>.0);
  v15 = *(_QWORD *)(v14 - 8);
  v34 = v14;
  v35 = v15;
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AnyView>);
  v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_23CCA3820;
  outlined init with copy of ParkingLocationView(a1, (uint64_t)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v19 = swift_allocObject();
  outlined init with take of ParkingLocationView((uint64_t)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v19 + v18);
  v36 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Label<Label<Text, Image>, EmptyView>);
  lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type Label<Label<Text, Image>, EmptyView> and conformance Label<A, B>, &demangling cache variable for type metadata for Label<Label<Text, Image>, EmptyView>, MEMORY[0x24BDF41A0]);
  Button.init(action:label:)();
  v21 = v31;
  v20 = v32;
  (*(void (**)(char *, _QWORD, uint64_t))(v31 + 104))(v4, *MEMORY[0x24BEAD980], v32);
  v22 = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type Button<Label<Label<Text, Image>, EmptyView>> and conformance Button<A>, &demangling cache variable for type metadata for Button<Label<Label<Text, Image>, EmptyView>>, MEMORY[0x24BDF43B8]);
  View.buttonRole(_:)();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v4, v20);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v10, v8);
  v37 = v8;
  v38 = v22;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  View.privacySensitive(_:)();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v13, v11);
  v37 = v11;
  v38 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  v24 = v34;
  v25 = View.eraseToAnyView()();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v17, v24);
  v26 = v29;
  *(_QWORD *)(v29 + 32) = v25;
  v37 = v26;
  specialized Array._endMutation()();
  return v37;
}

uint64_t outlined init with copy of ParkingLocationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ParkingLocationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with take of ParkingLocationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ParkingLocationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in ParkingLocationView.directionsButton.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ParkingLocationView() - 8) + 80);
  return closure #1 in ParkingLocationView.directionsButton.getter(v0 + ((v1 + 16) & ~v1));
}

uint64_t closure #1 in closure #1 in ParkingLocationView.directionsButton.getter()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for InteractionType?);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v18 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ActionProperty?);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for StandardActionHandler?);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ParkingLocationView();
  ActionHandler.wrappedValue.getter();
  v9 = type metadata accessor for StandardActionHandler();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    return outlined destroy of Environment<Locale>.Content((uint64_t)v8, &demangling cache variable for type metadata for StandardActionHandler?);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ActionElementConvertible>);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_23CCA3820;
  v13 = type metadata accessor for Command();
  v14 = MEMORY[0x24BEAD1F0];
  *(_QWORD *)(v12 + 56) = v13;
  *(_QWORD *)(v12 + 64) = v14;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v12 + 32));
  *boxed_opaque_existential_1 = (uint64_t)ParkingLocationView.navCommand.getter();
  *((_BYTE *)boxed_opaque_existential_1 + 8) = 0;
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(boxed_opaque_existential_1, *MEMORY[0x24BEAD170], v13);
  ActionProperty.init(_:)();
  v16 = type metadata accessor for ActionProperty();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v5, 0, 1, v16);
  v17 = type metadata accessor for InteractionType();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v2, 1, 1, v17);
  StandardActionHandler.perform(_:interactionType:)();
  outlined destroy of Environment<Locale>.Content((uint64_t)v2, &demangling cache variable for type metadata for InteractionType?);
  outlined destroy of Environment<Locale>.Content((uint64_t)v5, &demangling cache variable for type metadata for ActionProperty?);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v8, v9);
}

uint64_t closure #2 in closure #1 in ParkingLocationView.directionsButton.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Label<Text, Image>);
  lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type Label<Text, Image> and conformance Label<A, B>, &demangling cache variable for type metadata for Label<Text, Image>, MEMORY[0x24BDF41A0]);
  return Label.init(title:icon:)();
}

uint64_t closure #1 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter()
{
  lazy protocol witness table accessor for type String and conformance String();
  swift_bridgeObjectRetain();
  return Label<>.init<A>(_:systemImage:)();
}

uint64_t ParkingLocationView.header.getter()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return PrimaryHeaderRichView.init(text1:text2:text3:text4:thumbnail:addTint:)();
}

uint64_t ParkingLocationView.body.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v1 = type metadata accessor for ParkingLocationView();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  outlined init with copy of ParkingLocationView(v0, (uint64_t)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  outlined init with take of ParkingLocationView((uint64_t)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TupleView<(ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)>);
  v7 = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type TupleView<(ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>, &demangling cache variable for type metadata for TupleView<(ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)>, MEMORY[0x24BDF5420]);
  return MEMORY[0x2426301E8](partial apply for closure #1 in ParkingLocationView.body.getter, v5, v6, v7);
}

uint64_t closure #1 in ParkingLocationView.body.getter@<X0>(uint64_t a1@<X8>)
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
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  __n128 v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t);
  uint64_t v35;
  uint64_t (*v36)(uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t OpaqueTypeConformance2;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  void (*v50)(char *, char *, uint64_t);
  uint64_t v51;
  void (*v52)(char *, char *, uint64_t);
  uint64_t v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t);
  void (*v56)(char *, uint64_t);
  char *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;

  v68 = a1;
  v1 = type metadata accessor for SeparatorStyle();
  v59 = *(_QWORD *)(v1 - 8);
  v60 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v58 = (char *)&v58 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.separators(_:isOverride:)>>.0);
  v67 = *(_QWORD *)(v65 - 8);
  MEMORY[0x24BDAC7A8](v65);
  v72 = (uint64_t)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.separators(_:isOverride:)>>.0);
  v74 = *(_QWORD *)(v66 - 8);
  v4 = MEMORY[0x24BDAC7A8](v66);
  v61 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v73 = (char *)&v58 - v6;
  v7 = type metadata accessor for PrimaryHeaderRichView();
  v63 = *(_QWORD *)(v7 - 8);
  v64 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v62 = (char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v70 = (char *)&v58 - v10;
  v11 = type metadata accessor for MapView();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.onTapGesture(count:perform:)>>.0);
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v58 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v58 - v23;
  v71 = (uint64_t)&v58 - v23;
  ParkingLocationView.mapView.getter();
  lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type MapView and conformance MapView, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE5A8], MEMORY[0x24BEAE598]);
  View.onTapGesture(count:perform:)();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v25 = static Alignment.center.getter();
  v69 = v22;
  v27 = specialized View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)v22, 0.0, 1, 157.0, 0, v25, v26, &demangling cache variable for type metadata for <<opaque return type of View.onTapGesture(count:perform:)>>.0, &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>);
  (*(void (**)(char *, uint64_t, __n128))(v16 + 8))(v18, v15, v27);
  outlined init with take of ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>((uint64_t)v22, (uint64_t)v24);
  v28 = v70;
  ParkingLocationView.header.getter();
  ParkingLocationView.directionsButton.getter(v72);
  v29 = v58;
  v30 = v59;
  v31 = v60;
  (*(void (**)(char *, _QWORD, uint64_t))(v59 + 104))(v58, *MEMORY[0x24BEAB510], v60);
  v32 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for <<opaque return type of View.buttonStyle<A>(_:)>>.0);
  v33 = type metadata accessor for ButtonContainerView();
  v34 = (uint64_t (*)(uint64_t))MEMORY[0x24BEADF00];
  v35 = type metadata accessor for RFButtonStyle();
  v36 = (uint64_t (*)(uint64_t))MEMORY[0x24BEADB80];
  v37 = lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type ButtonContainerView and conformance ButtonContainerView, v34, MEMORY[0x24BEADEE0]);
  v38 = lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type RFButtonStyle and conformance RFButtonStyle, v36, MEMORY[0x24BEADB78]);
  v75 = v33;
  v76 = v35;
  v77 = v37;
  v78 = v38;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v75 = v32;
  v76 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  v40 = v61;
  v41 = v65;
  v42 = v72;
  View.separators(_:isOverride:)();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v29, v31);
  (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v42, v41);
  v44 = v73;
  v43 = v74;
  v45 = v40;
  v46 = v66;
  (*(void (**)(char *, char *, uint64_t))(v74 + 32))(v73, v40, v66);
  v47 = (uint64_t)v69;
  outlined init with copy of ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>(v71, (uint64_t)v69);
  v49 = v62;
  v48 = v63;
  v50 = *(void (**)(char *, char *, uint64_t))(v63 + 16);
  v51 = v64;
  v50(v62, v28, v64);
  v52 = *(void (**)(char *, char *, uint64_t))(v43 + 16);
  v52(v45, v44, v46);
  v53 = v68;
  outlined init with copy of ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>(v47, v68);
  v54 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0));
  v50((char *)(v53 + *(int *)(v54 + 48)), v49, v51);
  v52((char *)(v53 + *(int *)(v54 + 64)), v45, v46);
  v55 = *(void (**)(char *, uint64_t))(v74 + 8);
  v55(v73, v46);
  v56 = *(void (**)(char *, uint64_t))(v48 + 8);
  v56(v70, v51);
  outlined destroy of Environment<Locale>.Content(v71, &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>);
  v55(v45, v46);
  v56(v49, v51);
  return outlined destroy of Environment<Locale>.Content((uint64_t)v69, &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>);
}

void closure #1 in closure #1 in ParkingLocationView.body.getter()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSURL *v7;
  void *v8;
  void *v9;
  Class isa;
  uint64_t v11;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = objc_msgSend((id)objc_opt_self(), sel_defaultWorkspace);
  if (v3)
  {
    v4 = v3;
    URL.init(string:)();
    v5 = type metadata accessor for URL();
    v6 = *(_QWORD *)(v5 - 8);
    v8 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v2, 1, v5) != 1)
    {
      URL._bridgeToObjectiveC()(v7);
      v8 = v9;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v2, v5);
    }
    specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x24BEE4AF8]);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_openSensitiveURL_withOptions_, v8, isa);

  }
  else
  {
    __break(1u);
  }
}

uint64_t ParkingLocationView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  v7 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v7;
  *(_QWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 40) = v4;
  *(_OWORD *)(a2 + 48) = *(_OWORD *)(a1 + 48);
  *(_QWORD *)(a2 + 64) = v5;
  *(_QWORD *)(a2 + 72) = v6;
  type metadata accessor for RFMapMarker(0, (unint64_t *)&lazy cache variable for type metadata for OS_os_log);
  *(_QWORD *)(a2 + 80) = OS_os_log.init(subsystem:category:)();
  type metadata accessor for ParkingLocationView();
  return ActionHandler.init()();
}

uint64_t protocol witness for View.body.getter in conformance ParkingLocationView(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](a1);
  outlined init with copy of ParkingLocationView(v1, (uint64_t)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  outlined init with take of ParkingLocationView((uint64_t)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TupleView<(ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)>);
  v7 = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type TupleView<(ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>, &demangling cache variable for type metadata for TupleView<(ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)>, MEMORY[0x24BDF5420]);
  return MEMORY[0x2426301E8](partial apply for closure #1 in ParkingLocationView.body.getter, v5, v6, v7);
}

uint64_t static ParkingLocationView_Previews.previews.getter()
{
  if (one-time initialization token for pickupTruck != -1)
    swift_once();
  type metadata accessor for ParkingLocationView();
  lazy protocol witness table accessor for type GeoDataModels.ParkingLocationDataModel and conformance GeoDataModels.ParkingLocationDataModel();
  lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type ParkingLocationView and conformance ParkingLocationView, (uint64_t (*)(uint64_t))type metadata accessor for ParkingLocationView, (uint64_t)&protocol conformance descriptor for ParkingLocationView);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return SnippetPreview.init(snippetModel:content:)();
}

uint64_t pickupTruck.unsafeMutableAddressor()
{
  if (one-time initialization token for pickupTruck != -1)
    swift_once();
  return pickupTruck.note.value._countAndFlagsBits;
}

uint64_t implicit closure #1 in static ParkingLocationView_Previews.previews.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)a2 = *(_QWORD *)a1;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 8);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 40) = v3;
  *(_OWORD *)(a2 + 48) = *(_OWORD *)(a1 + 48);
  *(_QWORD *)(a2 + 64) = v4;
  *(_QWORD *)(a2 + 72) = v5;
  type metadata accessor for RFMapMarker(0, (unint64_t *)&lazy cache variable for type metadata for OS_os_log);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  *(_QWORD *)(a2 + 80) = OS_os_log.init(subsystem:category:)();
  type metadata accessor for ParkingLocationView();
  return ActionHandler.init()();
}

uint64_t protocol witness for static _PreviewProvider._previews.getter in conformance ParkingLocationView_Previews()
{
  lazy protocol witness table accessor for type ParkingLocationView_Previews and conformance ParkingLocationView_Previews();
  return static PreviewProvider._previews.getter();
}

uint64_t protocol witness for static _PreviewProvider._platform.getter in conformance ParkingLocationView_Previews()
{
  lazy protocol witness table accessor for type ParkingLocationView_Previews and conformance ParkingLocationView_Previews();
  return static PreviewProvider._platform.getter();
}

double one-time initialization function for pickupTruck()
{
  uint64_t v0;
  double result;

  v0 = swift_slowAlloc();
  pickupTruck.note.value._countAndFlagsBits = v0;
  *(_QWORD *)v0 = 0;
  *(_QWORD *)(v0 + 8) = 0;
  *(_QWORD *)(v0 + 16) = 0xD000000000000024;
  *(_QWORD *)(v0 + 24) = 0x800000023CCA6780;
  *(_QWORD *)(v0 + 32) = 0x432064656B726150;
  *(_QWORD *)(v0 + 40) = 0xEA00000000007261;
  result = 37.3349;
  *(_OWORD *)(v0 + 48) = xmmword_23CCA3830;
  return result;
}

unint64_t lazy protocol witness table accessor for type GeoDataModels.ParkingLocationDataModel and conformance GeoDataModels.ParkingLocationDataModel()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel and conformance GeoDataModels.ParkingLocationDataModel;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel and conformance GeoDataModels.ParkingLocationDataModel)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.ParkingLocationDataModel, &type metadata for GeoDataModels.ParkingLocationDataModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel and conformance GeoDataModels.ParkingLocationDataModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel and conformance GeoDataModels.ParkingLocationDataModel;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel and conformance GeoDataModels.ParkingLocationDataModel)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.ParkingLocationDataModel, &type metadata for GeoDataModels.ParkingLocationDataModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel and conformance GeoDataModels.ParkingLocationDataModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel and conformance GeoDataModels.ParkingLocationDataModel;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel and conformance GeoDataModels.ParkingLocationDataModel)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.ParkingLocationDataModel, &type metadata for GeoDataModels.ParkingLocationDataModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel and conformance GeoDataModels.ParkingLocationDataModel);
  }
  return result;
}

uint64_t associated type witness table accessor for View.Body : View in ParkingLocationView()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t lazy protocol witness table accessor for type ParkingLocationView_Previews and conformance ParkingLocationView_Previews()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ParkingLocationView_Previews and conformance ParkingLocationView_Previews;
  if (!lazy protocol witness table cache variable for type ParkingLocationView_Previews and conformance ParkingLocationView_Previews)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for ParkingLocationView_Previews, &type metadata for ParkingLocationView_Previews);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ParkingLocationView_Previews and conformance ParkingLocationView_Previews);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ParkingLocationView_Previews and conformance ParkingLocationView_Previews;
  if (!lazy protocol witness table cache variable for type ParkingLocationView_Previews and conformance ParkingLocationView_Previews)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for ParkingLocationView_Previews, &type metadata for ParkingLocationView_Previews);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ParkingLocationView_Previews and conformance ParkingLocationView_Previews);
  }
  return result;
}

uint64_t associated type witness table accessor for PreviewProvider.Previews : View in ParkingLocationView_Previews()
{
  return swift_getOpaqueTypeConformance2();
}

_QWORD *initializeBufferWithCopyOfBuffer for ParkingLocationView(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  id v15;
  uint64_t v16;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v16 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v16 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v5;
    v6 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v6;
    v7 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v7;
    *(_OWORD *)(a1 + 48) = *((_OWORD *)a2 + 3);
    v8 = a2[9];
    *(_QWORD *)(a1 + 64) = a2[8];
    *(_QWORD *)(a1 + 72) = v8;
    v9 = (void *)a2[10];
    v10 = *(int *)(a3 + 24);
    v11 = a1 + v10;
    v12 = (uint64_t)a2 + v10;
    *(_QWORD *)(a1 + 80) = v9;
    v13 = type metadata accessor for ActionHandler();
    v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15 = v9;
    v14(v11, v12, v13);
  }
  return v3;
}

uint64_t destroy for ParkingLocationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v4 = a1 + *(int *)(a2 + 24);
  v5 = type metadata accessor for ActionHandler();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t initializeWithCopy for ParkingLocationView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  id v14;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  v8 = *(void **)(a2 + 80);
  v9 = *(int *)(a3 + 24);
  v10 = a1 + v9;
  v11 = a2 + v9;
  *(_QWORD *)(a1 + 80) = v8;
  v12 = type metadata accessor for ActionHandler();
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14 = v8;
  v13(v10, v11, v12);
  return a1;
}

_QWORD *assignWithCopy for ParkingLocationView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (void *)a2[10];
  v7 = (void *)a1[10];
  a1[10] = v6;
  v8 = v6;

  v9 = *(int *)(a3 + 24);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = type metadata accessor for ActionHandler();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

uint64_t initializeWithTake for ParkingLocationView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v5;
  v6 = *(int *)(a3 + 24);
  v7 = a2 + v6;
  v8 = a1 + v6;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  v9 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8, v7, v9);
  return a1;
}

uint64_t assignWithTake for ParkingLocationView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  v9 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v9;
  swift_bridgeObjectRelease();
  v10 = *(void **)(a1 + 80);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);

  v11 = *(int *)(a3 + 24);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for ParkingLocationView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CC86F38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for ActionHandler();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for ParkingLocationView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CC86FC0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 40) = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for ActionHandler();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata completion function for ParkingLocationView()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for ActionHandler();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ParkingLocationView_Previews()
{
  return &type metadata for ParkingLocationView_Previews;
}

uint64_t sub_23CC870C4()
{
  return lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type MapView and conformance MapView, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE5A8], MEMORY[0x24BEAE598]);
}

uint64_t sub_23CC870F0()
{
  uint64_t (*v0)(uint64_t);
  uint64_t (*v1)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for <<opaque return type of View.buttonStyle<A>(_:)>>.0);
  type metadata accessor for ButtonContainerView();
  v0 = (uint64_t (*)(uint64_t))MEMORY[0x24BEADF00];
  type metadata accessor for RFButtonStyle();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x24BEADB80];
  lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type ButtonContainerView and conformance ButtonContainerView, v0, MEMORY[0x24BEADEE0]);
  lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type RFButtonStyle and conformance RFButtonStyle, v1, MEMORY[0x24BEADB78]);
  swift_getOpaqueTypeConformance2();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23CC871C0()
{
  return lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type PrimaryHeaderRichView and conformance PrimaryHeaderRichView, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE048], MEMORY[0x24BEAE030]);
}

uint64_t sub_23CC871EC()
{
  return lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type ComponentStack<TupleView<(ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)>> and conformance ComponentStack<A>, &demangling cache variable for type metadata for ComponentStack<TupleView<(ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)>>, MEMORY[0x24BEADBF8]);
}

uint64_t sub_23CC87218()
{
  return lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type SnippetPreview<GeoDataModels.ParkingLocationDataModel, ParkingLocationView> and conformance SnippetPreview<A, B>, &demangling cache variable for type metadata for SnippetPreview<GeoDataModels.ParkingLocationDataModel, ParkingLocationView>, MEMORY[0x24BEAD9E8]);
}

uint64_t partial apply for closure #1 in ParkingLocationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for ParkingLocationView();
  return closure #1 in ParkingLocationView.body.getter(a1);
}

uint64_t outlined init with take of ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for ParkingLocationView();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v4 = v3 + *(int *)(v1 + 24);
  v5 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in ParkingLocationView.directionsButton.getter()
{
  type metadata accessor for ParkingLocationView();
  return closure #1 in closure #1 in ParkingLocationView.directionsButton.getter();
}

uint64_t partial apply for closure #2 in closure #1 in ParkingLocationView.directionsButton.getter()
{
  return closure #2 in closure #1 in ParkingLocationView.directionsButton.getter();
}

uint64_t partial apply for closure #1 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter()
{
  return closure #1 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter();
}

double SnippetModeConstants.minimumZoomMeters.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

void SnippetModeConstants.minimumZoomMeters.setter(double a1)
{
  double *v1;

  *v1 = a1;
}

uint64_t (*SnippetModeConstants.minimumZoomMeters.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

double SnippetModeConstants.snippetPaddingTop.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

void SnippetModeConstants.snippetPaddingTop.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 8) = a1;
}

uint64_t (*SnippetModeConstants.snippetPaddingTop.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

double SnippetModeConstants.avatarCenterOffsetHeight.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

void SnippetModeConstants.avatarCenterOffsetHeight.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 16) = a1;
}

uint64_t (*SnippetModeConstants.avatarCenterOffsetHeight.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

double SnippetModeConstants.blurFooterAngle.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 24);
}

void SnippetModeConstants.blurFooterAngle.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 24) = a1;
}

uint64_t (*SnippetModeConstants.blurFooterAngle.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

uint64_t SnippetModeConstants.ambientMapAnnotationViewSize.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t SnippetModeConstants.ambientMapAnnotationViewSize.setter(uint64_t result, uint64_t a2, char a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 32) = result;
  *(_QWORD *)(v3 + 40) = a2;
  *(_BYTE *)(v3 + 48) = a3 & 1;
  return result;
}

uint64_t (*SnippetModeConstants.ambientMapAnnotationViewSize.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

double SnippetModeConstants.avatarRenderingScopeScale.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 56);
}

void SnippetModeConstants.avatarRenderingScopeScale.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 56) = a1;
}

uint64_t (*SnippetModeConstants.avatarRenderingScopeScale.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

double SnippetModeConstants.friendLocationSnippetHeight.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 64);
}

void SnippetModeConstants.friendLocationSnippetHeight.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 64) = a1;
}

uint64_t (*SnippetModeConstants.friendLocationSnippetHeight.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

double SnippetModeConstants.friendLocationSnippetCornerRadius.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 72);
}

void SnippetModeConstants.friendLocationSnippetCornerRadius.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 72) = a1;
}

uint64_t (*SnippetModeConstants.friendLocationSnippetCornerRadius.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

CGFloat one-time initialization function for ambientFriendLocationSnippetHeight()
{
  id v0;
  double v1;
  CGFloat v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGFloat result;
  CGRect v10;

  v0 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v0, sel_bounds);
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;

  v10.origin.x = v2;
  v10.origin.y = v4;
  v10.size.width = v6;
  v10.size.height = v8;
  result = CGRectGetHeight(v10) + -104.0;
  static SnippetModeConstants.ambientFriendLocationSnippetHeight = *(_QWORD *)&result;
  return result;
}

double one-time initialization function for default()
{
  double result;

  pickupTruck.locationInfo = *(GeoUIFramework::StandardMapData *)ymmword_23CCA3B70;
  xmmword_256C22770 = 0uLL;
  byte_256C22780 = 1;
  result = 1.0;
  unk_256C22788 = xmmword_23CCA3B90;
  qword_256C22798 = 0x402C000000000000;
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double result;

  v0 = static Color.black.getter();
  v1 = static Color.black.getter();
  v2 = static Color.black.getter();
  v3 = static Color.black.getter();
  v4 = static Color.black.getter();
  *(_QWORD *)&static AvatarBubbleShadowStyle.default = v0;
  *(__int128 *)((char *)&static AvatarBubbleShadowStyle.default + 8) = xmmword_23CCA3E20;
  result = 1.0;
  unk_256C22848 = xmmword_23CCA3E30;
  qword_256C22858 = v1;
  xmmword_256C22860 = xmmword_23CCA3E40;
  xmmword_256C22870 = xmmword_23CCA3E50;
  qword_256C22880 = v2;
  *(_OWORD *)algn_256C22888 = xmmword_23CCA3E60;
  *(__int128 *)((char *)&xmmword_256C22890 + 8) = xmmword_23CCA3E70;
  qword_256C228A8 = v3;
  xmmword_256C228B0 = xmmword_23CCA3E80;
  unk_256C228C0 = xmmword_23CCA3E90;
  *(_QWORD *)&xmmword_256C228D0 = v4;
  *(__int128 *)((char *)&xmmword_256C228D0 + 8) = xmmword_23CCA3E60;
  unk_256C228E8 = xmmword_23CCA3E30;
  return result;
}

{
  double result;

  result = 60.0;
  sc.displayName = (Swift::String)xmmword_23CCA49B0;
  *(_OWORD *)&sc.driPayload = xmmword_23CCA49C0;
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  double result;

  v0 = static Color.white.getter();
  v1 = static Color.black.getter();
  v2 = static Color.black.getter();
  static AvatarBadgeStyle.default = xmmword_23CCA55C0;
  qword_256C229F0 = v0;
  qword_256C229F8 = 0x3FF8000000000000;
  qword_256C22A00 = v1;
  *(_OWORD *)&qword_256C22A08 = xmmword_23CCA55D0;
  result = 1.0;
  *(_OWORD *)&qword_256C22A18 = xmmword_23CCA55E0;
  qword_256C22A28 = v2;
  xmmword_256C22A30 = xmmword_23CCA55F0;
  *(_OWORD *)&qword_256C22A40 = xmmword_23CCA55E0;
  return result;
}

uint64_t SnippetModeConstants.init(minimumZoomMeters:snippetPaddingTop:avatarCenterOffsetHeight:blurFooterAngle:ambientMapAnnotationViewSize:avatarRenderingScopeScale:friendLocationSnippetHeight:friendLocationSnippetCornerRadius:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>, double a9@<D4>, double a10@<D5>, double a11@<D6>)
{
  *(double *)a4 = a5;
  *(double *)(a4 + 8) = a6;
  *(double *)(a4 + 16) = a7;
  *(double *)(a4 + 24) = a8;
  *(_QWORD *)(a4 + 32) = result;
  *(_QWORD *)(a4 + 40) = a2;
  *(_BYTE *)(a4 + 48) = a3 & 1;
  *(double *)(a4 + 56) = a9;
  *(double *)(a4 + 64) = a10;
  *(double *)(a4 + 72) = a11;
  return result;
}

GeoUIFramework::StandardMapData *SnippetModeConstants.default.unsafeMutableAddressor()
{
  if (one-time initialization token for default != -1)
    swift_once();
  return &pickupTruck.locationInfo;
}

double static SnippetModeConstants.default.getter@<D0>(uint64_t a1@<X8>)
{
  char v2;
  double result;
  __int128 v4;

  if (one-time initialization token for default != -1)
    swift_once();
  v2 = byte_256C22780;
  result = *(double *)&qword_256C22798;
  v4 = *(_OWORD *)&pickupTruck.locationInfo.latitude;
  *(Swift::String *)a1 = pickupTruck.locationInfo.label;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = xmmword_256C22770;
  *(_BYTE *)(a1 + 48) = v2;
  *(_OWORD *)(a1 + 56) = unk_256C22788;
  *(double *)(a1 + 72) = result;
  return result;
}

double one-time initialization function for ambient()
{
  double result;

  if (one-time initialization token for ambientFriendLocationSnippetHeight != -1)
    swift_once();
  result = *(double *)&static SnippetModeConstants.ambientFriendLocationSnippetHeight;
  static SnippetModeConstants.ambient = xmmword_23CCA3BA0;
  *(_OWORD *)algn_256C227B0 = xmmword_23CCA3BB0;
  xmmword_256C227C0 = (__int128)vdupq_n_s64(0x4069000000000000uLL);
  byte_256C227D0 = 0;
  qword_256C227D8 = 0x4000000000000000;
  qword_256C227E0 = static SnippetModeConstants.ambientFriendLocationSnippetHeight;
  qword_256C227E8 = 0x4046000000000000;
  return result;
}

__int128 *SnippetModeConstants.ambient.unsafeMutableAddressor()
{
  if (one-time initialization token for ambient != -1)
    swift_once();
  return &static SnippetModeConstants.ambient;
}

double static SnippetModeConstants.ambient.getter@<D0>(uint64_t a1@<X8>)
{
  char v2;
  double result;
  __int128 v4;

  if (one-time initialization token for ambient != -1)
    swift_once();
  v2 = byte_256C227D0;
  result = *(double *)&qword_256C227E8;
  v4 = *(_OWORD *)algn_256C227B0;
  *(_OWORD *)a1 = static SnippetModeConstants.ambient;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = xmmword_256C227C0;
  *(_BYTE *)(a1 + 48) = v2;
  *(_OWORD *)(a1 + 56) = *(_OWORD *)&qword_256C227D8;
  *(double *)(a1 + 72) = result;
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance SnippetModeConstants(_OWORD *a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v8[5];
  _OWORD v9[5];

  v2 = a1[3];
  v8[2] = a1[2];
  v8[3] = v2;
  v3 = a1[4];
  v4 = a1[1];
  v8[0] = *a1;
  v8[1] = v4;
  v5 = a2[3];
  v9[2] = a2[2];
  v9[3] = v5;
  v9[4] = a2[4];
  v6 = *a2;
  v9[1] = a2[1];
  v8[4] = v3;
  v9[0] = v6;
  return specialized static SnippetModeConstants.== infix(_:_:)((uint64_t)v8, (uint64_t)v9);
}

BOOL specialized static SnippetModeConstants.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;

  if (*(double *)a1 != *(double *)a2
    || *(double *)(a1 + 8) != *(double *)(a2 + 8)
    || *(double *)(a1 + 16) != *(double *)(a2 + 16)
    || (static Angle.== infix(_:_:)() & 1) == 0)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 48))
      return 0;
LABEL_11:
    if (*(double *)(a1 + 56) == *(double *)(a2 + 56) && *(double *)(a1 + 64) == *(double *)(a2 + 64))
      return *(double *)(a1 + 72) == *(double *)(a2 + 72);
    return 0;
  }
  result = 0;
  if ((*(_BYTE *)(a2 + 48) & 1) == 0
    && *(double *)(a1 + 32) == *(double *)(a2 + 32)
    && *(double *)(a1 + 40) == *(double *)(a2 + 40))
  {
    goto LABEL_11;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SnippetModeConstants(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
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

uint64_t getEnumTagSinglePayload for SnippetModeConstants(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 80))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SnippetModeConstants(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 80) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SnippetModeConstants()
{
  return &type metadata for SnippetModeConstants;
}

id one-time initialization function for instance()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for SiriFindMyUIBundle();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  static SiriFindMyUIBundle.instance = (uint64_t)result;
  return result;
}

uint64_t *SiriFindMyUIBundle.instance.unsafeMutableAddressor()
{
  if (one-time initialization token for instance != -1)
    swift_once();
  return &static SiriFindMyUIBundle.instance;
}

id static SiriFindMyUIBundle.instance.getter()
{
  if (one-time initialization token for instance != -1)
    swift_once();
  return (id)static SiriFindMyUIBundle.instance;
}

uint64_t SiriFindMyUIBundle.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SiriFindMyUIBundle.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t one-time initialization function for noLocationBackground()
{
  id v0;
  uint64_t result;

  if (one-time initialization token for bundle != -1)
    swift_once();
  v0 = (id)static Assets.bundle;
  result = Image.init(_:bundle:)();
  static Assets.noLocationBackground = result;
  return result;
}

uint64_t *Assets.noLocationBackground.unsafeMutableAddressor()
{
  if (one-time initialization token for noLocationBackground != -1)
    swift_once();
  return &static Assets.noLocationBackground;
}

uint64_t static Assets.noLocationBackground.getter()
{
  return static Assets.noLocationBackground.getter(&one-time initialization token for noLocationBackground);
}

uint64_t one-time initialization function for avatarStrokeColor(uint64_t a1)
{
  return one-time initialization function for avatarStrokeColor(a1, 0xD000000000000011, 0x800000023CCA6930, &static Assets.avatarStrokeColor);
}

uint64_t *Assets.avatarStrokeColor.unsafeMutableAddressor()
{
  if (one-time initialization token for avatarStrokeColor != -1)
    swift_once();
  return &static Assets.avatarStrokeColor;
}

uint64_t static Assets.avatarStrokeColor.getter()
{
  return static Assets.noLocationBackground.getter(&one-time initialization token for avatarStrokeColor);
}

uint64_t static Assets.noLocationBackground.getter(_QWORD *a1)
{
  if (*a1 != -1)
    swift_once();
  return swift_retain();
}

uint64_t one-time initialization function for timeLimitedBadgeColor(uint64_t a1)
{
  return one-time initialization function for avatarStrokeColor(a1, 0xD000000000000015, 0x800000023CCA6910, &static Assets.timeLimitedBadgeColor);
}

uint64_t *Assets.timeLimitedBadgeColor.unsafeMutableAddressor()
{
  if (one-time initialization token for timeLimitedBadgeColor != -1)
    swift_once();
  return &static Assets.timeLimitedBadgeColor;
}

uint64_t static Assets.timeLimitedBadgeColor.getter()
{
  return static Assets.noLocationBackground.getter(&one-time initialization token for timeLimitedBadgeColor);
}

uint64_t one-time initialization function for favoriteBadgeColor(uint64_t a1)
{
  return one-time initialization function for avatarStrokeColor(a1, 0xD000000000000012, 0x800000023CCA68F0, &static Assets.favoriteBadgeColor);
}

uint64_t *Assets.favoriteBadgeColor.unsafeMutableAddressor()
{
  if (one-time initialization token for favoriteBadgeColor != -1)
    swift_once();
  return &static Assets.favoriteBadgeColor;
}

uint64_t static Assets.favoriteBadgeColor.getter()
{
  return static Assets.noLocationBackground.getter(&one-time initialization token for favoriteBadgeColor);
}

uint64_t one-time initialization function for blurGradientColor(uint64_t a1)
{
  return one-time initialization function for avatarStrokeColor(a1, 0xD000000000000011, 0x800000023CCA68D0, &static Assets.blurGradientColor);
}

uint64_t *Assets.blurGradientColor.unsafeMutableAddressor()
{
  if (one-time initialization token for blurGradientColor != -1)
    swift_once();
  return &static Assets.blurGradientColor;
}

uint64_t static Assets.blurGradientColor.getter()
{
  return static Assets.noLocationBackground.getter(&one-time initialization token for blurGradientColor);
}

uint64_t one-time initialization function for locationCircleFillColor(uint64_t a1)
{
  return one-time initialization function for avatarStrokeColor(a1, 0xD000000000000017, 0x800000023CCA68B0, &static Assets.locationCircleFillColor);
}

uint64_t *Assets.locationCircleFillColor.unsafeMutableAddressor()
{
  if (one-time initialization token for locationCircleFillColor != -1)
    swift_once();
  return &static Assets.locationCircleFillColor;
}

uint64_t static Assets.locationCircleFillColor.getter()
{
  return static Assets.noLocationBackground.getter(&one-time initialization token for locationCircleFillColor);
}

uint64_t one-time initialization function for locationCircleStrokeColor(uint64_t a1)
{
  return one-time initialization function for avatarStrokeColor(a1, 0xD000000000000019, 0x800000023CCA6890, &static Assets.locationCircleStrokeColor);
}

uint64_t one-time initialization function for avatarStrokeColor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  id v5;
  uint64_t result;

  if (one-time initialization token for bundle != -1)
    swift_once();
  v5 = (id)static Assets.bundle;
  result = Color.init(_:bundle:)();
  *a4 = result;
  return result;
}

uint64_t *Assets.locationCircleStrokeColor.unsafeMutableAddressor()
{
  if (one-time initialization token for locationCircleStrokeColor != -1)
    swift_once();
  return &static Assets.locationCircleStrokeColor;
}

uint64_t static Assets.locationCircleStrokeColor.getter()
{
  return static Assets.noLocationBackground.getter(&one-time initialization token for locationCircleStrokeColor);
}

id one-time initialization function for bundle()
{
  if (one-time initialization token for instance != -1)
    swift_once();
  static Assets.bundle = static SiriFindMyUIBundle.instance;
  return (id)static SiriFindMyUIBundle.instance;
}

uint64_t static Color.avatarStroke.getter()
{
  return static Assets.noLocationBackground.getter(&one-time initialization token for avatarStrokeColor);
}

uint64_t static Color.timeLimitedBadge.getter()
{
  return static Assets.noLocationBackground.getter(&one-time initialization token for timeLimitedBadgeColor);
}

uint64_t static Color.favoriteBadge.getter()
{
  return static Assets.noLocationBackground.getter(&one-time initialization token for favoriteBadgeColor);
}

uint64_t static Color.blurGradient.getter()
{
  return static Assets.noLocationBackground.getter(&one-time initialization token for blurGradientColor);
}

uint64_t static Color.locationCircleFill.getter()
{
  return static Assets.noLocationBackground.getter(&one-time initialization token for locationCircleFillColor);
}

uint64_t static Color.locationCircleStroke.getter()
{
  return static Assets.noLocationBackground.getter(&one-time initialization token for locationCircleStrokeColor);
}

uint64_t type metadata accessor for SiriFindMyUIBundle()
{
  return objc_opt_self();
}

uint64_t method lookup function for SiriFindMyUIBundle()
{
  return swift_lookUpClassMethod();
}

ValueMetadata *type metadata accessor for Assets()
{
  return &type metadata for Assets;
}

double GeoParkedCar.latitude.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 48);
}

double GeoParkedCar.longitude.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 56);
}

uint64_t GeoParkedCar.label.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

void __swiftcall GeoParkedCar.init(note:localizedAddress:locationInfo:)(GeoUIFramework::GeoParkedCar *__return_ptr retstr, Swift::String_optional note, Swift::String_optional localizedAddress, GeoUIFramework::StandardMapData locationInfo)
{
  uint64_t v4;
  void *v5;

  v4 = *(_QWORD *)locationInfo.label._countAndFlagsBits;
  v5 = *(void **)(locationInfo.label._countAndFlagsBits + 8);
  retstr->note = note;
  retstr->localizedAddress = localizedAddress;
  retstr->locationInfo.label._countAndFlagsBits = v4;
  retstr->locationInfo.label._object = v5;
  *(_OWORD *)&retstr->locationInfo.latitude = *(_OWORD *)(locationInfo.label._countAndFlagsBits + 16);
}

uint64_t GeoParkedCar.note.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GeoParkedCar.localizedAddress.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GeoParkedCar.locationInfo.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 40);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 32);
  *(_QWORD *)(a1 + 8) = v2;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(v1 + 48);
  return swift_bridgeObjectRetain();
}

uint64_t GeoParkedCar.CodingKeys.stringValue.getter(char a1)
{
  if (!a1)
    return 1702129518;
  if (a1 == 1)
    return 0xD000000000000010;
  return 0x6E6F697461636F6CLL;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance GeoParkedCar.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance GeoParkedCar.CodingKeys()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance GeoParkedCar.CodingKeys()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GeoParkedCar.CodingKeys()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GeoParkedCar.CodingKeys()
{
  char *v0;

  return GeoParkedCar.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GeoParkedCar.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized GeoParkedCar.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance GeoParkedCar.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance GeoParkedCar.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GeoParkedCar.CodingKeys()
{
  lazy protocol witness table accessor for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GeoParkedCar.CodingKeys()
{
  lazy protocol witness table accessor for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t GeoParkedCar.encode(to:)(_QWORD *a1)
{
  _QWORD *v1;
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
  char v25;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GeoParkedCar.CodingKeys>);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = v1[2];
  v18 = v1[3];
  v19 = v7;
  v8 = v1[4];
  v16 = v1[5];
  v17 = v8;
  v9 = v1[6];
  v10 = v1[7];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v21) = 0;
  v11 = v20;
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  if (!v11)
  {
    v13 = v16;
    v12 = v17;
    LOBYTE(v21) = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v21 = v12;
    v22 = v13;
    v23 = v9;
    v24 = v10;
    v25 = 2;
    lazy protocol witness table accessor for type StandardMapData and conformance StandardMapData();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t lazy protocol witness table accessor for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoParkedCar.CodingKeys, &unk_250DE1FB8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoParkedCar.CodingKeys, &unk_250DE1FB8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoParkedCar.CodingKeys, &unk_250DE1FB8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoParkedCar.CodingKeys, &unk_250DE1FB8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type StandardMapData and conformance StandardMapData()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type StandardMapData and conformance StandardMapData;
  if (!lazy protocol witness table cache variable for type StandardMapData and conformance StandardMapData)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for StandardMapData, &type metadata for StandardMapData);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type StandardMapData and conformance StandardMapData);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type StandardMapData and conformance StandardMapData;
  if (!lazy protocol witness table cache variable for type StandardMapData and conformance StandardMapData)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for StandardMapData, &type metadata for StandardMapData);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type StandardMapData and conformance StandardMapData);
  }
  return result;
}

uint64_t GeoParkedCar.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GeoParkedCar.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  LOBYTE(v25) = 0;
  v9 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  v11 = v10;
  v24 = v9;
  LOBYTE(v25) = 1;
  swift_bridgeObjectRetain();
  v12 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  v14 = v13;
  v22 = v12;
  v29 = 2;
  lazy protocol witness table accessor for type StandardMapData and conformance StandardMapData();
  swift_bridgeObjectRetain();
  v23 = v14;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v16 = v25;
  v15 = v26;
  v17 = v27;
  v18 = v28;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v19 = v23;
  *a2 = v24;
  a2[1] = v11;
  a2[2] = v22;
  a2[3] = v19;
  a2[4] = v16;
  a2[5] = v15;
  a2[6] = v17;
  a2[7] = v18;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t protocol witness for Decodable.init(from:) in conformance GeoParkedCar@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return GeoParkedCar.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GeoParkedCar(_QWORD *a1)
{
  return GeoParkedCar.encode(to:)(a1);
}

uint64_t destroy for GeoParkedCar()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for GeoParkedCar(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for GeoParkedCar(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
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

uint64_t assignWithTake for GeoParkedCar(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for GeoParkedCar(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GeoParkedCar(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for GeoParkedCar()
{
  return &type metadata for GeoParkedCar;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GeoParkedCar.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for GeoParkedCar.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23CC88B3C + 4 * byte_23CCA3C89[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23CC88B70 + 4 * byte_23CCA3C84[v4]))();
}

uint64_t sub_23CC88B70(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23CC88B78(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23CC88B80);
  return result;
}

uint64_t sub_23CC88B8C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23CC88B94);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23CC88B98(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23CC88BA0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for GeoParkedCar.CodingKeys(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for GeoParkedCar.CodingKeys(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void *type metadata accessor for GeoParkedCar.CodingKeys()
{
  return &unk_250DE1FB8;
}

uint64_t specialized GeoParkedCar.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 1702129518 && a2 == 0xE400000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023CCA6970
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E6F697461636F6CLL && a2 == 0xEC0000006F666E49)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t AvatarBubbleShadow.style.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for AvatarBubbleShadow() + 20);
  return outlined init with copy of AvatarBubbleShadowStyle(v3, a1);
}

uint64_t type metadata accessor for AvatarBubbleShadow()
{
  uint64_t result;

  result = type metadata singleton initialization cache for AvatarBubbleShadow;
  if (!type metadata singleton initialization cache for AvatarBubbleShadow)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t AvatarBubbleShadow.style.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for AvatarBubbleShadow() + 20);
  return outlined assign with take of AvatarBubbleShadowStyle(a1, v3);
}

uint64_t outlined assign with take of AvatarBubbleShadowStyle(uint64_t a1, uint64_t a2)
{
  assignWithTake for AvatarBubbleShadowStyle(a2, a1);
  return a2;
}

uint64_t (*AvatarBubbleShadow.style.modify())()
{
  type metadata accessor for AvatarBubbleShadow();
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

uint64_t AvatarBubbleShadow.body(content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return closure #1 in AvatarBubbleShadow.body(content:)(v2, a1, a2);
}

uint64_t closure #1 in AvatarBubbleShadow.body(content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char v23;
  void (*v24)(char *, uint64_t);
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;

  v60 = a2;
  v64 = a3;
  v65 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, _ShadowEffect>);
  v4 = MEMORY[0x24BDAC7A8](v65);
  v58 = (uint64_t)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v59 = (uint64_t)&v58 - v6;
  v61 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, ModifiedContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, _ShadowEffect>>.Storage);
  MEMORY[0x24BDAC7A8](v61);
  v63 = (uint64_t)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>);
  v11 = MEMORY[0x24BDAC7A8](v62);
  v13 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v58 - v14;
  v16 = type metadata accessor for ColorScheme();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v58 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v58 - v21;
  specialized Environment.wrappedValue.getter((uint64_t)&v58 - v21);
  (*(void (**)(char *, _QWORD, uint64_t))(v17 + 104))(v20, *MEMORY[0x24BDEB3F8], v16);
  v23 = static ColorScheme.== infix(_:_:)();
  v24 = *(void (**)(char *, uint64_t))(v17 + 8);
  v24(v20, v16);
  v24(v22, v16);
  v25 = (_QWORD *)(a1 + *(int *)(type metadata accessor for AvatarBubbleShadow() + 20));
  if ((v23 & 1) != 0)
  {
    v26 = v25[17];
    v27 = v25[18];
    v28 = v25[19];
    v29 = Color.opacity(_:)();
    v30 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ViewModifier_Content<AvatarBubbleShadow>);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(v10, v60, v30);
    v31 = (uint64_t *)&v10[*(int *)(v8 + 36)];
    *v31 = v29;
    v31[1] = v28;
    v31[2] = v26;
    v31[3] = v27;
    v32 = v25[22];
    v33 = v25[23];
    v34 = v25[24];
    v35 = Color.opacity(_:)();
    outlined init with copy of Environment<ColorScheme>.Content((uint64_t)v10, (uint64_t)v13, &demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>);
    v36 = (uint64_t *)&v13[*(int *)(v62 + 36)];
    *v36 = v35;
    v36[1] = v34;
    v36[2] = v32;
    v36[3] = v33;
    outlined destroy of Environment<Locale>.Content((uint64_t)v10, &demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>);
    v37 = &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>;
    outlined init with take of ModifiedContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, _ShadowEffect>((uint64_t)v13, (uint64_t)v15, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>);
    outlined init with copy of Environment<ColorScheme>.Content((uint64_t)v15, v63, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>);
    swift_storeEnumTagMultiPayload();
    lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect> and conformance <> ModifiedContent<A, B>();
    lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, _ShadowEffect> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, _ShadowEffect>, lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect> and conformance <> ModifiedContent<A, B>);
    _ConditionalContent<>.init(storage:)();
    v38 = (uint64_t)v15;
  }
  else
  {
    v39 = v25[2];
    v40 = v25[3];
    v41 = v25[4];
    v42 = Color.opacity(_:)();
    v43 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ViewModifier_Content<AvatarBubbleShadow>);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 16))(v10, v60, v43);
    v44 = (uint64_t *)&v10[*(int *)(v8 + 36)];
    *v44 = v42;
    v44[1] = v41;
    v44[2] = v39;
    v44[3] = v40;
    v45 = v25[7];
    v46 = v25[8];
    v47 = v25[9];
    v48 = Color.opacity(_:)();
    outlined init with copy of Environment<ColorScheme>.Content((uint64_t)v10, (uint64_t)v15, &demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>);
    v49 = (uint64_t *)&v15[*(int *)(v62 + 36)];
    *v49 = v48;
    v49[1] = v47;
    v49[2] = v45;
    v49[3] = v46;
    outlined destroy of Environment<Locale>.Content((uint64_t)v10, &demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>);
    v50 = v25[12];
    v51 = v25[13];
    v52 = v25[14];
    v53 = Color.opacity(_:)();
    v54 = v58;
    outlined init with copy of Environment<ColorScheme>.Content((uint64_t)v15, v58, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>);
    v55 = (uint64_t *)(v54 + *(int *)(v65 + 36));
    *v55 = v53;
    v55[1] = v52;
    v55[2] = v50;
    v55[3] = v51;
    outlined destroy of Environment<Locale>.Content((uint64_t)v15, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>);
    v37 = &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, _ShadowEffect>;
    v56 = v59;
    outlined init with take of ModifiedContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, _ShadowEffect>(v54, v59, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, _ShadowEffect>);
    outlined init with copy of Environment<ColorScheme>.Content(v56, v63, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, _ShadowEffect>);
    swift_storeEnumTagMultiPayload();
    lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect> and conformance <> ModifiedContent<A, B>();
    lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, _ShadowEffect> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, _ShadowEffect>, lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect> and conformance <> ModifiedContent<A, B>);
    _ConditionalContent<>.init(storage:)();
    v38 = v56;
  }
  return outlined destroy of Environment<Locale>.Content(v38, v37);
}

__n128 AvatarBubbleShadow.init(style:)@<Q0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  char *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __n128 result;

  *a2 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  swift_storeEnumTagMultiPayload();
  v4 = (char *)a2 + *(int *)(type metadata accessor for AvatarBubbleShadow() + 20);
  v5 = *(_OWORD *)(a1 + 176);
  *((_OWORD *)v4 + 10) = *(_OWORD *)(a1 + 160);
  *((_OWORD *)v4 + 11) = v5;
  *((_QWORD *)v4 + 24) = *(_QWORD *)(a1 + 192);
  v6 = *(_OWORD *)(a1 + 112);
  *((_OWORD *)v4 + 6) = *(_OWORD *)(a1 + 96);
  *((_OWORD *)v4 + 7) = v6;
  v7 = *(_OWORD *)(a1 + 144);
  *((_OWORD *)v4 + 8) = *(_OWORD *)(a1 + 128);
  *((_OWORD *)v4 + 9) = v7;
  v8 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v4 + 2) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v4 + 3) = v8;
  v9 = *(_OWORD *)(a1 + 80);
  *((_OWORD *)v4 + 4) = *(_OWORD *)(a1 + 64);
  *((_OWORD *)v4 + 5) = v9;
  result = *(__n128 *)(a1 + 16);
  *(_OWORD *)v4 = *(_OWORD *)a1;
  *((__n128 *)v4 + 1) = result;
  return result;
}

uint64_t key path getter for EnvironmentValues.colorScheme : EnvironmentValues()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_23CC8947C()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t key path setter for EnvironmentValues.colorScheme : EnvironmentValues(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = type metadata accessor for ColorScheme();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return EnvironmentValues.colorScheme.setter();
}

uint64_t protocol witness for static ViewModifier._viewListCount(inputs:body:) in conformance AvatarBubbleShadow()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t protocol witness for ViewModifier.body(content:) in conformance AvatarBubbleShadow@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return closure #1 in AvatarBubbleShadow.body(content:)(v2, a1, a2);
}

uint64_t AvatarBubbleShadowStyle.lightShadow1.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v1 + 24);
  return swift_retain();
}

uint64_t AvatarBubbleShadowStyle.lightShadow2.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v2;

  *(_QWORD *)a1 = *(_QWORD *)(v1 + 40);
  v2 = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(a1 + 24) = v2;
  return swift_retain();
}

uint64_t AvatarBubbleShadowStyle.lightShadow3.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)a1 = *(_QWORD *)(v1 + 80);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 88);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v1 + 104);
  return swift_retain();
}

uint64_t AvatarBubbleShadowStyle.darkShadow1.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v2;

  *(_QWORD *)a1 = *(_QWORD *)(v1 + 120);
  v2 = *(_OWORD *)(v1 + 144);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 128);
  *(_OWORD *)(a1 + 24) = v2;
  return swift_retain();
}

uint64_t AvatarBubbleShadowStyle.darkShadow2.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)a1 = *(_QWORD *)(v1 + 160);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 168);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v1 + 184);
  return swift_retain();
}

__n128 AvatarBubbleShadowStyle.init(lightShadow1:lightShadow2:lightShadow3:darkShadow1:darkShadow2:)@<Q0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, uint64_t *a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __n128 result;

  v6 = *a5;
  v7 = *a4;
  v8 = *a3;
  v9 = *a2;
  *(_QWORD *)a6 = *(_QWORD *)a1;
  *(_OWORD *)(a6 + 8) = *(_OWORD *)(a1 + 8);
  *(_OWORD *)(a6 + 24) = *(_OWORD *)(a1 + 24);
  *(_QWORD *)(a6 + 40) = v9;
  v10 = *(_OWORD *)(a2 + 3);
  *(_OWORD *)(a6 + 48) = *(_OWORD *)(a2 + 1);
  *(_OWORD *)(a6 + 64) = v10;
  *(_QWORD *)(a6 + 80) = v8;
  *(_OWORD *)(a6 + 88) = *(_OWORD *)(a3 + 1);
  *(_OWORD *)(a6 + 104) = *(_OWORD *)(a3 + 3);
  *(_QWORD *)(a6 + 120) = v7;
  v11 = *(_OWORD *)(a4 + 3);
  *(_OWORD *)(a6 + 128) = *(_OWORD *)(a4 + 1);
  *(_OWORD *)(a6 + 144) = v11;
  *(_QWORD *)(a6 + 160) = v6;
  *(_OWORD *)(a6 + 168) = *(_OWORD *)(a5 + 1);
  result = *(__n128 *)(a5 + 3);
  *(__n128 *)(a6 + 184) = result;
  return result;
}

__int128 *AvatarBubbleShadowStyle.default.unsafeMutableAddressor()
{
  if (one-time initialization token for default != -1)
    swift_once();
  return &static AvatarBubbleShadowStyle.default;
}

uint64_t static AvatarBubbleShadowStyle.default.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for default != -1)
    swift_once();
  return outlined init with copy of AvatarBubbleShadowStyle((uint64_t)&static AvatarBubbleShadowStyle.default, a1);
}

uint64_t View.avatarShadows(style:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  char *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v17;

  v6 = type metadata accessor for AvatarBubbleShadow();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (uint64_t *)((char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  swift_storeEnumTagMultiPayload();
  v9 = (char *)v8 + *(int *)(v6 + 20);
  v10 = *(_OWORD *)(a1 + 176);
  *((_OWORD *)v9 + 10) = *(_OWORD *)(a1 + 160);
  *((_OWORD *)v9 + 11) = v10;
  *((_QWORD *)v9 + 24) = *(_QWORD *)(a1 + 192);
  v11 = *(_OWORD *)(a1 + 112);
  *((_OWORD *)v9 + 6) = *(_OWORD *)(a1 + 96);
  *((_OWORD *)v9 + 7) = v11;
  v12 = *(_OWORD *)(a1 + 144);
  *((_OWORD *)v9 + 8) = *(_OWORD *)(a1 + 128);
  *((_OWORD *)v9 + 9) = v12;
  v13 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v9 + 2) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v9 + 3) = v13;
  v14 = *(_OWORD *)(a1 + 80);
  *((_OWORD *)v9 + 4) = *(_OWORD *)(a1 + 64);
  *((_OWORD *)v9 + 5) = v14;
  v15 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)v9 = *(_OWORD *)a1;
  *((_OWORD *)v9 + 1) = v15;
  outlined retain of AvatarBubbleShadowStyle(a1);
  MEMORY[0x24262FFD8](v8, a2, v6, a3);
  return outlined destroy of AvatarBubbleShadow((uint64_t)v8);
}

uint64_t outlined retain of AvatarBubbleShadowStyle(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t outlined destroy of AvatarBubbleShadow(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AvatarBubbleShadow();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t associated type witness table accessor for ViewModifier.Body : View in AvatarBubbleShadow()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for AvatarBubbleShadow(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
  uint64_t v16;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    v4 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = type metadata accessor for ColorScheme();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v4, a2, v7);
    }
    else
    {
      *v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = *(int *)(a3 + 20);
    v10 = (char *)v4 + v9;
    v11 = (char *)a2 + v9;
    v12 = *((_QWORD *)v11 + 1);
    *(_QWORD *)v10 = *(_QWORD *)v11;
    *((_QWORD *)v10 + 1) = v12;
    *((_OWORD *)v10 + 1) = *((_OWORD *)v11 + 1);
    v13 = *((_QWORD *)v11 + 5);
    *((_QWORD *)v10 + 4) = *((_QWORD *)v11 + 4);
    *((_QWORD *)v10 + 5) = v13;
    *((_QWORD *)v10 + 6) = *((_QWORD *)v11 + 6);
    *(_OWORD *)(v10 + 56) = *(_OWORD *)(v11 + 56);
    v14 = *((_QWORD *)v11 + 10);
    *((_QWORD *)v10 + 9) = *((_QWORD *)v11 + 9);
    *((_QWORD *)v10 + 10) = v14;
    *((_QWORD *)v10 + 11) = *((_QWORD *)v11 + 11);
    *((_OWORD *)v10 + 6) = *((_OWORD *)v11 + 6);
    v15 = *((_QWORD *)v11 + 15);
    *((_QWORD *)v10 + 14) = *((_QWORD *)v11 + 14);
    *((_QWORD *)v10 + 15) = v15;
    *((_QWORD *)v10 + 16) = *((_QWORD *)v11 + 16);
    *(_OWORD *)(v10 + 136) = *(_OWORD *)(v11 + 136);
    v16 = *((_QWORD *)v11 + 20);
    *((_QWORD *)v10 + 19) = *((_QWORD *)v11 + 19);
    *((_QWORD *)v10 + 20) = v16;
    *((_QWORD *)v10 + 21) = *((_QWORD *)v11 + 21);
    *((_OWORD *)v10 + 11) = *((_OWORD *)v11 + 11);
    *((_QWORD *)v10 + 24) = *((_QWORD *)v11 + 24);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t destroy for AvatarBubbleShadow(uint64_t a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v2 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

_QWORD *initializeWithCopy for AvatarBubbleShadow(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = type metadata accessor for ColorScheme();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = *((_QWORD *)v9 + 1);
  *(_QWORD *)v8 = *(_QWORD *)v9;
  *((_QWORD *)v8 + 1) = v10;
  *((_OWORD *)v8 + 1) = *((_OWORD *)v9 + 1);
  v11 = *((_QWORD *)v9 + 5);
  *((_QWORD *)v8 + 4) = *((_QWORD *)v9 + 4);
  *((_QWORD *)v8 + 5) = v11;
  *((_QWORD *)v8 + 6) = *((_QWORD *)v9 + 6);
  *(_OWORD *)(v8 + 56) = *(_OWORD *)(v9 + 56);
  v12 = *((_QWORD *)v9 + 10);
  *((_QWORD *)v8 + 9) = *((_QWORD *)v9 + 9);
  *((_QWORD *)v8 + 10) = v12;
  *((_QWORD *)v8 + 11) = *((_QWORD *)v9 + 11);
  *((_OWORD *)v8 + 6) = *((_OWORD *)v9 + 6);
  v13 = *((_QWORD *)v9 + 15);
  *((_QWORD *)v8 + 14) = *((_QWORD *)v9 + 14);
  *((_QWORD *)v8 + 15) = v13;
  *((_QWORD *)v8 + 16) = *((_QWORD *)v9 + 16);
  *(_OWORD *)(v8 + 136) = *(_OWORD *)(v9 + 136);
  v14 = *((_QWORD *)v9 + 20);
  *((_QWORD *)v8 + 19) = *((_QWORD *)v9 + 19);
  *((_QWORD *)v8 + 20) = v14;
  *((_QWORD *)v8 + 21) = *((_QWORD *)v9 + 21);
  *((_OWORD *)v8 + 11) = *((_OWORD *)v9 + 11);
  *((_QWORD *)v8 + 24) = *((_QWORD *)v9 + 24);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for AvatarBubbleShadow(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  if (a1 != a2)
  {
    outlined destroy of Environment<Locale>.Content((uint64_t)a1, &demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = type metadata accessor for ColorScheme();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  *(_QWORD *)((char *)a1 + v7) = *(_QWORD *)((char *)a2 + v7);
  swift_retain();
  swift_release();
  v8[1] = v9[1];
  v8[2] = v9[2];
  v8[3] = v9[3];
  v8[4] = v9[4];
  v8[5] = v9[5];
  swift_retain();
  swift_release();
  v8[6] = v9[6];
  v8[7] = v9[7];
  v8[8] = v9[8];
  v8[9] = v9[9];
  v8[10] = v9[10];
  swift_retain();
  swift_release();
  v8[11] = v9[11];
  v8[12] = v9[12];
  v8[13] = v9[13];
  v8[14] = v9[14];
  v8[15] = v9[15];
  swift_retain();
  swift_release();
  v8[16] = v9[16];
  v8[17] = v9[17];
  v8[18] = v9[18];
  v8[19] = v9[19];
  v8[20] = v9[20];
  swift_retain();
  swift_release();
  v8[21] = v9[21];
  v8[22] = v9[22];
  v8[23] = v9[23];
  v8[24] = v9[24];
  return a1;
}

char *initializeWithTake for AvatarBubbleShadow(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = type metadata accessor for ColorScheme();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = *((_OWORD *)v10 + 11);
  *((_OWORD *)v9 + 10) = *((_OWORD *)v10 + 10);
  *((_OWORD *)v9 + 11) = v11;
  *((_QWORD *)v9 + 24) = *((_QWORD *)v10 + 24);
  v12 = *((_OWORD *)v10 + 7);
  *((_OWORD *)v9 + 6) = *((_OWORD *)v10 + 6);
  *((_OWORD *)v9 + 7) = v12;
  v13 = *((_OWORD *)v10 + 9);
  *((_OWORD *)v9 + 8) = *((_OWORD *)v10 + 8);
  *((_OWORD *)v9 + 9) = v13;
  v14 = *((_OWORD *)v10 + 3);
  *((_OWORD *)v9 + 2) = *((_OWORD *)v10 + 2);
  *((_OWORD *)v9 + 3) = v14;
  v15 = *((_OWORD *)v10 + 5);
  *((_OWORD *)v9 + 4) = *((_OWORD *)v10 + 4);
  *((_OWORD *)v9 + 5) = v15;
  v16 = *((_OWORD *)v10 + 1);
  *(_OWORD *)v9 = *(_OWORD *)v10;
  *((_OWORD *)v9 + 1) = v16;
  return a1;
}

char *assignWithTake for AvatarBubbleShadow(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  __int128 v11;
  __int128 v12;

  if (a1 != a2)
  {
    outlined destroy of Environment<Locale>.Content((uint64_t)a1, &demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = type metadata accessor for ColorScheme();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  *(_QWORD *)&a1[v8] = *(_QWORD *)v10;
  swift_release();
  *(_OWORD *)(v9 + 8) = *(_OWORD *)(v10 + 8);
  *(_OWORD *)(v9 + 24) = *(_OWORD *)(v10 + 24);
  *((_QWORD *)v9 + 5) = *((_QWORD *)v10 + 5);
  swift_release();
  v11 = *((_OWORD *)v10 + 4);
  *((_OWORD *)v9 + 3) = *((_OWORD *)v10 + 3);
  *((_OWORD *)v9 + 4) = v11;
  *((_QWORD *)v9 + 10) = *((_QWORD *)v10 + 10);
  swift_release();
  *(_OWORD *)(v9 + 88) = *(_OWORD *)(v10 + 88);
  *(_OWORD *)(v9 + 104) = *(_OWORD *)(v10 + 104);
  *((_QWORD *)v9 + 15) = *((_QWORD *)v10 + 15);
  swift_release();
  v12 = *((_OWORD *)v10 + 9);
  *((_OWORD *)v9 + 8) = *((_OWORD *)v10 + 8);
  *((_OWORD *)v9 + 9) = v12;
  *((_QWORD *)v9 + 20) = *((_QWORD *)v10 + 20);
  swift_release();
  *(_OWORD *)(v9 + 168) = *(_OWORD *)(v10 + 168);
  *(_OWORD *)(v9 + 184) = *(_OWORD *)(v10 + 184);
  return a1;
}

uint64_t getEnumTagSinglePayload for AvatarBubbleShadow()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CC8A0C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for AvatarBubbleShadow()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CC8A154(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

void type metadata completion function for AvatarBubbleShadow()
{
  unint64_t v0;

  type metadata accessor for Environment<ColorScheme>.Content();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void type metadata accessor for Environment<ColorScheme>.Content()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for Environment<ColorScheme>.Content)
  {
    type metadata accessor for ColorScheme();
    v0 = type metadata accessor for Environment.Content();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Environment<ColorScheme>.Content);
  }
}

uint64_t destroy for AvatarBubbleShadowStyle()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for AvatarBubbleShadowStyle(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v5 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v5;
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  v6 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v6;
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  v7 = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = v7;
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for AvatarBubbleShadowStyle(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_retain();
  swift_release();
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  a1[10] = a2[10];
  swift_retain();
  swift_release();
  a1[11] = a2[11];
  a1[12] = a2[12];
  a1[13] = a2[13];
  a1[14] = a2[14];
  a1[15] = a2[15];
  swift_retain();
  swift_release();
  a1[16] = a2[16];
  a1[17] = a2[17];
  a1[18] = a2[18];
  a1[19] = a2[19];
  a1[20] = a2[20];
  swift_retain();
  swift_release();
  a1[21] = a2[21];
  a1[22] = a2[22];
  a1[23] = a2[23];
  a1[24] = a2[24];
  return a1;
}

__n128 __swift_memcpy200_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  __int128 v9;
  __int128 v10;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  v5 = *(_OWORD *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 96) = v6;
  result = *(__n128 *)(a2 + 144);
  v9 = *(_OWORD *)(a2 + 160);
  v10 = *(_OWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 176) = v10;
  *(__n128 *)(a1 + 144) = result;
  return result;
}

uint64_t assignWithTake for AvatarBubbleShadowStyle(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_release();
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_release();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_release();
  v5 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v5;
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  swift_release();
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  return a1;
}

uint64_t getEnumTagSinglePayload for AvatarBubbleShadowStyle(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 200))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AvatarBubbleShadowStyle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 200) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 200) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AvatarBubbleShadowStyle()
{
  return &type metadata for AvatarBubbleShadowStyle;
}

unint64_t lazy protocol witness table accessor for type Group<_ConditionalContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, ModifiedContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, _ShadowEffect>>> and conformance <A> Group<A>()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = lazy protocol witness table cache variable for type Group<_ConditionalContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, ModifiedContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, _ShadowEffect>>> and conformance <A> Group<A>;
  if (!lazy protocol witness table cache variable for type Group<_ConditionalContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, ModifiedContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, _ShadowEffect>>> and conformance <A> Group<A>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Group<_ConditionalContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, ModifiedContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, _ShadowEffect>>>);
    v2 = lazy protocol witness table accessor for type _ConditionalContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, ModifiedContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, _ShadowEffect>> and conformance <> _ConditionalContent<A, B>();
    result = MEMORY[0x242630878](MEMORY[0x24BDF3F48], v1, &v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Group<_ConditionalContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, ModifiedContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, _ShadowEffect>>> and conformance <A> Group<A>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type _ConditionalContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, ModifiedContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, _ShadowEffect>> and conformance <> _ConditionalContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type _ConditionalContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, ModifiedContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, _ShadowEffect>> and conformance <> _ConditionalContent<A, B>;
  if (!lazy protocol witness table cache variable for type _ConditionalContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, ModifiedContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, _ShadowEffect>> and conformance <> _ConditionalContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, ModifiedContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, _ShadowEffect>>);
    v2[0] = lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect> and conformance <> ModifiedContent<A, B>();
    v2[1] = lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, _ShadowEffect> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, _ShadowEffect>, lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect> and conformance <> ModifiedContent<A, B>);
    result = MEMORY[0x242630878](MEMORY[0x24BDEF3D8], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _ConditionalContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, ModifiedContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, _ShadowEffect>> and conformance <> _ConditionalContent<A, B>);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect> and conformance <> ModifiedContent<A, B>()
{
  return lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, lazy protocol witness table accessor for type ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect> and conformance <> ModifiedContent<A, B>);
}

uint64_t lazy protocol witness table accessor for type ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect> and conformance <> ModifiedContent<A, B>()
{
  return lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, (uint64_t (*)(void))lazy protocol witness table accessor for type _ViewModifier_Content<AvatarBubbleShadow> and conformance _ViewModifier_Content<A>);
}

uint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect> and conformance <> ModifiedContent<A, B>(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = a3();
    v7[1] = MEMORY[0x24BDEC460];
    result = MEMORY[0x242630878](MEMORY[0x24BDED300], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type _ViewModifier_Content<AvatarBubbleShadow> and conformance _ViewModifier_Content<A>()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type _ViewModifier_Content<AvatarBubbleShadow> and conformance _ViewModifier_Content<A>;
  if (!lazy protocol witness table cache variable for type _ViewModifier_Content<AvatarBubbleShadow> and conformance _ViewModifier_Content<A>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for _ViewModifier_Content<AvatarBubbleShadow>);
    result = MEMORY[0x242630878](MEMORY[0x24BDEFB70], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _ViewModifier_Content<AvatarBubbleShadow> and conformance _ViewModifier_Content<A>);
  }
  return result;
}

uint64_t sub_23CC8A880(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  type metadata accessor for AvatarBubbleShadow();
  v2 = type metadata accessor for ModifiedContent();
  v4[0] = v1;
  v4[1] = lazy protocol witness table accessor for type AvatarBubbleShadow and conformance AvatarBubbleShadow();
  return MEMORY[0x242630878](MEMORY[0x24BDED300], v2, v4);
}

unint64_t lazy protocol witness table accessor for type AvatarBubbleShadow and conformance AvatarBubbleShadow()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type AvatarBubbleShadow and conformance AvatarBubbleShadow;
  if (!lazy protocol witness table cache variable for type AvatarBubbleShadow and conformance AvatarBubbleShadow)
  {
    v1 = type metadata accessor for AvatarBubbleShadow();
    result = MEMORY[0x242630878](&protocol conformance descriptor for AvatarBubbleShadow, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AvatarBubbleShadow and conformance AvatarBubbleShadow);
  }
  return result;
}

uint64_t outlined init with take of ModifiedContent<ModifiedContent<ModifiedContent<_ViewModifier_Content<AvatarBubbleShadow>, _ShadowEffect>, _ShadowEffect>, _ShadowEffect>(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t ContactDisambiguationView.model.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v1[1];
  v3 = v1[2];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id ContactDisambiguationView.logObject.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 24);
}

uint64_t ContactDisambiguationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  char *v34;
  uint64_t KeyPath;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v41 = a1;
  v2 = type metadata accessor for ContactDisambiguationView();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>);
  v38 = *(_QWORD *)(v39 - 8);
  v40 = *(_QWORD *)(v38 + 64);
  v5 = MEMORY[0x24BDAC7A8](v39);
  v37 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v42 = (char *)&v33 - v7;
  v36 = type metadata accessor for PrimaryHeaderRichView();
  v8 = *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64);
  v9 = *(_QWORD *)(v36 - 8);
  v10 = MEMORY[0x24BDAC7A8](v36);
  v11 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v33 - v12;
  v15 = *v1;
  v14 = v1[1];
  v57 = MEMORY[0x24BEE0D00];
  v58 = MEMORY[0x24BEAE5C0];
  v55 = v15;
  v56 = v14;
  v54 = 0;
  v52 = 0u;
  v53 = 0u;
  v51 = 0;
  v49 = 0u;
  v50 = 0u;
  v48 = 0;
  v47 = 0u;
  v46 = 0u;
  v45 = 0;
  v44 = 0u;
  v43 = 0u;
  swift_bridgeObjectRetain();
  v34 = v13;
  PrimaryHeaderRichView.init(text1:text2:text3:text4:thumbnail:addTint:)();
  *(_QWORD *)&v52 = v1[2];
  KeyPath = swift_getKeyPath();
  outlined init with copy of ContactDisambiguationView((uint64_t)v1, (uint64_t)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for ContactDisambiguationView);
  v16 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v17 = swift_allocObject();
  outlined init with take of ContactDisambiguationView((uint64_t)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16, (uint64_t (*)(_QWORD))type metadata accessor for ContactDisambiguationView);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GeoContact]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0);
  lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type [GeoContact] and conformance [A], &demangling cache variable for type metadata for [GeoContact], MEMORY[0x24BEE12D8]);
  lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type GeoContact and conformance GeoContact, (uint64_t (*)(uint64_t))type metadata accessor for GeoContact, (uint64_t)&protocol conformance descriptor for GeoContact);
  v18 = type metadata accessor for SimpleItemRichView();
  v19 = lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type SimpleItemRichView and conformance SimpleItemRichView, (uint64_t (*)(uint64_t))MEMORY[0x24BEADE98], MEMORY[0x24BEADE78]);
  v55 = v18;
  v56 = v19;
  swift_getOpaqueTypeConformance2();
  v20 = v42;
  ForEach<>.init(_:id:content:)();
  v21 = v9;
  v22 = v36;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v11, v13, v36);
  v23 = v38;
  v24 = v37;
  v25 = v39;
  (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v37, v20, v39);
  v26 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v27 = v23;
  v28 = (v8 + *(unsigned __int8 *)(v23 + 80) + v26) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  v29 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v21 + 32))(v29 + v26, v11, v22);
  (*(void (**)(unint64_t, char *, uint64_t))(v27 + 32))(v29 + v28, v24, v25);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DisambiguationStandardView<PrimaryHeaderRichView, ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>>);
  v31 = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type DisambiguationStandardView<PrimaryHeaderRichView, ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>> and conformance DisambiguationStandardView<A, B>, &demangling cache variable for type metadata for DisambiguationStandardView<PrimaryHeaderRichView, ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>>, MEMORY[0x24BEAE330]);
  MEMORY[0x2426301E8](partial apply for closure #2 in ContactDisambiguationView.body.getter, v29, v30, v31);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v42, v25);
  return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v34, v22);
}

uint64_t type metadata accessor for ContactDisambiguationView()
{
  uint64_t result;

  result = type metadata singleton initialization cache for ContactDisambiguationView;
  if (!type metadata singleton initialization cache for ContactDisambiguationView)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t closure #1 in ContactDisambiguationView.body.getter@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  void (*v23)(char *, _QWORD, uint64_t);
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *boxed_opaque_existential_1;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  _QWORD v61[2];
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  uint64_t v81[5];
  __int128 v82;
  __int128 v83;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  __int128 v101;
  __int128 v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;

  v67 = a2;
  v77 = a3;
  v4 = type metadata accessor for GeoContact();
  v68 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v69 = v5;
  v73 = (uint64_t)v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for ContactDisambiguationView();
  v64 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v65 = v7;
  v66 = (uint64_t)v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for SimpleItemRichView();
  v75 = *(_QWORD *)(v8 - 8);
  v76 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v72 = (char *)v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0);
  v71 = *(_QWORD *)(v74 - 8);
  MEMORY[0x24BDAC7A8](v74);
  v70 = (char *)v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = type metadata accessor for ImageElement.ImageStyle();
  v62 = *(_QWORD *)(v78 - 8);
  MEMORY[0x24BDAC7A8](v78);
  v12 = (char *)v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for ImageElement.SourceType();
  v61[0] = *(_QWORD *)(v13 - 8);
  v14 = v61[0];
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v61 - v18;
  v20 = type metadata accessor for ImageElement();
  MEMORY[0x24BDAC7A8](v20);
  v63 = type metadata accessor for RFImageView();
  v79 = *(_QWORD *)(v63 - 8);
  MEMORY[0x24BDAC7A8](v63);
  v22 = (char *)v61 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = a1;
  GeoContact.image.getter();
  v23 = *(void (**)(char *, _QWORD, uint64_t))(v14 + 104);
  v23(v19, *MEMORY[0x24BEAAD20], v13);
  v61[1] = 0x800000023CCA66F0;
  (*(void (**)(char *, _QWORD, uint64_t))(v62 + 104))(v12, *MEMORY[0x24BEAABB8], v78);
  ImageElement.AppIcon.init(_:imageStyle:)();
  v23(v17, *MEMORY[0x24BEAAD10], v13);
  static ImageElement.badgedImage(image:badge:)();
  v24 = *(void (**)(char *, uint64_t))(v61[0] + 8);
  v24(v17, v13);
  v24(v19, v13);
  v78 = (uint64_t)v22;
  RFImageView.init(_:)();
  v25 = v80[3];
  v26 = v80[4];
  v106 = MEMORY[0x24BEE0D00];
  v107 = MEMORY[0x24BEAE5C0];
  v104 = v25;
  v105 = v26;
  v103 = 0;
  v101 = 0u;
  v102 = 0u;
  v100 = 0;
  v27 = v80[9] & 0xFFFFFFFFFFFFFFFELL;
  v98 = 0u;
  v99 = 0u;
  if (v27 == 2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    v28 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if ((v28 & 1) == 0)
    {
      v30 = 0;
      v29 = 0xE000000000000000;
      goto LABEL_6;
    }
  }
  v29 = 0xE300000000000000;
  v30 = 5459283;
LABEL_6:
  v94 = v30;
  v95 = v29;
  lazy protocol witness table accessor for type String and conformance String();
  v31 = Text.init<A>(_:)();
  v33 = v32;
  v35 = v34 & 1;
  static Color.green.getter();
  v36 = Text.foregroundColor(_:)();
  v38 = v37;
  v40 = v39;
  swift_release();
  v41 = v40 & 1;
  outlined consume of Text.Storage(v31, v33, v35);
  swift_bridgeObjectRelease();
  static Font.title2.getter();
  v42 = Text.font(_:)();
  v44 = v43;
  v46 = v45;
  v48 = v47;
  swift_release();
  outlined consume of Text.Storage(v36, v38, v41);
  swift_bridgeObjectRelease();
  v96 = MEMORY[0x24BDF1FA0];
  v97 = MEMORY[0x24BEAD6B8];
  v49 = swift_allocObject();
  v94 = v49;
  *(_QWORD *)(v49 + 16) = v42;
  *(_QWORD *)(v49 + 24) = v44;
  *(_BYTE *)(v49 + 32) = v46 & 1;
  *(_QWORD *)(v49 + 40) = v48;
  v93 = 0;
  v91 = 0u;
  v92 = 0u;
  v90 = 0;
  v88 = 0u;
  v89 = 0u;
  v87 = 0;
  v85 = 0u;
  v86 = 0u;
  v84 = 0;
  v82 = 0u;
  v83 = 0u;
  v50 = v63;
  v81[3] = v63;
  v81[4] = MEMORY[0x24BEADA28];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v81);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v79 + 16))(boxed_opaque_existential_1, v78, v50);
  v52 = v72;
  SimpleItemRichView.init(text1:text2:text3:text4:text5:text6:text7:text8:thumbnail:)();
  v53 = v66;
  outlined init with copy of ContactDisambiguationView(v67, v66, (uint64_t (*)(_QWORD))type metadata accessor for ContactDisambiguationView);
  v54 = v73;
  outlined init with copy of ContactDisambiguationView((uint64_t)v80, v73, (uint64_t (*)(_QWORD))type metadata accessor for GeoContact);
  v55 = (*(unsigned __int8 *)(v64 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80);
  v56 = (v65 + *(unsigned __int8 *)(v68 + 80) + v55) & ~(unint64_t)*(unsigned __int8 *)(v68 + 80);
  v57 = swift_allocObject();
  outlined init with take of ContactDisambiguationView(v53, v57 + v55, (uint64_t (*)(_QWORD))type metadata accessor for ContactDisambiguationView);
  outlined init with take of ContactDisambiguationView(v54, v57 + v56, (uint64_t (*)(_QWORD))type metadata accessor for GeoContact);
  lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type SimpleItemRichView and conformance SimpleItemRichView, (uint64_t (*)(uint64_t))MEMORY[0x24BEADE98], MEMORY[0x24BEADE78]);
  v58 = v70;
  v59 = v76;
  View.componentTapped(isNavigation:perform:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v75 + 8))(v52, v59);
  (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v78, v50);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v71 + 32))(v77, v58, v74);
}

uint64_t sub_23CC8B504()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for ContactDisambiguationView();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v4 = v3 + *(int *)(v1 + 28);
  v5 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in ContactDisambiguationView.body.getter@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ContactDisambiguationView() - 8) + 80);
  return closure #1 in ContactDisambiguationView.body.getter(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t closure #1 in closure #1 in ContactDisambiguationView.body.getter(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t inited;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for InteractionType?);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ActionProperty?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for StandardActionHandler?);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1[3];
  v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_23CC7E000, v13, v14, "component tapped", v15, 2u);
    MEMORY[0x2426308F0](v15, -1, -1);
  }
  type metadata accessor for ContactDisambiguationView();
  ActionHandler.wrappedValue.getter();
  v16 = type metadata accessor for StandardActionHandler();
  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v12, 1, v16) == 1)
    return outlined destroy of Environment<Locale>.Content((uint64_t)v12, &demangling cache variable for type metadata for StandardActionHandler?);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ActionElementConvertible>);
  v19 = swift_allocObject();
  v29 = xmmword_23CCA3820;
  *(_OWORD *)(v19 + 16) = xmmword_23CCA3820;
  v20 = a1[4];
  v30 = a1[5];
  v31 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(AnyHashable, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = v29;
  v32 = 0x6E65697069636552;
  v33 = 0xE900000000000074;
  v22 = MEMORY[0x24BEE0D00];
  AnyHashable.init<A>(_:)();
  v24 = *(_QWORD *)(a2 + 56);
  v23 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(inited + 96) = v22;
  *(_QWORD *)(inited + 72) = v24;
  *(_QWORD *)(inited + 80) = v23;
  swift_bridgeObjectRetain();
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  v25 = type metadata accessor for Command();
  v26 = MEMORY[0x24BEAD1F0];
  *(_QWORD *)(v19 + 56) = v25;
  *(_QWORD *)(v19 + 64) = v26;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v19 + 32));
  static Command.directInvocation(identifier:payload:isNavigation:)();
  swift_bridgeObjectRelease();
  ActionProperty.init(_:)();
  v27 = type metadata accessor for ActionProperty();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v9, 0, 1, v27);
  v28 = type metadata accessor for InteractionType();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v6, 1, 1, v28);
  StandardActionHandler.perform(_:interactionType:)();
  outlined destroy of Environment<Locale>.Content((uint64_t)v6, &demangling cache variable for type metadata for InteractionType?);
  outlined destroy of Environment<Locale>.Content((uint64_t)v9, &demangling cache variable for type metadata for ActionProperty?);
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v12, v16);
}

uint64_t closure #2 in ContactDisambiguationView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v15[2];

  v15[0] = a2;
  v15[1] = a3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = type metadata accessor for PrimaryHeaderRichView();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  v10 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v11 + v10, (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 16))((char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v15[0], v4);
  v12 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v13 + v12, (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type PrimaryHeaderRichView and conformance PrimaryHeaderRichView, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE048], MEMORY[0x24BEAE030]);
  lazy protocol witness table accessor for type ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0> and conformance <> ForEach<A, B, C>();
  return DisambiguationStandardView.init(header:content:)();
}

uint64_t sub_23CC8BAC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = type metadata accessor for PrimaryHeaderRichView();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v3 + *(_QWORD *)(v2 + 64);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t partial apply for closure #2 in ContactDisambiguationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(type metadata accessor for PrimaryHeaderRichView() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = v4 + *(_QWORD *)(v3 + 64);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>)
                                      - 8)
                          + 80);
  return closure #2 in ContactDisambiguationView.body.getter(v1 + v4, v1 + ((v5 + v6) & ~v6), a1);
}

uint64_t ContactDisambiguationView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *(_QWORD *)a1;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 8);
  type metadata accessor for OS_os_log();
  *(_QWORD *)(a2 + 24) = OS_os_log.init(subsystem:category:)();
  *(_QWORD *)(a2 + 32) = 0xD00000000000002CLL;
  *(_QWORD *)(a2 + 40) = 0x800000023CCA6990;
  type metadata accessor for ContactDisambiguationView();
  return ActionHandler.init()();
}

unint64_t type metadata accessor for OS_os_log()
{
  unint64_t result;

  result = lazy cache variable for type metadata for OS_os_log;
  if (!lazy cache variable for type metadata for OS_os_log)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_os_log);
  }
  return result;
}

uint64_t static SampleView_Previews.previews.getter()
{
  if (one-time initialization token for testView1 != -1)
    swift_once();
  type metadata accessor for ContactDisambiguationView();
  lazy protocol witness table accessor for type GeoDataModels.ContactDisambiguationDataModel and conformance GeoDataModels.ContactDisambiguationDataModel();
  lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type ContactDisambiguationView and conformance ContactDisambiguationView, (uint64_t (*)(uint64_t))type metadata accessor for ContactDisambiguationView, (uint64_t)&protocol conformance descriptor for ContactDisambiguationView);
  swift_bridgeObjectRetain();
  return SnippetPreview.init(snippetModel:content:)();
}

uint64_t implicit closure #1 in static SampleView_Previews.previews.getter@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a1[1];
  v4 = a1[2];
  *a2 = *a1;
  a2[1] = v3;
  a2[2] = v4;
  type metadata accessor for OS_os_log();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  a2[3] = OS_os_log.init(subsystem:category:)();
  a2[4] = 0xD00000000000002CLL;
  a2[5] = 0x800000023CCA6990;
  type metadata accessor for ContactDisambiguationView();
  return ActionHandler.init()();
}

uint64_t protocol witness for static PreviewProvider.previews.getter in conformance SampleView_Previews()
{
  if (one-time initialization token for testView1 != -1)
    swift_once();
  type metadata accessor for ContactDisambiguationView();
  lazy protocol witness table accessor for type GeoDataModels.ContactDisambiguationDataModel and conformance GeoDataModels.ContactDisambiguationDataModel();
  lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type ContactDisambiguationView and conformance ContactDisambiguationView, (uint64_t (*)(uint64_t))type metadata accessor for ContactDisambiguationView, (uint64_t)&protocol conformance descriptor for ContactDisambiguationView);
  swift_bridgeObjectRetain();
  return SnippetPreview.init(snippetModel:content:)();
}

uint64_t protocol witness for static _PreviewProvider._previews.getter in conformance SampleView_Previews()
{
  lazy protocol witness table accessor for type SampleView_Previews and conformance SampleView_Previews();
  return static PreviewProvider._previews.getter();
}

uint64_t protocol witness for static _PreviewProvider._platform.getter in conformance SampleView_Previews()
{
  lazy protocol witness table accessor for type SampleView_Previews and conformance SampleView_Previews();
  return static PreviewProvider._platform.getter();
}

uint64_t one-time initialization function for BrandonBacon()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v0 = type metadata accessor for GeoContact();
  __swift_allocate_value_buffer(v0, BrandonBacon);
  v1 = __swift_project_value_buffer(v0, (uint64_t)BrandonBacon);
  v2 = v1 + *(int *)(v0 + 40);
  v3 = *MEMORY[0x24BEAAAC8];
  v4 = type metadata accessor for ImageElement.ImageStyle();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 104))(v2, v3, v4);
  *(_QWORD *)v1 = 0;
  *(_QWORD *)(v1 + 8) = 0;
  *(_QWORD *)(v1 + 16) = 0;
  strcpy((char *)(v1 + 24), "Brandon Bacon");
  *(_WORD *)(v1 + 38) = -4864;
  *(_QWORD *)(v1 + 40) = 16962;
  *(_QWORD *)(v1 + 48) = 0xE200000000000000;
  *(_QWORD *)(v1 + 56) = 0xD0000000000000FCLL;
  *(_QWORD *)(v1 + 64) = 0x800000023CCA6AF0;
  *(_QWORD *)(v1 + 72) = 1;
  return result;
}

uint64_t one-time initialization function for TimBacon()
{
  uint64_t v0;
  _QWORD *v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v0 = type metadata accessor for GeoContact();
  __swift_allocate_value_buffer(v0, TimBacon);
  v1 = (_QWORD *)__swift_project_value_buffer(v0, (uint64_t)TimBacon);
  v2 = (char *)v1 + *(int *)(v0 + 40);
  v3 = *MEMORY[0x24BEAAAC8];
  v4 = type metadata accessor for ImageElement.ImageStyle();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 104))(v2, v3, v4);
  *v1 = 1;
  v1[1] = 0;
  v1[2] = 0;
  v1[3] = 0x6F636142206D6954;
  v1[4] = 0xE90000000000006ELL;
  v1[5] = 16980;
  v1[6] = 0xE200000000000000;
  v1[7] = 0xD0000000000000FCLL;
  v1[8] = 0x800000023CCA69F0;
  v1[9] = 2;
  return result;
}

uint64_t one-time initialization function for testView1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  _OWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<GeoContact>);
  v0 = type metadata accessor for GeoContact();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = *(_QWORD *)(v1 + 72);
  v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v4 = (_OWORD *)swift_allocObject();
  v4[1] = xmmword_23CCA3FA0;
  v5 = (uint64_t)v4 + v3;
  if (one-time initialization token for BrandonBacon != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v0, (uint64_t)BrandonBacon);
  outlined init with copy of ContactDisambiguationView(v6, v5, (uint64_t (*)(_QWORD))type metadata accessor for GeoContact);
  if (one-time initialization token for TimBacon != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v0, (uint64_t)TimBacon);
  result = outlined init with copy of ContactDisambiguationView(v7, v5 + v2, (uint64_t (*)(_QWORD))type metadata accessor for GeoContact);
  testView1._rawValue = v4;
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<GeoTrafficIncident>);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_23CCA4410;
  if (one-time initialization token for crash != -1)
    swift_once();
  v2 = *(_QWORD *)(crash.index + 32);
  v1 = *(_QWORD *)(crash.index + 40);
  v3 = *(_OWORD *)(crash.index + 16);
  *(_OWORD *)(v0 + 32) = *(_OWORD *)crash.index;
  *(_OWORD *)(v0 + 48) = v3;
  *(_QWORD *)(v0 + 64) = v2;
  *(_QWORD *)(v0 + 72) = v1;
  v4 = one-time initialization token for hazard;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v4 != -1)
    swift_once();
  v6 = *(_QWORD *)(crash.displayName._countAndFlagsBits + 32);
  v5 = *(_QWORD *)(crash.displayName._countAndFlagsBits + 40);
  v7 = *(_OWORD *)(crash.displayName._countAndFlagsBits + 16);
  *(_OWORD *)(v0 + 80) = *(_OWORD *)crash.displayName._countAndFlagsBits;
  *(_OWORD *)(v0 + 96) = v7;
  *(_QWORD *)(v0 + 112) = v6;
  *(_QWORD *)(v0 + 120) = v5;
  v8 = one-time initialization token for sc;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v8 != -1)
    swift_once();
  v10 = *(_QWORD *)(sc.index + 32);
  v9 = *(_QWORD *)(sc.index + 40);
  v11 = *(_OWORD *)(sc.index + 16);
  *(_OWORD *)(v0 + 128) = *(_OWORD *)sc.index;
  *(_OWORD *)(v0 + 144) = v11;
  *(_QWORD *)(v0 + 160) = v10;
  *(_QWORD *)(v0 + 168) = v9;
  testView1._rawValue = (void *)v0;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

unint64_t lazy protocol witness table accessor for type GeoDataModels.ContactDisambiguationDataModel and conformance GeoDataModels.ContactDisambiguationDataModel()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel and conformance GeoDataModels.ContactDisambiguationDataModel;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel and conformance GeoDataModels.ContactDisambiguationDataModel)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.ContactDisambiguationDataModel, &type metadata for GeoDataModels.ContactDisambiguationDataModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel and conformance GeoDataModels.ContactDisambiguationDataModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel and conformance GeoDataModels.ContactDisambiguationDataModel;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel and conformance GeoDataModels.ContactDisambiguationDataModel)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.ContactDisambiguationDataModel, &type metadata for GeoDataModels.ContactDisambiguationDataModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel and conformance GeoDataModels.ContactDisambiguationDataModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel and conformance GeoDataModels.ContactDisambiguationDataModel;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel and conformance GeoDataModels.ContactDisambiguationDataModel)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.ContactDisambiguationDataModel, &type metadata for GeoDataModels.ContactDisambiguationDataModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel and conformance GeoDataModels.ContactDisambiguationDataModel);
  }
  return result;
}

uint64_t associated type witness table accessor for View.Body : View in ContactDisambiguationView()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t lazy protocol witness table accessor for type SampleView_Previews and conformance SampleView_Previews()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SampleView_Previews and conformance SampleView_Previews;
  if (!lazy protocol witness table cache variable for type SampleView_Previews and conformance SampleView_Previews)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for SampleView_Previews, &type metadata for SampleView_Previews);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SampleView_Previews and conformance SampleView_Previews);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SampleView_Previews and conformance SampleView_Previews;
  if (!lazy protocol witness table cache variable for type SampleView_Previews and conformance SampleView_Previews)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for SampleView_Previews, &type metadata for SampleView_Previews);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SampleView_Previews and conformance SampleView_Previews);
  }
  return result;
}

uint64_t associated type witness table accessor for PreviewProvider.Previews : View in SampleView_Previews()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for ContactDisambiguationView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  id v13;
  uint64_t v14;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v14 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = (void *)a2[3];
    a1[2] = a2[2];
    a1[3] = (uint64_t)v6;
    v7 = a2[5];
    v8 = *(int *)(a3 + 28);
    v9 = (char *)a2 + v8;
    v10 = (char *)a1 + v8;
    a1[4] = a2[4];
    a1[5] = v7;
    v11 = type metadata accessor for ActionHandler();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13 = v6;
    swift_bridgeObjectRetain();
    v12(v10, v9, v11);
  }
  return v3;
}

uint64_t destroy for ContactDisambiguationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = type metadata accessor for ActionHandler();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for ContactDisambiguationView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  id v12;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = (void *)a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = a2[5];
  v7 = *(int *)(a3 + 28);
  v8 = (char *)a2 + v7;
  v9 = (char *)a1 + v7;
  a1[4] = a2[4];
  a1[5] = v6;
  v10 = type metadata accessor for ActionHandler();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12 = v5;
  swift_bridgeObjectRetain();
  v11(v9, v8, v10);
  return a1;
}

_QWORD *assignWithCopy for ContactDisambiguationView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (void *)a2[3];
  v7 = (void *)a1[3];
  a1[3] = v6;
  v8 = v6;

  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = *(int *)(a3 + 28);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = type metadata accessor for ActionHandler();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

uint64_t initializeWithTake for ContactDisambiguationView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v5 = *(int *)(a3 + 28);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

_QWORD *assignWithTake for ContactDisambiguationView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  v7 = (void *)a1[3];
  a1[3] = a2[3];

  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  v9 = *(int *)(a3 + 28);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = type metadata accessor for ActionHandler();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactDisambiguationView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CC8C6FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for ActionHandler();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for ContactDisambiguationView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CC8C784(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = type metadata accessor for ActionHandler();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata completion function for ContactDisambiguationView()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for ActionHandler();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SampleView_Previews()
{
  return &type metadata for SampleView_Previews;
}

uint64_t sub_23CC8C894()
{
  return lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type ComponentStack<DisambiguationStandardView<PrimaryHeaderRichView, ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>>> and conformance ComponentStack<A>, &demangling cache variable for type metadata for ComponentStack<DisambiguationStandardView<PrimaryHeaderRichView, ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>>>, MEMORY[0x24BEADBF8]);
}

uint64_t sub_23CC8C8C0()
{
  return lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type SnippetPreview<GeoDataModels.ContactDisambiguationDataModel, ContactDisambiguationView> and conformance SnippetPreview<A, B>, &demangling cache variable for type metadata for SnippetPreview<GeoDataModels.ContactDisambiguationDataModel, ContactDisambiguationView>, MEMORY[0x24BEAD9E8]);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t outlined init with copy of ContactDisambiguationView(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
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

uint64_t sub_23CC8C9CC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = type metadata accessor for PrimaryHeaderRichView();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #2 in ContactDisambiguationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for PrimaryHeaderRichView();
  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80)), v3);
}

uint64_t sub_23CC8CA70()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t partial apply for closure #2 in closure #2 in ContactDisambiguationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>);
  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80)), v3);
}

unint64_t lazy protocol witness table accessor for type ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0> and conformance <> ForEach<A, B, C>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[3];

  result = lazy protocol witness table cache variable for type ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0> and conformance <> ForEach<A, B, C>;
  if (!lazy protocol witness table cache variable for type ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0> and conformance <> ForEach<A, B, C>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>);
    v2[1] = type metadata accessor for SimpleItemRichView();
    v2[2] = lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type SimpleItemRichView and conformance SimpleItemRichView, (uint64_t (*)(uint64_t))MEMORY[0x24BEADE98], MEMORY[0x24BEADE78]);
    v2[0] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x242630878](MEMORY[0x24BDF4A00], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0> and conformance <> ForEach<A, B, C>);
  }
  return result;
}

uint64_t outlined consume of Text.Storage(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_23CC8CBCC()
{
  uint64_t v0;

  outlined consume of Text.Storage(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23CC8CBFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v1 = type metadata accessor for ContactDisambiguationView();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = type metadata accessor for GeoContact();
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  v7 = (v3 + v4 + v6) & ~v6;
  v8 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v9 = v8 + *(int *)(v1 + 28);
  v10 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = v0 + v7 + *(int *)(v5 + 40);
  v12 = type metadata accessor for ImageElement.ImageStyle();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  return swift_deallocObject();
}

uint64_t outlined init with take of ContactDisambiguationView(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t partial apply for closure #1 in closure #1 in ContactDisambiguationView.body.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(type metadata accessor for ContactDisambiguationView() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for GeoContact() - 8) + 80);
  return closure #1 in closure #1 in ContactDisambiguationView.body.getter((_QWORD *)(v0 + v2), v0 + ((v2 + v3 + v4) & ~v4));
}

uint64_t GeoTrafficIncident.index.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t GeoTrafficIncident.id.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GeoTrafficIncident.displayName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GeoTrafficIncident.driPayload.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 40);
}

void GeoTrafficIncident.hash(into:)()
{
  Swift::UInt *v0;
  Swift::UInt v1;
  Swift::UInt v2;

  v1 = v0[2];
  v2 = v0[5];
  Hasher._combine(_:)(*v0);
  if (v1)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Hasher._combine(_:)(v2);
}

uint64_t GeoTrafficIncident.CodingKeys.stringValue.getter(char a1)
{
  return *(_QWORD *)&aIndex_1[8 * a1];
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GeoTrafficIncident.CodingKeys()
{
  char *v0;

  return GeoTrafficIncident.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GeoTrafficIncident.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized GeoTrafficIncident.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance GeoTrafficIncident.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GeoTrafficIncident.CodingKeys()
{
  lazy protocol witness table accessor for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GeoTrafficIncident.CodingKeys()
{
  lazy protocol witness table accessor for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t GeoTrafficIncident.encode(to:)(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[6];
  char v12;
  char v13;
  char v14;
  char v15;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GeoTrafficIncident.CodingKeys>);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = v1[1];
  v11[4] = v1[2];
  v11[5] = v8;
  v9 = v1[3];
  v11[2] = v1[4];
  v11[3] = v9;
  v11[1] = v1[5];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v15 = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v2)
  {
    v14 = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v13 = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v12 = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

Swift::Int GeoTrafficIncident.hashValue.getter()
{
  Swift::UInt *v0;
  Swift::UInt v1;
  Swift::UInt v2;
  Swift::UInt v3;

  v1 = *v0;
  v2 = v0[2];
  v3 = v0[5];
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  if (v2)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Hasher._combine(_:)(v3);
  return Hasher._finalize()();
}

uint64_t GeoTrafficIncident.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  char v25;
  char v26;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GeoTrafficIncident.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v26 = 0;
  v9 = KeyedDecodingContainer.decode(_:forKey:)();
  v25 = 1;
  v10 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  v12 = v11;
  v22 = v10;
  v24 = 2;
  swift_bridgeObjectRetain();
  v20 = KeyedDecodingContainer.decode(_:forKey:)();
  v21 = v13;
  v23 = 3;
  swift_bridgeObjectRetain();
  v14 = KeyedDecodingContainer.decode(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v16 = v21;
  v15 = v22;
  *a2 = v9;
  a2[1] = v15;
  v17 = v20;
  a2[2] = v12;
  a2[3] = v17;
  a2[4] = v16;
  a2[5] = v14;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void __swiftcall GeoTrafficIncident.init(index:id:displayName:driPayload:)(GeoUIFramework::GeoTrafficIncident *__return_ptr retstr, Swift::Int index, Swift::String_optional id, Swift::String displayName, Swift::Int driPayload)
{
  retstr->index = index;
  retstr->id = id;
  retstr->displayName = displayName;
  retstr->driPayload = driPayload;
}

uint64_t protocol witness for Decodable.init(from:) in conformance GeoTrafficIncident@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return GeoTrafficIncident.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GeoTrafficIncident(_QWORD *a1)
{
  return GeoTrafficIncident.encode(to:)(a1);
}

uint64_t protocol witness for Identifiable.id.getter in conformance GeoTrafficIncident@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 16);
  *a1 = *(_QWORD *)(v1 + 8);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

void protocol witness for Hashable.hash(into:) in conformance GeoTrafficIncident()
{
  Swift::UInt *v0;
  Swift::UInt v1;
  Swift::UInt v2;

  v1 = v0[2];
  v2 = v0[5];
  Hasher._combine(_:)(*v0);
  if (v1)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Hasher._combine(_:)(v2);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GeoTrafficIncident()
{
  Swift::UInt *v0;
  Swift::UInt v1;
  Swift::UInt v2;
  Swift::UInt v3;

  v1 = *v0;
  v2 = v0[2];
  v3 = v0[5];
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  if (v2)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Hasher._combine(_:)(v3);
  return Hasher._finalize()();
}

BOOL specialized static GeoTrafficIncident.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  _BOOL8 result;
  char v13;

  if (*a1 != *a2)
    return 0;
  v3 = a1[2];
  v4 = a1[3];
  v5 = a1[4];
  v6 = a1[5];
  v7 = a2[2];
  v8 = a2[3];
  v9 = a2[4];
  v10 = a2[5];
  if (v3)
  {
    if (v7)
    {
      if (a1[1] != a2[1] || v3 != v7)
      {
        v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
        result = 0;
        if ((v11 & 1) == 0)
          return result;
      }
      goto LABEL_11;
    }
    return 0;
  }
  if (v7)
    return 0;
LABEL_11:
  if (v4 == v8 && v5 == v9)
    return v6 == v10;
  v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
  result = 0;
  if ((v13 & 1) != 0)
    return v6 == v10;
  return result;
}

unint64_t lazy protocol witness table accessor for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoTrafficIncident.CodingKeys, &unk_250DE23E8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoTrafficIncident.CodingKeys, &unk_250DE23E8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoTrafficIncident.CodingKeys, &unk_250DE23E8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoTrafficIncident.CodingKeys, &unk_250DE23E8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type String? and conformance <A> A?()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = lazy protocol witness table cache variable for type String? and conformance <A> A?;
  if (!lazy protocol witness table cache variable for type String? and conformance <A> A?)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for String?);
    v2 = MEMORY[0x24BEE0D10];
    result = MEMORY[0x242630878](MEMORY[0x24BEE4AB0], v1, &v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String? and conformance <A> A?);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GeoTrafficIncident and conformance GeoTrafficIncident()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoTrafficIncident and conformance GeoTrafficIncident;
  if (!lazy protocol witness table cache variable for type GeoTrafficIncident and conformance GeoTrafficIncident)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoTrafficIncident, &type metadata for GeoTrafficIncident);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoTrafficIncident and conformance GeoTrafficIncident);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoTrafficIncident and conformance GeoTrafficIncident;
  if (!lazy protocol witness table cache variable for type GeoTrafficIncident and conformance GeoTrafficIncident)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoTrafficIncident, &type metadata for GeoTrafficIncident);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoTrafficIncident and conformance GeoTrafficIncident);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoTrafficIncident and conformance GeoTrafficIncident;
  if (!lazy protocol witness table cache variable for type GeoTrafficIncident and conformance GeoTrafficIncident)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoTrafficIncident, &type metadata for GeoTrafficIncident);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoTrafficIncident and conformance GeoTrafficIncident);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoTrafficIncident and conformance GeoTrafficIncident;
  if (!lazy protocol witness table cache variable for type GeoTrafficIncident and conformance GeoTrafficIncident)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoTrafficIncident, &type metadata for GeoTrafficIncident);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoTrafficIncident and conformance GeoTrafficIncident);
  }
  return result;
}

uint64_t destroy for GeoTrafficIncident()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for GeoTrafficIncident(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for GeoTrafficIncident(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
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

uint64_t assignWithTake for GeoTrafficIncident(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for GeoTrafficIncident(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GeoTrafficIncident(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for GeoTrafficIncident()
{
  return &type metadata for GeoTrafficIncident;
}

uint64_t getEnumTagSinglePayload for GeoTrafficIncident.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for GeoTrafficIncident.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23CC8DA3C + 4 * byte_23CCA4125[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23CC8DA70 + 4 * asc_23CCA4120[v4]))();
}

uint64_t sub_23CC8DA70(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23CC8DA78(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23CC8DA80);
  return result;
}

uint64_t sub_23CC8DA8C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23CC8DA94);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23CC8DA98(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23CC8DAA0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for GeoTrafficIncident.CodingKeys()
{
  return &unk_250DE23E8;
}

uint64_t specialized GeoTrafficIncident.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x7865646E69 && a2 == 0xE500000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 25705 && a2 == 0xE200000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6F6C796150697264 && a2 == 0xEA00000000006461)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Any>);
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
    outlined init with copy of Environment<ColorScheme>.Content(v6, (uint64_t)&v15, &demangling cache variable for type metadata for (String, Any));
    v7 = v15;
    v8 = v16;
    result = specialized __RawDictionaryStorage.find<A>(_:)(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)outlined init with take of Any(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
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
    outlined init with copy of Environment<ColorScheme>.Content(v6, (uint64_t)v15, &demangling cache variable for type metadata for (AnyHashable, Any));
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

uint64_t TrafficDisambiguationView.model.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v1[1];
  v3 = v1[2];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id TrafficDisambiguationView.logObject.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 24);
}

uint64_t TrafficDisambiguationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v34;
  char *v35;
  uint64_t KeyPath;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v43 = a1;
  v2 = type metadata accessor for TrafficDisambiguationView();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ForEach<[GeoTrafficIncident], GeoTrafficIncident, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>);
  v40 = *(_QWORD *)(v5 - 8);
  v41 = *(_QWORD *)(v40 + 64);
  v42 = v5;
  v6 = MEMORY[0x24BDAC7A8](v5);
  v39 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v34 - v8;
  v38 = type metadata accessor for DisambiguationTitle();
  v10 = *(_QWORD *)(v38 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = MEMORY[0x24BDAC7A8](v38);
  v37 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v34 - v13;
  v16 = *v1;
  v15 = v1[1];
  v49 = MEMORY[0x24BEE0D00];
  v50 = MEMORY[0x24BEAE5C0];
  v47 = v16;
  v48 = v15;
  v46 = 0;
  v44 = 0u;
  v45 = 0u;
  swift_bridgeObjectRetain();
  v35 = v14;
  DisambiguationTitle.init(text1:thumbnail:)();
  *(_QWORD *)&v44 = v1[2];
  KeyPath = swift_getKeyPath();
  outlined init with copy of TrafficDisambiguationView((uint64_t)v1, (uint64_t)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v17 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v18 = swift_allocObject();
  outlined init with take of TrafficDisambiguationView((uint64_t)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v18 + v17);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GeoTrafficIncident]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0);
  lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type [GeoTrafficIncident] and conformance [A], &demangling cache variable for type metadata for [GeoTrafficIncident], MEMORY[0x24BEE12D8]);
  lazy protocol witness table accessor for type GeoTrafficIncident and conformance GeoTrafficIncident();
  v19 = type metadata accessor for SimpleItemRichView();
  v20 = lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type SimpleItemRichView and conformance SimpleItemRichView, (uint64_t (*)(uint64_t))MEMORY[0x24BEADE98], MEMORY[0x24BEADE78]);
  v47 = v19;
  v48 = v20;
  swift_getOpaqueTypeConformance2();
  v21 = v9;
  v34 = v9;
  ForEach<>.init(_:id:content:)();
  v22 = v37;
  v23 = v38;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v37, v14, v38);
  v25 = v39;
  v24 = v40;
  v26 = v21;
  v27 = v42;
  (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v39, v26, v42);
  v28 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v29 = (v11 + *(unsigned __int8 *)(v24 + 80) + v28) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  v30 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v30 + v28, v22, v23);
  (*(void (**)(unint64_t, char *, uint64_t))(v24 + 32))(v30 + v29, v25, v27);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DisambiguationView<ForEach<[GeoTrafficIncident], GeoTrafficIncident, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>>);
  v32 = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type DisambiguationView<ForEach<[GeoTrafficIncident], GeoTrafficIncident, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>> and conformance DisambiguationView<A>, &demangling cache variable for type metadata for DisambiguationView<ForEach<[GeoTrafficIncident], GeoTrafficIncident, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>>, MEMORY[0x24BEADE48]);
  MEMORY[0x2426301E8](partial apply for closure #2 in TrafficDisambiguationView.body.getter, v30, v31, v32);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v34, v27);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v35, v23);
}

uint64_t type metadata accessor for TrafficDisambiguationView()
{
  uint64_t result;

  result = type metadata singleton initialization cache for TrafficDisambiguationView;
  if (!type metadata singleton initialization cache for TrafficDisambiguationView)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t closure #1 in TrafficDisambiguationView.body.getter(__int128 *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  __int128 v11;
  __int128 v12;
  unint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  __int128 v16;
  _BYTE v18[32];
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;

  v4 = type metadata accessor for TrafficDisambiguationView();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = type metadata accessor for SimpleItemRichView();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = a1[2];
  v12 = *a1;
  v46 = a1[1];
  v47 = v11;
  v45 = v12;
  v43 = MEMORY[0x24BEE0D00];
  v44 = MEMORY[0x24BEAE5C0];
  v41 = *((_QWORD *)&v46 + 1);
  v42 = v11;
  v40 = 0;
  v38 = 0u;
  v39 = 0u;
  v37 = 0;
  v35 = 0u;
  v36 = 0u;
  v34 = 0;
  v32 = 0u;
  v33 = 0u;
  v31 = 0;
  v29 = 0u;
  v30 = 0u;
  v28 = 0;
  v26 = 0u;
  v27 = 0u;
  v25 = 0;
  v23 = 0u;
  v24 = 0u;
  v22 = 0;
  v20 = 0u;
  v21 = 0u;
  v19 = 0;
  memset(v18, 0, sizeof(v18));
  swift_bridgeObjectRetain();
  SimpleItemRichView.init(text1:text2:text3:text4:text5:text6:text7:text8:thumbnail:)();
  outlined init with copy of TrafficDisambiguationView(a2, (uint64_t)&v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  v13 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v14 = swift_allocObject();
  outlined init with take of TrafficDisambiguationView((uint64_t)&v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)], v14 + v13);
  v15 = (_OWORD *)(v14 + ((v6 + v13 + 7) & 0xFFFFFFFFFFFFFFF8));
  v16 = v46;
  *v15 = v45;
  v15[1] = v16;
  v15[2] = v47;
  outlined retain of GeoTrafficIncident((uint64_t)&v45);
  lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type SimpleItemRichView and conformance SimpleItemRichView, (uint64_t (*)(uint64_t))MEMORY[0x24BEADE98], MEMORY[0x24BEADE78]);
  View.componentTapped(isNavigation:perform:)();
  swift_release();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t outlined init with copy of TrafficDisambiguationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TrafficDisambiguationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23CC8E60C()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = (int *)type metadata accessor for TrafficDisambiguationView();
  v2 = *(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v4 = v3 + v1[7];
  v5 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);

  outlined consume of Environment<VRXIdiom>.Content(*(_QWORD *)(v3 + v1[9]), *(_BYTE *)(v3 + v1[9] + 8));
  return swift_deallocObject();
}

uint64_t outlined init with take of TrafficDisambiguationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TrafficDisambiguationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in TrafficDisambiguationView.body.getter(__int128 *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for TrafficDisambiguationView() - 8) + 80);
  return closure #1 in TrafficDisambiguationView.body.getter(a1, v1 + ((v3 + 16) & ~v3));
}

uint64_t closure #1 in closure #1 in TrafficDisambiguationView.body.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t inited;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  _WORD v25[8];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for InteractionType?);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ActionProperty?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for StandardActionHandler?);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TrafficDisambiguationView();
  ActionHandler.wrappedValue.getter();
  v13 = type metadata accessor for StandardActionHandler();
  v14 = *(_QWORD *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
    return outlined destroy of Environment<Locale>.Content((uint64_t)v12, &demangling cache variable for type metadata for StandardActionHandler?);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ActionElementConvertible>);
  v16 = swift_allocObject();
  v23 = xmmword_23CCA3820;
  *(_OWORD *)(v16 + 16) = xmmword_23CCA3820;
  v24 = *(_QWORD *)(a1 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(AnyHashable, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = v23;
  strcpy((char *)v25, "IncidentType");
  HIBYTE(v25[6]) = 0;
  v25[7] = -5120;
  AnyHashable.init<A>(_:)();
  v18 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(inited + 96) = MEMORY[0x24BEE1768];
  *(_QWORD *)(inited + 72) = v18;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  v19 = type metadata accessor for Command();
  v20 = MEMORY[0x24BEAD1F0];
  *(_QWORD *)(v16 + 56) = v19;
  *(_QWORD *)(v16 + 64) = v20;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v16 + 32));
  static Command.directInvocation(identifier:payload:isNavigation:)();
  swift_bridgeObjectRelease();
  ActionProperty.init(_:)();
  v21 = type metadata accessor for ActionProperty();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v9, 0, 1, v21);
  v22 = type metadata accessor for InteractionType();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v6, 1, 1, v22);
  StandardActionHandler.perform(_:interactionType:)();
  outlined destroy of Environment<Locale>.Content((uint64_t)v6, &demangling cache variable for type metadata for InteractionType?);
  outlined destroy of Environment<Locale>.Content((uint64_t)v9, &demangling cache variable for type metadata for ActionProperty?);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v12, v13);
}

uint64_t closure #2 in TrafficDisambiguationView.body.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ForEach<[GeoTrafficIncident], GeoTrafficIncident, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = type metadata accessor for DisambiguationTitle();
  MEMORY[0x24BDAC7A8](v7);
  (*(void (**)(char *, uint64_t))(v9 + 16))((char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v4);
  v10 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v11 + v10, (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  lazy protocol witness table accessor for type ForEach<[GeoTrafficIncident], GeoTrafficIncident, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0> and conformance <> ForEach<A, B, C>();
  return DisambiguationView.init(title:content:)();
}

uint64_t sub_23CC8EBA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = type metadata accessor for DisambiguationTitle();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v3 + *(_QWORD *)(v2 + 64);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ForEach<[GeoTrafficIncident], GeoTrafficIncident, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t partial apply for closure #2 in TrafficDisambiguationView.body.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(type metadata accessor for DisambiguationTitle() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = v2 + *(_QWORD *)(v1 + 64);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ForEach<[GeoTrafficIncident], GeoTrafficIncident, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>)
                                      - 8)
                          + 80);
  return closure #2 in TrafficDisambiguationView.body.getter(v0 + v2, v0 + ((v3 + v4) & ~v4));
}

uint64_t TrafficDisambiguationView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  *(_QWORD *)a2 = *(_QWORD *)a1;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 8);
  type metadata accessor for OS_os_log();
  *(_QWORD *)(a2 + 24) = OS_os_log.init(subsystem:category:)();
  *(_QWORD *)(a2 + 32) = 0xD000000000000033;
  *(_QWORD *)(a2 + 40) = 0x800000023CCA6BF0;
  v3 = type metadata accessor for TrafficDisambiguationView();
  ActionHandler.init()();
  v4 = (uint64_t *)(a2 + *(int *)(v3 + 32));
  type metadata accessor for Context();
  lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type Context and conformance Context, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE578], MEMORY[0x24BEAE528]);
  *v4 = EnvironmentObject.init()();
  v4[1] = v5;
  v6 = a2 + *(int *)(v3 + 36);
  result = swift_getKeyPath();
  *(_QWORD *)v6 = result;
  *(_BYTE *)(v6 + 8) = 0;
  return result;
}

uint64_t static TrafficIncidentView_Previews.previews.getter()
{
  if (one-time initialization token for testView1 != -1)
    swift_once();
  type metadata accessor for TrafficDisambiguationView();
  lazy protocol witness table accessor for type GeoDataModels.TrafficDisambiguationDataModel and conformance GeoDataModels.TrafficDisambiguationDataModel();
  lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type TrafficDisambiguationView and conformance TrafficDisambiguationView, (uint64_t (*)(uint64_t))type metadata accessor for TrafficDisambiguationView, (uint64_t)&protocol conformance descriptor for TrafficDisambiguationView);
  swift_bridgeObjectRetain();
  return SnippetPreview.init(snippetModel:content:)();
}

uint64_t implicit closure #1 in static TrafficIncidentView_Previews.previews.getter@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char *v8;
  uint64_t result;

  v3 = a1[1];
  v4 = a1[2];
  *a2 = *a1;
  a2[1] = v3;
  a2[2] = v4;
  type metadata accessor for OS_os_log();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  a2[3] = OS_os_log.init(subsystem:category:)();
  a2[4] = 0xD000000000000033;
  a2[5] = 0x800000023CCA6BF0;
  v5 = type metadata accessor for TrafficDisambiguationView();
  ActionHandler.init()();
  v6 = (_QWORD *)((char *)a2 + *(int *)(v5 + 32));
  type metadata accessor for Context();
  lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type Context and conformance Context, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE578], MEMORY[0x24BEAE528]);
  *v6 = EnvironmentObject.init()();
  v6[1] = v7;
  v8 = (char *)a2 + *(int *)(v5 + 36);
  result = swift_getKeyPath();
  *(_QWORD *)v8 = result;
  v8[8] = 0;
  return result;
}

uint64_t protocol witness for static PreviewProvider.previews.getter in conformance TrafficIncidentView_Previews()
{
  if (one-time initialization token for testView1 != -1)
    swift_once();
  type metadata accessor for TrafficDisambiguationView();
  lazy protocol witness table accessor for type GeoDataModels.TrafficDisambiguationDataModel and conformance GeoDataModels.TrafficDisambiguationDataModel();
  lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type TrafficDisambiguationView and conformance TrafficDisambiguationView, (uint64_t (*)(uint64_t))type metadata accessor for TrafficDisambiguationView, (uint64_t)&protocol conformance descriptor for TrafficDisambiguationView);
  swift_bridgeObjectRetain();
  return SnippetPreview.init(snippetModel:content:)();
}

uint64_t protocol witness for static _PreviewProvider._previews.getter in conformance TrafficIncidentView_Previews()
{
  lazy protocol witness table accessor for type TrafficIncidentView_Previews and conformance TrafficIncidentView_Previews();
  return static PreviewProvider._previews.getter();
}

uint64_t protocol witness for static _PreviewProvider._platform.getter in conformance TrafficIncidentView_Previews()
{
  lazy protocol witness table accessor for type TrafficIncidentView_Previews and conformance TrafficIncidentView_Previews();
  return static PreviewProvider._platform.getter();
}

double one-time initialization function for crash()
{
  Swift::Int v0;
  double result;

  v0 = swift_slowAlloc();
  crash.index = v0;
  result = 0.0;
  *(_OWORD *)v0 = xmmword_23CCA43B0;
  *(_OWORD *)(v0 + 16) = xmmword_23CCA43C0;
  *(_QWORD *)(v0 + 32) = 0xE500000000000000;
  *(_QWORD *)(v0 + 40) = 2;
  return result;
}

uint64_t crash.unsafeMutableAddressor()
{
  return crash.unsafeMutableAddressor(&one-time initialization token for crash, (uint64_t)&crash);
}

double one-time initialization function for hazard()
{
  uint64_t v0;
  double result;

  v0 = swift_slowAlloc();
  crash.displayName._countAndFlagsBits = v0;
  *(_QWORD *)&result = 1;
  *(_OWORD *)v0 = xmmword_23CCA43D0;
  *(_OWORD *)(v0 + 16) = xmmword_23CCA43E0;
  *(_QWORD *)(v0 + 32) = 0xE600000000000000;
  *(_QWORD *)(v0 + 40) = 1;
  return result;
}

uint64_t hazard.unsafeMutableAddressor()
{
  return crash.unsafeMutableAddressor(&one-time initialization token for hazard, (uint64_t)&crash.displayName);
}

double one-time initialization function for sc()
{
  Swift::Int v0;
  double result;

  v0 = swift_slowAlloc();
  sc.index = v0;
  *(_QWORD *)&result = 2;
  *(_OWORD *)v0 = xmmword_23CCA43F0;
  *(_OWORD *)(v0 + 16) = xmmword_23CCA4400;
  *(_QWORD *)(v0 + 32) = 0xEB000000006B6365;
  *(_QWORD *)(v0 + 40) = 3;
  return result;
}

uint64_t sc.unsafeMutableAddressor()
{
  return crash.unsafeMutableAddressor(&one-time initialization token for sc, (uint64_t)&sc);
}

uint64_t crash.unsafeMutableAddressor(_QWORD *a1, uint64_t a2)
{
  if (*a1 != -1)
    swift_once();
  return *(_QWORD *)a2;
}

unint64_t lazy protocol witness table accessor for type GeoDataModels.TrafficDisambiguationDataModel and conformance GeoDataModels.TrafficDisambiguationDataModel()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel and conformance GeoDataModels.TrafficDisambiguationDataModel;
  if (!lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel and conformance GeoDataModels.TrafficDisambiguationDataModel)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.TrafficDisambiguationDataModel, &type metadata for GeoDataModels.TrafficDisambiguationDataModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel and conformance GeoDataModels.TrafficDisambiguationDataModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel and conformance GeoDataModels.TrafficDisambiguationDataModel;
  if (!lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel and conformance GeoDataModels.TrafficDisambiguationDataModel)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.TrafficDisambiguationDataModel, &type metadata for GeoDataModels.TrafficDisambiguationDataModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel and conformance GeoDataModels.TrafficDisambiguationDataModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel and conformance GeoDataModels.TrafficDisambiguationDataModel;
  if (!lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel and conformance GeoDataModels.TrafficDisambiguationDataModel)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.TrafficDisambiguationDataModel, &type metadata for GeoDataModels.TrafficDisambiguationDataModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel and conformance GeoDataModels.TrafficDisambiguationDataModel);
  }
  return result;
}

uint64_t associated type witness table accessor for View.Body : View in TrafficDisambiguationView()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t lazy protocol witness table accessor for type TrafficIncidentView_Previews and conformance TrafficIncidentView_Previews()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TrafficIncidentView_Previews and conformance TrafficIncidentView_Previews;
  if (!lazy protocol witness table cache variable for type TrafficIncidentView_Previews and conformance TrafficIncidentView_Previews)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for TrafficIncidentView_Previews, &type metadata for TrafficIncidentView_Previews);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TrafficIncidentView_Previews and conformance TrafficIncidentView_Previews);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TrafficIncidentView_Previews and conformance TrafficIncidentView_Previews;
  if (!lazy protocol witness table cache variable for type TrafficIncidentView_Previews and conformance TrafficIncidentView_Previews)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for TrafficIncidentView_Previews, &type metadata for TrafficIncidentView_Previews);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TrafficIncidentView_Previews and conformance TrafficIncidentView_Previews);
  }
  return result;
}

uint64_t associated type witness table accessor for PreviewProvider.Previews : View in TrafficIncidentView_Previews()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for TrafficDisambiguationView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  id v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  char *v18;
  uint64_t v19;
  void *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  char *v27;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v25 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v25 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = a3;
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = (void *)a2[3];
    a1[2] = a2[2];
    a1[3] = (uint64_t)v8;
    v9 = a2[5];
    v10 = *(int *)(a3 + 28);
    v27 = (char *)a1 + v10;
    v11 = (char *)a2 + v10;
    a1[4] = a2[4];
    a1[5] = v9;
    v12 = type metadata accessor for ActionHandler();
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14 = v8;
    swift_bridgeObjectRetain();
    v13(v27, v11, v12);
    v15 = *(int *)(v6 + 32);
    v16 = *(int *)(v6 + 36);
    v17 = (uint64_t *)((char *)v4 + v15);
    v18 = (char *)a2 + v15;
    v20 = *(void **)v18;
    v19 = *((_QWORD *)v18 + 1);
    *v17 = v20;
    v17[1] = v19;
    v21 = (char *)v4 + v16;
    v22 = (char *)a2 + v16;
    v23 = *(uint64_t *)((char *)a2 + v16);
    LOBYTE(v6) = v22[8];
    v24 = v20;
    outlined copy of Environment<VRXIdiom>.Content(v23, v6);
    *(_QWORD *)v21 = v23;
    v21[8] = v6;
  }
  return v4;
}

uint64_t destroy for TrafficDisambiguationView(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v4 = a1 + a2[7];
  v5 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);

  return outlined consume of Environment<VRXIdiom>.Content(*(_QWORD *)(a1 + a2[9]), *(_BYTE *)(a1 + a2[9] + 8));
}

_QWORD *initializeWithCopy for TrafficDisambiguationView(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  id v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  char *v17;
  uint64_t v18;
  void *v19;
  char *v20;
  uint64_t v21;
  id v22;
  char *v24;

  v4 = a2;
  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = (void *)a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = a2[5];
  v9 = a3[7];
  v24 = (char *)a1 + v9;
  v10 = (char *)a2 + v9;
  a1[4] = a2[4];
  a1[5] = v8;
  v11 = type metadata accessor for ActionHandler();
  v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13 = v7;
  swift_bridgeObjectRetain();
  v12(v24, v10, v11);
  v14 = a3[8];
  v15 = a3[9];
  v16 = (_QWORD *)((char *)a1 + v14);
  v17 = (char *)v4 + v14;
  v19 = *(void **)v17;
  v18 = *((_QWORD *)v17 + 1);
  *v16 = v19;
  v16[1] = v18;
  v20 = (char *)a1 + v15;
  v21 = *(_QWORD *)((char *)v4 + v15);
  LOBYTE(v4) = *((_BYTE *)v4 + v15 + 8);
  v22 = v19;
  outlined copy of Environment<VRXIdiom>.Content(v21, (char)v4);
  *(_QWORD *)v20 = v21;
  v20[8] = (char)v4;
  return a1;
}

_QWORD *assignWithCopy for TrafficDisambiguationView(_QWORD *a1, _QWORD *a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (void *)a2[3];
  v7 = (void *)a1[3];
  a1[3] = v6;
  v8 = v6;

  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = a3[7];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = type metadata accessor for ActionHandler();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  v13 = a3[8];
  v14 = (_QWORD *)((char *)a1 + v13);
  v15 = (char *)a2 + v13;
  v16 = *(void **)((char *)a1 + v13);
  v17 = *(void **)((char *)a2 + v13);
  *v14 = v17;
  v18 = v17;

  v14[1] = *((_QWORD *)v15 + 1);
  v19 = a3[9];
  v20 = (char *)a1 + v19;
  v21 = (char *)a2 + v19;
  v22 = *(_QWORD *)v21;
  LOBYTE(a3) = v21[8];
  outlined copy of Environment<VRXIdiom>.Content(*(_QWORD *)v21, (char)a3);
  v23 = *(_QWORD *)v20;
  v24 = v20[8];
  *(_QWORD *)v20 = v22;
  v20[8] = (char)a3;
  outlined consume of Environment<VRXIdiom>.Content(v23, v24);
  return a1;
}

uint64_t initializeWithTake for TrafficDisambiguationView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v7 = a3[7];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[9];
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  v12 = a1 + v11;
  v13 = a2 + v11;
  *(_BYTE *)(v12 + 8) = *(_BYTE *)(v13 + 8);
  *(_QWORD *)v12 = *(_QWORD *)v13;
  return a1;
}

_QWORD *assignWithTake for TrafficDisambiguationView(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  v7 = (void *)a1[3];
  a1[3] = a2[3];

  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  v9 = a3[7];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = type metadata accessor for ActionHandler();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  v13 = a3[8];
  v14 = (_QWORD *)((char *)a1 + v13);
  v15 = (_QWORD *)((char *)a2 + v13);
  v16 = *(void **)((char *)a1 + v13);
  *v14 = *v15;

  v14[1] = v15[1];
  v17 = a3[9];
  v18 = (char *)a1 + v17;
  v19 = (char *)a2 + v17;
  v20 = *(_QWORD *)v19;
  LOBYTE(v19) = v19[8];
  v21 = *(_QWORD *)v18;
  v22 = v18[8];
  *(_QWORD *)v18 = v20;
  v18[8] = (char)v19;
  outlined consume of Environment<VRXIdiom>.Content(v21, v22);
  return a1;
}

uint64_t getEnumTagSinglePayload for TrafficDisambiguationView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CC8F9F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for ActionHandler();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for TrafficDisambiguationView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CC8FA80(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = type metadata accessor for ActionHandler();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata completion function for TrafficDisambiguationView()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for ActionHandler();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for TrafficIncidentView_Previews()
{
  return &type metadata for TrafficIncidentView_Previews;
}

uint64_t sub_23CC8FBA4()
{
  return lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type ComponentStack<DisambiguationView<ForEach<[GeoTrafficIncident], GeoTrafficIncident, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>>> and conformance ComponentStack<A>, &demangling cache variable for type metadata for ComponentStack<DisambiguationView<ForEach<[GeoTrafficIncident], GeoTrafficIncident, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>>>, MEMORY[0x24BEADBF8]);
}

uint64_t sub_23CC8FBD0()
{
  return lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type SnippetPreview<GeoDataModels.TrafficDisambiguationDataModel, TrafficDisambiguationView> and conformance SnippetPreview<A, B>, &demangling cache variable for type metadata for SnippetPreview<GeoDataModels.TrafficDisambiguationDataModel, TrafficDisambiguationView>, MEMORY[0x24BEAD9E8]);
}

uint64_t sub_23CC8FC40()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ForEach<[GeoTrafficIncident], GeoTrafficIncident, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #2 in TrafficDisambiguationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ForEach<[GeoTrafficIncident], GeoTrafficIncident, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>);
  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80)), v3);
}

unint64_t lazy protocol witness table accessor for type ForEach<[GeoTrafficIncident], GeoTrafficIncident, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0> and conformance <> ForEach<A, B, C>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[3];

  result = lazy protocol witness table cache variable for type ForEach<[GeoTrafficIncident], GeoTrafficIncident, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0> and conformance <> ForEach<A, B, C>;
  if (!lazy protocol witness table cache variable for type ForEach<[GeoTrafficIncident], GeoTrafficIncident, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0> and conformance <> ForEach<A, B, C>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ForEach<[GeoTrafficIncident], GeoTrafficIncident, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>);
    v2[1] = type metadata accessor for SimpleItemRichView();
    v2[2] = lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type SimpleItemRichView and conformance SimpleItemRichView, (uint64_t (*)(uint64_t))MEMORY[0x24BEADE98], MEMORY[0x24BEADE78]);
    v2[0] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x242630878](MEMORY[0x24BDF4A00], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ForEach<[GeoTrafficIncident], GeoTrafficIncident, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0> and conformance <> ForEach<A, B, C>);
  }
  return result;
}

uint64_t sub_23CC8FD8C()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = (int *)type metadata accessor for TrafficDisambiguationView();
  v2 = *(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v4 = v3 + v1[7];
  v5 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);

  outlined consume of Environment<VRXIdiom>.Content(*(_QWORD *)(v3 + v1[9]), *(_BYTE *)(v3 + v1[9] + 8));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in TrafficDisambiguationView.body.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(type metadata accessor for TrafficDisambiguationView() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  return closure #1 in closure #1 in TrafficDisambiguationView.body.getter(v0 + v2, v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
}

uint64_t outlined retain of GeoTrafficIncident(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;

  Hasher.init(_seed:)();
  String.hash(into:)();
  v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
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

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
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
      v7 = MEMORY[0x2426303C8](v9, a1);
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

uint64_t GeoContact.image.getter()
{
  char *v0;
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
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v1 = type metadata accessor for ImageElement.ImageStyle();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for ImageElement.Contact.Content();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *((_QWORD *)v0 + 2);
  if (v9)
  {
    v18 = v6;
    v10 = *((_QWORD *)v0 + 1);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_23CCA3820;
    *(_QWORD *)(v11 + 32) = v10;
    *(_QWORD *)(v11 + 40) = v9;
    v6 = v18;
    swift_bridgeObjectRetain();
  }
  else
  {
    v13 = *((_QWORD *)v0 + 6);
    v14 = HIBYTE(v13) & 0xF;
    if ((v13 & 0x2000000000000000) == 0)
      v14 = *((_QWORD *)v0 + 5) & 0xFFFFFFFFFFFFLL;
    if (v14)
    {
      swift_bridgeObjectRetain();
      ImageElement.Contact.Monogram.init(letters:)();
      v12 = (unsigned int *)MEMORY[0x24BEAB010];
      goto LABEL_8;
    }
  }
  ImageElement.Contact.Avatar.init(contactIds:)();
  v12 = (unsigned int *)MEMORY[0x24BEAB008];
LABEL_8:
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *v12, v5);
  v15 = type metadata accessor for GeoContact();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v4, &v0[*(int *)(v15 + 40)], v1);
  return ImageElement.Contact.init(_:imageStyle:)();
}

uint64_t type metadata accessor for GeoContact()
{
  uint64_t result;

  result = type metadata singleton initialization cache for GeoContact;
  if (!type metadata singleton initialization cache for GeoContact)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t GeoContact.app.getter()
{
  uint64_t v0;

  if ((*(_QWORD *)(v0 + 72) & 0xFFFFFFFFFFFFFFFELL) == 2)
    return 0xD000000000000013;
  else
    return 0x6C7070612E6D6F63;
}

uint64_t GeoContact.supplamentalText.getter()
{
  uint64_t v0;
  char v1;

  if ((*(_QWORD *)(v0 + 72) & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    swift_bridgeObjectRelease();
    return 5459283;
  }
  v1 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if ((v1 & 1) != 0)
    return 5459283;
  return 0;
}

uint64_t GeoContact.init(index:id:displayName:initials:encodeBase64:shareLevel:imageStyle:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  char *v12;
  uint64_t v13;

  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  a9[8] = a10;
  a9[9] = a11;
  v12 = (char *)a9 + *(int *)(type metadata accessor for GeoContact() + 40);
  v13 = type metadata accessor for ImageElement.ImageStyle();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v12, a12, v13);
}

uint64_t GeoContact.index.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t GeoContact.id.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GeoContact.displayName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GeoContact.initials.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GeoContact.encodeBase64.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GeoContact.shareLevel.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 72);
}

uint64_t GeoContact.imageStyle.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for GeoContact() + 40);
  v4 = type metadata accessor for ImageElement.ImageStyle();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t GeoContact.imageStyle.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for GeoContact() + 40);
  v4 = type metadata accessor for ImageElement.ImageStyle();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*GeoContact.imageStyle.modify())()
{
  type metadata accessor for GeoContact();
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

uint64_t AppID.rawValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000013;
  else
    return 0x6C7070612E6D6F63;
}

uint64_t GeoContact.hash(into:)()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
  if (v0[2])
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Hasher._combine(_:)(v0[9]);
  type metadata accessor for GeoContact();
  type metadata accessor for ImageElement.ImageStyle();
  lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type ImageElement.ImageStyle and conformance ImageElement.ImageStyle, (uint64_t (*)(uint64_t))MEMORY[0x24BEAAC50], MEMORY[0x24BEAAC78]);
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t GeoContact.CodingKeys.stringValue.getter(char a1)
{
  return *(_QWORD *)&aIndex_2[8 * a1];
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GeoContact.CodingKeys()
{
  char *v0;

  return GeoContact.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GeoContact.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized GeoContact.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance GeoContact.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 7;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GeoContact.CodingKeys()
{
  lazy protocol witness table accessor for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GeoContact.CodingKeys()
{
  lazy protocol witness table accessor for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t GeoContact.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GeoContact.CodingKeys>);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v8[15] = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v1)
  {
    v8[14] = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v8[13] = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[12] = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[11] = 4;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[10] = 5;
    KeyedEncodingContainer.encode(_:forKey:)();
    type metadata accessor for GeoContact();
    v8[9] = 6;
    type metadata accessor for ImageElement.ImageStyle();
    lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type ImageElement.ImageStyle and conformance ImageElement.ImageStyle, (uint64_t (*)(uint64_t))MEMORY[0x24BEAAC50], MEMORY[0x24BEAAC68]);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

Swift::Int GeoContact.hashValue.getter()
{
  Hasher.init(_seed:)();
  GeoContact.hash(into:)();
  return Hasher._finalize()();
}

uint64_t GeoContact.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t *v31;
  char v32;
  char v33;
  char v34;
  char v35;
  char v36;
  char v37;
  char v38;

  v26 = a2;
  v3 = type metadata accessor for ImageElement.ImageStyle();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GeoContact.CodingKeys>);
  v7 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for GeoContact();
  MEMORY[0x24BDAC7A8](v10);
  v31 = (uint64_t *)((char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = a1[3];
  v29 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  lazy protocol witness table accessor for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys();
  v28 = v9;
  v13 = v30;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v13)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v29);
  v25 = v10;
  v30 = v4;
  v38 = 0;
  v14 = v27;
  v15 = KeyedDecodingContainer.decode(_:forKey:)();
  v16 = v31;
  *v31 = v15;
  v37 = 1;
  v16[1] = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  v16[2] = v17;
  v36 = 2;
  v16[3] = KeyedDecodingContainer.decode(_:forKey:)();
  v16[4] = v18;
  v35 = 3;
  v19 = KeyedDecodingContainer.decode(_:forKey:)();
  v24 = v7;
  v16[5] = v19;
  v16[6] = v20;
  v34 = 4;
  v16[7] = KeyedDecodingContainer.decode(_:forKey:)();
  v16[8] = v21;
  v33 = 5;
  v16[9] = KeyedDecodingContainer.decode(_:forKey:)();
  v32 = 6;
  lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type ImageElement.ImageStyle and conformance ImageElement.ImageStyle, (uint64_t (*)(uint64_t))MEMORY[0x24BEAAC50], MEMORY[0x24BEAAC88]);
  v22 = v28;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v22, v14);
  (*(void (**)(char *, char *, uint64_t))(v30 + 32))((char *)v16 + *(int *)(v25 + 40), v6, v3);
  outlined init with copy of GeoContact((uint64_t)v16, v26);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v29);
  return outlined destroy of GeoContact((uint64_t)v16);
}

uint64_t protocol witness for Decodable.init(from:) in conformance GeoContact@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return GeoContact.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GeoContact(_QWORD *a1)
{
  return GeoContact.encode(to:)(a1);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance GeoContact()
{
  Hasher.init(_seed:)();
  GeoContact.hash(into:)();
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GeoContact()
{
  Hasher.init(_seed:)();
  GeoContact.hash(into:)();
  return Hasher._finalize()();
}

GeoUIFramework::AppID_optional __swiftcall AppID.init(rawValue:)(Swift::String rawValue)
{
  void *object;
  Swift::String v2;
  Swift::Int v3;
  GeoUIFramework::AppID_optional v4;

  object = rawValue._object;
  v2._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of AppID.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 == 1)
    v4.value = GeoUIFramework_AppID_messages;
  else
    v4.value = GeoUIFramework_AppID_unknownDefault;
  if (v3)
    return v4;
  else
    return 0;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance AppID(char *a1, char *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = AppID.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == AppID.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance AppID()
{
  char *v0;
  char v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  AppID.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance AppID()
{
  char *v0;

  AppID.rawValue.getter(*v0);
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance AppID()
{
  char *v0;
  char v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  AppID.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance AppID@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  Swift::Int v3;
  uint64_t result;
  char v5;

  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of AppID.init(rawValue:), *a1);
  result = swift_bridgeObjectRelease();
  if (v3 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (!v3)
    v5 = 0;
  *a2 = v5;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance AppID@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = AppID.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

Swift::String __swiftcall INPerson.getContactInitials()()
{
  void *v0;
  void *v1;
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
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  id v17;
  id v18;
  void *v19;
  void (*v20)(char *, char *, uint64_t);
  void (*v21)(char *, uint64_t, uint64_t, uint64_t);
  Class isa;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  void (*v36)(char *, char *, uint64_t);
  char *v37;
  Class v38;
  id v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  id v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  Swift::String result;
  char *v53;
  id v54;
  uint64_t v55;
  unint64_t v56;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PersonNameComponents?);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v53 - v6;
  v8 = type metadata accessor for PersonNameComponents();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v53 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v53 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v53 - v15;
  v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1738]), sel_init);
  objc_msgSend(v17, sel_setStyle_, 4);
  v18 = objc_msgSend(v1, sel_nameComponents);
  if (v18)
  {
    v19 = v18;
    static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)();

    v20 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v20(v7, v14, v8);
    v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v21(v7, 0, 1, v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
    {
      v20(v16, v7, v8);
      isa = PersonNameComponents._bridgeToObjectiveC()().super.isa;
      v23 = objc_msgSend(v17, sel_stringFromPersonNameComponents_, isa);

      v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v26 = v25;

      (*(void (**)(char *, uint64_t))(v9 + 8))(v16, v8);
      goto LABEL_24;
    }
  }
  else
  {
    v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v21(v7, 1, 1, v8);
  }
  v54 = v17;
  outlined destroy of PersonNameComponents?((uint64_t)v7);
  v27 = objc_msgSend(v1, sel_displayName);
  v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v30 = v29;

  swift_bridgeObjectRelease();
  v31 = HIBYTE(v30) & 0xF;
  if ((v30 & 0x2000000000000000) == 0)
    v31 = v28 & 0xFFFFFFFFFFFFLL;
  if (v31)
  {
    v32 = objc_msgSend(v1, sel_displayName);
    if (!v32)
    {
      v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v32 = (id)MEMORY[0x2426302F0](v33);
      swift_bridgeObjectRelease();
    }
    v34 = v54;
    v35 = objc_msgSend(v54, sel_personNameComponentsFromString_, v32);

    if (v35)
    {
      static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)();

      v36 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
      v36(v5, v14, v8);
      v21(v5, 0, 1, v8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v5, 1, v8) != 1)
      {
        v37 = v53;
        v36(v53, v5, v8);
        v38 = PersonNameComponents._bridgeToObjectiveC()().super.isa;
        v39 = objc_msgSend(v34, sel_stringFromPersonNameComponents_, v38);

        v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v26 = v40;

        (*(void (**)(char *, uint64_t))(v9 + 8))(v37, v8);
        goto LABEL_24;
      }
    }
    else
    {
      v21(v5, 1, 1, v8);
    }
    outlined destroy of PersonNameComponents?((uint64_t)v5);
    v43 = objc_msgSend(v1, sel_displayName);
    v41 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v42 = v44;

  }
  else
  {
    v41 = 0;
    v42 = 0xE000000000000000;
    v34 = v54;
  }
  v55 = v41;
  v56 = v42;
  v45 = lazy protocol witness table accessor for type String and conformance String();
  v46 = MEMORY[0x2426303B0](32, 0xE100000000000000, 0x7FFFFFFFFFFFFFFFLL, 1, MEMORY[0x24BEE0D00], v45);
  swift_bridgeObjectRelease();
  v55 = 0;
  v56 = 0xE000000000000000;
  v47 = *(_QWORD *)(v46 + 16);
  if (v47)
  {
    swift_bridgeObjectRetain();
    v48 = v46 + 56;
    do
    {
      if ((*(_QWORD *)(v48 - 16) ^ *(_QWORD *)(v48 - 24)) >= 0x4000)
      {
        swift_bridgeObjectRetain();
        v49 = Substring.subscript.getter();
        MEMORY[0x242630320](v49);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      v48 += 32;
      --v47;
    }
    while (v47);

    swift_bridgeObjectRelease_n();
    v24 = v55;
    v26 = v56;
  }
  else
  {
    swift_bridgeObjectRelease();

    v24 = 0;
    v26 = 0xE000000000000000;
  }
LABEL_24:
  v50 = v24;
  v51 = (void *)v26;
  result._object = v51;
  result._countAndFlagsBits = v50;
  return result;
}

uint64_t specialized static GeoContact.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;

  if (*a1 != *a2)
    return 0;
  v4 = a1[2];
  v5 = a2[2];
  if (v4)
  {
    if (!v5)
      return 0;
    v6 = a1[1] == a2[1] && v4 == v5;
    if (!v6 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  v7 = a1[3] == a2[3] && a1[4] == a2[4];
  if ((v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    && (a1[5] == a2[5] && a1[6] == a2[6] || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    && (a1[7] == a2[7] && a1[8] == a2[8] || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    && a1[9] == a2[9])
  {
    type metadata accessor for GeoContact();
    return static ImageElement.ImageStyle.== infix(_:_:)();
  }
  return 0;
}

unint64_t lazy protocol witness table accessor for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoContact.CodingKeys, &unk_250DE2720);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoContact.CodingKeys, &unk_250DE2720);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoContact.CodingKeys, &unk_250DE2720);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoContact.CodingKeys, &unk_250DE2720);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys);
  }
  return result;
}

uint64_t outlined init with copy of GeoContact(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for GeoContact();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of GeoContact(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for GeoContact();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined destroy of PersonNameComponents?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PersonNameComponents?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t base witness table accessor for Equatable in GeoContact()
{
  return lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type GeoContact and conformance GeoContact, (uint64_t (*)(uint64_t))type metadata accessor for GeoContact, (uint64_t)&protocol conformance descriptor for GeoContact);
}

unint64_t lazy protocol witness table accessor for type AppID and conformance AppID()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AppID and conformance AppID;
  if (!lazy protocol witness table cache variable for type AppID and conformance AppID)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for AppID, &type metadata for AppID);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AppID and conformance AppID);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for GeoContact(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v14 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    v5 = a2[3];
    a1[2] = a2[2];
    a1[3] = v5;
    v6 = a2[5];
    a1[4] = a2[4];
    a1[5] = v6;
    v7 = a2[7];
    a1[6] = a2[6];
    a1[7] = v7;
    v8 = a2[9];
    v9 = *(int *)(a3 + 40);
    v10 = (char *)a2 + v9;
    v11 = (char *)a1 + v9;
    a1[8] = a2[8];
    a1[9] = v8;
    v12 = type metadata accessor for ImageElement.ImageStyle();
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v11, v10, v12);
  }
  return v3;
}

uint64_t destroy for GeoContact(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 40);
  v5 = type metadata accessor for ImageElement.ImageStyle();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t initializeWithCopy for GeoContact(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  v7 = *(_QWORD *)(a2 + 72);
  v8 = *(int *)(a3 + 40);
  v9 = a2 + v8;
  v10 = a1 + v8;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  v11 = type metadata accessor for ImageElement.ImageStyle();
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v10, v9, v11);
  return a1;
}

_QWORD *assignWithCopy for GeoContact(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  v6 = *(int *)(a3 + 40);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for ImageElement.ImageStyle();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t initializeWithTake for GeoContact(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v4 = *(int *)(a3 + 40);
  v5 = a2 + v4;
  v6 = a1 + v4;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  v7 = type metadata accessor for ImageElement.ImageStyle();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v6, v5, v7);
  return a1;
}

uint64_t assignWithTake for GeoContact(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v8;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  v9 = *(int *)(a3 + 40);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = type metadata accessor for ImageElement.ImageStyle();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for GeoContact()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CC91D98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for ImageElement.ImageStyle();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 40), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for GeoContact()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CC91E20(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 32) = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for ImageElement.ImageStyle();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 40), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata completion function for GeoContact()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for ImageElement.ImageStyle();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AppID(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AppID(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23CC92000 + 4 * byte_23CCA4605[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23CC92034 + 4 * asc_23CCA4600[v4]))();
}

uint64_t sub_23CC92034(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23CC9203C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23CC92044);
  return result;
}

uint64_t sub_23CC92050(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23CC92058);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23CC9205C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23CC92064(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *destructiveInjectEnumTag for AppID(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AppID()
{
  return &type metadata for AppID;
}

uint64_t getEnumTagSinglePayload for GeoContact.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for GeoContact.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_23CC92168 + 4 * byte_23CCA460F[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_23CC9219C + 4 * byte_23CCA460A[v4]))();
}

uint64_t sub_23CC9219C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23CC921A4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23CC921ACLL);
  return result;
}

uint64_t sub_23CC921B8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23CC921C0);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_23CC921C4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23CC921CC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for GeoContact.CodingKeys()
{
  return &unk_250DE2720;
}

uint64_t specialized GeoContact.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x7865646E69 && a2 == 0xE500000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 25705 && a2 == 0xE200000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x736C616974696E69 && a2 == 0xE800000000000000
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x614265646F636E65 && a2 == 0xEC00000034366573
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x76654C6572616873 && a2 == 0xEA00000000006C65
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x7974536567616D69 && a2 == 0xEA0000000000656CLL)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 6;
    else
      return 7;
  }
}

uint64_t static ViewBuilder.buildBlock<each A>(_:)(uint64_t *a1, unint64_t a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t TupleTypeMetadata;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  __int128 *v12;
  _OWORD *v13;
  unint64_t v14;
  __int128 v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;

  v4 = a1;
  v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    TupleTypeMetadata = *v5;
    MEMORY[0x24BDAC7A8](a1);
    v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
LABEL_12:
    v22 = 32;
    v23 = a2;
    do
    {
      if (a2 == 1)
        v24 = 0;
      else
        v24 = *(_DWORD *)(TupleTypeMetadata + v22);
      v26 = *v5++;
      v25 = v26;
      v27 = *v4++;
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(&v8[v24], v27);
      v22 += 16;
      --v23;
    }
    while (v23);
    return TupleView.init(_:)();
  }
  MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v11 = 0;
    if (a2 < 4)
      goto LABEL_9;
    if ((unint64_t)(v10 - (char *)v5) < 0x20)
      goto LABEL_9;
    v11 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    v12 = (__int128 *)(v5 + 2);
    v13 = v10 + 16;
    v14 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      v15 = *v12;
      *(v13 - 1) = *(v12 - 1);
      *v13 = v15;
      v12 += 2;
      v13 += 2;
      v14 -= 4;
    }
    while (v14);
    if (v11 != a2)
    {
LABEL_9:
      v16 = a2 - v11;
      v17 = v11;
      v18 = &v10[8 * v11];
      v19 = &v5[v17];
      do
      {
        v20 = *v19++;
        *(_QWORD *)v18 = v20;
        v18 += 8;
        --v16;
      }
      while (v16);
    }
  }
  TupleTypeMetadata = swift_getTupleTypeMetadata();
  MEMORY[0x24BDAC7A8](TupleTypeMetadata);
  v8 = (char *)&v29 - v21;
  if (a2)
    goto LABEL_12;
  return TupleView.init(_:)();
}

double AvatarBubbleViewStyle.insideDiameter.getter(double a1, double a2)
{
  return a2;
}

double AvatarBubbleViewStyle.badgeOffset.getter(double a1, double a2, double a3)
{
  return a3;
}

Swift::String *AvatarBubbleViewStyle.default.unsafeMutableAddressor()
{
  if (one-time initialization token for default != -1)
    swift_once();
  return &sc.displayName;
}

double static AvatarBubbleViewStyle.default.getter()
{
  if (one-time initialization token for default != -1)
    swift_once();
  return *(double *)&sc.displayName._countAndFlagsBits;
}

double one-time initialization function for watch()
{
  double result;

  result = 36.0;
  static AvatarBubbleViewStyle.watch = xmmword_23CCA49D0;
  *(_OWORD *)&qword_256C22970 = xmmword_23CCA49E0;
  return result;
}

__int128 *AvatarBubbleViewStyle.watch.unsafeMutableAddressor()
{
  if (one-time initialization token for watch != -1)
    swift_once();
  return &static AvatarBubbleViewStyle.watch;
}

double static AvatarBubbleViewStyle.watch.getter()
{
  if (one-time initialization token for watch != -1)
    swift_once();
  return *(double *)&static AvatarBubbleViewStyle.watch;
}

double one-time initialization function for tiny()
{
  double result;

  result = 17.0;
  static AvatarBubbleViewStyle.tiny = xmmword_23CCA49F0;
  *(_OWORD *)&qword_256C22990 = xmmword_23CCA49E0;
  return result;
}

__int128 *AvatarBubbleViewStyle.tiny.unsafeMutableAddressor()
{
  if (one-time initialization token for tiny != -1)
    swift_once();
  return &static AvatarBubbleViewStyle.tiny;
}

double static AvatarBubbleViewStyle.tiny.getter()
{
  if (one-time initialization token for tiny != -1)
    swift_once();
  return *(double *)&static AvatarBubbleViewStyle.tiny;
}

uint64_t AvatarBubbleView.showTail.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t AvatarBubbleView.showTail.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*AvatarBubbleView.showTail.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

uint64_t AvatarBubbleView.isLive.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t AvatarBubbleView.isLive.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 1) = result;
  return result;
}

uint64_t (*AvatarBubbleView.isLive.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

uint64_t AvatarBubbleView.badgeType.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t AvatarBubbleView.badgeType.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 2) = result;
  return result;
}

uint64_t (*AvatarBubbleView.badgeType.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

double AvatarBubbleView.style.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

void AvatarBubbleView.style.setter(double a1, double a2, double a3, double a4)
{
  double *v4;

  v4[1] = a1;
  v4[2] = a2;
  v4[3] = a3;
  v4[4] = a4;
}

uint64_t (*AvatarBubbleView.style.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

uint64_t AvatarBubbleView.strokeColor.getter()
{
  return swift_retain();
}

uint64_t AvatarBubbleView.strokeColor.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_release();
  *(_QWORD *)(v1 + 40) = a1;
  return result;
}

uint64_t (*AvatarBubbleView.strokeColor.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

uint64_t AvatarBubbleView.content.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 52));
}

uint64_t AvatarBubbleView.content.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 40))(v2 + *(int *)(a2 + 52), a1);
}

uint64_t (*AvatarBubbleView.content.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

uint64_t AvatarBubbleView.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
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
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  void (*v23)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[2];
  _QWORD v37[2];
  _OWORD v38[12];
  uint64_t v39;

  v28 = a1;
  v32 = a2;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<_ShapeView<BubbleShape, Color>, _FrameLayout>);
  v27 = *(_QWORD *)(a1 + 16);
  type metadata accessor for ModifiedContent();
  type metadata accessor for ModifiedContent();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for _ClipEffect<Circle>);
  type metadata accessor for ModifiedContent();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<AvatarBadge, _OffsetEffect>?);
  swift_getTupleTypeMetadata3();
  v3 = type metadata accessor for TupleView();
  MEMORY[0x242630878](MEMORY[0x24BDF5420], v3);
  v4 = type metadata accessor for ZStack();
  v26 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v25 - v5;
  v7 = type metadata accessor for ModifiedContent();
  v31 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v25 - v8;
  type metadata accessor for AvatarBubbleShadow();
  v10 = type metadata accessor for ModifiedContent();
  v30 = *(_QWORD *)(v10 - 8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v25 - v14;
  v16 = *(_QWORD *)(v28 + 24);
  v33 = v27;
  v34 = v16;
  v35 = v29;
  static Alignment.center.getter();
  ZStack.init(alignment:content:)();
  v17 = MEMORY[0x242630878](MEMORY[0x24BDF4758], v4);
  View.compositingGroup()();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v6, v4);
  if (one-time initialization token for default != -1)
    swift_once();
  v38[10] = xmmword_256C228D0;
  v38[11] = unk_256C228E0;
  v39 = qword_256C228F0;
  v38[6] = xmmword_256C22890;
  v38[7] = unk_256C228A0;
  v38[8] = xmmword_256C228B0;
  v38[9] = unk_256C228C0;
  v38[2] = unk_256C22850;
  v38[3] = xmmword_256C22860;
  v38[4] = xmmword_256C22870;
  v38[5] = *(_OWORD *)&qword_256C22880;
  v38[0] = static AvatarBubbleShadowStyle.default;
  v38[1] = unk_256C22840;
  outlined retain of AvatarBubbleShadowStyle((uint64_t)v38);
  v37[0] = v17;
  v37[1] = MEMORY[0x24BDF0388];
  v18 = MEMORY[0x24BDED300];
  v19 = MEMORY[0x242630878](MEMORY[0x24BDED300], v7, v37);
  View.avatarShadows(style:)((uint64_t)v38, v7, v19);
  outlined release of AvatarBubbleShadowStyle((uint64_t)v38);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v7);
  v20 = lazy protocol witness table accessor for type AvatarBubbleShadow and conformance AvatarBubbleShadow();
  v36[0] = v19;
  v36[1] = v20;
  MEMORY[0x242630878](v18, v10, v36);
  v21 = v30;
  v22 = *(void (**)(char *, char *, uint64_t))(v30 + 16);
  v22(v15, v13, v10);
  v23 = *(void (**)(char *, uint64_t))(v21 + 8);
  v23(v13, v10);
  v22(v32, v15, v10);
  return ((uint64_t (*)(char *, uint64_t))v23)(v15, v10);
}

uint64_t closure #1 in AvatarBubbleView.body.getter@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  void (*v24)(char *, char *, uint64_t);
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  unsigned __int8 *v30;
  int v31;
  char v32;
  uint64_t v33;
  char *v34;
  char *v36;
  unsigned __int8 *v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  _QWORD v55[3];
  _BYTE v56[136];
  char v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66[3];
  uint64_t v67;
  __int128 v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  float64x2_t v77;
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[18];
  unsigned __int8 v82;
  uint64_t v83;
  unsigned __int8 v84;
  uint64_t v85;
  uint64_t v86;

  v38 = a3;
  v50 = a4;
  v6 = type metadata accessor for ModifiedContent();
  v39 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v36 - v7;
  v9 = type metadata accessor for ModifiedContent();
  v41 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v36 = (char *)&v36 - v10;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for _ClipEffect<Circle>);
  v11 = type metadata accessor for ModifiedContent();
  v40 = *(void (**)(char *, uint64_t))(v11 - 8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v51 = (char *)&v36 - v15;
  v48 = *a1;
  v49 = *((_QWORD *)a1 + 5);
  swift_retain();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  v47 = v81[17];
  v46 = v82;
  v45 = v83;
  v44 = v84;
  v42 = v86;
  v43 = v85;
  v16 = v38;
  type metadata accessor for AvatarBubbleView(0, a2, v38, v17);
  v37 = a1;
  static Alignment.center.getter();
  View.frame(width:height:alignment:)();
  v80[0] = v16;
  v80[1] = MEMORY[0x24BDEBED8];
  v18 = MEMORY[0x24BDED300];
  v19 = MEMORY[0x242630878](MEMORY[0x24BDED300], v6, v80);
  v20 = v36;
  View.scaledToFill()();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v8, v6);
  v79[0] = v19;
  v79[1] = MEMORY[0x24BDEEC48];
  v21 = MEMORY[0x242630878](v18, v9, v79);
  lazy protocol witness table accessor for type Circle and conformance Circle();
  View.clipShape<A>(_:style:)();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v20, v9);
  v22 = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type _ClipEffect<Circle> and conformance _ClipEffect<A>, &demangling cache variable for type metadata for _ClipEffect<Circle>, MEMORY[0x24BDEB958]);
  v78[0] = v21;
  v78[1] = v22;
  v41 = MEMORY[0x242630878](v18, v11, v78);
  v23 = v40;
  v24 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v40 + 2);
  v24(v51, v14, v11);
  v25 = (void (*)(char *, uint64_t))*((_QWORD *)v23 + 1);
  v26 = (uint64_t)v14;
  v27 = v14;
  v28 = v11;
  v29 = v11;
  v30 = v37;
  v25(v27, v29);
  v31 = v30[2];
  if (v31 == 2)
  {
    _s7SwiftUI15ModifiedContentVy14GeoUIFramework11AvatarBadgeVAA13_OffsetEffectVGSgWOi0_((uint64_t)&v67);
    outlined init with take of ModifiedContent<AvatarBadge, _OffsetEffect>?((uint64_t)&v67, (uint64_t)v81);
  }
  else
  {
    v40 = v25;
    v32 = v31 & 1;
    if (one-time initialization token for default != -1)
      swift_once();
    *(double *)&v33 = *((double *)v30 + 2) * 0.5;
    LOBYTE(v67) = v32;
    v68 = static AvatarBadgeStyle.default;
    v69 = qword_256C229F0;
    v70 = qword_256C229F8;
    v72 = *(_OWORD *)&qword_256C22A08;
    v73 = *(_OWORD *)&qword_256C22A18;
    v71 = qword_256C22A00;
    v74 = qword_256C22A28;
    v75 = xmmword_256C22A30;
    v76 = *(_OWORD *)&qword_256C22A40;
    v77 = vaddq_f64((float64x2_t)vdupq_lane_s64(v33, 0), *(float64x2_t *)(v30 + 24));
    closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter(&v67);
    swift_retain();
    swift_retain();
    swift_retain();
    outlined init with take of ModifiedContent<AvatarBadge, _OffsetEffect>?((uint64_t)&v67, (uint64_t)v81);
    v25 = v40;
  }
  v57 = (v48 == 2) | v48 & 1;
  v58 = v49;
  v59 = 256;
  v60 = v47;
  v61 = v46;
  v62 = v45;
  v63 = v44;
  v64 = v43;
  v65 = v42;
  v66[0] = (uint64_t)&v57;
  v34 = v51;
  v24((char *)v26, v51, v28);
  v66[1] = v26;
  outlined init with take of ModifiedContent<AvatarBadge, _OffsetEffect>?((uint64_t)v81, (uint64_t)v56);
  v66[2] = (uint64_t)v56;
  swift_retain();
  outlined retain of ModifiedContent<AvatarBadge, _OffsetEffect>?(v81, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of ModifiedContent<AvatarBadge, _OffsetEffect>?);
  v55[0] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<_ShapeView<BubbleShape, Color>, _FrameLayout>);
  v55[1] = v28;
  v55[2] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<AvatarBadge, _OffsetEffect>?);
  v52 = lazy protocol witness table accessor for type ModifiedContent<_ShapeView<BubbleShape, Color>, _FrameLayout> and conformance <> ModifiedContent<A, B>();
  v53 = v41;
  v54 = lazy protocol witness table accessor for type ModifiedContent<AvatarBadge, _OffsetEffect>? and conformance <A> A?();
  static ViewBuilder.buildBlock<each A>(_:)(v66, 3uLL, (uint64_t)v55);
  outlined retain of ModifiedContent<AvatarBadge, _OffsetEffect>?(v81, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of ModifiedContent<AvatarBadge, _OffsetEffect>?);
  v25(v34, v28);
  swift_release();
  outlined init with take of ModifiedContent<AvatarBadge, _OffsetEffect>?((uint64_t)v56, (uint64_t)&v67);
  outlined retain of ModifiedContent<AvatarBadge, _OffsetEffect>?(&v67, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of ModifiedContent<AvatarBadge, _OffsetEffect>?);
  v25((char *)v26, v28);
  return swift_release();
}

uint64_t partial apply for closure #1 in AvatarBubbleView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return closure #1 in AvatarBubbleView.body.getter(*(unsigned __int8 **)(v1 + 32), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

double AvatarBubbleView.badgeOffset.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16) * 0.5 + *(double *)(v0 + 24);
}

uint64_t outlined release of AvatarBubbleShadowStyle(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

double default argument 3 of AvatarBubbleView.init(showTail:isLive:badgeType:style:strokeColor:content:)()
{
  if (one-time initialization token for default != -1)
    swift_once();
  return *(double *)&sc.displayName._countAndFlagsBits;
}

uint64_t default argument 4 of AvatarBubbleView.init(showTail:isLive:badgeType:style:strokeColor:content:)()
{
  if (one-time initialization token for avatarStrokeColor != -1)
    swift_once();
  return swift_retain();
}

uint64_t AvatarBubbleView.init(showTail:isLive:badgeType:style:strokeColor:content:)@<X0>(char a1@<W0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t (*a5)(void)@<X4>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, double a9@<D0>, double a10@<D1>, double a11@<D2>, double a12@<D3>)
{
  *(_BYTE *)a8 = a1;
  *(_BYTE *)(a8 + 1) = a2;
  *(_BYTE *)(a8 + 2) = a3;
  *(double *)(a8 + 8) = a9;
  *(double *)(a8 + 16) = a10;
  *(double *)(a8 + 24) = a11;
  *(double *)(a8 + 32) = a12;
  *(_QWORD *)(a8 + 40) = a4;
  type metadata accessor for AvatarBubbleView(0, a6, a7, a4);
  return a5();
}

uint64_t type metadata accessor for AvatarBubbleView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AvatarBubbleView);
}

double static AvatarView_PreviewProvider.bubbleView(showTail:isLive:style:)@<D0>(char a1@<W0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t KeyPath;
  char v21;
  int v22;
  char v23;
  double result;
  uint64_t v25;
  int v26;
  char v27;
  int v28;
  char v29;
  _BYTE v30[7];
  char v31;
  _BYTE v32[7];
  char v33;
  char v34;
  _BYTE v35[7];
  _BYTE v36[7];

  v12 = type metadata accessor for Image.ResizingMode();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for avatarStrokeColor != -1)
    swift_once();
  v16 = static Assets.avatarStrokeColor;
  swift_retain();
  v17 = static VerticalAlignment.center.getter();
  v26 = a1 & 1;
  swift_retain();
  Image.init(_internalSystemName:)();
  (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BDF3FD8], v12);
  v18 = Image.resizable(capInsets:resizingMode:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  v19 = static Color.secondary.getter();
  KeyPath = swift_getKeyPath();
  v33 = 1;
  v31 = 1;
  v27 = 1;
  v21 = static Edge.Set.all.getter();
  v22 = static HierarchicalShapeStyle.quaternary.getter();
  v23 = static Edge.Set.all.getter();
  swift_release();
  v34 = 1;
  *(_QWORD *)a2 = v17;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  *(_DWORD *)(a2 + 17) = *(_DWORD *)v32;
  *(_DWORD *)(a2 + 20) = *(_DWORD *)&v32[3];
  *(_QWORD *)(a2 + 24) = 0;
  *(_BYTE *)(a2 + 32) = 1;
  *(_DWORD *)(a2 + 33) = *(_DWORD *)v30;
  *(_DWORD *)(a2 + 36) = *(_DWORD *)&v30[3];
  *(_BYTE *)(a2 + 40) = v26;
  *(_WORD *)(a2 + 41) = 512;
  *(_DWORD *)(a2 + 43) = v28;
  *(_BYTE *)(a2 + 47) = v29;
  *(double *)(a2 + 48) = a3;
  *(double *)(a2 + 56) = a4;
  *(double *)(a2 + 64) = a5;
  *(double *)(a2 + 72) = a6;
  *(_QWORD *)(a2 + 80) = v16;
  *(_QWORD *)(a2 + 88) = v18;
  *(_QWORD *)(a2 + 96) = KeyPath;
  *(_QWORD *)(a2 + 104) = v19;
  *(_QWORD *)(a2 + 112) = 0;
  *(_BYTE *)(a2 + 120) = 1;
  *(_DWORD *)(a2 + 121) = *(_DWORD *)v36;
  *(_DWORD *)(a2 + 124) = *(_DWORD *)&v36[3];
  *(_BYTE *)(a2 + 128) = v21;
  *(_DWORD *)(a2 + 132) = *(_DWORD *)&v35[3];
  *(_DWORD *)(a2 + 129) = *(_DWORD *)v35;
  result = 0.0;
  *(_OWORD *)(a2 + 152) = 0u;
  *(_OWORD *)(a2 + 136) = 0u;
  *(_BYTE *)(a2 + 168) = v34;
  *(_DWORD *)(a2 + 172) = v22;
  *(_BYTE *)(a2 + 176) = v23;
  return result;
}

uint64_t static AvatarView_PreviewProvider.preview<A>(showTail:isLive:style:strokeColor:content:)@<X0>(char a1@<W0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>, double a9@<D0>, double a10@<D1>, double a11@<D2>, double a12@<D3>)
{
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  uint64_t v27;
  _BYTE v29[4];
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[2];
  int v48;

  v33 = a5;
  v32 = a4;
  v31 = a3;
  v30 = a2;
  v35 = a8;
  type metadata accessor for AvatarBubbleView(255, a6, a7, a4);
  swift_getTupleTypeMetadata3();
  v19 = type metadata accessor for TupleView();
  MEMORY[0x242630878](MEMORY[0x24BDF5420], v19);
  v20 = type metadata accessor for HStack();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v23 = &v29[-v22];
  v24 = type metadata accessor for ModifiedContent();
  v34 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v26 = &v29[-v25];
  v36 = a6;
  v37 = a7;
  v38 = a1;
  v39 = v30;
  v40 = a9;
  v41 = a10;
  v42 = a11;
  v43 = a12;
  v44 = v31;
  v45 = v32;
  v46 = v33;
  static VerticalAlignment.center.getter();
  HStack.init(alignment:spacing:content:)();
  static Edge.Set.all.getter();
  v27 = MEMORY[0x242630878](MEMORY[0x24BDF44A0], v20);
  View.padding(_:_:)();
  (*(void (**)(_BYTE *, uint64_t))(v21 + 8))(v23, v20);
  v48 = static HierarchicalShapeStyle.quaternary.getter();
  static Edge.Set.all.getter();
  v47[0] = v27;
  v47[1] = MEMORY[0x24BDECC58];
  MEMORY[0x242630878](MEMORY[0x24BDED300], v24, v47);
  View.background<A>(_:ignoresSafeAreaEdges:)();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v34 + 8))(v26, v24);
}

uint64_t closure #1 in static AvatarView_PreviewProvider.preview<A>(showTail:isLive:style:strokeColor:content:)@<X0>(char a1@<W0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>, double a9@<D0>, double a10@<D1>, double a11@<D2>, double a12@<D3>)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, double *, uint64_t);
  void (*v31)(double *, uint64_t);
  _QWORD v33[5];
  _QWORD v34[3];
  uint64_t v35;
  char v36;
  uint64_t v37;
  char v38;
  uint64_t v39[4];

  v33[0] = a5;
  v33[1] = a8;
  v20 = type metadata accessor for AvatarBubbleView(0, a6, a7, a4);
  v21 = *(_QWORD *)(v20 - 8);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (double *)((char *)v33 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  v25 = MEMORY[0x24BDAC7A8](v22);
  v27 = (char *)v33 - v26;
  *(_BYTE *)v24 = a1;
  *((_BYTE *)v24 + 1) = a2;
  *((_BYTE *)v24 + 2) = 2;
  v24[1] = a9;
  v24[2] = a10;
  v24[3] = a11;
  v24[4] = a12;
  *((_QWORD *)v24 + 5) = a3;
  v28 = (char *)v24 + *(int *)(v25 + 52);
  swift_retain();
  closure #1 in closure #1 in static AvatarView_PreviewProvider.preview<A>(showTail:isLive:style:strokeColor:content:)(a6, v28);
  v29 = MEMORY[0x242630878](&protocol conformance descriptor for AvatarBubbleView<A>, v20);
  v30 = *(void (**)(char *, double *, uint64_t))(v21 + 16);
  v30(v27, v24, v20);
  v31 = *(void (**)(double *, uint64_t))(v21 + 8);
  v31(v24, v20);
  v37 = 0;
  v38 = 1;
  v39[0] = (uint64_t)&v37;
  v30((char *)v24, (double *)v27, v20);
  v35 = 0;
  v36 = 1;
  v39[1] = (uint64_t)v24;
  v39[2] = (uint64_t)&v35;
  v34[0] = MEMORY[0x24BDF4630];
  v34[1] = v20;
  v34[2] = MEMORY[0x24BDF4630];
  v33[2] = MEMORY[0x24BDF4618];
  v33[3] = v29;
  v33[4] = MEMORY[0x24BDF4618];
  static ViewBuilder.buildBlock<each A>(_:)(v39, 3uLL, (uint64_t)v34);
  v31((double *)v27, v20);
  return ((uint64_t (*)(double *, uint64_t))v31)(v24, v20);
}

uint64_t closure #1 in closure #1 in static AvatarView_PreviewProvider.preview<A>(showTail:isLive:style:strokeColor:content:)@<X0>(uint64_t a1@<X2>, char *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void (*v8)(void);
  uint64_t v9;
  char *v10;
  void (*v11)(char *, char *, uint64_t);
  void (*v12)(char *, uint64_t);
  uint64_t v14;

  v4 = *(_QWORD *)(a1 - 8);
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (void (*)(void))MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v14 - v9;
  v8();
  v11 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v11(v10, v7, a1);
  v12 = *(void (**)(char *, uint64_t))(v4 + 8);
  v12(v7, a1);
  v11(a2, v10, a1);
  return ((uint64_t (*)(char *, uint64_t))v12)(v10, a1);
}

void *static AvatarView_PreviewProvider.previews.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  _BYTE __src[928];
  _BYTE v5[928];

  v2 = static HorizontalAlignment.center.getter();
  closure #1 in static AvatarView_PreviewProvider.previews.getter(__src);
  memcpy(&v5[7], __src, 0x399uLL);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  return memcpy((void *)(a1 + 17), v5, 0x3A0uLL);
}

uint64_t closure #1 in static AvatarView_PreviewProvider.previews.getter@<X0>(void *a1@<X8>)
{
  uint64_t v1;
  __int128 v2;
  int v3;
  char v5;
  char v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  char v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  char v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  char v62;
  char v63;
  char v64;
  char v65;
  char v66;
  __int16 v67;
  char v68;
  _BYTE v69[7];
  _BYTE v70[7];
  int v71;
  char v72;
  _BYTE v73[7];
  _BYTE v74[7];
  _OWORD v75[11];
  char v76;
  _OWORD v77[11];
  char v78;
  _OWORD v79[11];
  char v80;
  _OWORD v81[11];
  char v82;
  __int128 v83;
  unint64_t v84;
  uint64_t v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[32];
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[25];
  _OWORD __src[58];
  _QWORD v95[2];
  char v96;
  _BYTE v97[7];
  uint64_t v98;
  char v99;
  _BYTE v100[7];
  __int16 v101;
  char v102;
  int v103;
  char v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  double v108;
  uint64_t v109;
  __int128 v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  char v114;
  _BYTE v115[7];
  char v116;
  _BYTE v117[7];
  __int128 v118;
  __int128 v119;
  char v120;
  __int16 v121;
  char v122;
  int v123;
  char v124;
  _OWORD v125[11];
  char v126;
  _OWORD v127[11];
  char v128;
  _OWORD v129[11];
  char v130;
  _OWORD v131[11];
  char v132;

  if (one-time initialization token for default != -1)
    swift_once();
  static AvatarView_PreviewProvider.bubbleView(showTail:isLive:style:)(1, (uint64_t)&v27, *(double *)&sc.displayName._countAndFlagsBits, *(double *)&sc.displayName._object, *(double *)&sc.driPayload, unk_256C22958);
  if (one-time initialization token for watch != -1)
    swift_once();
  static AvatarView_PreviewProvider.bubbleView(showTail:isLive:style:)(1, (uint64_t)&v39, *(double *)&static AvatarBubbleViewStyle.watch, *((double *)&static AvatarBubbleViewStyle.watch + 1), *(double *)&qword_256C22970, unk_256C22978);
  static AvatarView_PreviewProvider.bubbleView(showTail:isLive:style:)(0, (uint64_t)&v51, *(double *)&sc.displayName._countAndFlagsBits, *(double *)&sc.displayName._object, *(double *)&sc.driPayload, unk_256C22958);
  if (one-time initialization token for tiny != -1)
    swift_once();
  v12 = *((_QWORD *)&static AvatarBubbleViewStyle.tiny + 1);
  v13 = static AvatarBubbleViewStyle.tiny;
  v10 = dbl_256C22998;
  v11 = qword_256C22990;
  static AvatarView_PreviewProvider.bubbleView(showTail:isLive:style:)(1, (uint64_t)&v15, *(double *)&static AvatarBubbleViewStyle.tiny, *((double *)&static AvatarBubbleViewStyle.tiny + 1), *(double *)&qword_256C22990, dbl_256C22998);
  v1 = static Color.red.getter();
  v7 = static VerticalAlignment.center.getter();
  swift_retain();
  closure #1 in closure #1 in static AvatarView_PreviewProvider.previews.getter((uint64_t *)__src);
  v2 = __src[0];
  v8 = *((_QWORD *)&__src[1] + 1);
  v9 = *(_QWORD *)&__src[1];
  v65 = 1;
  v64 = 1;
  v63 = 1;
  v6 = static Edge.Set.all.getter();
  v3 = static HierarchicalShapeStyle.quaternary.getter();
  v5 = static Edge.Set.all.getter();
  swift_release();
  v75[8] = v35;
  v75[9] = v36;
  v75[10] = v37;
  v75[4] = v31;
  v75[5] = v32;
  v75[6] = v33;
  v75[7] = v34;
  v75[0] = v27;
  v75[1] = v28;
  v75[2] = v29;
  v75[3] = v30;
  v77[8] = v47;
  v77[9] = v48;
  v77[10] = v49;
  v77[4] = v43;
  v77[5] = v44;
  v77[6] = v45;
  v77[7] = v46;
  v77[0] = v39;
  v77[1] = v40;
  v77[2] = v41;
  v77[3] = v42;
  v79[8] = v59;
  v79[9] = v60;
  v79[10] = v61;
  v79[4] = v55;
  v79[5] = v56;
  v79[6] = v57;
  v79[7] = v58;
  v79[0] = v51;
  v79[1] = v52;
  v79[2] = v53;
  v79[3] = v54;
  v81[8] = v23;
  v81[9] = v24;
  v81[10] = v25;
  v81[4] = v19;
  v81[5] = v20;
  v81[6] = v21;
  v81[7] = v22;
  v81[0] = v15;
  v81[1] = v16;
  v81[2] = v17;
  v81[3] = v18;
  __src[3] = v30;
  __src[2] = v29;
  __src[1] = v28;
  __src[0] = v27;
  __src[7] = v34;
  __src[6] = v33;
  __src[5] = v32;
  __src[4] = v31;
  __src[10] = v37;
  __src[9] = v36;
  __src[8] = v35;
  *(_OWORD *)((char *)&__src[20] + 8) = v48;
  *(_OWORD *)((char *)&__src[21] + 8) = v49;
  *(_OWORD *)((char *)&__src[16] + 8) = v44;
  *(_OWORD *)((char *)&__src[17] + 8) = v45;
  *(_OWORD *)((char *)&__src[18] + 8) = v46;
  *(_OWORD *)((char *)&__src[19] + 8) = v47;
  *(_OWORD *)((char *)&__src[15] + 8) = v43;
  *(_OWORD *)((char *)&__src[11] + 8) = v39;
  *(_OWORD *)((char *)&__src[12] + 8) = v40;
  *(_OWORD *)((char *)&__src[13] + 8) = v41;
  *(_OWORD *)((char *)&__src[14] + 8) = v42;
  __src[31] = v59;
  __src[32] = v60;
  __src[33] = v61;
  __src[27] = v55;
  __src[28] = v56;
  __src[29] = v57;
  __src[30] = v58;
  __src[23] = v51;
  __src[24] = v52;
  __src[25] = v53;
  __src[26] = v54;
  *(_OWORD *)((char *)&__src[42] + 8) = v23;
  *(_OWORD *)((char *)&__src[43] + 8) = v24;
  *(_OWORD *)((char *)&__src[44] + 8) = v25;
  *(_OWORD *)((char *)&__src[38] + 8) = v19;
  *(_OWORD *)((char *)&__src[39] + 8) = v20;
  v66 = 1;
  *(_DWORD *)v97 = *(_DWORD *)v74;
  *(_DWORD *)v100 = *(_DWORD *)v73;
  *(_DWORD *)&v97[3] = *(_DWORD *)&v74[3];
  *(_DWORD *)&v100[3] = *(_DWORD *)&v73[3];
  v103 = v71;
  v104 = v72;
  *(_DWORD *)&v115[3] = *(_DWORD *)&v70[3];
  *(_DWORD *)v115 = *(_DWORD *)v70;
  *(_DWORD *)&v117[3] = *(_DWORD *)&v69[3];
  *(_DWORD *)v117 = *(_DWORD *)v69;
  v121 = v67;
  v122 = v68;
  v76 = v38;
  v78 = v50;
  v80 = v62;
  v82 = v26;
  v83 = (unint64_t)v7;
  LOBYTE(v84) = 1;
  *(_DWORD *)((char *)&v84 + 1) = *(_DWORD *)v74;
  HIDWORD(v84) = *(_DWORD *)&v74[3];
  v85 = 0;
  LOBYTE(v86) = 1;
  *(_DWORD *)((char *)&v86 + 1) = *(_DWORD *)v73;
  DWORD1(v86) = *(_DWORD *)&v73[3];
  WORD4(v86) = 1;
  BYTE10(v86) = 2;
  *(_DWORD *)((char *)&v86 + 11) = v71;
  HIBYTE(v86) = v72;
  *(_QWORD *)&v87 = v13;
  *((_QWORD *)&v87 + 1) = v12;
  *(_QWORD *)&v88 = v11;
  *((double *)&v88 + 1) = v10;
  *(_QWORD *)v89 = v1;
  *(_OWORD *)&v89[8] = v2;
  *(_QWORD *)&v89[24] = v9;
  v90 = v8;
  LOBYTE(v91) = 1;
  *(_DWORD *)((char *)&v91 + 1) = *(_DWORD *)v70;
  DWORD1(v91) = *(_DWORD *)&v70[3];
  BYTE8(v91) = v6;
  HIDWORD(v91) = *(_DWORD *)&v69[3];
  *(_DWORD *)((char *)&v91 + 9) = *(_DWORD *)v69;
  *(_OWORD *)((char *)&__src[40] + 8) = v21;
  *(_OWORD *)((char *)&__src[41] + 8) = v22;
  v92 = 0u;
  *(_OWORD *)v93 = 0u;
  v93[16] = 1;
  v93[19] = v68;
  *(_WORD *)&v93[17] = v67;
  *(_DWORD *)&v93[20] = v3;
  v93[24] = v5;
  LOBYTE(__src[11]) = v38;
  BYTE8(__src[22]) = v50;
  LOBYTE(__src[34]) = v62;
  *(_OWORD *)((char *)&__src[34] + 8) = v15;
  *(_OWORD *)((char *)&__src[35] + 8) = v16;
  *(_OWORD *)((char *)&__src[36] + 8) = v17;
  *(_OWORD *)((char *)&__src[37] + 8) = v18;
  BYTE8(__src[45]) = v26;
  *(_OWORD *)((char *)&__src[56] + 9) = *(_OWORD *)&v93[9];
  __src[54] = v91;
  memset(&__src[55], 0, 25);
  __src[50] = v88;
  __src[51] = *(_OWORD *)v89;
  __src[52] = *(_OWORD *)&v89[16];
  __src[53] = v8;
  __src[46] = (unint64_t)v7;
  __src[47] = v84;
  __src[48] = v86;
  __src[49] = v87;
  memcpy(a1, __src, 0x399uLL);
  v95[0] = v7;
  v95[1] = 0;
  v96 = 1;
  v98 = 0;
  v99 = 1;
  v101 = 1;
  v102 = 2;
  v105 = v13;
  v106 = v12;
  v107 = v11;
  v108 = v10;
  v109 = v1;
  v110 = v2;
  v111 = v9;
  v112 = v8;
  v113 = 0;
  v114 = 1;
  v116 = v6;
  v119 = 0u;
  v118 = 0u;
  v120 = 1;
  v123 = v3;
  v124 = v5;
  outlined retain of ModifiedContent<ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, _PaddingLayout>, _BackgroundStyleModifier<HierarchicalShapeStyle>>((uint64_t)v75);
  outlined retain of ModifiedContent<ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, _PaddingLayout>, _BackgroundStyleModifier<HierarchicalShapeStyle>>((uint64_t)v77);
  outlined retain of ModifiedContent<ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, _PaddingLayout>, _BackgroundStyleModifier<HierarchicalShapeStyle>>((uint64_t)v79);
  outlined retain of ModifiedContent<ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, _PaddingLayout>, _BackgroundStyleModifier<HierarchicalShapeStyle>>((uint64_t)v81);
  outlined retain of ModifiedContent<ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _ForegroundStyleModifier<Color>>>, Spacer)>>, _PaddingLayout>, _BackgroundStyleModifier<HierarchicalShapeStyle>>((uint64_t)&v83);
  outlined release of ModifiedContent<ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _ForegroundStyleModifier<Color>>>, Spacer)>>, _PaddingLayout>, _BackgroundStyleModifier<HierarchicalShapeStyle>>((uint64_t)v95);
  v125[8] = v23;
  v125[9] = v24;
  v125[10] = v25;
  v126 = v26;
  v125[4] = v19;
  v125[5] = v20;
  v125[6] = v21;
  v125[7] = v22;
  v125[0] = v15;
  v125[1] = v16;
  v125[2] = v17;
  v125[3] = v18;
  outlined release of ModifiedContent<ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, _PaddingLayout>, _BackgroundStyleModifier<HierarchicalShapeStyle>>((uint64_t)v125);
  v127[8] = v59;
  v127[9] = v60;
  v127[10] = v61;
  v128 = v62;
  v127[4] = v55;
  v127[5] = v56;
  v127[6] = v57;
  v127[7] = v58;
  v127[0] = v51;
  v127[1] = v52;
  v127[2] = v53;
  v127[3] = v54;
  outlined release of ModifiedContent<ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, _PaddingLayout>, _BackgroundStyleModifier<HierarchicalShapeStyle>>((uint64_t)v127);
  v129[8] = v47;
  v129[9] = v48;
  v129[10] = v49;
  v130 = v50;
  v129[4] = v43;
  v129[5] = v44;
  v129[6] = v45;
  v129[7] = v46;
  v129[0] = v39;
  v129[1] = v40;
  v129[2] = v41;
  v129[3] = v42;
  outlined release of ModifiedContent<ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, _PaddingLayout>, _BackgroundStyleModifier<HierarchicalShapeStyle>>((uint64_t)v129);
  v131[8] = v35;
  v131[9] = v36;
  v131[10] = v37;
  v132 = v38;
  v131[4] = v31;
  v131[5] = v32;
  v131[6] = v33;
  v131[7] = v34;
  v131[0] = v27;
  v131[1] = v28;
  v131[2] = v29;
  v131[3] = v30;
  return outlined release of ModifiedContent<ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, _PaddingLayout>, _BackgroundStyleModifier<HierarchicalShapeStyle>>((uint64_t)v131);
}

uint64_t closure #1 in closure #1 in static AvatarView_PreviewProvider.previews.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t KeyPath;
  uint64_t result;
  uint64_t v10;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Font.Design?);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = Image.init(systemName:)();
  v6 = type metadata accessor for Font.Design();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v4, 1, 1, v6);
  v7 = static Font.system(size:weight:design:)();
  outlined destroy of Font.Design?((uint64_t)v4);
  KeyPath = swift_getKeyPath();
  result = static Color.white.getter();
  *a1 = v5;
  a1[1] = KeyPath;
  a1[2] = v7;
  a1[3] = result;
  return result;
}

void *protocol witness for static PreviewProvider.previews.getter in conformance AvatarView_PreviewProvider@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  _BYTE __src[928];
  _BYTE v5[928];

  v2 = static HorizontalAlignment.center.getter();
  closure #1 in static AvatarView_PreviewProvider.previews.getter(__src);
  memcpy(&v5[7], __src, 0x399uLL);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  return memcpy((void *)(a1 + 17), v5, 0x3A0uLL);
}

uint64_t protocol witness for static _PreviewProvider._previews.getter in conformance AvatarView_PreviewProvider()
{
  lazy protocol witness table accessor for type AvatarView_PreviewProvider and conformance AvatarView_PreviewProvider();
  return static PreviewProvider._previews.getter();
}

uint64_t protocol witness for static _PreviewProvider._platform.getter in conformance AvatarView_PreviewProvider()
{
  lazy protocol witness table accessor for type AvatarView_PreviewProvider and conformance AvatarView_PreviewProvider();
  return static PreviewProvider._platform.getter();
}

uint64_t key path getter for EnvironmentValues.foregroundColor : EnvironmentValues, serialized@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_23CC946CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t key path setter for EnvironmentValues.foregroundColor : EnvironmentValues, serialized()
{
  swift_retain();
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_23CC9471C()
{
  swift_retain();
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t partial apply for closure #1 in static AvatarView_PreviewProvider.preview<A>(showTail:isLive:style:strokeColor:content:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return closure #1 in static AvatarView_PreviewProvider.preview<A>(showTail:isLive:style:strokeColor:content:)(*(_BYTE *)(v1 + 32), *(_BYTE *)(v1 + 33), *(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 88), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1, *(double *)(v1 + 40), *(double *)(v1 + 48), *(double *)(v1 + 56), *(double *)(v1 + 64));
}

uint64_t associated type witness table accessor for View.Body : View in AvatarBubbleView<A>()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t lazy protocol witness table accessor for type AvatarView_PreviewProvider and conformance AvatarView_PreviewProvider()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AvatarView_PreviewProvider and conformance AvatarView_PreviewProvider;
  if (!lazy protocol witness table cache variable for type AvatarView_PreviewProvider and conformance AvatarView_PreviewProvider)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for AvatarView_PreviewProvider, &type metadata for AvatarView_PreviewProvider);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AvatarView_PreviewProvider and conformance AvatarView_PreviewProvider);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AvatarView_PreviewProvider and conformance AvatarView_PreviewProvider;
  if (!lazy protocol witness table cache variable for type AvatarView_PreviewProvider and conformance AvatarView_PreviewProvider)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for AvatarView_PreviewProvider, &type metadata for AvatarView_PreviewProvider);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AvatarView_PreviewProvider and conformance AvatarView_PreviewProvider);
  }
  return result;
}

uint64_t associated type witness table accessor for PreviewProvider.Previews : View in AvatarView_PreviewProvider()
{
  return swift_getOpaqueTypeConformance2();
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

uint64_t getEnumTagSinglePayload for AvatarBubbleViewStyle(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AvatarBubbleViewStyle(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 32) = v3;
  return result;
}

ValueMetadata *type metadata accessor for AvatarBubbleViewStyle()
{
  return &type metadata for AvatarBubbleViewStyle;
}

uint64_t type metadata instantiation function for AvatarBubbleView()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata completion function for AvatarBubbleView()
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

_QWORD *initializeBufferWithCopyOfBuffer for AvatarBubbleView(_BYTE *a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  _OWORD *v10;
  _OWORD *v11;
  __int128 v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);

  v3 = a1;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 48) & (unint64_t)~v6) + *(_QWORD *)(v5 + 64) > 0x18)
  {
    v9 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    *a1 = *(_BYTE *)a2;
    a1[1] = *((_BYTE *)a2 + 1);
    a1[2] = *((_BYTE *)a2 + 2);
    v10 = (_OWORD *)((unint64_t)(a1 + 10) & 0xFFFFFFFFFFFFFFF8);
    v11 = (_OWORD *)(((unint64_t)a2 + 10) & 0xFFFFFFFFFFFFFFF8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = (_QWORD *)(((unint64_t)v10 + 39) & 0xFFFFFFFFFFFFFFF8);
    v14 = (_QWORD *)(((unint64_t)v11 + 39) & 0xFFFFFFFFFFFFFFF8);
    *v13 = *v14;
    v15 = ((unint64_t)v13 + v6 + 8) & ~v6;
    v16 = ((unint64_t)v14 + v6 + 8) & ~v6;
    v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_retain();
    v17(v15, v16, v4);
  }
  return v3;
}

uint64_t destroy for AvatarBubbleView(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = (((a1 + 10) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((v3 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
}

_BYTE *initializeWithCopy for AvatarBubbleView(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  _OWORD *v4;
  _OWORD *v5;
  __int128 v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  v4 = (_OWORD *)((unint64_t)(a1 + 10) & 0xFFFFFFFFFFFFFFF8);
  v5 = (_OWORD *)((unint64_t)(a2 + 10) & 0xFFFFFFFFFFFFFFF8);
  v6 = v5[1];
  *v4 = *v5;
  v4[1] = v6;
  v7 = (_QWORD *)(((unint64_t)v4 + 39) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)(((unint64_t)v5 + 39) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v9 = *(_QWORD *)(a3 + 16);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned __int8 *)(v10 + 80);
  v12 = ((unint64_t)v7 + v11 + 8) & ~v11;
  v13 = ((unint64_t)v8 + v11 + 8) & ~v11;
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
  swift_retain();
  v14(v12, v13, v9);
  return a1;
}

_BYTE *assignWithCopy for AvatarBubbleView(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  v5 = (_QWORD *)((unint64_t)(a1 + 10) & 0xFFFFFFFFFFFFFFF8);
  v6 = (_QWORD *)((unint64_t)(a2 + 10) & 0xFFFFFFFFFFFFFFF8);
  *v5 = *v6;
  v5[1] = v6[1];
  v5[2] = v6[2];
  v5[3] = v6[3];
  v7 = (_QWORD *)(((unint64_t)v5 + 39) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)(((unint64_t)v6 + 39) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  swift_retain();
  swift_release();
  v9 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v9 + 24))(((unint64_t)v7 + *(unsigned __int8 *)(v9 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80), ((unint64_t)v8 + *(unsigned __int8 *)(v9 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  return a1;
}

_BYTE *initializeWithTake for AvatarBubbleView(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  _OWORD *v4;
  _OWORD *v5;
  __int128 v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  v4 = (_OWORD *)((unint64_t)(a1 + 10) & 0xFFFFFFFFFFFFFFF8);
  v5 = (_OWORD *)((unint64_t)(a2 + 10) & 0xFFFFFFFFFFFFFFF8);
  v6 = v5[1];
  *v4 = *v5;
  v4[1] = v6;
  v7 = (_QWORD *)(((unint64_t)v4 + 39) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)(((unint64_t)v5 + 39) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v9 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v9 + 32))(((unint64_t)v7 + *(unsigned __int8 *)(v9 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80), ((unint64_t)v8 + *(unsigned __int8 *)(v9 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  return a1;
}

_BYTE *assignWithTake for AvatarBubbleView(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  v5 = (_QWORD *)((unint64_t)(a1 + 10) & 0xFFFFFFFFFFFFFFF8);
  v6 = (_QWORD *)((unint64_t)(a2 + 10) & 0xFFFFFFFFFFFFFFF8);
  *v5 = *v6;
  v5[1] = v6[1];
  v5[2] = v6[2];
  v5[3] = v6[3];
  v7 = (_QWORD *)(((unint64_t)v5 + 39) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)(((unint64_t)v6 + 39) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  swift_release();
  v9 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v9 + 40))(((unint64_t)v7 + *(unsigned __int8 *)(v9 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80), ((unint64_t)v8 + *(unsigned __int8 *)(v9 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  return a1;
}

uint64_t getEnumTagSinglePayload for AvatarBubbleView(uint64_t a1, unsigned int a2, uint64_t a3)
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
  unint64_t *v15;
  unint64_t v16;

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
  v9 = ((v7 + 48) & ~v7) + *(_QWORD *)(v4 + 64);
  v10 = 8 * v9;
  if (v9 <= 3)
  {
    v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      v11 = *(_DWORD *)(a1 + v9);
      if (!v11)
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      v11 = *(unsigned __int16 *)(a1 + v9);
      if (!*(_WORD *)(a1 + v9))
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_22:
      v15 = (unint64_t *)((((a1 + 10) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8);
      if ((v5 & 0x80000000) != 0)
        return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)v15 + v7 + 8) & ~v7);
      v16 = *v15;
      if (v16 >= 0xFFFFFFFF)
        LODWORD(v16) = -1;
      return (v16 + 1);
    }
  }
  v11 = *(unsigned __int8 *)(a1 + v9);
  if (!*(_BYTE *)(a1 + v9))
    goto LABEL_22;
LABEL_15:
  v14 = (v11 - 1) << v10;
  if (v9 > 3)
    v14 = 0;
  if (!(_DWORD)v9)
    return v6 + v14 + 1;
  if (v9 > 3)
    LODWORD(v9) = 4;
  return ((uint64_t (*)(void))((char *)&loc_23CC94DE4 + 4 * byte_23CCA4A00[(v9 - 1)]))();
}

void storeEnumTagSinglePayload for AvatarBubbleView(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
  v7 = ((*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
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

ValueMetadata *type metadata accessor for AvatarView_PreviewProvider()
{
  return &type metadata for AvatarView_PreviewProvider;
}

uint64_t sub_23CC95078()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];
  _QWORD v7[2];

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<_ShapeView<BubbleShape, Color>, _FrameLayout>);
  type metadata accessor for ModifiedContent();
  type metadata accessor for ModifiedContent();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for _ClipEffect<Circle>);
  type metadata accessor for ModifiedContent();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<AvatarBadge, _OffsetEffect>?);
  swift_getTupleTypeMetadata3();
  v0 = type metadata accessor for TupleView();
  MEMORY[0x242630878](MEMORY[0x24BDF5420], v0);
  v1 = type metadata accessor for ZStack();
  v2 = type metadata accessor for ModifiedContent();
  type metadata accessor for AvatarBubbleShadow();
  v3 = type metadata accessor for ModifiedContent();
  v7[0] = MEMORY[0x242630878](MEMORY[0x24BDF4758], v1);
  v7[1] = MEMORY[0x24BDF0388];
  v4 = MEMORY[0x24BDED300];
  v6[0] = MEMORY[0x242630878](MEMORY[0x24BDED300], v2, v7);
  v6[1] = lazy protocol witness table accessor for type AvatarBubbleShadow and conformance AvatarBubbleShadow();
  return MEMORY[0x242630878](v4, v3, v6);
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, _PaddingLayout>, _BackgroundStyleModifier<HierarchicalShapeStyle>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, _PaddingLayout>, _BackgroundStyleModifier<HierarchicalShapeStyle>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, _PaddingLayout>, _BackgroundStyleModifier<HierarchicalShapeStyle>> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, _PaddingLayout>, _BackgroundStyleModifier<HierarchicalShapeStyle>>);
    v2[0] = lazy protocol witness table accessor for type ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>();
    v2[1] = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type _BackgroundStyleModifier<HierarchicalShapeStyle> and conformance _BackgroundStyleModifier<A>, &demangling cache variable for type metadata for _BackgroundStyleModifier<HierarchicalShapeStyle>, MEMORY[0x24BDF06D8]);
    result = MEMORY[0x242630878](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, _PaddingLayout>, _BackgroundStyleModifier<HierarchicalShapeStyle>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, _PaddingLayout>);
    v2[0] = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>> and conformance HStack<A>, &demangling cache variable for type metadata for HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, MEMORY[0x24BDF44A0]);
    v2[1] = MEMORY[0x24BDECC58];
    result = MEMORY[0x242630878](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t sub_23CC952EC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];
  _QWORD v11[2];

  type metadata accessor for AvatarBubbleView(255, *a1, a1[1], a4);
  swift_getTupleTypeMetadata3();
  v4 = type metadata accessor for TupleView();
  MEMORY[0x242630878](MEMORY[0x24BDF5420], v4);
  v5 = type metadata accessor for HStack();
  v6 = type metadata accessor for ModifiedContent();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for _BackgroundStyleModifier<HierarchicalShapeStyle>);
  v7 = type metadata accessor for ModifiedContent();
  v11[0] = MEMORY[0x242630878](MEMORY[0x24BDF44A0], v5);
  v11[1] = MEMORY[0x24BDECC58];
  v8 = MEMORY[0x24BDED300];
  v10[0] = MEMORY[0x242630878](MEMORY[0x24BDED300], v6, v11);
  v10[1] = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type _BackgroundStyleModifier<HierarchicalShapeStyle> and conformance _BackgroundStyleModifier<A>, &demangling cache variable for type metadata for _BackgroundStyleModifier<HierarchicalShapeStyle>, MEMORY[0x24BDF06D8]);
  return MEMORY[0x242630878](v8, v7, v10);
}

uint64_t sub_23CC95414()
{
  return lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type VStack<TupleView<(ModifiedContent<ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, _PaddingLayout>, _BackgroundStyleModifier<HierarchicalShapeStyle>>, ModifiedContent<ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, _PaddingLayout>, _BackgroundStyleModifier<HierarchicalShapeStyle>>, ModifiedContent<ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, _PaddingLayout>, _BackgroundStyleModifier<HierarchicalShapeStyle>>, ModifiedContent<ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, _PaddingLayout>, _BackgroundStyleModifier<HierarchicalShapeStyle>>, ModifiedContent<ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<Mo, &demangling cache variable for type metadata for VStack<TupleView<(ModifiedContent<ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, _PaddingLayout>, _BackgroundStyleModifier<HierarchicalShapeStyle>>, ModifiedContent<ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, _PaddingLayout>, _BackgroundStyleModifier<HierarchicalShapeStyle>>, ModifiedContent<ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, _PaddingLayout>, _BackgroundStyleModifier<HierarchicalShapeStyle>>, ModifiedContent<ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, _PaddingLayout>, _BackgroundStyleModifier<HierarchicalShapeStyle>>, ModifiedContent<ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<Modifi, MEMORY[0x24BDF46F8]);
}

uint64_t outlined retain of ModifiedContent<ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, _PaddingLayout>, _BackgroundStyleModifier<HierarchicalShapeStyle>>(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t outlined retain of ModifiedContent<ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _ForegroundStyleModifier<Color>>>, Spacer)>>, _PaddingLayout>, _BackgroundStyleModifier<HierarchicalShapeStyle>>(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t outlined release of ModifiedContent<ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _ForegroundStyleModifier<Color>>>, Spacer)>>, _PaddingLayout>, _BackgroundStyleModifier<HierarchicalShapeStyle>>(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

uint64_t outlined release of ModifiedContent<ModifiedContent<HStack<TupleView<(Spacer, AvatarBubbleView<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Color?>>>, Spacer)>>, _PaddingLayout>, _BackgroundStyleModifier<HierarchicalShapeStyle>>(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

uint64_t outlined destroy of Font.Design?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Font.Design?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t lazy protocol witness table accessor for type Circle and conformance Circle()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Circle and conformance Circle;
  if (!lazy protocol witness table cache variable for type Circle and conformance Circle)
  {
    result = MEMORY[0x242630878](MEMORY[0x24BDF4438], MEMORY[0x24BDF4460]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Circle and conformance Circle);
  }
  return result;
}

double _s7SwiftUI15ModifiedContentVy14GeoUIFramework11AvatarBadgeVAA13_OffsetEffectVGSgWOi0_(uint64_t a1)
{
  double result;

  *(_QWORD *)(a1 + 128) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t outlined init with take of ModifiedContent<AvatarBadge, _OffsetEffect>?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<AvatarBadge, _OffsetEffect>?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined copy of ModifiedContent<AvatarBadge, _OffsetEffect>?(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  if (a4)
  {
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<_ShapeView<BubbleShape, Color>, _FrameLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<_ShapeView<BubbleShape, Color>, _FrameLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<_ShapeView<BubbleShape, Color>, _FrameLayout> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<_ShapeView<BubbleShape, Color>, _FrameLayout>);
    v2[0] = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type _ShapeView<BubbleShape, Color> and conformance _ShapeView<A, B>, &demangling cache variable for type metadata for _ShapeView<BubbleShape, Color>, MEMORY[0x24BDEB350]);
    v2[1] = MEMORY[0x24BDEBED8];
    result = MEMORY[0x242630878](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<_ShapeView<BubbleShape, Color>, _FrameLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<AvatarBadge, _OffsetEffect>? and conformance <A> A?()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = lazy protocol witness table cache variable for type ModifiedContent<AvatarBadge, _OffsetEffect>? and conformance <A> A?;
  if (!lazy protocol witness table cache variable for type ModifiedContent<AvatarBadge, _OffsetEffect>? and conformance <A> A?)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<AvatarBadge, _OffsetEffect>?);
    v2 = lazy protocol witness table accessor for type ModifiedContent<AvatarBadge, _OffsetEffect> and conformance <> ModifiedContent<A, B>();
    result = MEMORY[0x242630878](MEMORY[0x24BDF5580], v1, &v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<AvatarBadge, _OffsetEffect>? and conformance <A> A?);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<AvatarBadge, _OffsetEffect> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<AvatarBadge, _OffsetEffect> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<AvatarBadge, _OffsetEffect> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<AvatarBadge, _OffsetEffect>);
    v2[0] = lazy protocol witness table accessor for type AvatarBadge and conformance AvatarBadge();
    v2[1] = MEMORY[0x24BDEC440];
    result = MEMORY[0x242630878](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<AvatarBadge, _OffsetEffect> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AvatarBadge and conformance AvatarBadge()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AvatarBadge and conformance AvatarBadge;
  if (!lazy protocol witness table cache variable for type AvatarBadge and conformance AvatarBadge)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for AvatarBadge, &type metadata for AvatarBadge);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AvatarBadge and conformance AvatarBadge);
  }
  return result;
}

_QWORD *outlined retain of ModifiedContent<AvatarBadge, _OffsetEffect>?(_QWORD *a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16]);
  return a1;
}

uint64_t outlined consume of ModifiedContent<AvatarBadge, _OffsetEffect>?(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  if (a4)
  {
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2426307F4](a1, v6, a5);
}

GeoUIFramework::BubbleShape __swiftcall BubbleShape.init(withTail:)(Swift::Bool withTail)
{
  return (GeoUIFramework::BubbleShape)withTail;
}

uint64_t BubbleShape.withTail.getter(char a1)
{
  return a1 & 1;
}

uint64_t BubbleShape.withTail.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*BubbleShape.withTail.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

void *BubbleShape.tailHeightRatio.unsafeMutableAddressor()
{
  return &static BubbleShape.tailHeightRatio;
}

double static BubbleShape.tailHeightRatio.getter()
{
  return 0.12;
}

uint64_t BubbleShape.path(in:)@<X0>(char a1@<W0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  double Width;
  double Height;
  _OWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t result;
  _OWORD v21[2];
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  CGAffineTransform v28;
  _OWORD v29[2];
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE v37[40];
  CGRect v38;
  CGRect v39;

  Path.init()();
  if ((a1 & 1) != 0)
  {
    v31 = 0x3FF0000000000000;
    v32 = 0;
    v33 = 0;
    v34 = 0x3FF0000000000000;
    v35 = 0;
    v36 = 0;
    Path.addArc(center:radius:startAngle:endAngle:clockwise:transform:)();
    Path.addCurve(to:control1:control2:)((CGPoint)__PAIR128__(0x3FF1559B3D07C84BLL, 0x3FE114E3BCD35A86), (CGPoint)__PAIR128__(1.0, 0x3FE34F0D844D013BLL), (CGPoint)__PAIR128__(0x3FF074538EF34D6ALL, 0x3FE229C779A6B50BLL));
    Path.addCurve(to:control1:control2:)((CGPoint)__PAIR128__(0x3FF1EB851EB851ECLL, 0.5), (CGPoint)__PAIR128__(0x3FF190FF97247454, 0x3FE0CBFB15B573EBLL), (CGPoint)__PAIR128__(0x3FF1EB851EB851ECLL, 0x3FE07AE147AE147BLL));
    Path.addCurve(to:control1:control2:)((CGPoint)__PAIR128__(0x3FF15532617C1BDALL, 0x3FDDD5BAB21815A0), (CGPoint)__PAIR128__(0x3FF1EB851EB851ECLL, 0x3FDF0A3D70A3D70ALL), (CGPoint)__PAIR128__(0x3FF190FF97247454, 0x3FDE6809D495182BLL));
    Path.addCurve(to:control1:control2:)((CGPoint)__PAIR128__(0x3FEF1758E219652CLL, 0x3FD554C985F06F69), (CGPoint)__PAIR128__(0x3FF073EAB367A0F9, 0x3FDBAACD9E83E426), (CGPoint)__PAIR128__(1.0, 0x3FD9604189374BC7));
    Path.closeSubpath()();
    v38.origin.x = a3;
    v38.origin.y = a4;
    v38.size.width = a5;
    v38.size.height = a6;
    Width = CGRectGetWidth(v38);
    v39.origin.x = a3;
    v39.origin.y = a4;
    v39.size.width = a5;
    v39.size.height = a6;
    Height = CGRectGetHeight(v39);
    if (Height >= Width)
      Height = Width;
    CGAffineTransformMakeScale(&v28, Height, Height);
    v29[0] = v21[0];
    v29[1] = v21[1];
    v30 = v22;
    v14 = v29;
    outlined init with take of Path.Storage((uint64_t)v29, (uint64_t)v37);
    outlined release of Path((uint64_t)v37, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of Path.Storage);
    Path.applying(_:)();
    v15 = v23;
    v16 = v24;
    v17 = v25;
    v18 = v26;
    v19 = v27;
    outlined release of Path((uint64_t)v29, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of Path.Storage);
  }
  else
  {
    Circle.path(in:)();
    v15 = v31;
    v16 = v32;
    v17 = v33;
    v18 = v34;
    v14 = v21;
    v19 = v35;
  }
  result = outlined release of Path((uint64_t)v14, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of Path.Storage);
  *(_QWORD *)a2 = v15;
  *(_QWORD *)(a2 + 8) = v16;
  *(_QWORD *)(a2 + 16) = v17;
  *(_QWORD *)(a2 + 24) = v18;
  *(_BYTE *)(a2 + 32) = v19;
  return result;
}

uint64_t outlined consume of Path.Storage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  uint64_t result;

  if (a5 - 2 <= 3)
    return swift_release();
  return result;
}

uint64_t outlined init with take of Path.Storage(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BDF1B20] - 8) + 32))(a2, a1);
  return a2;
}

uint64_t outlined release of Path(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(unsigned __int8 *)(a1 + 32));
  return a1;
}

uint64_t outlined copy of Path.Storage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  uint64_t result;

  if (a5 - 2 <= 3)
    return swift_retain();
  return result;
}

GeoUIFramework::BubbleShape __swiftcall BubbleShape.init()()
{
  return (GeoUIFramework::BubbleShape)1;
}

uint64_t default argument 0 of BubbleShape.init(withTail:)()
{
  return 1;
}

double protocol witness for Shape.path(in:) in conformance BubbleShape@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  char *v5;
  double result;
  __int128 v8;
  _OWORD v9[2];
  char v10;

  BubbleShape.path(in:)(*v5, (uint64_t)v9, a2, a3, a4, a5);
  result = *(double *)v9;
  v8 = v9[1];
  *(_OWORD *)a1 = v9[0];
  *(_OWORD *)(a1 + 16) = v8;
  *(_BYTE *)(a1 + 32) = v10;
  return result;
}

uint64_t protocol witness for Shape.sizeThatFits(_:) in conformance BubbleShape()
{
  return Shape.sizeThatFits(_:)();
}

void (*protocol witness for Animatable.animatableData.modify in conformance BubbleShape(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = Animatable<>.animatableData.modify();
  return protocol witness for Animatable.animatableData.modify in conformance BubbleShape;
}

void protocol witness for Animatable.animatableData.modify in conformance BubbleShape(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t protocol witness for static View._makeView(view:inputs:) in conformance BubbleShape()
{
  lazy protocol witness table accessor for type BubbleShape and conformance BubbleShape();
  return static Shape._makeView(view:inputs:)();
}

uint64_t protocol witness for static View._makeViewList(view:inputs:) in conformance BubbleShape()
{
  lazy protocol witness table accessor for type BubbleShape and conformance BubbleShape();
  return static Shape._makeViewList(view:inputs:)();
}

uint64_t protocol witness for View.body.getter in conformance BubbleShape()
{
  lazy protocol witness table accessor for type BubbleShape and conformance BubbleShape();
  return Shape.body.getter();
}

void *static BubbleShape_PreviewProvider.previews.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  _OWORD v4[16];
  _BYTE __src[263];

  v2 = static HorizontalAlignment.center.getter();
  closure #1 in static BubbleShape_PreviewProvider.previews.getter(v4);
  *(_OWORD *)&__src[199] = v4[12];
  *(_OWORD *)&__src[215] = v4[13];
  *(_OWORD *)&__src[231] = v4[14];
  *(_OWORD *)&__src[247] = v4[15];
  *(_OWORD *)&__src[135] = v4[8];
  *(_OWORD *)&__src[151] = v4[9];
  *(_OWORD *)&__src[167] = v4[10];
  *(_OWORD *)&__src[183] = v4[11];
  *(_OWORD *)&__src[71] = v4[4];
  *(_OWORD *)&__src[87] = v4[5];
  *(_OWORD *)&__src[103] = v4[6];
  *(_OWORD *)&__src[119] = v4[7];
  *(_OWORD *)&__src[7] = v4[0];
  *(_OWORD *)&__src[23] = v4[1];
  *(_OWORD *)&__src[39] = v4[2];
  *(_OWORD *)&__src[55] = v4[3];
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  return memcpy((void *)(a1 + 17), __src, 0x107uLL);
}

uint64_t closure #1 in static BubbleShape_PreviewProvider.previews.getter@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  char v36;
  __int128 v37;
  _OWORD v38[3];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _OWORD v44[3];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[8];
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  char v77;
  __int128 v78;
  char v79[8];
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  __int16 v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  uint64_t v89;
  char v90;
  __int128 v91;

  v21 = static Color.red.getter();
  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
  v2 = static Alignment.center.getter();
  v4 = v3;
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  v20 = static Color.red.getter();
  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
  v5 = static Alignment.center.getter();
  v19 = v6;
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  LOBYTE(v38[0]) = 1;
  *((_QWORD *)&v38[0] + 1) = v22;
  v38[1] = v23;
  v38[2] = v24;
  *(_QWORD *)&v39 = v21;
  WORD4(v39) = 256;
  *(_QWORD *)&v40 = v2;
  *((_QWORD *)&v40 + 1) = v4;
  *(_QWORD *)&v41 = v25;
  BYTE8(v41) = v26;
  *(_QWORD *)&v42 = v27;
  BYTE8(v42) = v28;
  v43 = v29;
  LOBYTE(v44[0]) = 0;
  *((_QWORD *)&v44[0] + 1) = v30;
  v44[1] = v31;
  v44[2] = v32;
  *(_QWORD *)&v45 = v20;
  WORD4(v45) = 256;
  *(_QWORD *)&v46 = v5;
  *((_QWORD *)&v46 + 1) = v19;
  *(_QWORD *)&v47 = v33;
  BYTE8(v47) = v34;
  *(_QWORD *)&v48 = v35;
  BYTE8(v48) = v36;
  v49 = v37;
  v54 = v40;
  v55 = v41;
  v56 = v42;
  v57 = v29;
  v50 = v38[0];
  v51 = v23;
  v52 = v24;
  v53 = v39;
  v60 = v32;
  v61 = v45;
  v58 = v44[0];
  v59 = v31;
  v64 = v48;
  v65 = v37;
  v62 = v46;
  v63 = v47;
  v7 = v38[0];
  v8 = v39;
  a1[2] = v24;
  a1[3] = v8;
  *a1 = v7;
  a1[1] = v23;
  v9 = v54;
  v10 = v55;
  v11 = v57;
  a1[6] = v56;
  a1[7] = v11;
  a1[4] = v9;
  a1[5] = v10;
  v12 = v58;
  v13 = v59;
  v14 = v61;
  a1[10] = v60;
  a1[11] = v14;
  a1[8] = v12;
  a1[9] = v13;
  v15 = v62;
  v16 = v63;
  v17 = v65;
  a1[14] = v64;
  a1[15] = v17;
  a1[12] = v15;
  a1[13] = v16;
  v66[0] = 0;
  v67 = v30;
  v68 = v31;
  v69 = v32;
  v70 = v20;
  v71 = 256;
  v72 = v5;
  v73 = v19;
  v74 = v33;
  v75 = v34;
  v76 = v35;
  v77 = v36;
  v78 = v37;
  outlined retain of ModifiedContent<StrokeShapeView<BubbleShape, Color, EmptyView>, _FrameLayout>((uint64_t)v38);
  outlined retain of ModifiedContent<StrokeShapeView<BubbleShape, Color, EmptyView>, _FrameLayout>((uint64_t)v44);
  outlined release of ModifiedContent<StrokeShapeView<BubbleShape, Color, EmptyView>, _FrameLayout>((uint64_t)v66);
  v79[0] = 1;
  v80 = v22;
  v81 = v23;
  v82 = v24;
  v83 = v21;
  v84 = 256;
  v85 = v2;
  v86 = v4;
  v87 = v25;
  v88 = v26;
  v89 = v27;
  v90 = v28;
  v91 = v29;
  return outlined release of ModifiedContent<StrokeShapeView<BubbleShape, Color, EmptyView>, _FrameLayout>((uint64_t)v79);
}

double static BubbleShape_PreviewProvider.shape(withTail:)@<D0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v4 = static Color.red.getter();
  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
  v5 = static Alignment.center.getter();
  v7 = v6;
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  *(_BYTE *)a2 = a1;
  *(_QWORD *)(a2 + 8) = v9;
  *(_QWORD *)(a2 + 16) = v10;
  *(_QWORD *)(a2 + 24) = v11;
  *(_QWORD *)(a2 + 32) = v12;
  *(_QWORD *)(a2 + 40) = v13;
  *(_QWORD *)(a2 + 48) = v4;
  *(_WORD *)(a2 + 56) = 256;
  *(_QWORD *)(a2 + 64) = v5;
  *(_QWORD *)(a2 + 72) = v7;
  *(_OWORD *)(a2 + 80) = v14;
  *(_OWORD *)(a2 + 96) = v15;
  result = *(double *)&v16;
  *(_OWORD *)(a2 + 112) = v16;
  return result;
}

unint64_t lazy protocol witness table accessor for type BubbleShape and conformance BubbleShape()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type BubbleShape and conformance BubbleShape;
  if (!lazy protocol witness table cache variable for type BubbleShape and conformance BubbleShape)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for BubbleShape, &type metadata for BubbleShape);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BubbleShape and conformance BubbleShape);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type BubbleShape and conformance BubbleShape;
  if (!lazy protocol witness table cache variable for type BubbleShape and conformance BubbleShape)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for BubbleShape, &type metadata for BubbleShape);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BubbleShape and conformance BubbleShape);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type BubbleShape and conformance BubbleShape;
  if (!lazy protocol witness table cache variable for type BubbleShape and conformance BubbleShape)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for BubbleShape, &type metadata for BubbleShape);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BubbleShape and conformance BubbleShape);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type EmptyAnimatableData and conformance EmptyAnimatableData()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type EmptyAnimatableData and conformance EmptyAnimatableData;
  if (!lazy protocol witness table cache variable for type EmptyAnimatableData and conformance EmptyAnimatableData)
  {
    result = MEMORY[0x242630878](MEMORY[0x24BDEEF20], MEMORY[0x24BDEEF40]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EmptyAnimatableData and conformance EmptyAnimatableData);
  }
  return result;
}

uint64_t associated type witness table accessor for View.Body : View in BubbleShape()
{
  return lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type _ShapeView<BubbleShape, ForegroundStyle> and conformance _ShapeView<A, B>, &demangling cache variable for type metadata for _ShapeView<BubbleShape, ForegroundStyle>, MEMORY[0x24BDEB350]);
}

unint64_t lazy protocol witness table accessor for type BubbleShape_PreviewProvider and conformance BubbleShape_PreviewProvider()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type BubbleShape_PreviewProvider and conformance BubbleShape_PreviewProvider;
  if (!lazy protocol witness table cache variable for type BubbleShape_PreviewProvider and conformance BubbleShape_PreviewProvider)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for BubbleShape_PreviewProvider, &type metadata for BubbleShape_PreviewProvider);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BubbleShape_PreviewProvider and conformance BubbleShape_PreviewProvider);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type BubbleShape_PreviewProvider and conformance BubbleShape_PreviewProvider;
  if (!lazy protocol witness table cache variable for type BubbleShape_PreviewProvider and conformance BubbleShape_PreviewProvider)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for BubbleShape_PreviewProvider, &type metadata for BubbleShape_PreviewProvider);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BubbleShape_PreviewProvider and conformance BubbleShape_PreviewProvider);
  }
  return result;
}

uint64_t associated type witness table accessor for PreviewProvider.Previews : View in BubbleShape_PreviewProvider()
{
  return swift_getOpaqueTypeConformance2();
}

void *protocol witness for static PreviewProvider.previews.getter in conformance BubbleShape_PreviewProvider@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  _OWORD v4[16];
  _BYTE __src[263];

  v2 = static HorizontalAlignment.center.getter();
  closure #1 in static BubbleShape_PreviewProvider.previews.getter(v4);
  *(_OWORD *)&__src[199] = v4[12];
  *(_OWORD *)&__src[215] = v4[13];
  *(_OWORD *)&__src[231] = v4[14];
  *(_OWORD *)&__src[247] = v4[15];
  *(_OWORD *)&__src[135] = v4[8];
  *(_OWORD *)&__src[151] = v4[9];
  *(_OWORD *)&__src[167] = v4[10];
  *(_OWORD *)&__src[183] = v4[11];
  *(_OWORD *)&__src[71] = v4[4];
  *(_OWORD *)&__src[87] = v4[5];
  *(_OWORD *)&__src[103] = v4[6];
  *(_OWORD *)&__src[119] = v4[7];
  *(_OWORD *)&__src[7] = v4[0];
  *(_OWORD *)&__src[23] = v4[1];
  *(_OWORD *)&__src[39] = v4[2];
  *(_OWORD *)&__src[55] = v4[3];
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  return memcpy((void *)(a1 + 17), __src, 0x107uLL);
}

uint64_t protocol witness for static _PreviewProvider._previews.getter in conformance BubbleShape_PreviewProvider()
{
  lazy protocol witness table accessor for type BubbleShape_PreviewProvider and conformance BubbleShape_PreviewProvider();
  return static PreviewProvider._previews.getter();
}

uint64_t protocol witness for static _PreviewProvider._platform.getter in conformance BubbleShape_PreviewProvider()
{
  lazy protocol witness table accessor for type BubbleShape_PreviewProvider and conformance BubbleShape_PreviewProvider();
  return static PreviewProvider._platform.getter();
}

uint64_t getEnumTagSinglePayload for BubbleShape(unsigned __int8 *a1, unsigned int a2)
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
  v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for BubbleShape(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23CC96750 + 4 * byte_23CCA4CD5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23CC96784 + 4 * byte_23CCA4CD0[v4]))();
}

uint64_t sub_23CC96784(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23CC9678C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23CC96794);
  return result;
}

uint64_t sub_23CC967A0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23CC967A8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23CC967AC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23CC967B4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BubbleShape()
{
  return &type metadata for BubbleShape;
}

ValueMetadata *type metadata accessor for BubbleShape_PreviewProvider()
{
  return &type metadata for BubbleShape_PreviewProvider;
}

uint64_t sub_23CC967E0()
{
  return lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type VStack<TupleView<(ModifiedContent<StrokeShapeView<BubbleShape, Color, EmptyView>, _FrameLayout>, ModifiedContent<StrokeShapeView<BubbleShape, Color, EmptyView>, _FrameLayout>)>> and conformance VStack<A>, &demangling cache variable for type metadata for VStack<TupleView<(ModifiedContent<StrokeShapeView<BubbleShape, Color, EmptyView>, _FrameLayout>, ModifiedContent<StrokeShapeView<BubbleShape, Color, EmptyView>, _FrameLayout>)>>, MEMORY[0x24BDF46F8]);
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<StrokeShapeView<BubbleShape, Color, EmptyView>, _FrameLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<StrokeShapeView<BubbleShape, Color, EmptyView>, _FrameLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<StrokeShapeView<BubbleShape, Color, EmptyView>, _FrameLayout> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<StrokeShapeView<BubbleShape, Color, EmptyView>, _FrameLayout>);
    v2[0] = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type StrokeShapeView<BubbleShape, Color, EmptyView> and conformance StrokeShapeView<A, B, C>, &demangling cache variable for type metadata for StrokeShapeView<BubbleShape, Color, EmptyView>, MEMORY[0x24BDED4F8]);
    v2[1] = MEMORY[0x24BDEBED8];
    result = MEMORY[0x242630878](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<StrokeShapeView<BubbleShape, Color, EmptyView>, _FrameLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t outlined retain of ModifiedContent<StrokeShapeView<BubbleShape, Color, EmptyView>, _FrameLayout>(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t outlined release of ModifiedContent<StrokeShapeView<BubbleShape, Color, EmptyView>, _FrameLayout>(uint64_t a1)
{
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

double StandardMapData.center.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

uint64_t StandardMapData.makePunchoutURL(idiom:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  __int128 v16;

  v3 = type metadata accessor for CharacterSet();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + 8);
  v14 = *(_QWORD *)v1;
  v15 = v7;
  v16 = *(_OWORD *)(v1 + 16);
  v8 = VRXIdiom.isWatchOS.getter();
  v14 = StandardMapData.makePunchoutURI(includeLabel:)((v8 & 1) == 0);
  v15 = v9;
  static CharacterSet.urlQueryAllowed.getter();
  lazy protocol witness table accessor for type String and conformance String();
  StringProtocol.addingPercentEncoding(withAllowedCharacters:)();
  v11 = v10;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_bridgeObjectRelease();
  if (v11)
  {
    URL.init(string:)();
    return swift_bridgeObjectRelease();
  }
  else
  {
    v13 = type metadata accessor for URL();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(a1, 1, 1, v13);
  }
}

uint64_t StandardMapData.makeAppPunchout(idiom:)()
{
  char v0;

  v0 = VRXIdiom.isWatchOS.getter();
  StandardMapData.makePunchoutURI(includeLabel:)((v0 & 1) == 0);
  if (one-time initialization token for appName != -1)
    swift_once();
  swift_bridgeObjectRetain();
  return AppPunchout.init(punchOutUri:bundleId:appDisplayName:)();
}

GeoUIFramework::StandardMapData __swiftcall StandardMapData.init(label:latitude:longitude:)(Swift::String label, Swift::Double latitude, Swift::Double longitude)
{
  uint64_t v3;
  GeoUIFramework::StandardMapData result;

  *(Swift::String *)v3 = label;
  *(Swift::Double *)(v3 + 16) = latitude;
  *(Swift::Double *)(v3 + 24) = longitude;
  result.label = label;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

id static StandardMapData.blueTint.getter()
{
  id v0;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE84B30]), sel_init);
  objc_msgSend(v0, sel_setName_, 8);
  return v0;
}

uint64_t StandardMapData.label.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

double StandardMapData.latitude.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

double StandardMapData.longitude.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 24);
}

uint64_t StandardMapData.CodingKeys.stringValue.getter(char a1)
{
  return *(_QWORD *)&aLabel_0[8 * a1];
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance StandardMapData.CodingKeys()
{
  char *v0;

  return StandardMapData.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance StandardMapData.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized StandardMapData.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance StandardMapData.CodingKeys()
{
  lazy protocol witness table accessor for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance StandardMapData.CodingKeys()
{
  lazy protocol witness table accessor for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t StandardMapData.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD v8[2];
  char v9;
  char v10;
  char v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<StandardMapData.CodingKeys>);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v11 = 0;
  v6 = v8[1];
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v6)
  {
    v10 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v9 = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t StandardMapData.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  char v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<StandardMapData.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v20 = 0;
  v9 = KeyedDecodingContainer.decode(_:forKey:)();
  v11 = v10;
  v19 = 1;
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode(_:forKey:)();
  v13 = v12;
  v18 = 2;
  KeyedDecodingContainer.decode(_:forKey:)();
  v16 = v15;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *a2 = v9;
  a2[1] = v11;
  a2[2] = v13;
  a2[3] = v16;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t protocol witness for Decodable.init(from:) in conformance StandardMapData@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return StandardMapData.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance StandardMapData(_QWORD *a1)
{
  return StandardMapData.encode(to:)(a1);
}

unint64_t StandardMapData.makePunchoutURI(includeLabel:)(char a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::String v10;
  Swift::String v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v19;
  Swift::String v20;
  Swift::String v21;

  v4 = *v1;
  v3 = v1[1];
  v6 = v1[2];
  v5 = v1[3];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  v7 = swift_allocObject();
  v8 = MEMORY[0x24BEE13C8];
  *(_OWORD *)(v7 + 16) = xmmword_23CCA3820;
  v9 = MEMORY[0x24BEE1448];
  *(_QWORD *)(v7 + 56) = v8;
  *(_QWORD *)(v7 + 64) = v9;
  *(_QWORD *)(v7 + 32) = v6;
  v10._countAndFlagsBits = String.init(format:_:)();
  String.append(_:)(v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v11._countAndFlagsBits = 44;
  v11._object = (void *)0xE100000000000000;
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_23CCA3820;
  *(_QWORD *)(v12 + 56) = v8;
  *(_QWORD *)(v12 + 64) = v9;
  *(_QWORD *)(v12 + 32) = v5;
  v13 = String.init(format:_:)();
  v15 = v14;
  swift_bridgeObjectRetain();
  v16._countAndFlagsBits = v13;
  v16._object = v15;
  String.append(_:)(v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0 && (v4 || v3 != 0xE000000000000000) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    lazy protocol witness table accessor for type String and conformance String();
    v19._countAndFlagsBits = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
    String.append(_:)(v19);
    swift_bridgeObjectRelease();
    v20._countAndFlagsBits = 15729;
    v20._object = (void *)0xE200000000000000;
    String.append(_:)(v20);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v21._countAndFlagsBits = 1030515750;
    v21._object = (void *)0xE400000000000000;
    String.append(_:)(v21);
    swift_bridgeObjectRelease();
  }
  else
  {
    v17._countAndFlagsBits = 1030515750;
    v17._object = (void *)0xE400000000000000;
    String.append(_:)(v17);
  }
  swift_bridgeObjectRelease();
  return 0xD000000000000017;
}

void one-time initialization function for radius()
{
  static GeoMapViewConstants.radius = 0x4030000000000000;
}

uint64_t *GeoMapViewConstants.radius.unsafeMutableAddressor()
{
  if (one-time initialization token for radius != -1)
    swift_once();
  return &static GeoMapViewConstants.radius;
}

double static GeoMapViewConstants.radius.getter()
{
  return static GeoMapViewConstants.radius.getter(&one-time initialization token for radius, (uint64_t)&static GeoMapViewConstants.radius);
}

void one-time initialization function for frameHeight()
{
  static GeoMapViewConstants.frameHeight = 0x4063A00000000000;
}

uint64_t *GeoMapViewConstants.frameHeight.unsafeMutableAddressor()
{
  if (one-time initialization token for frameHeight != -1)
    swift_once();
  return &static GeoMapViewConstants.frameHeight;
}

double static GeoMapViewConstants.frameHeight.getter()
{
  return static GeoMapViewConstants.radius.getter(&one-time initialization token for frameHeight, (uint64_t)&static GeoMapViewConstants.frameHeight);
}

double static GeoMapViewConstants.radius.getter(_QWORD *a1, uint64_t a2)
{
  if (*a1 != -1)
    swift_once();
  return *(double *)a2;
}

double one-time initialization function for marginPadding()
{
  double result;

  result = 0.0;
  __asm { FMOV            V1.2D, #6.0 }
  static GeoMapViewConstants.marginPadding = _Q1;
  *(_OWORD *)&qword_256C229C0 = xmmword_23CCA4E90;
  return result;
}

__int128 *GeoMapViewConstants.marginPadding.unsafeMutableAddressor()
{
  if (one-time initialization token for marginPadding != -1)
    swift_once();
  return &static GeoMapViewConstants.marginPadding;
}

double static GeoMapViewConstants.marginPadding.getter()
{
  if (one-time initialization token for marginPadding != -1)
    swift_once();
  return *(double *)&static GeoMapViewConstants.marginPadding;
}

unint64_t lazy protocol witness table accessor for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys;
  if (!lazy protocol witness table cache variable for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for StandardMapData.CodingKeys, &unk_250DE2C68);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys;
  if (!lazy protocol witness table cache variable for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for StandardMapData.CodingKeys, &unk_250DE2C68);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys;
  if (!lazy protocol witness table cache variable for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for StandardMapData.CodingKeys, &unk_250DE2C68);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys;
  if (!lazy protocol witness table cache variable for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for StandardMapData.CodingKeys, &unk_250DE2C68);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys);
  }
  return result;
}

uint64_t destroy for StandardMapData()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for StandardMapData(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for StandardMapData(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

uint64_t assignWithTake for StandardMapData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for StandardMapData(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StandardMapData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for StandardMapData()
{
  return &type metadata for StandardMapData;
}

ValueMetadata *type metadata accessor for GeoMapViewConstants()
{
  return &type metadata for GeoMapViewConstants;
}

uint64_t storeEnumTagSinglePayload for StandardMapData.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23CC9766C + 4 * byte_23CCA4EA5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23CC976A0 + 4 * byte_23CCA4EA0[v4]))();
}

uint64_t sub_23CC976A0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23CC976A8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23CC976B0);
  return result;
}

uint64_t sub_23CC976BC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23CC976C4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23CC976C8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23CC976D0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for StandardMapData.CodingKeys()
{
  return &unk_250DE2C68;
}

uint64_t specialized StandardMapData.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6C6562616CLL && a2 == 0xE500000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656475746974616CLL && a2 == 0xE800000000000000
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x64757469676E6F6CLL && a2 == 0xE900000000000065)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

double RoundedRectangleCorners.topLeading.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for RoundedRectangleCorners() + 20));
}

uint64_t type metadata accessor for RoundedRectangleCorners()
{
  uint64_t result;

  result = type metadata singleton initialization cache for RoundedRectangleCorners;
  if (!type metadata singleton initialization cache for RoundedRectangleCorners)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t RoundedRectangleCorners.topLeading.setter(double a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for RoundedRectangleCorners();
  *(double *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*RoundedRectangleCorners.topLeading.modify())(_QWORD)
{
  type metadata accessor for RoundedRectangleCorners();
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

double RoundedRectangleCorners.topTrailing.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for RoundedRectangleCorners() + 24));
}

uint64_t RoundedRectangleCorners.topTrailing.setter(double a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for RoundedRectangleCorners();
  *(double *)(v1 + *(int *)(result + 24)) = a1;
  return result;
}

uint64_t (*RoundedRectangleCorners.topTrailing.modify())(_QWORD)
{
  type metadata accessor for RoundedRectangleCorners();
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

double RoundedRectangleCorners.bottomLeading.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for RoundedRectangleCorners() + 28));
}

uint64_t RoundedRectangleCorners.bottomLeading.setter(double a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for RoundedRectangleCorners();
  *(double *)(v1 + *(int *)(result + 28)) = a1;
  return result;
}

uint64_t (*RoundedRectangleCorners.bottomLeading.modify())(_QWORD)
{
  type metadata accessor for RoundedRectangleCorners();
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

double RoundedRectangleCorners.bottomTrailing.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for RoundedRectangleCorners() + 32));
}

uint64_t RoundedRectangleCorners.bottomTrailing.setter(double a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for RoundedRectangleCorners();
  *(double *)(v1 + *(int *)(result + 32)) = a1;
  return result;
}

uint64_t (*RoundedRectangleCorners.bottomTrailing.modify())(_QWORD)
{
  type metadata accessor for RoundedRectangleCorners();
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

double RoundedRectangleCorners.path(in:)@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat MaxX;
  double v44;
  unint64_t v45;
  unint64_t v46;
  CGFloat v47;
  CGFloat MaxY;
  CGFloat v49;
  double v50;
  unint64_t v51;
  unint64_t v52;
  char v53;
  double result;
  __int128 v55;
  double v56;
  double v57;
  __int128 v58;
  __int128 v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;

  v11 = type metadata accessor for LayoutDirection();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v56 - v16;
  specialized Environment.wrappedValue.getter((uint64_t)&v56 - v16);
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v15, *MEMORY[0x24BDED108], v11);
  v18 = static LayoutDirection.== infix(_:_:)();
  v19 = *(void (**)(char *, uint64_t))(v12 + 8);
  v19(v15, v11);
  v19(v17, v11);
  v20 = type metadata accessor for RoundedRectangleCorners();
  v21 = v20;
  v22 = (v18 & 1) == 0;
  if ((v18 & 1) != 0)
    v23 = 20;
  else
    v23 = 24;
  v24 = *(double *)(v5 + *(int *)(v20 + v23));
  if ((v18 & 1) != 0)
    v25 = 24;
  else
    v25 = 20;
  if ((v18 & 1) != 0)
    v26 = 28;
  else
    v26 = 32;
  if (v22)
    v27 = 28;
  else
    v27 = 32;
  v85.origin.x = a2;
  v85.origin.y = a3;
  v85.size.width = a4;
  v85.size.height = a5;
  v28 = CGRectGetWidth(v85) * 0.5;
  v86.origin.x = a2;
  v86.origin.y = a3;
  v86.size.width = a4;
  v86.size.height = a5;
  v29 = CGRectGetHeight(v86) * 0.5;
  if (v29 >= v28)
    v29 = v28;
  if (v24 < v29)
    v29 = v24;
  if (v29 < 0.0)
    v30 = 0.0;
  else
    v30 = v29;
  v31 = *(double *)(v5 + *(int *)(v21 + v25));
  v87.origin.x = a2;
  v87.origin.y = a3;
  v87.size.width = a4;
  v87.size.height = a5;
  v32 = CGRectGetWidth(v87) * 0.5;
  v88.origin.x = a2;
  v88.origin.y = a3;
  v88.size.width = a4;
  v88.size.height = a5;
  v33 = CGRectGetHeight(v88) * 0.5;
  if (v33 >= v32)
    v33 = v32;
  if (v31 < v33)
    v33 = v31;
  if (v33 < 0.0)
    v33 = 0.0;
  v56 = v33;
  v34 = *(double *)(v5 + *(int *)(v21 + v26));
  v89.origin.x = a2;
  v89.origin.y = a3;
  v89.size.width = a4;
  v89.size.height = a5;
  v35 = CGRectGetWidth(v89) * 0.5;
  v90.origin.x = a2;
  v90.origin.y = a3;
  v90.size.width = a4;
  v90.size.height = a5;
  v36 = CGRectGetHeight(v90) * 0.5;
  if (v36 >= v35)
    v36 = v35;
  if (v34 < v36)
    v36 = v34;
  if (v36 < 0.0)
    v36 = 0.0;
  v57 = v36;
  v37 = *(double *)(v5 + *(int *)(v21 + v27));
  v91.origin.x = a2;
  v91.origin.y = a3;
  v91.size.width = a4;
  v91.size.height = a5;
  v38 = CGRectGetWidth(v91) * 0.5;
  v92.origin.x = a2;
  v92.origin.y = a3;
  v92.size.width = a4;
  v92.size.height = a5;
  v39 = CGRectGetHeight(v92) * 0.5;
  if (v39 >= v38)
    v39 = v38;
  if (v37 < v39)
    v39 = v37;
  if (v39 < 0.0)
    v40 = 0.0;
  else
    v40 = v39;
  Path.init()();
  v93.origin.x = a2;
  v93.origin.y = a3;
  v93.size.width = a4;
  v93.size.height = a5;
  MinX = CGRectGetMinX(v93);
  v94.origin.x = a2;
  v94.origin.y = a3;
  v94.size.width = a4;
  v94.size.height = a5;
  MinY = CGRectGetMinY(v94);
  Path.move(to:)((CGPoint)__PAIR128__(v30 + MinY, *(unint64_t *)&MinX));
  if (v30 > 0.0)
  {
    v95.origin.x = a2;
    v95.origin.y = a3;
    v95.size.width = a4;
    v95.size.height = a5;
    CGRectGetMinX(v95);
    v96.origin.x = a2;
    v96.origin.y = a3;
    v96.size.width = a4;
    v96.size.height = a5;
    CGRectGetMinY(v96);
    v79 = 0x3FF0000000000000;
    v80 = 0;
    v81 = 0;
    v82 = 0x3FF0000000000000;
    v83 = 0;
    v84 = 0;
    Path.addArc(center:radius:startAngle:endAngle:clockwise:transform:)();
  }
  v97.origin.x = a2;
  v97.origin.y = a3;
  v97.size.width = a4;
  v97.size.height = a5;
  MaxX = CGRectGetMaxX(v97);
  v44 = v56;
  *(double *)&v45 = MaxX - v56;
  v98.origin.x = a2;
  v98.origin.y = a3;
  v98.size.width = a4;
  v98.size.height = a5;
  *(double *)&v46 = CGRectGetMinY(v98);
  Path.addLine(to:)((CGPoint)__PAIR128__(v46, v45));
  if (v44 > 0.0)
  {
    v99.origin.x = a2;
    v99.origin.y = a3;
    v99.size.width = a4;
    v99.size.height = a5;
    CGRectGetMaxX(v99);
    v100.origin.x = a2;
    v100.origin.y = a3;
    v100.size.width = a4;
    v100.size.height = a5;
    CGRectGetMinY(v100);
    v73 = 0x3FF0000000000000;
    v74 = 0;
    v75 = 0;
    v76 = 0x3FF0000000000000;
    v77 = 0;
    v78 = 0;
    Path.addArc(center:radius:startAngle:endAngle:clockwise:transform:)();
  }
  v101.origin.x = a2;
  v101.origin.y = a3;
  v101.size.width = a4;
  v101.size.height = a5;
  v47 = CGRectGetMaxX(v101);
  v102.origin.x = a2;
  v102.origin.y = a3;
  v102.size.width = a4;
  v102.size.height = a5;
  MaxY = CGRectGetMaxY(v102);
  Path.addLine(to:)((CGPoint)__PAIR128__(MaxY - v40, *(unint64_t *)&v47));
  if (v40 > 0.0)
  {
    v103.origin.x = a2;
    v103.origin.y = a3;
    v103.size.width = a4;
    v103.size.height = a5;
    CGRectGetMaxX(v103);
    v104.origin.x = a2;
    v104.origin.y = a3;
    v104.size.width = a4;
    v104.size.height = a5;
    CGRectGetMaxY(v104);
    v67 = 0x3FF0000000000000;
    v68 = 0;
    v69 = 0;
    v70 = 0x3FF0000000000000;
    v71 = 0;
    v72 = 0;
    Path.addArc(center:radius:startAngle:endAngle:clockwise:transform:)();
  }
  v105.origin.x = a2;
  v105.origin.y = a3;
  v105.size.width = a4;
  v105.size.height = a5;
  v49 = CGRectGetMinX(v105);
  v50 = v57;
  *(double *)&v51 = v57 + v49;
  v106.origin.x = a2;
  v106.origin.y = a3;
  v106.size.width = a4;
  v106.size.height = a5;
  *(double *)&v52 = CGRectGetMaxY(v106);
  Path.addLine(to:)((CGPoint)__PAIR128__(v52, v51));
  if (v50 > 0.0)
  {
    v107.origin.x = a2;
    v107.origin.y = a3;
    v107.size.width = a4;
    v107.size.height = a5;
    CGRectGetMinX(v107);
    v108.origin.x = a2;
    v108.origin.y = a3;
    v108.size.width = a4;
    v108.size.height = a5;
    CGRectGetMaxY(v108);
    v61 = 0x3FF0000000000000;
    v62 = 0;
    v63 = 0;
    v64 = 0x3FF0000000000000;
    v66 = 0;
    v65 = 0;
    Path.addArc(center:radius:startAngle:endAngle:clockwise:transform:)();
  }
  Path.closeSubpath()();
  v53 = v60;
  result = *(double *)&v58;
  v55 = v59;
  *(_OWORD *)a1 = v58;
  *(_OWORD *)(a1 + 16) = v55;
  *(_BYTE *)(a1 + 32) = v53;
  return result;
}

int *RoundedRectangleCorners.init()@<X0>(uint64_t *a1@<X8>)
{
  int *result;

  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<LayoutDirection>.Content);
  swift_storeEnumTagMultiPayload();
  result = (int *)type metadata accessor for RoundedRectangleCorners();
  *(uint64_t *)((char *)a1 + result[5]) = 0;
  *(uint64_t *)((char *)a1 + result[6]) = 0;
  *(uint64_t *)((char *)a1 + result[7]) = 0;
  *(uint64_t *)((char *)a1 + result[8]) = 0;
  return result;
}

double default argument 0 of RoundedRectangleCorners.init(topLeading:topTrailing:bottomLeading:bottomTrailing:)()
{
  return 0.0;
}

double default argument 1 of RoundedRectangleCorners.init(topLeading:topTrailing:bottomLeading:bottomTrailing:)()
{
  return 0.0;
}

double default argument 2 of RoundedRectangleCorners.init(topLeading:topTrailing:bottomLeading:bottomTrailing:)()
{
  return 0.0;
}

double default argument 3 of RoundedRectangleCorners.init(topLeading:topTrailing:bottomLeading:bottomTrailing:)()
{
  return 0.0;
}

int *RoundedRectangleCorners.init(topLeading:topTrailing:bottomLeading:bottomTrailing:)@<X0>(uint64_t *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  int *result;

  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<LayoutDirection>.Content);
  swift_storeEnumTagMultiPayload();
  result = (int *)type metadata accessor for RoundedRectangleCorners();
  *(double *)((char *)a1 + result[5]) = a2;
  *(double *)((char *)a1 + result[6]) = a3;
  *(double *)((char *)a1 + result[7]) = a4;
  *(double *)((char *)a1 + result[8]) = a5;
  return result;
}

uint64_t key path getter for EnvironmentValues.layoutDirection : EnvironmentValues()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t key path setter for EnvironmentValues.layoutDirection : EnvironmentValues(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = type metadata accessor for LayoutDirection();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return EnvironmentValues.layoutDirection.setter();
}

double protocol witness for Shape.path(in:) in conformance RoundedRectangleCorners@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  double result;
  __int128 v7;
  _OWORD v8[2];
  char v9;

  RoundedRectangleCorners.path(in:)((uint64_t)v8, a2, a3, a4, a5);
  result = *(double *)v8;
  v7 = v8[1];
  *(_OWORD *)a1 = v8[0];
  *(_OWORD *)(a1 + 16) = v7;
  *(_BYTE *)(a1 + 32) = v9;
  return result;
}

uint64_t protocol witness for static View._makeView(view:inputs:) in conformance RoundedRectangleCorners()
{
  lazy protocol witness table accessor for type RoundedRectangleCorners and conformance RoundedRectangleCorners(&lazy protocol witness table cache variable for type RoundedRectangleCorners and conformance RoundedRectangleCorners, (uint64_t)&protocol conformance descriptor for RoundedRectangleCorners);
  return static Shape._makeView(view:inputs:)();
}

uint64_t protocol witness for static View._makeViewList(view:inputs:) in conformance RoundedRectangleCorners()
{
  lazy protocol witness table accessor for type RoundedRectangleCorners and conformance RoundedRectangleCorners(&lazy protocol witness table cache variable for type RoundedRectangleCorners and conformance RoundedRectangleCorners, (uint64_t)&protocol conformance descriptor for RoundedRectangleCorners);
  return static Shape._makeViewList(view:inputs:)();
}

uint64_t protocol witness for View.body.getter in conformance RoundedRectangleCorners()
{
  lazy protocol witness table accessor for type RoundedRectangleCorners and conformance RoundedRectangleCorners(&lazy protocol witness table cache variable for type RoundedRectangleCorners and conformance RoundedRectangleCorners, (uint64_t)&protocol conformance descriptor for RoundedRectangleCorners);
  return Shape.body.getter();
}

uint64_t sub_23CC983AC()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t base witness table accessor for Animatable in RoundedRectangleCorners()
{
  return lazy protocol witness table accessor for type RoundedRectangleCorners and conformance RoundedRectangleCorners(&lazy protocol witness table cache variable for type RoundedRectangleCorners and conformance RoundedRectangleCorners, (uint64_t)&protocol conformance descriptor for RoundedRectangleCorners);
}

uint64_t base witness table accessor for View in RoundedRectangleCorners()
{
  return lazy protocol witness table accessor for type RoundedRectangleCorners and conformance RoundedRectangleCorners(&lazy protocol witness table cache variable for type RoundedRectangleCorners and conformance RoundedRectangleCorners, (uint64_t)&protocol conformance descriptor for RoundedRectangleCorners);
}

unint64_t lazy protocol witness table accessor for type _ShapeView<RoundedRectangleCorners, ForegroundStyle> and conformance _ShapeView<A, B>()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type _ShapeView<RoundedRectangleCorners, ForegroundStyle> and conformance _ShapeView<A, B>;
  if (!lazy protocol witness table cache variable for type _ShapeView<RoundedRectangleCorners, ForegroundStyle> and conformance _ShapeView<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for _ShapeView<RoundedRectangleCorners, ForegroundStyle>);
    result = MEMORY[0x242630878](MEMORY[0x24BDEB350], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _ShapeView<RoundedRectangleCorners, ForegroundStyle> and conformance _ShapeView<A, B>);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for RoundedRectangleCorners(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<LayoutDirection>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = type metadata accessor for LayoutDirection();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    v10 = a3[8];
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    *(uint64_t *)((char *)a1 + v10) = *(uint64_t *)((char *)a2 + v10);
  }
  return a1;
}

uint64_t destroy for RoundedRectangleCorners(uint64_t a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<LayoutDirection>.Content);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v2 = type metadata accessor for LayoutDirection();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

_QWORD *initializeWithCopy for RoundedRectangleCorners(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<LayoutDirection>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = type metadata accessor for LayoutDirection();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = a3[6];
  *(_QWORD *)((char *)a1 + a3[5]) = *(_QWORD *)((char *)a2 + a3[5]);
  *(_QWORD *)((char *)a1 + v7) = *(_QWORD *)((char *)a2 + v7);
  v8 = a3[8];
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  *(_QWORD *)((char *)a1 + v8) = *(_QWORD *)((char *)a2 + v8);
  return a1;
}

_QWORD *assignWithCopy for RoundedRectangleCorners(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    outlined destroy of Environment<LayoutDirection>.Content((uint64_t)a1);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<LayoutDirection>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = type metadata accessor for LayoutDirection();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(_QWORD *)((char *)a1 + a3[5]) = *(_QWORD *)((char *)a2 + a3[5]);
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  return a1;
}

uint64_t outlined destroy of Environment<LayoutDirection>.Content(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<LayoutDirection>.Content);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *initializeWithTake for RoundedRectangleCorners(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<LayoutDirection>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = type metadata accessor for LayoutDirection();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[6];
  *(_QWORD *)&a1[a3[5]] = *(_QWORD *)&a2[a3[5]];
  *(_QWORD *)&a1[v8] = *(_QWORD *)&a2[v8];
  v9 = a3[8];
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  *(_QWORD *)&a1[v9] = *(_QWORD *)&a2[v9];
  return a1;
}

char *assignWithTake for RoundedRectangleCorners(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 != a2)
  {
    outlined destroy of Environment<LayoutDirection>.Content((uint64_t)a1);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<LayoutDirection>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = type metadata accessor for LayoutDirection();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = a3[6];
  *(_QWORD *)&a1[a3[5]] = *(_QWORD *)&a2[a3[5]];
  *(_QWORD *)&a1[v8] = *(_QWORD *)&a2[v8];
  v9 = a3[8];
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  *(_QWORD *)&a1[v9] = *(_QWORD *)&a2[v9];
  return a1;
}

uint64_t getEnumTagSinglePayload for RoundedRectangleCorners()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CC9894C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<LayoutDirection>);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for RoundedRectangleCorners()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CC98998(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<LayoutDirection>);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

void type metadata completion function for RoundedRectangleCorners()
{
  unint64_t v0;

  type metadata accessor for Environment<LayoutDirection>.Content();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void type metadata accessor for Environment<LayoutDirection>.Content()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for Environment<LayoutDirection>.Content)
  {
    type metadata accessor for LayoutDirection();
    v0 = type metadata accessor for Environment.Content();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Environment<LayoutDirection>.Content);
  }
}

uint64_t lazy protocol witness table accessor for type RoundedRectangleCorners and conformance RoundedRectangleCorners(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for RoundedRectangleCorners();
    result = MEMORY[0x242630878](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t SmartMinimumScaleFactorModifier.smallerStyle.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for Font.TextStyle();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t SmartMinimumScaleFactorModifier.smallerStyle.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for Font.TextStyle();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*SmartMinimumScaleFactorModifier.smallerStyle.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

uint64_t SmartMinimumScaleFactorModifier.largerStyle.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for SmartMinimumScaleFactorModifier() + 20);
  v4 = type metadata accessor for Font.TextStyle();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for SmartMinimumScaleFactorModifier()
{
  uint64_t result;

  result = type metadata singleton initialization cache for SmartMinimumScaleFactorModifier;
  if (!type metadata singleton initialization cache for SmartMinimumScaleFactorModifier)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t SmartMinimumScaleFactorModifier.largerStyle.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for SmartMinimumScaleFactorModifier() + 20);
  v4 = type metadata accessor for Font.TextStyle();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*SmartMinimumScaleFactorModifier.largerStyle.modify())(_QWORD)
{
  type metadata accessor for SmartMinimumScaleFactorModifier();
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

double SmartMinimumScaleFactorModifier.scaleFactor.getter()
{
  void *v0;
  id v1;
  id v2;
  double v3;
  double v4;
  id v5;
  id v6;
  double v7;
  double v8;

  v0 = (void *)objc_opt_self();
  v1 = Font.TextStyle.platformFontTextStyle.getter();
  v2 = objc_msgSend(v0, sel_preferredFontForTextStyle_, v1);

  objc_msgSend(v2, sel_pointSize);
  v4 = v3;

  type metadata accessor for SmartMinimumScaleFactorModifier();
  v5 = Font.TextStyle.platformFontTextStyle.getter();
  v6 = objc_msgSend(v0, sel_preferredFontForTextStyle_, v5);

  objc_msgSend(v6, sel_pointSize);
  v8 = v7;

  return v4 / v8;
}

double Font.TextStyle.pointSize.getter()
{
  void *v0;
  id v1;
  id v2;
  double v3;
  double v4;

  v0 = (void *)objc_opt_self();
  v1 = Font.TextStyle.platformFontTextStyle.getter();
  v2 = objc_msgSend(v0, sel_preferredFontForTextStyle_, v1);

  objc_msgSend(v2, sel_pointSize);
  v4 = v3;

  return v4;
}

uint64_t SmartMinimumScaleFactorModifier.body(content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  void *v4;
  id v5;
  id v6;
  double v7;
  double v8;
  id v9;
  id v10;
  double v11;
  double v12;
  uint64_t KeyPath;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;

  v4 = (void *)objc_opt_self();
  v5 = Font.TextStyle.platformFontTextStyle.getter();
  v6 = objc_msgSend(v4, sel_preferredFontForTextStyle_, v5);

  objc_msgSend(v6, sel_pointSize);
  v8 = v7;

  type metadata accessor for SmartMinimumScaleFactorModifier();
  v9 = Font.TextStyle.platformFontTextStyle.getter();
  v10 = objc_msgSend(v4, sel_preferredFontForTextStyle_, v9);

  objc_msgSend(v10, sel_pointSize);
  v12 = v11;

  KeyPath = swift_getKeyPath();
  v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ViewModifier_Content<SmartMinimumScaleFactorModifier>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(a2, a1, v14);
  result = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<SmartMinimumScaleFactorModifier>, _EnvironmentKeyWritingModifier<CGFloat>>);
  v16 = a2 + *(int *)(result + 36);
  *(_QWORD *)v16 = KeyPath;
  *(double *)(v16 + 8) = v8 / v12;
  return result;
}

uint64_t SmartMinimumScaleFactorModifier.init(smallerStyle:largerStyle:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t *v9;

  v6 = type metadata accessor for Font.TextStyle();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a3, a1, v6);
  v8 = type metadata accessor for SmartMinimumScaleFactorModifier();
  v7(a3 + *(int *)(v8 + 20), a2, v6);
  v9 = (uint64_t *)(a3 + *(int *)(v8 + 24));
  *v9 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
  return swift_storeEnumTagMultiPayload();
}

uint64_t key path setter for EnvironmentValues.dynamicTypeSize : EnvironmentValues(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = type metadata accessor for DynamicTypeSize();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return EnvironmentValues.dynamicTypeSize.setter();
}

uint64_t View.smartMinimumScaleFactor(from:relativeTo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t);
  uint64_t *v13;
  uint64_t v15;

  v8 = type metadata accessor for SmartMinimumScaleFactorModifier();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Font.TextStyle();
  v12 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  v12(v10, a1, v11);
  v12(&v10[*(int *)(v8 + 20)], a2, v11);
  v13 = (uint64_t *)&v10[*(int *)(v8 + 24)];
  *v13 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
  swift_storeEnumTagMultiPayload();
  MEMORY[0x24262FFD8](v10, a3, v8, a4);
  return outlined destroy of SmartMinimumScaleFactorModifier((uint64_t)v10);
}

id Font.TextStyle.platformFontTextStyle.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  id *v7;
  void (*v9)(char *, uint64_t);
  id v10;
  uint64_t v11;

  v1 = v0;
  v2 = type metadata accessor for Font.TextStyle();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == *MEMORY[0x24BDF1850])
  {
    v7 = (id *)MEMORY[0x24BEBE210];
    return *v7;
  }
  if (v6 == *MEMORY[0x24BDF1888])
  {
    v7 = (id *)MEMORY[0x24BEBE240];
    return *v7;
  }
  if (v6 == *MEMORY[0x24BDF1898])
  {
    v7 = (id *)MEMORY[0x24BEBE248];
    return *v7;
  }
  if (v6 == *MEMORY[0x24BDF18A0])
  {
    v7 = (id *)MEMORY[0x24BEBE250];
    return *v7;
  }
  if (v6 == *MEMORY[0x24BDF18F8])
  {
    v7 = (id *)MEMORY[0x24BEBE200];
    return *v7;
  }
  if (v6 == *MEMORY[0x24BDF1858])
  {
    v7 = (id *)MEMORY[0x24BEBE220];
    return *v7;
  }
  if (v6 == *MEMORY[0x24BDF1870])
  {
    v7 = (id *)MEMORY[0x24BEBE1D0];
    return *v7;
  }
  if (v6 == *MEMORY[0x24BDF18B8])
  {
    v7 = (id *)MEMORY[0x24BEBE1D8];
    return *v7;
  }
  if (v6 == *MEMORY[0x24BDF18E0])
  {
    v7 = (id *)MEMORY[0x24BEBE1F0];
    return *v7;
  }
  if (v6 == *MEMORY[0x24BDF18C0])
  {
    v7 = (id *)MEMORY[0x24BEBE1E0];
    return *v7;
  }
  if (v6 == *MEMORY[0x24BDF18D0])
  {
    v7 = (id *)MEMORY[0x24BEBE1E8];
    return *v7;
  }
  v9 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10 = (id)*MEMORY[0x24BEBE1D0];
  v9(v5, v2);
  return v10;
}

uint64_t sub_23CC9933C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = EnvironmentValues.minimumScaleFactor.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_23CC99364()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

uint64_t sub_23CC99388()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t outlined destroy of SmartMinimumScaleFactorModifier(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SmartMinimumScaleFactorModifier();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t associated type witness table accessor for ViewModifier.Body : View in SmartMinimumScaleFactorModifier()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for SmartMinimumScaleFactorModifier(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for Font.TextStyle();
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
    v9 = *(int *)(a3 + 24);
    v10 = (uint64_t *)((char *)a1 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for SmartMinimumScaleFactorModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;

  v4 = type metadata accessor for Font.TextStyle();
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + *(int *)(a2 + 20), v4);
  v6 = a1 + *(int *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v7 = type metadata accessor for DynamicTypeSize();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

uint64_t initializeWithCopy for SmartMinimumScaleFactorModifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;

  v6 = type metadata accessor for Font.TextStyle();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  v8 = *(int *)(a3 + 24);
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  }
  else
  {
    *v9 = *v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for SmartMinimumScaleFactorModifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;

  v6 = type metadata accessor for Font.TextStyle();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  if (a1 != a2)
  {
    v8 = *(int *)(a3 + 24);
    v9 = (_QWORD *)(a1 + v8);
    v10 = (_QWORD *)(a2 + v8);
    outlined destroy of Environment<DynamicTypeSize>.Content(a1 + v8);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v11 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      *v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t outlined destroy of Environment<DynamicTypeSize>.Content(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeWithTake for SmartMinimumScaleFactorModifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = type metadata accessor for Font.TextStyle();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  v8 = *(int *)(a3 + 24);
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v12 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  return a1;
}

uint64_t assignWithTake for SmartMinimumScaleFactorModifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = type metadata accessor for Font.TextStyle();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  if (a1 != a2)
  {
    v8 = *(int *)(a3 + 24);
    v9 = (void *)(a1 + v8);
    v10 = (const void *)(a2 + v8);
    outlined destroy of Environment<DynamicTypeSize>.Content(a1 + v8);
    v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for SmartMinimumScaleFactorModifier()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CC999D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = type metadata accessor for Font.TextStyle();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>);
    v10 = a1 + *(int *)(a3 + 24);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for SmartMinimumScaleFactorModifier()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CC99A54(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = type metadata accessor for Font.TextStyle();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>);
    v12 = a1 + *(int *)(a4 + 24);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void type metadata completion function for SmartMinimumScaleFactorModifier()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for Font.TextStyle();
  if (v0 <= 0x3F)
  {
    type metadata accessor for Environment<DynamicTypeSize>.Content();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void type metadata accessor for Environment<DynamicTypeSize>.Content()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for Environment<DynamicTypeSize>.Content)
  {
    type metadata accessor for DynamicTypeSize();
    v0 = type metadata accessor for Environment.Content();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Environment<DynamicTypeSize>.Content);
  }
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<_ViewModifier_Content<SmartMinimumScaleFactorModifier>, _EnvironmentKeyWritingModifier<CGFloat>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<_ViewModifier_Content<SmartMinimumScaleFactorModifier>, _EnvironmentKeyWritingModifier<CGFloat>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<_ViewModifier_Content<SmartMinimumScaleFactorModifier>, _EnvironmentKeyWritingModifier<CGFloat>> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<SmartMinimumScaleFactorModifier>, _EnvironmentKeyWritingModifier<CGFloat>>);
    v2[0] = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type _ViewModifier_Content<SmartMinimumScaleFactorModifier> and conformance _ViewModifier_Content<A>, &demangling cache variable for type metadata for _ViewModifier_Content<SmartMinimumScaleFactorModifier>, MEMORY[0x24BDEFB70]);
    v2[1] = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type _EnvironmentKeyWritingModifier<CGFloat> and conformance _EnvironmentKeyWritingModifier<A>, &demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<CGFloat>, MEMORY[0x24BDF1020]);
    result = MEMORY[0x242630878](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<_ViewModifier_Content<SmartMinimumScaleFactorModifier>, _EnvironmentKeyWritingModifier<CGFloat>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t sub_23CC99C4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  type metadata accessor for SmartMinimumScaleFactorModifier();
  v2 = type metadata accessor for ModifiedContent();
  v4[0] = v1;
  v4[1] = lazy protocol witness table accessor for type SmartMinimumScaleFactorModifier and conformance SmartMinimumScaleFactorModifier();
  return MEMORY[0x242630878](MEMORY[0x24BDED300], v2, v4);
}

unint64_t lazy protocol witness table accessor for type SmartMinimumScaleFactorModifier and conformance SmartMinimumScaleFactorModifier()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type SmartMinimumScaleFactorModifier and conformance SmartMinimumScaleFactorModifier;
  if (!lazy protocol witness table cache variable for type SmartMinimumScaleFactorModifier and conformance SmartMinimumScaleFactorModifier)
  {
    v1 = type metadata accessor for SmartMinimumScaleFactorModifier();
    result = MEMORY[0x242630878](&protocol conformance descriptor for SmartMinimumScaleFactorModifier, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SmartMinimumScaleFactorModifier and conformance SmartMinimumScaleFactorModifier);
  }
  return result;
}

void one-time initialization function for defaultValue()
{
  static SizeMeasurerPreferenceKey.defaultValue = 0uLL;
}

double protocol witness for static PreferenceKey.defaultValue.getter in conformance SizeMeasurerPreferenceKey@<D0>(_OWORD *a1@<X8>)
{
  double result;

  if (one-time initialization token for defaultValue != -1)
    swift_once();
  result = *(double *)&static SizeMeasurerPreferenceKey.defaultValue;
  *a1 = static SizeMeasurerPreferenceKey.defaultValue;
  return result;
}

double protocol witness for static PreferenceKey.reduce(value:nextValue:) in conformance SizeMeasurerPreferenceKey(_OWORD *a1, void (*a2)(__int128 *__return_ptr))
{
  double result;
  __int128 v4;

  a2(&v4);
  result = *(double *)&v4;
  *a1 = v4;
  return result;
}

uint64_t View.measureSize(onChange:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  swift_retain();
  static Alignment.center.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<GeometryReader<ModifiedContent<Color, _PreferenceWritingModifier<SizeMeasurerPreferenceKey>>>, _PreferenceActionModifier<SizeMeasurerPreferenceKey>>);
  lazy protocol witness table accessor for type ModifiedContent<GeometryReader<ModifiedContent<Color, _PreferenceWritingModifier<SizeMeasurerPreferenceKey>>>, _PreferenceActionModifier<SizeMeasurerPreferenceKey>> and conformance <> ModifiedContent<A, B>();
  View.background<A>(_:alignment:)();
  return swift_release();
}

uint64_t sub_23CC99E68()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@unowned CGSize) -> ()(double *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(double, double))(v1 + 16))(*a1, a1[1]);
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<GeometryReader<ModifiedContent<Color, _PreferenceWritingModifier<SizeMeasurerPreferenceKey>>>, _PreferenceActionModifier<SizeMeasurerPreferenceKey>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<GeometryReader<ModifiedContent<Color, _PreferenceWritingModifier<SizeMeasurerPreferenceKey>>>, _PreferenceActionModifier<SizeMeasurerPreferenceKey>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<GeometryReader<ModifiedContent<Color, _PreferenceWritingModifier<SizeMeasurerPreferenceKey>>>, _PreferenceActionModifier<SizeMeasurerPreferenceKey>> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<GeometryReader<ModifiedContent<Color, _PreferenceWritingModifier<SizeMeasurerPreferenceKey>>>, _PreferenceActionModifier<SizeMeasurerPreferenceKey>>);
    v2[0] = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type GeometryReader<ModifiedContent<Color, _PreferenceWritingModifier<SizeMeasurerPreferenceKey>>> and conformance GeometryReader<A>, &demangling cache variable for type metadata for GeometryReader<ModifiedContent<Color, _PreferenceWritingModifier<SizeMeasurerPreferenceKey>>>, MEMORY[0x24BDEC700]);
    v2[1] = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type _PreferenceActionModifier<SizeMeasurerPreferenceKey> and conformance _PreferenceActionModifier<A>, &demangling cache variable for type metadata for _PreferenceActionModifier<SizeMeasurerPreferenceKey>, MEMORY[0x24BDF09B8]);
    result = MEMORY[0x242630878](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<GeometryReader<ModifiedContent<Color, _PreferenceWritingModifier<SizeMeasurerPreferenceKey>>>, _PreferenceActionModifier<SizeMeasurerPreferenceKey>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t sub_23CC99F4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for _BackgroundModifier<ModifiedContent<GeometryReader<ModifiedContent<Color, _PreferenceWritingModifier<SizeMeasurerPreferenceKey>>>, _PreferenceActionModifier<SizeMeasurerPreferenceKey>>>);
  v2 = type metadata accessor for ModifiedContent();
  v4[0] = v1;
  v4[1] = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type _BackgroundModifier<ModifiedContent<GeometryReader<ModifiedContent<Color, _PreferenceWritingModifier<SizeMeasurerPreferenceKey>>>, _PreferenceActionModifier<SizeMeasurerPreferenceKey>>> and conformance _BackgroundModifier<A>, &demangling cache variable for type metadata for _BackgroundModifier<ModifiedContent<GeometryReader<ModifiedContent<Color, _PreferenceWritingModifier<SizeMeasurerPreferenceKey>>>, _PreferenceActionModifier<SizeMeasurerPreferenceKey>>>, MEMORY[0x24BDEF378]);
  return MEMORY[0x242630878](MEMORY[0x24BDED300], v2, v4);
}

void *type metadata accessor for SizeMeasurerPreferenceKey()
{
  return &unk_250DE2E60;
}

uint64_t closure #1 in View.measurerView.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v2 = static Color.clear.getter();
  result = GeometryProxy.size.getter();
  *a1 = v2;
  a1[1] = v4;
  a1[2] = v5;
  return result;
}

uint64_t ColorSchemeShadow.light.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for ColorSchemeShadow() + 20);
  *(_QWORD *)a1 = *(_QWORD *)v3;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v3 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v3 + 24);
  return swift_retain();
}

uint64_t type metadata accessor for ColorSchemeShadow()
{
  uint64_t result;

  result = type metadata singleton initialization cache for ColorSchemeShadow;
  if (!type metadata singleton initialization cache for ColorSchemeShadow)
    return swift_getSingletonMetadata();
  return result;
}

__n128 ColorSchemeShadow.light.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v3 = v1 + *(int *)(type metadata accessor for ColorSchemeShadow() + 20);
  swift_release();
  result = *(__n128 *)a1;
  v5 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)v3 = *(_OWORD *)a1;
  *(_OWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v3 + 32) = *(_QWORD *)(a1 + 32);
  return result;
}

uint64_t (*ColorSchemeShadow.light.modify())(_QWORD)
{
  type metadata accessor for ColorSchemeShadow();
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

uint64_t ColorSchemeShadow.dark.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for ColorSchemeShadow() + 24);
  *(_QWORD *)a1 = *(_QWORD *)v3;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v3 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v3 + 24);
  return swift_retain();
}

__n128 ColorSchemeShadow.dark.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v3 = v1 + *(int *)(type metadata accessor for ColorSchemeShadow() + 24);
  swift_release();
  result = *(__n128 *)a1;
  v5 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)v3 = *(_OWORD *)a1;
  *(_OWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v3 + 32) = *(_QWORD *)(a1 + 32);
  return result;
}

uint64_t (*ColorSchemeShadow.dark.modify())(_QWORD)
{
  type metadata accessor for ColorSchemeShadow();
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

uint64_t ColorSchemeShadow.body(content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char v12;
  void (*v13)(char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t *v23;
  uint64_t v24;

  v5 = type metadata accessor for ColorScheme();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v24 - v10;
  specialized Environment.wrappedValue.getter((uint64_t)&v24 - v10);
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v9, *MEMORY[0x24BDEB3F8], v5);
  v12 = static ColorScheme.== infix(_:_:)();
  v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v9, v5);
  v13(v11, v5);
  v14 = type metadata accessor for ColorSchemeShadow();
  v15 = 20;
  if ((v12 & 1) != 0)
    v15 = 24;
  v16 = (_QWORD *)(v2 + *(int *)(v14 + v15));
  v17 = v16[2];
  v18 = v16[3];
  v19 = v16[4];
  swift_retain();
  v20 = Color.opacity(_:)();
  v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ViewModifier_Content<ColorSchemeShadow>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(a2, a1, v21);
  swift_release();
  result = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<ColorSchemeShadow>, _ShadowEffect>);
  v23 = (uint64_t *)(a2 + *(int *)(result + 36));
  *v23 = v20;
  v23[1] = v19;
  v23[2] = v17;
  v23[3] = v18;
  return result;
}

__n128 ColorSchemeShadow.init(light:dark:)@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  char *v7;
  __int128 v8;
  __n128 *v9;
  __n128 result;

  *a3 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  swift_storeEnumTagMultiPayload();
  v6 = type metadata accessor for ColorSchemeShadow();
  v7 = (char *)a3 + *(int *)(v6 + 20);
  v8 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)v7 = *(_OWORD *)a1;
  *((_OWORD *)v7 + 1) = v8;
  *((_QWORD *)v7 + 4) = *(_QWORD *)(a1 + 32);
  v9 = (__n128 *)((char *)a3 + *(int *)(v6 + 24));
  v9[2].n128_u64[0] = a2[2].n128_u64[0];
  result = a2[1];
  *v9 = *a2;
  v9[1] = result;
  return result;
}

uint64_t View.shadow(light:dark:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  char *v11;
  __int128 v12;
  char *v13;
  __int128 v14;
  uint64_t v16;

  v8 = type metadata accessor for ColorSchemeShadow();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (uint64_t *)((char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v10 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  swift_storeEnumTagMultiPayload();
  v11 = (char *)v10 + *(int *)(v8 + 20);
  v12 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)v11 = *(_OWORD *)a1;
  *((_OWORD *)v11 + 1) = v12;
  *((_QWORD *)v11 + 4) = *(_QWORD *)(a1 + 32);
  v13 = (char *)v10 + *(int *)(v8 + 24);
  *((_QWORD *)v13 + 4) = *(_QWORD *)(a2 + 32);
  v14 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v13 = *(_OWORD *)a2;
  *((_OWORD *)v13 + 1) = v14;
  outlined retain of Shadow(a1);
  outlined retain of Shadow(a2);
  MEMORY[0x24262FFD8](v10, a3, v8, a4);
  return outlined destroy of ColorSchemeShadow((uint64_t)v10);
}

uint64_t outlined retain of Shadow(uint64_t a1)
{
  swift_retain();
  return a1;
}

uint64_t outlined destroy of ColorSchemeShadow(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ColorSchemeShadow();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t associated type witness table accessor for ViewModifier.Body : View in ColorSchemeShadow()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for ColorSchemeShadow(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    v4 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = type metadata accessor for ColorScheme();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v4, a2, v7);
    }
    else
    {
      *v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = *(int *)(a3 + 20);
    v10 = *(int *)(a3 + 24);
    v11 = (char *)v4 + v9;
    v12 = (char *)a2 + v9;
    v13 = *((_QWORD *)v12 + 1);
    *(_QWORD *)v11 = *(_QWORD *)v12;
    *((_QWORD *)v11 + 1) = v13;
    *((_OWORD *)v11 + 1) = *((_OWORD *)v12 + 1);
    *((_QWORD *)v11 + 4) = *((_QWORD *)v12 + 4);
    v14 = (char *)v4 + v10;
    v15 = (char *)a2 + v10;
    v16 = *((_QWORD *)v15 + 1);
    *(_QWORD *)v14 = *(_QWORD *)v15;
    *((_QWORD *)v14 + 1) = v16;
    *((_OWORD *)v14 + 1) = *((_OWORD *)v15 + 1);
    *((_QWORD *)v14 + 4) = *((_QWORD *)v15 + 4);
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t destroy for ColorSchemeShadow(uint64_t a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v2 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }
  swift_release();
  return swift_release();
}

_QWORD *initializeWithCopy for ColorSchemeShadow(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = type metadata accessor for ColorScheme();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = (char *)a1 + v7;
  v10 = (char *)a2 + v7;
  v11 = *((_QWORD *)v10 + 1);
  *(_QWORD *)v9 = *(_QWORD *)v10;
  *((_QWORD *)v9 + 1) = v11;
  *((_OWORD *)v9 + 1) = *((_OWORD *)v10 + 1);
  *((_QWORD *)v9 + 4) = *((_QWORD *)v10 + 4);
  v12 = (char *)a1 + v8;
  v13 = (char *)a2 + v8;
  v14 = *((_QWORD *)v13 + 1);
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *((_QWORD *)v12 + 1) = v14;
  *((_OWORD *)v12 + 1) = *((_OWORD *)v13 + 1);
  *((_QWORD *)v12 + 4) = *((_QWORD *)v13 + 4);
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for ColorSchemeShadow(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  if (a1 != a2)
  {
    outlined destroy of Environment<ColorScheme>.Content((uint64_t)a1);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = type metadata accessor for ColorScheme();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  *(_QWORD *)((char *)a1 + v7) = *(_QWORD *)((char *)a2 + v7);
  swift_retain();
  swift_release();
  v8[1] = v9[1];
  v8[2] = v9[2];
  v8[3] = v9[3];
  v8[4] = v9[4];
  v10 = *(int *)(a3 + 24);
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  *(_QWORD *)((char *)a1 + v10) = *(_QWORD *)((char *)a2 + v10);
  swift_retain();
  swift_release();
  v11[1] = v12[1];
  v11[2] = v12[2];
  v11[3] = v12[3];
  v11[4] = v12[4];
  return a1;
}

uint64_t outlined destroy of Environment<ColorScheme>.Content(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *initializeWithTake for ColorSchemeShadow(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  char *v13;
  char *v14;
  __int128 v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = type metadata accessor for ColorScheme();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = *(int *)(a3 + 20);
  v9 = *(int *)(a3 + 24);
  v10 = &a1[v8];
  v11 = &a2[v8];
  v12 = *((_OWORD *)v11 + 1);
  *(_OWORD *)v10 = *(_OWORD *)v11;
  *((_OWORD *)v10 + 1) = v12;
  *((_QWORD *)v10 + 4) = *((_QWORD *)v11 + 4);
  v13 = &a1[v9];
  v14 = &a2[v9];
  *((_QWORD *)v13 + 4) = *((_QWORD *)v14 + 4);
  v15 = *((_OWORD *)v14 + 1);
  *(_OWORD *)v13 = *(_OWORD *)v14;
  *((_OWORD *)v13 + 1) = v15;
  return a1;
}

char *assignWithTake for ColorSchemeShadow(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char *v13;

  if (a1 != a2)
  {
    outlined destroy of Environment<ColorScheme>.Content((uint64_t)a1);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = type metadata accessor for ColorScheme();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  *(_QWORD *)&a1[v8] = *(_QWORD *)&a2[v8];
  swift_release();
  *(_OWORD *)(v9 + 8) = *(_OWORD *)(v10 + 8);
  *(_OWORD *)(v9 + 24) = *(_OWORD *)(v10 + 24);
  v11 = *(int *)(a3 + 24);
  v12 = &a1[v11];
  v13 = &a2[v11];
  *(_QWORD *)&a1[v11] = *(_QWORD *)v13;
  swift_release();
  *(_OWORD *)(v12 + 8) = *(_OWORD *)(v13 + 8);
  *(_OWORD *)(v12 + 24) = *(_OWORD *)(v13 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for ColorSchemeShadow()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CC9AB38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for ColorSchemeShadow()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CC9ABC4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

void type metadata completion function for ColorSchemeShadow()
{
  unint64_t v0;

  type metadata accessor for Environment<ColorScheme>.Content();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<_ViewModifier_Content<ColorSchemeShadow>, _ShadowEffect> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<_ViewModifier_Content<ColorSchemeShadow>, _ShadowEffect> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<_ViewModifier_Content<ColorSchemeShadow>, _ShadowEffect> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<ColorSchemeShadow>, _ShadowEffect>);
    v2[0] = lazy protocol witness table accessor for type _ViewModifier_Content<ColorSchemeShadow> and conformance _ViewModifier_Content<A>();
    v2[1] = MEMORY[0x24BDEC460];
    result = MEMORY[0x242630878](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<_ViewModifier_Content<ColorSchemeShadow>, _ShadowEffect> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type _ViewModifier_Content<ColorSchemeShadow> and conformance _ViewModifier_Content<A>()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type _ViewModifier_Content<ColorSchemeShadow> and conformance _ViewModifier_Content<A>;
  if (!lazy protocol witness table cache variable for type _ViewModifier_Content<ColorSchemeShadow> and conformance _ViewModifier_Content<A>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for _ViewModifier_Content<ColorSchemeShadow>);
    result = MEMORY[0x242630878](MEMORY[0x24BDEFB70], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _ViewModifier_Content<ColorSchemeShadow> and conformance _ViewModifier_Content<A>);
  }
  return result;
}

uint64_t sub_23CC9AD70(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  type metadata accessor for ColorSchemeShadow();
  v2 = type metadata accessor for ModifiedContent();
  v4[0] = v1;
  v4[1] = lazy protocol witness table accessor for type ColorSchemeShadow and conformance ColorSchemeShadow();
  return MEMORY[0x242630878](MEMORY[0x24BDED300], v2, v4);
}

unint64_t lazy protocol witness table accessor for type ColorSchemeShadow and conformance ColorSchemeShadow()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type ColorSchemeShadow and conformance ColorSchemeShadow;
  if (!lazy protocol witness table cache variable for type ColorSchemeShadow and conformance ColorSchemeShadow)
  {
    v1 = type metadata accessor for ColorSchemeShadow();
    result = MEMORY[0x242630878](&protocol conformance descriptor for ColorSchemeShadow, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ColorSchemeShadow and conformance ColorSchemeShadow);
  }
  return result;
}

uint64_t static MapsAppProperties.getBundleID(idiom:)(uint64_t a1)
{
  if (a1 == 6)
    return 0xD000000000000012;
  else
    return 0x6C7070612E6D6F63;
}

uint64_t *MapsAppProperties.appName.unsafeMutableAddressor()
{
  if (one-time initialization token for appName != -1)
    swift_once();
  return &static MapsAppProperties.appName;
}

void one-time initialization function for appName()
{
  static MapsAppProperties.appName = 1936744781;
  *(_QWORD *)algn_256C229D8 = 0xE400000000000000;
}

uint64_t static MapsAppProperties.appName.getter()
{
  uint64_t v0;

  if (one-time initialization token for appName != -1)
    swift_once();
  v0 = static MapsAppProperties.appName;
  swift_bridgeObjectRetain();
  return v0;
}

ValueMetadata *type metadata accessor for MapsAppProperties()
{
  return &type metadata for MapsAppProperties;
}

uint64_t FindMyEnvironmentViewModifier.siriLocale.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for Locale();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t FindMyEnvironmentViewModifier.siriLocale.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for Locale();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*FindMyEnvironmentViewModifier.siriLocale.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

uint64_t FindMyEnvironmentViewModifier.isSmartEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for FindMyEnvironmentViewModifier() + 20));
}

uint64_t type metadata accessor for FindMyEnvironmentViewModifier()
{
  uint64_t result;

  result = type metadata singleton initialization cache for FindMyEnvironmentViewModifier;
  if (!type metadata singleton initialization cache for FindMyEnvironmentViewModifier)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t FindMyEnvironmentViewModifier.isSmartEnabled.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for FindMyEnvironmentViewModifier();
  *(_BYTE *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*FindMyEnvironmentViewModifier.isSmartEnabled.modify())(_QWORD)
{
  type metadata accessor for FindMyEnvironmentViewModifier();
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

uint64_t Locale.layoutDirection.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  unsigned int *v3;
  uint64_t v4;
  uint64_t v5;

  Locale.identifier.getter();
  v2 = static Locale.characterDirection(forLanguage:)();
  swift_bridgeObjectRelease();
  if (v2 == 2)
    v3 = (unsigned int *)MEMORY[0x24BDED110];
  else
    v3 = (unsigned int *)MEMORY[0x24BDED108];
  v4 = *v3;
  v5 = type metadata accessor for LayoutDirection();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 104))(a1, v4, v5);
}

uint64_t FindMyEnvironmentViewModifier.body(content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t KeyPath;
  uint64_t *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;

  v24 = a1;
  v25 = a2;
  v3 = type metadata accessor for LayoutDirection();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<FindMyEnvironmentViewModifier>, _EnvironmentKeyWritingModifier<Locale>>);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<_ViewModifier_Content<FindMyEnvironmentViewModifier>, _EnvironmentKeyWritingModifier<Locale>>, _EnvironmentKeyWritingModifier<LayoutDirection>>);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath();
  v14 = (uint64_t *)&v9[*(int *)(v7 + 36)];
  v15 = (char *)v14
      + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<Locale>)
               + 28);
  v16 = type metadata accessor for Locale();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v15, v2, v16);
  *v14 = KeyPath;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ViewModifier_Content<FindMyEnvironmentViewModifier>);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v9, v24, v17);
  v18 = swift_getKeyPath();
  Locale.identifier.getter();
  v19 = static Locale.characterDirection(forLanguage:)();
  swift_bridgeObjectRelease();
  v20 = (unsigned int *)MEMORY[0x24BDED110];
  if (v19 != 2)
    v20 = (unsigned int *)MEMORY[0x24BDED108];
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *v20, v3);
  v21 = (uint64_t *)&v12[*(int *)(v10 + 36)];
  v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<LayoutDirection>);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))((char *)v21 + *(int *)(v22 + 28), v6, v3);
  *v21 = v18;
  outlined init with copy of ModifiedContent<_ViewModifier_Content<FindMyEnvironmentViewModifier>, _EnvironmentKeyWritingModifier<Locale>>((uint64_t)v9, (uint64_t)v12);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  outlined destroy of ModifiedContent<_ViewModifier_Content<FindMyEnvironmentViewModifier>, _EnvironmentKeyWritingModifier<Locale>>((uint64_t)v9);
  return outlined init with take of ModifiedContent<ModifiedContent<_ViewModifier_Content<FindMyEnvironmentViewModifier>, _EnvironmentKeyWritingModifier<Locale>>, _EnvironmentKeyWritingModifier<LayoutDirection>>((uint64_t)v12, v25);
}

uint64_t outlined init with copy of ModifiedContent<_ViewModifier_Content<FindMyEnvironmentViewModifier>, _EnvironmentKeyWritingModifier<Locale>>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<FindMyEnvironmentViewModifier>, _EnvironmentKeyWritingModifier<Locale>>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of ModifiedContent<_ViewModifier_Content<FindMyEnvironmentViewModifier>, _EnvironmentKeyWritingModifier<Locale>>(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<FindMyEnvironmentViewModifier>, _EnvironmentKeyWritingModifier<Locale>>);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined init with take of ModifiedContent<ModifiedContent<_ViewModifier_Content<FindMyEnvironmentViewModifier>, _EnvironmentKeyWritingModifier<Locale>>, _EnvironmentKeyWritingModifier<LayoutDirection>>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<_ViewModifier_Content<FindMyEnvironmentViewModifier>, _EnvironmentKeyWritingModifier<Locale>>, _EnvironmentKeyWritingModifier<LayoutDirection>>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t FindMyEnvironmentViewModifier.init(siriLocale:isSmartEnabled:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t result;

  v6 = type metadata accessor for Locale();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a3, a1, v6);
  result = type metadata accessor for FindMyEnvironmentViewModifier();
  *(_BYTE *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t associated type witness table accessor for ViewModifier.Body : View in FindMyEnvironmentViewModifier()
{
  return swift_getOpaqueTypeConformance2();
}

_QWORD *initializeBufferWithCopyOfBuffer for FindMyEnvironmentViewModifier(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
    v7 = type metadata accessor for Locale();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for FindMyEnvironmentViewModifier(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for Locale();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for FindMyEnvironmentViewModifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = type metadata accessor for Locale();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for FindMyEnvironmentViewModifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = type metadata accessor for Locale();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for FindMyEnvironmentViewModifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = type metadata accessor for Locale();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for FindMyEnvironmentViewModifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = type metadata accessor for Locale();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for FindMyEnvironmentViewModifier()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CC9B68C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;

  v6 = type metadata accessor for Locale();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 2)
    return ((v9 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for FindMyEnvironmentViewModifier()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CC9B724(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for Locale();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  return result;
}

uint64_t type metadata completion function for FindMyEnvironmentViewModifier()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for Locale();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<_ViewModifier_Content<FindMyEnvironmentViewModifier>, _EnvironmentKeyWritingModifier<Locale>>, _EnvironmentKeyWritingModifier<LayoutDirection>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<_ViewModifier_Content<FindMyEnvironmentViewModifier>, _EnvironmentKeyWritingModifier<Locale>>, _EnvironmentKeyWritingModifier<LayoutDirection>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<_ViewModifier_Content<FindMyEnvironmentViewModifier>, _EnvironmentKeyWritingModifier<Locale>>, _EnvironmentKeyWritingModifier<LayoutDirection>> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<_ViewModifier_Content<FindMyEnvironmentViewModifier>, _EnvironmentKeyWritingModifier<Locale>>, _EnvironmentKeyWritingModifier<LayoutDirection>>);
    v2[0] = lazy protocol witness table accessor for type ModifiedContent<_ViewModifier_Content<FindMyEnvironmentViewModifier>, _EnvironmentKeyWritingModifier<Locale>> and conformance <> ModifiedContent<A, B>();
    v2[1] = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type _EnvironmentKeyWritingModifier<LayoutDirection> and conformance _EnvironmentKeyWritingModifier<A>, &demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<LayoutDirection>, MEMORY[0x24BDF1020]);
    result = MEMORY[0x242630878](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<_ViewModifier_Content<FindMyEnvironmentViewModifier>, _EnvironmentKeyWritingModifier<Locale>>, _EnvironmentKeyWritingModifier<LayoutDirection>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<_ViewModifier_Content<FindMyEnvironmentViewModifier>, _EnvironmentKeyWritingModifier<Locale>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<_ViewModifier_Content<FindMyEnvironmentViewModifier>, _EnvironmentKeyWritingModifier<Locale>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<_ViewModifier_Content<FindMyEnvironmentViewModifier>, _EnvironmentKeyWritingModifier<Locale>> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<FindMyEnvironmentViewModifier>, _EnvironmentKeyWritingModifier<Locale>>);
    v2[0] = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type _ViewModifier_Content<FindMyEnvironmentViewModifier> and conformance _ViewModifier_Content<A>, &demangling cache variable for type metadata for _ViewModifier_Content<FindMyEnvironmentViewModifier>, MEMORY[0x24BDEFB70]);
    v2[1] = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type _EnvironmentKeyWritingModifier<Locale> and conformance _EnvironmentKeyWritingModifier<A>, &demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<Locale>, MEMORY[0x24BDF1020]);
    result = MEMORY[0x242630878](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<_ViewModifier_Content<FindMyEnvironmentViewModifier>, _EnvironmentKeyWritingModifier<Locale>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

__n128 AvatarBadge.init(type:style:)@<Q0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __n128 result;
  __int128 v9;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 72);
  *(_BYTE *)a3 = a1 & 1;
  *(_OWORD *)(a3 + 8) = *(_OWORD *)a2;
  *(_QWORD *)(a3 + 24) = v3;
  *(_QWORD *)(a3 + 32) = v4;
  *(_QWORD *)(a3 + 40) = v5;
  v7 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a3 + 48) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a3 + 64) = v7;
  *(_QWORD *)(a3 + 80) = v6;
  result = *(__n128 *)(a2 + 80);
  v9 = *(_OWORD *)(a2 + 96);
  *(__n128 *)(a3 + 88) = result;
  *(_OWORD *)(a3 + 104) = v9;
  return result;
}

uint64_t AvatarBadgeType.backgroundColor.getter(char a1)
{
  if ((a1 & 1) == 0)
  {
    if (one-time initialization token for timeLimitedBadgeColor == -1)
      return swift_retain();
    goto LABEL_6;
  }
  if (one-time initialization token for favoriteBadgeColor != -1)
LABEL_6:
    swift_once();
  return swift_retain();
}

uint64_t AvatarBadgeType.sfSymbolName.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6C69662E72617473;
  else
    return 0x72656D6974;
}

uint64_t AvatarBadgeType.rawValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6C69662E72617473;
  else
    return 0x72656D6974;
}

GeoUIFramework::AvatarBadgeType_optional __swiftcall AvatarBadgeType.init(rawValue:)(Swift::String rawValue)
{
  void *object;
  Swift::String v2;
  Swift::Int v3;
  GeoUIFramework::AvatarBadgeType_optional v4;

  object = rawValue._object;
  v2._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of AvatarBadgeType.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 == 1)
    v4.value = GeoUIFramework_AvatarBadgeType_favorite;
  else
    v4.value = GeoUIFramework_AvatarBadgeType_unknownDefault;
  if (v3)
    return v4;
  else
    return 0;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance AvatarBadgeType(char *a1, char *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = AvatarBadgeType.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == AvatarBadgeType.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance AvatarBadgeType()
{
  char *v0;
  char v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  AvatarBadgeType.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance AvatarBadgeType()
{
  char *v0;

  AvatarBadgeType.rawValue.getter(*v0);
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance AvatarBadgeType()
{
  char *v0;
  char v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  AvatarBadgeType.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance AvatarBadgeType@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  Swift::Int v3;
  uint64_t result;
  char v5;

  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of AvatarBadgeType.init(rawValue:), *a1);
  result = swift_bridgeObjectRelease();
  if (v3 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (!v3)
    v5 = 0;
  *a2 = v5;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance AvatarBadgeType@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = AvatarBadgeType.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

double AvatarBadgeStyle.diameter.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

double AvatarBadgeStyle.symbolFontSize.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

uint64_t AvatarBadgeStyle.symbolColor.getter()
{
  return swift_retain();
}

double AvatarBadgeStyle.strokeWidth.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 24);
}

uint64_t AvatarBadgeStyle.lightShadow.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)a1 = *(_QWORD *)(v1 + 32);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v1 + 56);
  return swift_retain();
}

uint64_t AvatarBadgeStyle.darkShadow.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v2;

  *(_QWORD *)a1 = *(_QWORD *)(v1 + 72);
  v2 = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(a1 + 24) = v2;
  return swift_retain();
}

__n128 AvatarBadgeStyle.init(diameter:symbolFontSize:symbolColor:strokeWidth:lightShadow:darkShadow:)@<Q0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>)
{
  uint64_t v7;
  uint64_t v8;
  __n128 result;
  __int128 v10;

  v7 = *a3;
  v8 = *a2;
  *(double *)a4 = a5;
  *(double *)(a4 + 8) = a6;
  *(_QWORD *)(a4 + 16) = a1;
  *(double *)(a4 + 24) = a7;
  *(_QWORD *)(a4 + 32) = v8;
  *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 1);
  *(_OWORD *)(a4 + 56) = *(_OWORD *)(a2 + 3);
  *(_QWORD *)(a4 + 72) = v7;
  result = *(__n128 *)(a3 + 1);
  v10 = *(_OWORD *)(a3 + 3);
  *(__n128 *)(a4 + 80) = result;
  *(_OWORD *)(a4 + 96) = v10;
  return result;
}

__int128 *AvatarBadgeStyle.default.unsafeMutableAddressor()
{
  if (one-time initialization token for default != -1)
    swift_once();
  return &static AvatarBadgeStyle.default;
}

uint64_t outlined init with copy of AvatarBadgeStyle(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for AvatarBadgeStyle(a2, a1);
  return a2;
}

uint64_t default argument 1 of AvatarBadge.init(type:style:)@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for default != -1)
    swift_once();
  return outlined init with copy of AvatarBadgeStyle((uint64_t)&static AvatarBadgeStyle.default, a1);
}

uint64_t AvatarBadge.type.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t AvatarBadge.type.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result & 1;
  return result;
}

uint64_t (*AvatarBadge.type.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

uint64_t AvatarBadge.style.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of AvatarBadgeStyle(v1 + 8, a1);
}

uint64_t AvatarBadge.style.setter(uint64_t a1)
{
  uint64_t v1;

  return outlined assign with take of AvatarBadgeStyle(a1, v1 + 8);
}

uint64_t outlined assign with take of AvatarBadgeStyle(uint64_t a1, uint64_t a2)
{
  assignWithTake for AvatarBadgeStyle(a2, a1);
  return a2;
}

uint64_t (*AvatarBadge.style.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

uint64_t AvatarBadge.body.getter@<X0>(uint64_t a1@<X8>)
{
  char *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  __int128 v27;
  char *v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t KeyPath;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char v52;
  uint64_t v53;
  unsigned __int8 v54;
  uint64_t v55;
  unsigned __int8 v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  char v76;

  v50 = a1;
  v49 = type metadata accessor for ColorSchemeShadow();
  MEMORY[0x24BDAC7A8](v49);
  v3 = (uint64_t *)((char *)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Font.Design?);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, _InsettableBackgroundShapeModifier<Color, Circle>>, _OverlayModifier<StrokeBorderShapeView<Circle, Color, EmptyView>>>, ColorSchemeShadow>);
  MEMORY[0x24BDAC7A8](v48);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = *v1;
  v46 = Image.init(_internalSystemName:)();
  v9 = *((_QWORD *)v1 + 3);
  v10 = *(_OWORD *)(v1 + 56);
  v67 = *(_OWORD *)(v1 + 40);
  v68 = v10;
  v69 = *((_QWORD *)v1 + 9);
  v11 = *((_OWORD *)v1 + 6);
  v64 = *((_OWORD *)v1 + 5);
  v65 = v11;
  v66 = *((_QWORD *)v1 + 14);
  v12 = type metadata accessor for Font.Design();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v6, 1, 1, v12);
  v45 = static Font.system(size:weight:design:)();
  outlined destroy of Environment<Locale>.Content((uint64_t)v6, &demangling cache variable for type metadata for Font.Design?);
  KeyPath = swift_getKeyPath();
  v43 = swift_getKeyPath();
  v47 = v9;
  swift_retain();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  v39 = v53;
  v40 = v55;
  v37 = v56;
  v38 = v54;
  v41 = v58;
  v42 = v57;
  if ((v76 & 1) != 0)
  {
    if (one-time initialization token for favoriteBadgeColor != -1)
      swift_once();
    v13 = &static Assets.favoriteBadgeColor;
  }
  else
  {
    if (one-time initialization token for timeLimitedBadgeColor != -1)
      swift_once();
    v13 = &static Assets.timeLimitedBadgeColor;
  }
  v14 = *v13;
  swift_retain();
  if (one-time initialization token for avatarStrokeColor != -1)
    swift_once();
  v15 = static Assets.avatarStrokeColor;
  swift_retain();
  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
  v16 = v59;
  v17 = v61;
  v36 = v62;
  v18 = v63;
  v19 = static Alignment.center.getter();
  v21 = v20;
  v22 = static Alignment.center.getter();
  v24 = v23;
  v52 = v38;
  v51 = v37;
  v73 = v67;
  v74 = v68;
  v75 = v69;
  v70 = v64;
  v71 = v65;
  v72 = v66;
  *v3 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  swift_storeEnumTagMultiPayload();
  v25 = v49;
  v26 = (char *)v3 + *(int *)(v49 + 20);
  v27 = v74;
  *(_OWORD *)v26 = v73;
  *((_OWORD *)v26 + 1) = v27;
  *((_QWORD *)v26 + 4) = v75;
  v28 = (char *)v3 + *(int *)(v25 + 24);
  *((_QWORD *)v28 + 4) = v72;
  v29 = v71;
  *(_OWORD *)v28 = v70;
  *((_OWORD *)v28 + 1) = v29;
  outlined init with copy of ContactDisambiguationView((uint64_t)v3, (uint64_t)&v8[*(int *)(v48 + 36)], (uint64_t (*)(_QWORD))type metadata accessor for ColorSchemeShadow);
  v30 = KeyPath;
  *(_QWORD *)v8 = v46;
  *((_QWORD *)v8 + 1) = v30;
  v31 = v43;
  *((_QWORD *)v8 + 2) = v45;
  *((_QWORD *)v8 + 3) = v31;
  v32 = v39;
  *((_QWORD *)v8 + 4) = v47;
  *((_QWORD *)v8 + 5) = v32;
  v8[48] = v52;
  *((_QWORD *)v8 + 7) = v40;
  v8[64] = v51;
  v33 = v41;
  *((_QWORD *)v8 + 9) = v42;
  *((_QWORD *)v8 + 10) = v33;
  *((_QWORD *)v8 + 11) = v14;
  *((_WORD *)v8 + 48) = 256;
  *((double *)v8 + 13) = v16 * 0.5;
  *((double *)v8 + 14) = v16;
  *((_QWORD *)v8 + 15) = v60;
  *((_QWORD *)v8 + 16) = v17;
  *((_QWORD *)v8 + 17) = v36;
  *((_QWORD *)v8 + 18) = v18;
  *((_QWORD *)v8 + 19) = v15;
  *((_WORD *)v8 + 80) = 256;
  *((_QWORD *)v8 + 21) = v19;
  *((_QWORD *)v8 + 22) = v21;
  *((_QWORD *)v8 + 23) = v22;
  *((_QWORD *)v8 + 24) = v24;
  outlined retain of Shadow((uint64_t)&v73);
  outlined retain of Shadow((uint64_t)&v70);
  outlined destroy of ColorSchemeShadow((uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for ColorSchemeShadow);
  return outlined init with take of ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, _InsettableBackgroundShapeModifier<Color, Circle>>, _OverlayModifier<StrokeBorderShapeView<Circle, Color, EmptyView>>>, ColorSchemeShadow>((uint64_t)v8, v50);
}

uint64_t static AvatarBadge_Previews.previews.getter@<X0>(void *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  char v7;
  int v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v17)(void);
  uint64_t v18;
  void *v19;
  uint64_t v21;
  void *v22;
  _OWORD v23[5];
  _BYTE v24[48];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[247];
  char v33;
  _OWORD v34[20];

  v22 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _InsettableBackgroundShapeModifier<HierarchicalShapeStyle, RoundedRectangle>);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (_DWORD *)((char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = type metadata accessor for RoundedRectangle();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (_OWORD *)((char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v21 = static HorizontalAlignment.center.getter();
  if (one-time initialization token for default != -1)
    swift_once();
  LOBYTE(v23[0]) = 1;
  *(_OWORD *)((char *)v23 + 8) = static AvatarBadgeStyle.default;
  *((_QWORD *)&v23[1] + 1) = xmmword_256C229F0;
  v23[2] = *(__int128 *)((char *)&xmmword_256C229F0 + 8);
  v23[3] = *(__int128 *)((char *)&xmmword_256C22A00 + 8);
  v23[4] = *(__int128 *)((char *)&xmmword_256C22A10 + 8);
  *(_QWORD *)v24 = *((_QWORD *)&xmmword_256C22A20 + 1);
  *(_OWORD *)&v24[8] = xmmword_256C22A30;
  *(_OWORD *)&v24[24] = xmmword_256C22A40;
  v24[40] = 0;
  v25 = static AvatarBadgeStyle.default;
  v26 = xmmword_256C229F0;
  v27 = xmmword_256C22A00;
  v28 = xmmword_256C22A10;
  v29 = xmmword_256C22A20;
  v30 = xmmword_256C22A30;
  v31 = xmmword_256C22A40;
  v33 = 1;
  *(_OWORD *)&v32[39] = *(__int128 *)((char *)&xmmword_256C229F0 + 8);
  *(_OWORD *)&v32[23] = v23[1];
  *(_OWORD *)&v32[7] = v23[0];
  *(_OWORD *)&v32[103] = *(_OWORD *)&v24[16];
  *(_OWORD *)&v32[87] = *(_OWORD *)v24;
  *(_OWORD *)&v32[71] = *(__int128 *)((char *)&xmmword_256C22A10 + 8);
  *(_OWORD *)&v32[55] = *(__int128 *)((char *)&xmmword_256C22A00 + 8);
  *(_OWORD *)&v32[167] = xmmword_256C22A00;
  *(_OWORD *)&v32[151] = xmmword_256C229F0;
  *(_OWORD *)&v32[135] = static AvatarBadgeStyle.default;
  *(_OWORD *)&v32[119] = *(_OWORD *)&v24[32];
  *(_OWORD *)&v32[231] = xmmword_256C22A40;
  *(_OWORD *)&v32[215] = xmmword_256C22A30;
  *(_OWORD *)&v32[199] = xmmword_256C22A20;
  *(_OWORD *)&v32[183] = xmmword_256C22A10;
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  v7 = static Edge.Set.all.getter();
  *(_OWORD *)((char *)&v34[13] + 1) = *(_OWORD *)&v32[192];
  *(_OWORD *)((char *)&v34[14] + 1) = *(_OWORD *)&v32[208];
  *(_OWORD *)((char *)&v34[15] + 1) = *(_OWORD *)&v32[224];
  *(_OWORD *)((char *)&v34[9] + 1) = *(_OWORD *)&v32[128];
  *(_OWORD *)((char *)&v34[10] + 1) = *(_OWORD *)&v32[144];
  *(_OWORD *)((char *)&v34[11] + 1) = *(_OWORD *)&v32[160];
  *(_OWORD *)((char *)&v34[12] + 1) = *(_OWORD *)&v32[176];
  *(_OWORD *)((char *)&v34[5] + 1) = *(_OWORD *)&v32[64];
  *(_OWORD *)((char *)&v34[6] + 1) = *(_OWORD *)&v32[80];
  *(_OWORD *)((char *)&v34[7] + 1) = *(_OWORD *)&v32[96];
  *(_OWORD *)((char *)&v34[8] + 1) = *(_OWORD *)&v32[112];
  *(_OWORD *)((char *)&v34[1] + 1) = *(_OWORD *)v32;
  *(_OWORD *)((char *)&v34[2] + 1) = *(_OWORD *)&v32[16];
  *(_OWORD *)((char *)&v34[3] + 1) = *(_OWORD *)&v32[32];
  v34[0] = (unint64_t)v21;
  LOBYTE(v34[1]) = 1;
  *(_QWORD *)&v34[16] = *(_QWORD *)&v32[239];
  *(_OWORD *)((char *)&v34[4] + 1) = *(_OWORD *)&v32[48];
  BYTE8(v34[16]) = v7;
  memset(&v34[17], 0, 32);
  LOBYTE(v34[19]) = 1;
  v8 = static HierarchicalShapeStyle.quaternary.getter();
  v9 = (char *)v6 + *(int *)(v4 + 20);
  v10 = *MEMORY[0x24BDEEB60];
  v11 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 104))(v9, v10, v11);
  __asm { FMOV            V0.2D, #8.0 }
  *v6 = _Q0;
  v17 = MEMORY[0x24BDED9A0];
  outlined init with copy of ContactDisambiguationView((uint64_t)v6, (uint64_t)v3 + *(int *)(v1 + 52), (uint64_t (*)(_QWORD))MEMORY[0x24BDED9A0]);
  *v3 = v8;
  *(_WORD *)((char *)v3 + *(int *)(v1 + 56)) = 256;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<TupleView<(AvatarBadge, AvatarBadge)>>, _PaddingLayout>, _InsettableBackgroundShapeModifier<HierarchicalShapeStyle, RoundedRectangle>>);
  v19 = v22;
  outlined init with copy of _InsettableBackgroundShapeModifier<HierarchicalShapeStyle, RoundedRectangle>((uint64_t)v3, (uint64_t)v22 + *(int *)(v18 + 36));
  memcpy(v19, v34, 0x131uLL);
  outlined retain of ModifiedContent<VStack<TupleView<(AvatarBadge, AvatarBadge)>>, _PaddingLayout>((uint64_t)v34);
  outlined destroy of Environment<Locale>.Content((uint64_t)v3, &demangling cache variable for type metadata for _InsettableBackgroundShapeModifier<HierarchicalShapeStyle, RoundedRectangle>);
  outlined destroy of ColorSchemeShadow((uint64_t)v6, (uint64_t (*)(_QWORD))v17);
  return outlined release of (AvatarBadge, AvatarBadge)((uint64_t)v23);
}

uint64_t protocol witness for static _PreviewProvider._previews.getter in conformance AvatarBadge_Previews()
{
  lazy protocol witness table accessor for type AvatarBadge_Previews and conformance AvatarBadge_Previews();
  return static PreviewProvider._previews.getter();
}

uint64_t protocol witness for static _PreviewProvider._platform.getter in conformance AvatarBadge_Previews()
{
  lazy protocol witness table accessor for type AvatarBadge_Previews and conformance AvatarBadge_Previews();
  return static PreviewProvider._platform.getter();
}

uint64_t key path getter for EnvironmentValues.font : EnvironmentValues, serialized@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_23CC9C7A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t key path setter for EnvironmentValues.font : EnvironmentValues, serialized()
{
  swift_retain();
  return EnvironmentValues.font.setter();
}

uint64_t sub_23CC9C7F0()
{
  swift_retain();
  return EnvironmentValues.font.setter();
}

uint64_t outlined init with take of ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, _InsettableBackgroundShapeModifier<Color, Circle>>, _OverlayModifier<StrokeBorderShapeView<Circle, Color, EmptyView>>>, ColorSchemeShadow>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, _InsettableBackgroundShapeModifier<Color, Circle>>, _OverlayModifier<StrokeBorderShapeView<Circle, Color, EmptyView>>>, ColorSchemeShadow>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of _InsettableBackgroundShapeModifier<HierarchicalShapeStyle, RoundedRectangle>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _InsettableBackgroundShapeModifier<HierarchicalShapeStyle, RoundedRectangle>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined retain of ModifiedContent<VStack<TupleView<(AvatarBadge, AvatarBadge)>>, _PaddingLayout>(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t outlined destroy of ColorSchemeShadow(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t outlined release of (AvatarBadge, AvatarBadge)(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

unint64_t lazy protocol witness table accessor for type AvatarBadgeType and conformance AvatarBadgeType()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AvatarBadgeType and conformance AvatarBadgeType;
  if (!lazy protocol witness table cache variable for type AvatarBadgeType and conformance AvatarBadgeType)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for AvatarBadgeType, &type metadata for AvatarBadgeType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AvatarBadgeType and conformance AvatarBadgeType);
  }
  return result;
}

uint64_t associated type witness table accessor for View.Body : View in AvatarBadge()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t lazy protocol witness table accessor for type AvatarBadge_Previews and conformance AvatarBadge_Previews()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AvatarBadge_Previews and conformance AvatarBadge_Previews;
  if (!lazy protocol witness table cache variable for type AvatarBadge_Previews and conformance AvatarBadge_Previews)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for AvatarBadge_Previews, &type metadata for AvatarBadge_Previews);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AvatarBadge_Previews and conformance AvatarBadge_Previews);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AvatarBadge_Previews and conformance AvatarBadge_Previews;
  if (!lazy protocol witness table cache variable for type AvatarBadge_Previews and conformance AvatarBadge_Previews)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for AvatarBadge_Previews, &type metadata for AvatarBadge_Previews);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AvatarBadge_Previews and conformance AvatarBadge_Previews);
  }
  return result;
}

uint64_t associated type witness table accessor for PreviewProvider.Previews : View in AvatarBadge_Previews()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t storeEnumTagSinglePayload for AvatarBadgeType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23CC9CAD8 + 4 * byte_23CCA5605[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23CC9CB0C + 4 * byte_23CCA5600[v4]))();
}

uint64_t sub_23CC9CB0C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23CC9CB14(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23CC9CB1CLL);
  return result;
}

uint64_t sub_23CC9CB28(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23CC9CB30);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23CC9CB34(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23CC9CB3C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AvatarBadgeType()
{
  return &type metadata for AvatarBadgeType;
}

uint64_t destroy for AvatarBadgeStyle()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for AvatarBadgeStyle(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  v5 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v5;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for AvatarBadgeStyle(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_retain();
  swift_release();
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  a1[13] = a2[13];
  return a1;
}

__n128 __swift_memcpy112_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v5;
  return result;
}

uint64_t assignWithTake for AvatarBadgeStyle(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_release();
  v4 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v4;
  return a1;
}

uint64_t getEnumTagSinglePayload for AvatarBadgeStyle(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 112))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AvatarBadgeStyle(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 112) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AvatarBadgeStyle()
{
  return &type metadata for AvatarBadgeStyle;
}

uint64_t destroy for AvatarBadge()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for AvatarBadge(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v3;
  v4 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v5 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v5;
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AvatarBadge(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  return a1;
}

__n128 __swift_memcpy120_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[6];
  *(_QWORD *)(a1 + 112) = *((_QWORD *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for AvatarBadge(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_release();
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_release();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  return a1;
}

uint64_t getEnumTagSinglePayload for AvatarBadge(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 120))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AvatarBadge(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 120) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 120) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AvatarBadge()
{
  return &type metadata for AvatarBadge;
}

ValueMetadata *type metadata accessor for AvatarBadge_Previews()
{
  return &type metadata for AvatarBadge_Previews;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, _InsettableBackgroundShapeModifier<Color, Circle>>, _OverlayModifier<StrokeBorderShapeView<Circle, Color, EmptyView>>>, ColorSchemeShadow> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, _InsettableBackgroundShapeModifier<Color, Circle>>, _OverlayModifier<StrokeBorderShapeView<Circle, Color, EmptyView>>>, ColorSchemeShadow> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, _InsettableBackgroundShapeModifier<Color, Circle>>, _OverlayModifier<StrokeBorderShapeView<Circle, Color, EmptyView>>>, ColorSchemeShadow> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, _InsettableBackgroundShapeModifier<Color, Circle>>, _OverlayModifier<StrokeBorderShapeView<Circle, Color, EmptyView>>>, ColorSchemeShadow>);
    v2[0] = lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, _InsettableBackgroundShapeModifier<Color, Circle>>, _OverlayModifier<StrokeBorderShapeView<Circle, Color, EmptyView>>> and conformance <> ModifiedContent<A, B>();
    v2[1] = lazy protocol witness table accessor for type ColorSchemeShadow and conformance ColorSchemeShadow();
    result = MEMORY[0x242630878](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, _InsettableBackgroundShapeModifier<Color, Circle>>, _OverlayModifier<StrokeBorderShapeView<Circle, Color, EmptyView>>>, ColorSchemeShadow> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, _InsettableBackgroundShapeModifier<Color, Circle>>, _OverlayModifier<StrokeBorderShapeView<Circle, Color, EmptyView>>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, _InsettableBackgroundShapeModifier<Color, Circle>>, _OverlayModifier<StrokeBorderShapeView<Circle, Color, EmptyView>>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, _InsettableBackgroundShapeModifier<Color, Circle>>, _OverlayModifier<StrokeBorderShapeView<Circle, Color, EmptyView>>> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, _InsettableBackgroundShapeModifier<Color, Circle>>, _OverlayModifier<StrokeBorderShapeView<Circle, Color, EmptyView>>>);
    v2[0] = lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, _InsettableBackgroundShapeModifier<Color, Circle>> and conformance <> ModifiedContent<A, B>();
    v2[1] = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type _OverlayModifier<StrokeBorderShapeView<Circle, Color, EmptyView>> and conformance _OverlayModifier<A>, &demangling cache variable for type metadata for _OverlayModifier<StrokeBorderShapeView<Circle, Color, EmptyView>>, MEMORY[0x24BDEDC08]);
    result = MEMORY[0x242630878](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, _InsettableBackgroundShapeModifier<Color, Circle>>, _OverlayModifier<StrokeBorderShapeView<Circle, Color, EmptyView>>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, _InsettableBackgroundShapeModifier<Color, Circle>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, _InsettableBackgroundShapeModifier<Color, Circle>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, _InsettableBackgroundShapeModifier<Color, Circle>> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, _InsettableBackgroundShapeModifier<Color, Circle>>);
    v2[0] = lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout> and conformance <> ModifiedContent<A, B>();
    v2[1] = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type _InsettableBackgroundShapeModifier<Color, Circle> and conformance _InsettableBackgroundShapeModifier<A, B>, &demangling cache variable for type metadata for _InsettableBackgroundShapeModifier<Color, Circle>, MEMORY[0x24BDF1338]);
    result = MEMORY[0x242630878](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, _InsettableBackgroundShapeModifier<Color, Circle>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>);
    v2[0] = lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>> and conformance <> ModifiedContent<A, B>();
    v2[1] = MEMORY[0x24BDEBED8];
    result = MEMORY[0x242630878](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>>);
    v2[0] = lazy protocol witness table accessor for type ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>> and conformance <> ModifiedContent<A, B>();
    v2[1] = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type _EnvironmentKeyWritingModifier<Color?> and conformance _EnvironmentKeyWritingModifier<A>, &demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<Color?>, MEMORY[0x24BDF1020]);
    result = MEMORY[0x242630878](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>, _EnvironmentKeyWritingModifier<Color?>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>>);
    v2 = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type _EnvironmentKeyWritingModifier<Font?> and conformance _EnvironmentKeyWritingModifier<A>, &demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<Font?>, MEMORY[0x24BDF1020]);
    v3[0] = MEMORY[0x24BDF40F0];
    v3[1] = v2;
    result = MEMORY[0x242630878](MEMORY[0x24BDED300], v1, v3);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<Image, _EnvironmentKeyWritingModifier<Font?>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<VStack<TupleView<(AvatarBadge, AvatarBadge)>>, _PaddingLayout>, _InsettableBackgroundShapeModifier<HierarchicalShapeStyle, RoundedRectangle>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<VStack<TupleView<(AvatarBadge, AvatarBadge)>>, _PaddingLayout>, _InsettableBackgroundShapeModifier<HierarchicalShapeStyle, RoundedRectangle>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<VStack<TupleView<(AvatarBadge, AvatarBadge)>>, _PaddingLayout>, _InsettableBackgroundShapeModifier<HierarchicalShapeStyle, RoundedRectangle>> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<TupleView<(AvatarBadge, AvatarBadge)>>, _PaddingLayout>, _InsettableBackgroundShapeModifier<HierarchicalShapeStyle, RoundedRectangle>>);
    v2[0] = lazy protocol witness table accessor for type ModifiedContent<VStack<TupleView<(AvatarBadge, AvatarBadge)>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>();
    v2[1] = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type _InsettableBackgroundShapeModifier<HierarchicalShapeStyle, RoundedRectangle> and conformance _InsettableBackgroundShapeModifier<A, B>, &demangling cache variable for type metadata for _InsettableBackgroundShapeModifier<HierarchicalShapeStyle, RoundedRectangle>, MEMORY[0x24BDF1338]);
    result = MEMORY[0x242630878](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<VStack<TupleView<(AvatarBadge, AvatarBadge)>>, _PaddingLayout>, _InsettableBackgroundShapeModifier<HierarchicalShapeStyle, RoundedRectangle>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<VStack<TupleView<(AvatarBadge, AvatarBadge)>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<VStack<TupleView<(AvatarBadge, AvatarBadge)>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<VStack<TupleView<(AvatarBadge, AvatarBadge)>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<VStack<TupleView<(AvatarBadge, AvatarBadge)>>, _PaddingLayout>);
    v2[0] = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type VStack<TupleView<(AvatarBadge, AvatarBadge)>> and conformance VStack<A>, &demangling cache variable for type metadata for VStack<TupleView<(AvatarBadge, AvatarBadge)>>, MEMORY[0x24BDF46F8]);
    v2[1] = MEMORY[0x24BDECC58];
    result = MEMORY[0x242630878](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<VStack<TupleView<(AvatarBadge, AvatarBadge)>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t GeoUIPluginProviding.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t GeoUIPluginProviding.init()()
{
  uint64_t v0;

  return v0;
}

void GeoUIPluginProviding.snippet(for:mode:idiom:)(uint64_t a1)
{
  specialized GeoUIPluginProviding.snippet(for:mode:idiom:)(a1);
}

uint64_t GeoUIPluginProviding.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t GeoUIPluginProviding.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t protocol witness for SnippetProviding.init() in conformance GeoUIPluginProviding@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = swift_allocObject();
  *a1 = result;
  return result;
}

void protocol witness for SnippetProviding.snippet(for:mode:idiom:) in conformance GeoUIPluginProviding(uint64_t a1)
{
  specialized GeoUIPluginProviding.snippet(for:mode:idiom:)(a1);
}

void specialized GeoUIPluginProviding.snippet(for:mode:idiom:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = type metadata accessor for WhereAmIView();
  MEMORY[0x24BDAC7A8](v5);
  v4 = type metadata accessor for TrafficDisambiguationView();
  MEMORY[0x24BDAC7A8](v4);
  v3 = type metadata accessor for ParkingLocationView();
  MEMORY[0x24BDAC7A8](v3);
  v2 = type metadata accessor for ContactDisambiguationView();
  MEMORY[0x24BDAC7A8](v2);
  __asm { BR              X10 }
}

uint64_t sub_23CC9D71C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *v1 = v3;
  v1[1] = v0;
  v1[2] = v2;
  type metadata accessor for OS_os_log();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v1[3] = OS_os_log.init(subsystem:category:)();
  v1[4] = 0xD00000000000002CLL;
  v1[5] = 0x800000023CCA6990;
  ActionHandler.init()();
  lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type ContactDisambiguationView and conformance ContactDisambiguationView, (uint64_t (*)(uint64_t))type metadata accessor for ContactDisambiguationView, (uint64_t)&protocol conformance descriptor for ContactDisambiguationView);
  v4 = View.eraseToAnyView()();
  outlined destroy of ColorSchemeShadow((uint64_t)v1, (uint64_t (*)(_QWORD))type metadata accessor for ContactDisambiguationView);
  return v4;
}

unint64_t lazy protocol witness table accessor for type GeoDataModels and conformance GeoDataModels()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels and conformance GeoDataModels;
  if (!lazy protocol witness table cache variable for type GeoDataModels and conformance GeoDataModels)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels, &type metadata for GeoDataModels);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels and conformance GeoDataModels);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels and conformance GeoDataModels;
  if (!lazy protocol witness table cache variable for type GeoDataModels and conformance GeoDataModels)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels, &type metadata for GeoDataModels);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels and conformance GeoDataModels);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels and conformance GeoDataModels;
  if (!lazy protocol witness table cache variable for type GeoDataModels and conformance GeoDataModels)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels, &type metadata for GeoDataModels);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels and conformance GeoDataModels);
  }
  return result;
}

uint64_t type metadata accessor for GeoUIPluginProviding()
{
  return objc_opt_self();
}

uint64_t method lookup function for GeoUIPluginProviding()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of GeoUIPluginProviding.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t outlined copy of GeoDataModels(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  uint64_t result;

  result = a4;
  switch(a11)
  {
    case 0:
    case 2:
      goto LABEL_3;
    case 1:
    case 3:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_3:
      swift_bridgeObjectRetain();
      result = swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t View.shadow(_:)()
{
  Color.opacity(_:)();
  View.shadow(color:radius:x:y:)();
  return swift_release();
}

uint64_t Shadow.init(color:alpha:offset:blur:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  *(_QWORD *)a2 = result;
  *(double *)(a2 + 8) = a3;
  *(double *)(a2 + 16) = a4;
  *(double *)(a2 + 24) = a5;
  *(double *)(a2 + 32) = a6;
  return result;
}

uint64_t Shadow.color.getter()
{
  return swift_retain();
}

uint64_t Shadow.color.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_release();
  *v1 = a1;
  return result;
}

uint64_t (*Shadow.color.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

double Shadow.alpha.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

void Shadow.alpha.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 8) = a1;
}

uint64_t (*Shadow.alpha.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

double Shadow.offset.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

void Shadow.offset.setter(double a1, double a2)
{
  uint64_t v2;

  *(double *)(v2 + 16) = a1;
  *(double *)(v2 + 24) = a2;
}

uint64_t (*Shadow.offset.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

double Shadow.blur.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 32);
}

void Shadow.blur.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 32) = a1;
}

uint64_t (*Shadow.blur.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

double default argument 2 of Shadow.init(color:alpha:offset:blur:)()
{
  return 0.0;
}

uint64_t destroy for Shadow()
{
  return swift_release();
}

uint64_t initializeWithCopy for Shadow(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for Shadow(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
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

uint64_t assignWithTake for Shadow(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for Shadow(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Shadow(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Shadow()
{
  return &type metadata for Shadow;
}

uint64_t sub_23CC9DF88(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  v2 = type metadata accessor for ModifiedContent();
  v4[0] = v1;
  v4[1] = MEMORY[0x24BDEC460];
  return MEMORY[0x242630878](MEMORY[0x24BDED300], v2, v4);
}

void __swiftcall GeoDataModels.WhereAmIDataModel.init(meID:buttonLabel:localizedAddress:currentLocation:)(GeoUIFramework::GeoDataModels::WhereAmIDataModel *__return_ptr retstr, Swift::String_optional meID, Swift::String buttonLabel, Swift::String_optional localizedAddress, GeoUIFramework::StandardMapData currentLocation)
{
  uint64_t v5;
  void *v6;

  v5 = *(_QWORD *)currentLocation.label._countAndFlagsBits;
  v6 = *(void **)(currentLocation.label._countAndFlagsBits + 8);
  retstr->meID = meID;
  retstr->buttonLabel = buttonLabel;
  retstr->localizedAddress = localizedAddress;
  retstr->currentLocation.label._countAndFlagsBits = v5;
  retstr->currentLocation.label._object = v6;
  *(_OWORD *)&retstr->currentLocation.latitude = *(_OWORD *)(currentLocation.label._countAndFlagsBits + 16);
}

void __swiftcall GeoDataModels.ParkingLocationDataModel.init(parkedCar:buttonLabel:)(GeoUIFramework::GeoDataModels::ParkingLocationDataModel *__return_ptr retstr, GeoUIFramework::GeoParkedCar *parkedCar, Swift::String buttonLabel)
{
  uint64_t countAndFlagsBits;
  void *object;
  Swift::String_optional localizedAddress;

  countAndFlagsBits = parkedCar->locationInfo.label._countAndFlagsBits;
  object = parkedCar->locationInfo.label._object;
  localizedAddress = parkedCar->localizedAddress;
  retstr->parkedCar.note = parkedCar->note;
  retstr->parkedCar.localizedAddress = localizedAddress;
  retstr->parkedCar.locationInfo.label._countAndFlagsBits = countAndFlagsBits;
  retstr->parkedCar.locationInfo.label._object = object;
  *(_OWORD *)&retstr->parkedCar.locationInfo.latitude = *(_OWORD *)&parkedCar->locationInfo.latitude;
  retstr->buttonLabel = buttonLabel;
}

GeoUIFramework::GeoDataModels::ContactDisambiguationDataModel __swiftcall GeoDataModels.ContactDisambiguationDataModel.init(systemText:candidates:)(Swift::String systemText, Swift::OpaquePointer candidates)
{
  uint64_t v2;
  GeoUIFramework::GeoDataModels::ContactDisambiguationDataModel result;

  *(Swift::String *)v2 = systemText;
  *(Swift::OpaquePointer *)(v2 + 16) = candidates;
  result.systemText = systemText;
  result.candidates = candidates;
  return result;
}

GeoUIFramework::GeoDataModels::TrafficDisambiguationDataModel __swiftcall GeoDataModels.TrafficDisambiguationDataModel.init(systemText:candidates:)(Swift::String systemText, Swift::OpaquePointer candidates)
{
  uint64_t v2;
  GeoUIFramework::GeoDataModels::TrafficDisambiguationDataModel result;

  *(Swift::String *)v2 = systemText;
  *(Swift::OpaquePointer *)(v2 + 16) = candidates;
  result.systemText = systemText;
  result.candidates = candidates;
  return result;
}

void one-time initialization function for bundleName()
{
  static GeoDataModels.bundleName = 0x756C5049556F6547;
  unk_256C1E200 = 0xEB000000006E6967;
}

uint64_t static GeoDataModels.bundleName.getter()
{
  uint64_t v0;

  if (one-time initialization token for bundleName != -1)
    swift_once();
  v0 = static GeoDataModels.bundleName;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t GeoDataModels.ContactDisambiguationDataModel.systemText.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GeoDataModels.ContactDisambiguationDataModel.systemText.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*GeoDataModels.ContactDisambiguationDataModel.systemText.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

uint64_t GeoDataModels.ContactDisambiguationDataModel.candidates.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t GeoDataModels.ContactDisambiguationDataModel.candidates.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*GeoDataModels.ContactDisambiguationDataModel.candidates.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

uint64_t GeoDataModels.ContactDisambiguationDataModel.CodingKeys.stringValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0x74616469646E6163;
  else
    return 0x65546D6574737973;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys()
{
  char *v0;

  return GeoDataModels.ContactDisambiguationDataModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized GeoDataModels.ContactDisambiguationDataModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys()
{
  lazy protocol witness table accessor for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys()
{
  lazy protocol witness table accessor for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t GeoDataModels.ContactDisambiguationDataModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GeoDataModels.ContactDisambiguationDataModel.CodingKeys>);
  v10 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v13 = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v2)
  {
    v11 = v9;
    v12 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GeoContact]);
    lazy protocol witness table accessor for type [GeoContact] and conformance <A> [A](&lazy protocol witness table cache variable for type [GeoContact] and conformance <A> [A], &lazy protocol witness table cache variable for type GeoContact and conformance GeoContact, (uint64_t)&protocol conformance descriptor for GeoContact, MEMORY[0x24BEE12A0]);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v6, v4);
}

unint64_t lazy protocol witness table accessor for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.ContactDisambiguationDataModel.CodingKeys, &unk_250DE3A70);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.ContactDisambiguationDataModel.CodingKeys, &unk_250DE3A70);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.ContactDisambiguationDataModel.CodingKeys, &unk_250DE3A70);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.ContactDisambiguationDataModel.CodingKeys, &unk_250DE3A70);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys);
  }
  return result;
}

uint64_t GeoDataModels.ContactDisambiguationDataModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[2];
  char v15;
  char v16;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GeoDataModels.ContactDisambiguationDataModel.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v16 = 0;
  v9 = KeyedDecodingContainer.decode(_:forKey:)();
  v11 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GeoContact]);
  v15 = 1;
  lazy protocol witness table accessor for type [GeoContact] and conformance <A> [A](&lazy protocol witness table cache variable for type [GeoContact] and conformance <A> [A], &lazy protocol witness table cache variable for type GeoContact and conformance GeoContact, (uint64_t)&protocol conformance descriptor for GeoContact, MEMORY[0x24BEE12D0]);
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v12 = v14[1];
  *a2 = v9;
  a2[1] = v11;
  a2[2] = v12;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t lazy protocol witness table accessor for type [GeoContact] and conformance <A> [A](unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [GeoContact]);
    v10 = lazy protocol witness table accessor for type GeoContact and conformance GeoContact(a2, a3);
    result = MEMORY[0x242630878](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type GeoContact and conformance GeoContact(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for GeoContact();
    result = MEMORY[0x242630878](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance GeoDataModels.ContactDisambiguationDataModel@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return GeoDataModels.ContactDisambiguationDataModel.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GeoDataModels.ContactDisambiguationDataModel(_QWORD *a1)
{
  return GeoDataModels.ContactDisambiguationDataModel.encode(to:)(a1);
}

uint64_t GeoDataModels.ParkingLocationDataModel.parkedCar.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 40);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v1 + 24);
  *(_QWORD *)(a1 + 40) = v2;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(v1 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t GeoDataModels.ParkingLocationDataModel.buttonLabel.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GeoDataModels.ParkingLocationDataModel.CodingKeys.stringValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0x614C6E6F74747562;
  else
    return 0x614364656B726170;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance GeoDataModels.ParkingLocationDataModel.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GeoDataModels.ParkingLocationDataModel.CodingKeys()
{
  char *v0;

  return GeoDataModels.ParkingLocationDataModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GeoDataModels.ParkingLocationDataModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized GeoDataModels.ParkingLocationDataModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GeoDataModels.ParkingLocationDataModel.CodingKeys()
{
  lazy protocol witness table accessor for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GeoDataModels.ParkingLocationDataModel.CodingKeys()
{
  lazy protocol witness table accessor for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t GeoDataModels.ParkingLocationDataModel.encode(to:)(_QWORD *a1)
{
  __int128 *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[2];
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GeoDataModels.ParkingLocationDataModel.CodingKeys>);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  v16 = v1[1];
  v17 = v7;
  v9 = *((_QWORD *)v1 + 4);
  v8 = *((_QWORD *)v1 + 5);
  v10 = *((_QWORD *)v1 + 6);
  v11 = *((_QWORD *)v1 + 7);
  v12 = *((_QWORD *)v1 + 8);
  v15[0] = *((_QWORD *)v1 + 9);
  v15[1] = v12;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v19 = v17;
  v20 = v16;
  v21 = v9;
  v22 = v8;
  v23 = v10;
  v24 = v11;
  v25 = 0;
  lazy protocol witness table accessor for type GeoParkedCar and conformance GeoParkedCar();
  v13 = v18;
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v13)
  {
    LOBYTE(v19) = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t lazy protocol witness table accessor for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.ParkingLocationDataModel.CodingKeys, &unk_250DE39E0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.ParkingLocationDataModel.CodingKeys, &unk_250DE39E0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.ParkingLocationDataModel.CodingKeys, &unk_250DE39E0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.ParkingLocationDataModel.CodingKeys, &unk_250DE39E0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GeoParkedCar and conformance GeoParkedCar()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoParkedCar and conformance GeoParkedCar;
  if (!lazy protocol witness table cache variable for type GeoParkedCar and conformance GeoParkedCar)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoParkedCar, &type metadata for GeoParkedCar);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoParkedCar and conformance GeoParkedCar);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoParkedCar and conformance GeoParkedCar;
  if (!lazy protocol witness table cache variable for type GeoParkedCar and conformance GeoParkedCar)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoParkedCar, &type metadata for GeoParkedCar);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoParkedCar and conformance GeoParkedCar);
  }
  return result;
}

uint64_t GeoDataModels.ParkingLocationDataModel.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t);
  uint64_t v18;
  uint64_t v19;
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
  char v33;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GeoDataModels.ParkingLocationDataModel.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v33 = 0;
  lazy protocol witness table accessor for type GeoParkedCar and conformance GeoParkedCar();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v9 = v26;
  v10 = v28;
  v22 = v27;
  v23 = v25;
  v11 = v30;
  v21 = v29;
  v12 = v31;
  v13 = v32;
  LOBYTE(v25) = 1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v24 = v9;
  swift_bridgeObjectRetain();
  v14 = KeyedDecodingContainer.decode(_:forKey:)();
  v16 = v15;
  v17 = *(void (**)(char *, uint64_t))(v6 + 8);
  v18 = v14;
  v17(v8, v5);
  v19 = v24;
  *a2 = v23;
  a2[1] = v19;
  a2[2] = v22;
  a2[3] = v10;
  a2[4] = v21;
  a2[5] = v11;
  a2[6] = v12;
  a2[7] = v13;
  a2[8] = v18;
  a2[9] = v16;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t protocol witness for Decodable.init(from:) in conformance GeoDataModels.ParkingLocationDataModel@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return GeoDataModels.ParkingLocationDataModel.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GeoDataModels.ParkingLocationDataModel(_QWORD *a1)
{
  return GeoDataModels.ParkingLocationDataModel.encode(to:)(a1);
}

uint64_t (*GeoDataModels.TrafficDisambiguationDataModel.systemText.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

uint64_t (*GeoDataModels.TrafficDisambiguationDataModel.candidates.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys()
{
  lazy protocol witness table accessor for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys()
{
  lazy protocol witness table accessor for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t GeoDataModels.TrafficDisambiguationDataModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GeoDataModels.TrafficDisambiguationDataModel.CodingKeys>);
  v10 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v13 = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v2)
  {
    v11 = v9;
    v12 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GeoTrafficIncident]);
    lazy protocol witness table accessor for type [GeoTrafficIncident] and conformance <A> [A](&lazy protocol witness table cache variable for type [GeoTrafficIncident] and conformance <A> [A], (uint64_t (*)(void))lazy protocol witness table accessor for type GeoTrafficIncident and conformance GeoTrafficIncident, MEMORY[0x24BEE12A0]);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v6, v4);
}

unint64_t lazy protocol witness table accessor for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.TrafficDisambiguationDataModel.CodingKeys, &unk_250DE3950);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.TrafficDisambiguationDataModel.CodingKeys, &unk_250DE3950);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.TrafficDisambiguationDataModel.CodingKeys, &unk_250DE3950);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.TrafficDisambiguationDataModel.CodingKeys, &unk_250DE3950);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type [GeoTrafficIncident] and conformance <A> [A](unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [GeoTrafficIncident]);
    v8 = a2();
    result = MEMORY[0x242630878](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t GeoDataModels.TrafficDisambiguationDataModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[2];
  char v15;
  char v16;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GeoDataModels.TrafficDisambiguationDataModel.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v16 = 0;
  v9 = KeyedDecodingContainer.decode(_:forKey:)();
  v11 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GeoTrafficIncident]);
  v15 = 1;
  lazy protocol witness table accessor for type [GeoTrafficIncident] and conformance <A> [A](&lazy protocol witness table cache variable for type [GeoTrafficIncident] and conformance <A> [A], (uint64_t (*)(void))lazy protocol witness table accessor for type GeoTrafficIncident and conformance GeoTrafficIncident, MEMORY[0x24BEE12D0]);
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v12 = v14[1];
  *a2 = v9;
  a2[1] = v11;
  a2[2] = v12;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t protocol witness for Decodable.init(from:) in conformance GeoDataModels.TrafficDisambiguationDataModel@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return GeoDataModels.TrafficDisambiguationDataModel.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GeoDataModels.TrafficDisambiguationDataModel(_QWORD *a1)
{
  return GeoDataModels.TrafficDisambiguationDataModel.encode(to:)(a1);
}

uint64_t GeoDataModels.WhereAmIDataModel.meID.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GeoDataModels.WhereAmIDataModel.buttonLabel.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GeoDataModels.WhereAmIDataModel.localizedAddress.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GeoDataModels.WhereAmIDataModel.currentLocation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 56);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 48);
  *(_QWORD *)(a1 + 8) = v2;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(v1 + 64);
  return swift_bridgeObjectRetain();
}

uint64_t GeoDataModels.WhereAmIDataModel.CodingKeys.stringValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23CC9F290 + 4 * byte_23CCA59A0[a1]))(0xD000000000000010, 0x800000023CCA6970);
}

uint64_t sub_23CC9F290()
{
  return 1145660781;
}

uint64_t sub_23CC9F2A0()
{
  return 0x4C746E6572727563;
}

uint64_t sub_23CC9F2C4()
{
  return 0x614C6E6F74747562;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GeoDataModels.WhereAmIDataModel.CodingKeys()
{
  unsigned __int8 *v0;

  return GeoDataModels.WhereAmIDataModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GeoDataModels.WhereAmIDataModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized GeoDataModels.WhereAmIDataModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GeoDataModels.WhereAmIDataModel.CodingKeys()
{
  lazy protocol witness table accessor for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GeoDataModels.WhereAmIDataModel.CodingKeys()
{
  lazy protocol witness table accessor for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t GeoDataModels.WhereAmIDataModel.encode(to:)(_QWORD *a1)
{
  _QWORD *v1;
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
  char v28;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GeoDataModels.WhereAmIDataModel.CodingKeys>);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = v1[2];
  v21 = v1[3];
  v22 = v7;
  v8 = v1[4];
  v19 = v1[5];
  v20 = v8;
  v9 = v1[6];
  v17 = v1[7];
  v18 = v9;
  v10 = v1[8];
  v11 = v1[9];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v24) = 0;
  v12 = v23;
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  if (!v12)
  {
    v14 = v17;
    v13 = v18;
    LOBYTE(v24) = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    LOBYTE(v24) = 2;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v24 = v13;
    v25 = v14;
    v26 = v10;
    v27 = v11;
    v28 = 3;
    lazy protocol witness table accessor for type StandardMapData and conformance StandardMapData();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t lazy protocol witness table accessor for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.WhereAmIDataModel.CodingKeys, &unk_250DE38C0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.WhereAmIDataModel.CodingKeys, &unk_250DE38C0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.WhereAmIDataModel.CodingKeys, &unk_250DE38C0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.WhereAmIDataModel.CodingKeys, &unk_250DE38C0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys);
  }
  return result;
}

uint64_t GeoDataModels.WhereAmIDataModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v15;
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
  uint64_t v32;
  uint64_t v33;
  char v34;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GeoDataModels.WhereAmIDataModel.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  LOBYTE(v30) = 0;
  v9 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  v11 = v10;
  v28 = v9;
  LOBYTE(v30) = 1;
  swift_bridgeObjectRetain();
  v12 = KeyedDecodingContainer.decode(_:forKey:)();
  v29 = v13;
  v26 = v12;
  v27 = v11;
  LOBYTE(v30) = 2;
  swift_bridgeObjectRetain();
  v24 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  v34 = 3;
  v15 = v14;
  lazy protocol witness table accessor for type StandardMapData and conformance StandardMapData();
  v25 = v15;
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v18 = v30;
  v17 = v31;
  v19 = v32;
  v20 = v33;
  v21 = v27;
  swift_bridgeObjectRetain();
  v22 = v29;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *a2 = v28;
  a2[1] = v21;
  v23 = v25;
  a2[2] = v26;
  a2[3] = v22;
  a2[4] = v24;
  a2[5] = v23;
  a2[6] = v18;
  a2[7] = v17;
  a2[8] = v19;
  a2[9] = v20;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t protocol witness for Decodable.init(from:) in conformance GeoDataModels.WhereAmIDataModel@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return GeoDataModels.WhereAmIDataModel.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GeoDataModels.WhereAmIDataModel(_QWORD *a1)
{
  return GeoDataModels.WhereAmIDataModel.encode(to:)(a1);
}

uint64_t GeoDataModels.snippetHidden(for:idiom:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char v5;
  uint64_t v7;

  v1 = type metadata accessor for DeviceIdiom();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned __int8 *)(v0 + 80) | 2) == 2)
  {
    v5 = 0;
  }
  else
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEA8968], v1);
    v5 = static DeviceIdiom.== infix(_:_:)();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return v5 & 1;
}

uint64_t GeoDataModels.CodingKeys.stringValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23CC9F99C + 4 * byte_23CCA59A4[a1]))(0xD000000000000015, 0x800000023CCA6D30);
}

uint64_t sub_23CC9F99C()
{
  return 0x4C676E696B726170;
}

uint64_t sub_23CC9F9D4()
{
  return 0x496D416572656877;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GeoDataModels.CodingKeys()
{
  unsigned __int8 *v0;

  return GeoDataModels.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GeoDataModels.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized GeoDataModels.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GeoDataModels.CodingKeys()
{
  lazy protocol witness table accessor for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GeoDataModels.CodingKeys()
{
  lazy protocol witness table accessor for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GeoDataModels.ContactDisambiguationCodingKeys()
{
  return 1;
}

void protocol witness for CodingKey.init(intValue:) in conformance GeoDataModels.ContactDisambiguationCodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GeoDataModels.ContactDisambiguationCodingKeys()
{
  lazy protocol witness table accessor for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GeoDataModels.ContactDisambiguationCodingKeys()
{
  lazy protocol witness table accessor for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GeoDataModels.ParkingLocationCodingKeys()
{
  lazy protocol witness table accessor for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GeoDataModels.ParkingLocationCodingKeys()
{
  lazy protocol witness table accessor for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GeoDataModels.TrafficDisambiguationCodingKeys()
{
  lazy protocol witness table accessor for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GeoDataModels.TrafficDisambiguationCodingKeys()
{
  lazy protocol witness table accessor for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys();
  return CodingKey.debugDescription.getter();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance GeoDataModels.ContactDisambiguationCodingKeys()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance GeoDataModels.WhereAmICodingKeys()
{
  Hasher._combine(_:)(0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GeoDataModels.ContactDisambiguationCodingKeys()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GeoDataModels.WhereAmICodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized GeoDataModels.ContactDisambiguationCodingKeys.init(stringValue:)(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GeoDataModels.WhereAmICodingKeys()
{
  lazy protocol witness table accessor for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GeoDataModels.WhereAmICodingKeys()
{
  lazy protocol witness table accessor for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys();
  return CodingKey.debugDescription.getter();
}

void GeoDataModels.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GeoDataModels.WhereAmICodingKeys>);
  v18 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v17 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GeoDataModels.TrafficDisambiguationCodingKeys>);
  v15 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v14 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GeoDataModels.ParkingLocationCodingKeys>);
  v12[1] = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GeoDataModels.ContactDisambiguationCodingKeys>);
  v12[0] = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GeoDataModels.CodingKeys>);
  v30 = *(_QWORD *)(v6 - 8);
  v31 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v7 = v1[1];
  v27 = *v1;
  v28 = v7;
  v29 = v1[2];
  v8 = v1[3];
  v25 = v1[4];
  v26 = v8;
  v9 = v1[5];
  v23 = v1[6];
  v24 = v9;
  v10 = v1[7];
  v21 = v1[8];
  v22 = v10;
  v20 = v1[9];
  v11 = *((unsigned __int8 *)v1 + 80);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  __asm { BR              X9 }
}

uint64_t sub_23CC9FEB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v3 - 168) = 0;
  lazy protocol witness table accessor for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys();
  v4 = *(_QWORD *)(v3 - 176);
  KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
  v5 = *(_QWORD *)(v3 - 200);
  *(_QWORD *)(v3 - 168) = *(_QWORD *)(v3 - 208);
  *(_QWORD *)(v3 - 160) = v5;
  *(_QWORD *)(v3 - 152) = *(_QWORD *)(v3 - 192);
  lazy protocol witness table accessor for type GeoDataModels.ContactDisambiguationDataModel and conformance GeoDataModels.ContactDisambiguationDataModel();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 336) + 8))(v2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 184) + 8))(v0, v4);
}

unint64_t lazy protocol witness table accessor for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.CodingKeys, &unk_250DE35F0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.CodingKeys, &unk_250DE35F0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.CodingKeys, &unk_250DE35F0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.CodingKeys, &unk_250DE35F0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.WhereAmICodingKeys, &unk_250DE3830);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.WhereAmICodingKeys, &unk_250DE3830);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.WhereAmICodingKeys, &unk_250DE3830);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.WhereAmICodingKeys, &unk_250DE3830);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.TrafficDisambiguationCodingKeys, &unk_250DE37A0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.TrafficDisambiguationCodingKeys, &unk_250DE37A0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.TrafficDisambiguationCodingKeys, &unk_250DE37A0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.TrafficDisambiguationCodingKeys, &unk_250DE37A0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.ParkingLocationCodingKeys, &unk_250DE3710);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.ParkingLocationCodingKeys, &unk_250DE3710);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.ParkingLocationCodingKeys, &unk_250DE3710);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.ParkingLocationCodingKeys, &unk_250DE3710);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.ContactDisambiguationCodingKeys, &unk_250DE3680);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.ContactDisambiguationCodingKeys, &unk_250DE3680);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.ContactDisambiguationCodingKeys, &unk_250DE3680);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys)
  {
    result = MEMORY[0x242630878](&protocol conformance descriptor for GeoDataModels.ContactDisambiguationCodingKeys, &unk_250DE3680);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys);
  }
  return result;
}

uint64_t GeoDataModels.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
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
  uint64_t v18;
  char *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;

  v36 = a2;
  v35 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GeoDataModels.WhereAmICodingKeys>);
  v29 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v34 = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GeoDataModels.TrafficDisambiguationCodingKeys>);
  v30 = *(_QWORD *)(v4 - 8);
  v31 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v33 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GeoDataModels.ParkingLocationCodingKeys>);
  v27 = *(_QWORD *)(v6 - 8);
  v28 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v32 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GeoDataModels.ContactDisambiguationCodingKeys>);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GeoDataModels.CodingKeys>);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = a1[3];
  v37 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v16);
  lazy protocol witness table accessor for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys();
  v17 = v38;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v17)
  {
    v25[4] = v11;
    v25[2] = v9;
    v25[3] = v8;
    v38 = v13;
    v26 = v12;
    v18 = KeyedDecodingContainer.allKeys.getter();
    if (*(_QWORD *)(v18 + 16) == 1)
    {
      v19 = (char *)&loc_23CCA0618 + 4 * byte_23CCA59AC[*(unsigned __int8 *)(v18 + 32)];
      v25[1] = *(unsigned __int8 *)(v18 + 32);
      __asm { BR              X9 }
    }
    v20 = type metadata accessor for DecodingError();
    swift_allocError();
    v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *v22 = &type metadata for GeoDataModels;
    v23 = v26;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(v22, *MEMORY[0x24BEE26D0], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v15, v23);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v37);
}

void sub_23CCA0778()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *(_BYTE *)(v3 - 168) = 1;
  lazy protocol witness table accessor for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys();
  v4 = *(_QWORD *)(v3 - 216);
  v5 = *(_QWORD *)(v3 - 264);
  KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
  if (!v0)
  {
    lazy protocol witness table accessor for type GeoDataModels.ParkingLocationDataModel and conformance GeoDataModels.ParkingLocationDataModel();
    v6 = *(_QWORD *)(v3 - 248);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    v7 = *(_QWORD *)(v3 - 72);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 256) + 8))(v4, v6);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v5);
    v8 = *(_OWORD *)(v3 - 160);
    v9 = *(_QWORD *)(v3 - 144);
    v10 = *(_QWORD *)(v3 - 136);
    v11 = *(_QWORD *)(v3 - 128);
    v12 = *(_QWORD *)(v3 - 120);
    v13 = *(_QWORD *)(v3 - 112);
    v14 = *(_QWORD *)(v3 - 104);
    v15 = *(_QWORD *)(v3 - 96);
    *(_QWORD *)v2 = *(_QWORD *)(v3 - 168);
    *(_OWORD *)(v2 + 8) = v8;
    *(_QWORD *)(v2 + 24) = v9;
    *(_QWORD *)(v2 + 32) = v10;
    *(_QWORD *)(v2 + 40) = v11;
    *(_QWORD *)(v2 + 48) = v12;
    *(_QWORD *)(v2 + 56) = v13;
    *(_QWORD *)(v2 + 64) = v14;
    *(_QWORD *)(v2 + 72) = v15;
    *(_BYTE *)(v2 + 80) = *(_QWORD *)(v3 - 296);
    JUMPOUT(0x23CCA0750);
  }
  JUMPOUT(0x23CCA0734);
}

void sub_23CCA084C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = v3;
  *(_BYTE *)(v4 - 168) = 3;
  lazy protocol witness table accessor for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys();
  v6 = *(_QWORD *)(v4 - 264);
  KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
  if (v0)
  {
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 72) + 8))(v2, v6);
    JUMPOUT(0x23CCA0750);
  }
  lazy protocol witness table accessor for type GeoDataModels.WhereAmIDataModel and conformance GeoDataModels.WhereAmIDataModel();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v7 = *(_QWORD *)(v4 - 72);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 240) + 8))(v5, v1);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v2, v6);
  JUMPOUT(0x23CCA0AC4);
}

uint64_t protocol witness for static SnippetPluginModel.bundleName.getter in conformance GeoDataModels()
{
  uint64_t v0;

  if (one-time initialization token for bundleName != -1)
    swift_once();
  v0 = static GeoDataModels.bundleName;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t protocol witness for SnippetPluginModel.snippetHidden(for:idiom:) in conformance GeoDataModels()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char v5;
  uint64_t v7;

  v1 = type metadata accessor for DeviceIdiom();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned __int8 *)(v0 + 80) | 2) == 2)
  {
    v5 = 0;
  }
  else
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEA8968], v1);
    v5 = static DeviceIdiom.== infix(_:_:)();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return v5 & 1;
}

uint64_t protocol witness for Decodable.init(from:) in conformance GeoDataModels@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return GeoDataModels.init(from:)(a1, a2);
}

void protocol witness for Encodable.encode(to:) in conformance GeoDataModels(_QWORD *a1)
{
  GeoDataModels.encode(to:)(a1);
}

uint64_t destroy for GeoDataModels(uint64_t a1)
{
  return outlined consume of GeoDataModels(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_BYTE *)(a1 + 80));
}

uint64_t outlined consume of GeoDataModels(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  uint64_t result;

  result = a6;
  switch(a11)
  {
    case 0:
    case 2:
      goto LABEL_3;
    case 1:
    case 3:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_3:
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeWithCopy for GeoDataModels(uint64_t a1, uint64_t a2)
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
  uint64_t v13;
  char v14;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v13 = *(_QWORD *)(a2 + 72);
  v14 = *(_BYTE *)(a2 + 80);
  outlined copy of GeoDataModels(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v13;
  *(_BYTE *)(a1 + 80) = v14;
  return a1;
}

uint64_t assignWithCopy for GeoDataModels(uint64_t a1, uint64_t a2)
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
  char v22;
  uint64_t v24;
  char v25;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v24 = *(_QWORD *)(a2 + 72);
  v25 = *(_BYTE *)(a2 + 80);
  outlined copy of GeoDataModels(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v24, v25);
  v12 = *(_QWORD *)a1;
  v13 = *(_QWORD *)(a1 + 8);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 48);
  v19 = *(_QWORD *)(a1 + 56);
  v20 = *(_QWORD *)(a1 + 64);
  v21 = *(_QWORD *)(a1 + 72);
  v22 = *(_BYTE *)(a1 + 80);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v24;
  *(_BYTE *)(a1 + 80) = v25;
  outlined consume of GeoDataModels(v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
  return a1;
}

__n128 __swift_memcpy81_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for GeoDataModels(uint64_t a1, uint64_t a2)
{
  char v3;
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
  char v14;
  __int128 v15;
  __int128 v16;

  v3 = *(_BYTE *)(a2 + 80);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 72);
  v14 = *(_BYTE *)(a1 + 80);
  v15 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v15;
  v16 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v16;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 80) = v3;
  outlined consume of GeoDataModels(v4, v6, v5, v7, v8, v9, v10, v11, v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for GeoDataModels(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 81))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 80);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for GeoDataModels(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 80) = 0;
    *(_QWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 81) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 81) = 0;
    if (a2)
      *(_BYTE *)(result + 80) = -(char)a2;
  }
  return result;
}

uint64_t getEnumTag for GeoDataModels(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 80);
}

uint64_t destructiveInjectEnumTag for GeoDataModels(uint64_t result, char a2)
{
  *(_BYTE *)(result + 80) = a2;
  return result;
}

ValueMetadata *type metadata accessor for GeoDataModels()
{
  return &type metadata for GeoDataModels;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for GeoDataModels.ContactDisambiguationDataModel()
{
  return &type metadata for GeoDataModels.ContactDisambiguationDataModel;
}

uint64_t destroy for GeoDataModels.ParkingLocationDataModel()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for GeoDataModels.ParkingLocationDataModel(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  v6 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for GeoDataModels.ParkingLocationDataModel(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for GeoDataModels.ParkingLocationDataModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GeoDataModels.ParkingLocationDataModel(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GeoDataModels.ParkingLocationDataModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 80) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for GeoDataModels.ParkingLocationDataModel()
{
  return &type metadata for GeoDataModels.ParkingLocationDataModel;
}

uint64_t destroy for GeoDataModels.ContactDisambiguationDataModel()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeBufferWithCopyOfBuffer for GeoDataModels.ContactDisambiguationDataModel(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for GeoDataModels.ContactDisambiguationDataModel(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for GeoDataModels.ContactDisambiguationDataModel(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GeoDataModels.ContactDisambiguationDataModel(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for GeoDataModels.ContactDisambiguationDataModel(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for GeoDataModels.TrafficDisambiguationDataModel()
{
  return &type metadata for GeoDataModels.TrafficDisambiguationDataModel;
}

uint64_t destroy for GeoDataModels.WhereAmIDataModel()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for GeoDataModels.WhereAmIDataModel(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for GeoDataModels.WhereAmIDataModel(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  return a1;
}

uint64_t assignWithTake for GeoDataModels.WhereAmIDataModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for GeoDataModels.WhereAmIDataModel(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GeoDataModels.WhereAmIDataModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 80) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for GeoDataModels.WhereAmIDataModel()
{
  return &type metadata for GeoDataModels.WhereAmIDataModel;
}

void *type metadata accessor for GeoDataModels.CodingKeys()
{
  return &unk_250DE35F0;
}

uint64_t getEnumTag for GeoDataModels.ContactDisambiguationCodingKeys()
{
  return 0;
}

void *type metadata accessor for GeoDataModels.ContactDisambiguationCodingKeys()
{
  return &unk_250DE3680;
}

void *type metadata accessor for GeoDataModels.ParkingLocationCodingKeys()
{
  return &unk_250DE3710;
}

void *type metadata accessor for GeoDataModels.TrafficDisambiguationCodingKeys()
{
  return &unk_250DE37A0;
}

uint64_t getEnumTagSinglePayload for GeoDataModels.ContactDisambiguationCodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for GeoDataModels.ContactDisambiguationCodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23CCA1964 + 4 * byte_23CCA59B8[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23CCA1984 + 4 * byte_23CCA59BD[v4]))();
}

_BYTE *sub_23CCA1964(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23CCA1984(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23CCA198C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23CCA1994(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23CCA199C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23CCA19A4(_DWORD *result)
{
  *result = 0;
  return result;
}

void *type metadata accessor for GeoDataModels.WhereAmICodingKeys()
{
  return &unk_250DE3830;
}

uint64_t storeEnumTagSinglePayload for GeoDataModels.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23CCA1A0C + 4 * byte_23CCA59C7[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23CCA1A40 + 4 * byte_23CCA59C2[v4]))();
}

uint64_t sub_23CCA1A40(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23CCA1A48(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23CCA1A50);
  return result;
}

uint64_t sub_23CCA1A5C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23CCA1A64);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23CCA1A68(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23CCA1A70(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for GeoDataModels.WhereAmIDataModel.CodingKeys()
{
  return &unk_250DE38C0;
}

void *type metadata accessor for GeoDataModels.TrafficDisambiguationDataModel.CodingKeys()
{
  return &unk_250DE3950;
}

void *type metadata accessor for GeoDataModels.ParkingLocationDataModel.CodingKeys()
{
  return &unk_250DE39E0;
}

uint64_t storeEnumTagSinglePayload for GeoDataModels.TrafficDisambiguationDataModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23CCA1B00 + 4 * byte_23CCA59D1[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23CCA1B34 + 4 * byte_23CCA59CC[v4]))();
}

uint64_t sub_23CCA1B34(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23CCA1B3C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23CCA1B44);
  return result;
}

uint64_t sub_23CCA1B50(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23CCA1B58);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23CCA1B5C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23CCA1B64(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for GeoDataModels.ContactDisambiguationDataModel.CodingKeys()
{
  return &unk_250DE3A70;
}

uint64_t specialized GeoDataModels.ParkingLocationDataModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x614364656B726170 && a2 == 0xE900000000000072;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x614C6E6F74747562 && a2 == 0xEB000000006C6562)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t specialized GeoDataModels.ContactDisambiguationDataModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0x65546D6574737973 && a2 == 0xEA00000000007478
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74616469646E6163 && a2 == 0xEA00000000007365)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t specialized GeoDataModels.WhereAmIDataModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 1145660781 && a2 == 0xE400000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x614C6E6F74747562 && a2 == 0xEB000000006C6562
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023CCA6970
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x4C746E6572727563 && a2 == 0xEF6E6F697461636FLL)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t specialized GeoDataModels.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000015 && a2 == 0x800000023CCA6D30
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4C676E696B726170 && a2 == 0xEF6E6F697461636FLL
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000023CCA6D50
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x496D416572656877 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t specialized GeoDataModels.ContactDisambiguationCodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t specialized GeoDataModels.WhereAmICodingKeys.stringValue.getter()
{
  return 12383;
}

uint64_t static CharacterSet.urlQueryAllowed.getter()
{
  return MEMORY[0x24BDCB668]();
}

uint64_t type metadata accessor for CharacterSet()
{
  return MEMORY[0x24BDCB750]();
}

NSPersonNameComponents __swiftcall PersonNameComponents._bridgeToObjectiveC()()
{
  objc_class *v0;
  void *v1;
  NSPersonNameComponents result;

  v0 = (objc_class *)MEMORY[0x24BDCCBB0]();
  result._private = v1;
  result.super.isa = v0;
  return result;
}

uint64_t static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCCBD0]();
}

uint64_t type metadata accessor for PersonNameComponents()
{
  return MEMORY[0x24BDCCC10]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
  MEMORY[0x24BDCD8D0](retstr);
}

uint64_t URL.init(string:)()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t Locale.init(identifier:)()
{
  return MEMORY[0x24BDCEB18]();
}

uint64_t Locale.identifier.getter()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t static Locale.characterDirection(forLanguage:)()
{
  return MEMORY[0x24BDCEC70]();
}

uint64_t static Locale.current.getter()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t type metadata accessor for Locale()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t AppPunchout.init(punchOutUri:bundleId:appDisplayName:)()
{
  return MEMORY[0x24BEAA6B0]();
}

uint64_t static ImageElement.badgedImage(image:badge:)()
{
  return MEMORY[0x24BEAAA90]();
}

uint64_t static ImageElement.ImageStyle.== infix(_:_:)()
{
  return MEMORY[0x24BEAAB28]();
}

uint64_t type metadata accessor for ImageElement.ImageStyle()
{
  return MEMORY[0x24BEAAC50]();
}

uint64_t type metadata accessor for ImageElement.SourceType()
{
  return MEMORY[0x24BEAAD40]();
}

uint64_t ImageElement.AppIcon.init(_:imageStyle:)()
{
  return MEMORY[0x24BEAAFD0]();
}

uint64_t ImageElement.Contact.Avatar.init(contactIds:)()
{
  return MEMORY[0x24BEAAFF8]();
}

uint64_t type metadata accessor for ImageElement.Contact.Content()
{
  return MEMORY[0x24BEAB018]();
}

uint64_t ImageElement.Contact.Monogram.init(letters:)()
{
  return MEMORY[0x24BEAB030]();
}

uint64_t ImageElement.Contact.init(_:imageStyle:)()
{
  return MEMORY[0x24BEAB040]();
}

uint64_t type metadata accessor for ImageElement()
{
  return MEMORY[0x24BEAB098]();
}

uint64_t type metadata accessor for ActionProperty()
{
  return MEMORY[0x24BEAB3D0]();
}

uint64_t ActionProperty.init(_:)()
{
  return MEMORY[0x24BEAB420]();
}

uint64_t type metadata accessor for SeparatorStyle()
{
  return MEMORY[0x24BEAB540]();
}

uint64_t static Command.directInvocation(identifier:payload:isNavigation:)()
{
  return MEMORY[0x24BEAD1C0]();
}

uint64_t type metadata accessor for Command()
{
  return MEMORY[0x24BEAD208]();
}

uint64_t static DeviceIdiom.== infix(_:_:)()
{
  return MEMORY[0x24BEA8958]();
}

uint64_t type metadata accessor for DeviceIdiom()
{
  return MEMORY[0x24BEA89B0]();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t Animatable<>.animatableData.modify()
{
  return MEMORY[0x24BDEAE90]();
}

uint64_t static Animatable<>._makeAnimatable(value:inputs:)()
{
  return MEMORY[0x24BDEAEB8]();
}

uint64_t static ColorScheme.== infix(_:_:)()
{
  return MEMORY[0x24BDEB3E8]();
}

uint64_t type metadata accessor for ColorScheme()
{
  return MEMORY[0x24BDEB420]();
}

uint64_t type metadata accessor for Environment.Content()
{
  return MEMORY[0x24BDEB568]();
}

uint64_t StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)()
{
  return MEMORY[0x24BDEB7C0]();
}

uint64_t static ViewModifier._makeView(modifier:inputs:body:)()
{
  return MEMORY[0x24BDEBDE8]();
}

uint64_t static ViewModifier._makeViewList(modifier:inputs:body:)()
{
  return MEMORY[0x24BDEBDF8]();
}

uint64_t static ViewModifier._viewListCount(inputs:body:)()
{
  return MEMORY[0x24BDEBE08]();
}

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return MEMORY[0x24BDEBEC8]();
}

uint64_t GeometryProxy.size.getter()
{
  return MEMORY[0x24BDEC128]();
}

uint64_t static PreferenceKey._isReadableByHost.getter()
{
  return MEMORY[0x24BDEC350]();
}

uint64_t static PreferenceKey._includesRemovedValues.getter()
{
  return MEMORY[0x24BDEC360]();
}

uint64_t type metadata accessor for DynamicTypeSize()
{
  return MEMORY[0x24BDECF48]();
}

uint64_t static LayoutDirection.== infix(_:_:)()
{
  return MEMORY[0x24BDED120]();
}

uint64_t type metadata accessor for LayoutDirection()
{
  return MEMORY[0x24BDED138]();
}

uint64_t type metadata accessor for ModifiedContent()
{
  return MEMORY[0x24BDED2D8]();
}

uint64_t static PreviewProvider.platform.getter()
{
  return MEMORY[0x24BDED380]();
}

uint64_t static PreviewProvider._platform.getter()
{
  return MEMORY[0x24BDED390]();
}

uint64_t static PreviewProvider._previews.getter()
{
  return MEMORY[0x24BDED3A0]();
}

uint64_t type metadata accessor for RoundedRectangle()
{
  return MEMORY[0x24BDED9A0]();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return MEMORY[0x24BDEDBB0]();
}

uint64_t EnvironmentObject.error()()
{
  return MEMORY[0x24BDEDE48]();
}

uint64_t EnvironmentObject.init()()
{
  return MEMORY[0x24BDEDE68]();
}

uint64_t EnvironmentValues.currentIdiom.getter()
{
  return MEMORY[0x24BEAD5D8]();
}

uint64_t EnvironmentValues.currentIdiom.setter()
{
  return MEMORY[0x24BEAD5F0]();
}

uint64_t EnvironmentValues.colorScheme.getter()
{
  return MEMORY[0x24BDEDEF0]();
}

uint64_t EnvironmentValues.colorScheme.setter()
{
  return MEMORY[0x24BDEDF00]();
}

uint64_t EnvironmentValues.dynamicTypeSize.getter()
{
  return MEMORY[0x24BDEE018]();
}

uint64_t EnvironmentValues.dynamicTypeSize.setter()
{
  return MEMORY[0x24BDEE030]();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return MEMORY[0x24BDEE040]();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return MEMORY[0x24BDEE050]();
}

uint64_t EnvironmentValues.layoutDirection.getter()
{
  return MEMORY[0x24BDEE068]();
}

uint64_t EnvironmentValues.layoutDirection.setter()
{
  return MEMORY[0x24BDEE078]();
}

uint64_t EnvironmentValues.minimumScaleFactor.getter()
{
  return MEMORY[0x24BDEE188]();
}

uint64_t EnvironmentValues.minimumScaleFactor.setter()
{
  return MEMORY[0x24BDEE1A0]();
}

uint64_t EnvironmentValues.font.getter()
{
  return MEMORY[0x24BDEE388]();
}

uint64_t EnvironmentValues.font.setter()
{
  return MEMORY[0x24BDEE398]();
}

uint64_t EnvironmentValues.locale.getter()
{
  return MEMORY[0x24BDEE3D0]();
}

uint64_t EnvironmentValues.locale.setter()
{
  return MEMORY[0x24BDEE3E0]();
}

uint64_t EnvironmentValues.init()()
{
  return MEMORY[0x24BDEE4E8]();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return MEMORY[0x24BDEE4F0]();
}

uint64_t static VerticalAlignment.center.getter()
{
  return MEMORY[0x24BDEE738]();
}

uint64_t type metadata accessor for RoundedCornerStyle()
{
  return MEMORY[0x24BDEEB80]();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return MEMORY[0x24BDEEF68]();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return MEMORY[0x24BDEF3A8]();
}

uint64_t static PrimitiveButtonStyle<>.rfButton.getter()
{
  return MEMORY[0x24BEAD698]();
}

uint64_t static HierarchicalShapeStyle.quaternary.getter()
{
  return MEMORY[0x24BDEFC90]();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return MEMORY[0x24BDF1428]();
}

uint64_t static Edge.Set.all.getter()
{
  return MEMORY[0x24BDF14B0]();
}

uint64_t type metadata accessor for Font.Design()
{
  return MEMORY[0x24BDF1680]();
}

uint64_t static Font.system(size:weight:design:)()
{
  return MEMORY[0x24BDF1748]();
}

uint64_t static Font.title2.getter()
{
  return MEMORY[0x24BDF1780]();
}

uint64_t type metadata accessor for Font.TextStyle()
{
  return MEMORY[0x24BDF1908]();
}

Swift::Void __swiftcall Path.closeSubpath()()
{
  MEMORY[0x24BDF1AD0]();
}

Swift::Void __swiftcall Path.move(to:)(CGPoint to)
{
  unint64_t v1;
  unint64_t v2;

  MEMORY[0x24BDF1AF8]((__n128)__PAIR128__(v1, *(unint64_t *)&to.x), (__n128)__PAIR128__(v2, *(unint64_t *)&to.y));
}

uint64_t Path.addArc(center:radius:startAngle:endAngle:clockwise:transform:)()
{
  return MEMORY[0x24BDF1B18]();
}

Swift::Void __swiftcall Path.addLine(to:)(CGPoint to)
{
  unint64_t v1;
  unint64_t v2;

  MEMORY[0x24BDF1B38]((__n128)__PAIR128__(v1, *(unint64_t *)&to.x), (__n128)__PAIR128__(v2, *(unint64_t *)&to.y));
}

Swift::Void __swiftcall Path.addCurve(to:control1:control2:)(CGPoint to, CGPoint control1, CGPoint control2)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  MEMORY[0x24BDF1B58]((__n128)__PAIR128__(v3, *(unint64_t *)&to.x), (__n128)__PAIR128__(v4, *(unint64_t *)&to.y), (__n128)__PAIR128__(v5, *(unint64_t *)&control1.x), (__n128)__PAIR128__(v6, *(unint64_t *)&control1.y), (__n128)__PAIR128__(v7, *(unint64_t *)&control2.x), (__n128)__PAIR128__(v8, *(unint64_t *)&control2.y));
}

uint64_t Path.applying(_:)()
{
  return MEMORY[0x24BDF1B68]();
}

uint64_t Path.init()()
{
  return MEMORY[0x24BDF1B98]();
}

uint64_t Text.foregroundColor(_:)()
{
  return MEMORY[0x24BDF1D00]();
}

uint64_t Text.font(_:)()
{
  return MEMORY[0x24BDF1DD0]();
}

uint64_t Text.init<A>(_:)()
{
  return MEMORY[0x24BDF1FE8]();
}

uint64_t View.eraseToAnyView()()
{
  return MEMORY[0x24BEAD6D8]();
}

uint64_t View.buttonRole(_:)()
{
  return MEMORY[0x24BEAD700]();
}

uint64_t View.separators(_:isOverride:)()
{
  return MEMORY[0x24BEAD760]();
}

uint64_t View.componentTapped(isNavigation:perform:)()
{
  return MEMORY[0x24BEAD7C8]();
}

uint64_t View.mapScope(_:)()
{
  return MEMORY[0x24BDFC010]();
}

uint64_t static View._makeView(view:inputs:)()
{
  return MEMORY[0x24BDF2090]();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return MEMORY[0x24BDF2098]();
}

uint64_t View.background<A>(_:ignoresSafeAreaEdges:)()
{
  return MEMORY[0x24BDF20E0]();
}

uint64_t View.background<A>(_:alignment:)()
{
  return MEMORY[0x24BDF2108]();
}

uint64_t View.buttonStyle<A>(_:)()
{
  return MEMORY[0x24BDF22A8]();
}

uint64_t View.onTapGesture(count:perform:)()
{
  return MEMORY[0x24BDF2540]();
}

uint64_t View.scaledToFill()()
{
  return MEMORY[0x24BDF2560]();
}

uint64_t static View._viewListCount(inputs:)()
{
  return MEMORY[0x24BDF26A0]();
}

uint64_t View.compositingGroup()()
{
  return MEMORY[0x24BDF2940]();
}

uint64_t View.privacySensitive(_:)()
{
  return MEMORY[0x24BDF29D0]();
}

uint64_t View.frame(width:height:alignment:)()
{
  return MEMORY[0x24BDF3620]();
}

uint64_t View.shadow(color:radius:x:y:)()
{
  return MEMORY[0x24BDF3720]();
}

uint64_t View.padding(_:_:)()
{
  return MEMORY[0x24BDF37E8]();
}

uint64_t View.modifier<A>(_:)()
{
  return MEMORY[0x24BDF38B8]();
}

uint64_t View.clipShape<A>(_:style:)()
{
  return MEMORY[0x24BDF3988]();
}

uint64_t static Angle.== infix(_:_:)()
{
  return MEMORY[0x24BDF3BA0]();
}

uint64_t static Color.red.getter()
{
  return MEMORY[0x24BDF3C80]();
}

uint64_t static Color.black.getter()
{
  return MEMORY[0x24BDF3CF8]();
}

uint64_t static Color.clear.getter()
{
  return MEMORY[0x24BDF3D08]();
}

uint64_t static Color.green.getter()
{
  return MEMORY[0x24BDF3D20]();
}

uint64_t static Color.white.getter()
{
  return MEMORY[0x24BDF3D28]();
}

uint64_t Color.opacity(_:)()
{
  return MEMORY[0x24BDF3D70]();
}

uint64_t static Color.secondary.getter()
{
  return MEMORY[0x24BDF3E00]();
}

uint64_t Color.init(_:bundle:)()
{
  return MEMORY[0x24BDF3E80]();
}

uint64_t Image.init(systemName:)()
{
  return MEMORY[0x24BDF3F88]();
}

uint64_t type metadata accessor for Image.ResizingMode()
{
  return MEMORY[0x24BDF3FE0]();
}

uint64_t Image.init(_internalSystemName:)()
{
  return MEMORY[0x24BDF4040]();
}

uint64_t Image.resizable(capInsets:resizingMode:)()
{
  return MEMORY[0x24BDF40E0]();
}

uint64_t Image.init(_:bundle:)()
{
  return MEMORY[0x24BDF4138]();
}

uint64_t Label.init(title:icon:)()
{
  return MEMORY[0x24BDF4148]();
}

uint64_t Label<>.init<A>(_:systemImage:)()
{
  return MEMORY[0x24BDF4168]();
}

uint64_t Shape.sizeThatFits(_:)()
{
  return MEMORY[0x24BDF4210]();
}

uint64_t static Shape._makeViewList(view:inputs:)()
{
  return MEMORY[0x24BDF4220]();
}

uint64_t Shape.layoutDirectionBehavior.getter()
{
  return MEMORY[0x24BDF4228]();
}

uint64_t Shape.body.getter()
{
  return MEMORY[0x24BDF4240]();
}

uint64_t static Shape.role.getter()
{
  return MEMORY[0x24BDF4250]();
}

uint64_t static Shape._makeView(view:inputs:)()
{
  return MEMORY[0x24BDF4270]();
}

uint64_t Button.init(action:label:)()
{
  return MEMORY[0x24BDF4348]();
}

uint64_t Circle.path(in:)()
{
  return MEMORY[0x24BDF4408]();
}

uint64_t HStack.init(alignment:spacing:content:)()
{
  return MEMORY[0x24BDF4468]();
}

uint64_t type metadata accessor for HStack()
{
  return MEMORY[0x24BDF4478]();
}

uint64_t ZStack.init(alignment:content:)()
{
  return MEMORY[0x24BDF4720]();
}

uint64_t type metadata accessor for ZStack()
{
  return MEMORY[0x24BDF4738]();
}

uint64_t ForEach<>.init(_:id:content:)()
{
  return MEMORY[0x24BDF4998]();
}

uint64_t static Alignment.center.getter()
{
  return MEMORY[0x24BDF4F10]();
}

uint64_t Namespace.wrappedValue.getter()
{
  return MEMORY[0x24BDF5250]();
}

uint64_t ShareLink<>.init<>(item:subject:message:onPresentationChanged:)()
{
  return MEMORY[0x24BDF5328]();
}

uint64_t type metadata accessor for TupleView()
{
  return MEMORY[0x24BDF53F8]();
}

uint64_t TupleView.init(_:)()
{
  return MEMORY[0x24BDF5410]();
}

uint64_t type metadata accessor for ButtonItemButtonStyle.Role()
{
  return MEMORY[0x24BEAD988]();
}

uint64_t SnippetPreview.init(snippetModel:content:)()
{
  return MEMORY[0x24BEAD9D0]();
}

uint64_t type metadata accessor for RFImageView()
{
  return MEMORY[0x24BEADA40]();
}

uint64_t RFImageView.init(_:)()
{
  return MEMORY[0x24BEADA70]();
}

uint64_t ActionHandler.wrappedValue.getter()
{
  return MEMORY[0x24BEADAE0]();
}

uint64_t ActionHandler.init()()
{
  return MEMORY[0x24BEADAF0]();
}

uint64_t type metadata accessor for ActionHandler()
{
  return MEMORY[0x24BEADB00]();
}

uint64_t type metadata accessor for RFButtonStyle()
{
  return MEMORY[0x24BEADB80]();
}

uint64_t ComponentStack.init(content:)()
{
  return MEMORY[0x24BEADBD8]();
}

uint64_t type metadata accessor for MapAspectRatio()
{
  return MEMORY[0x24BEADC60]();
}

uint64_t type metadata accessor for InteractionType()
{
  return MEMORY[0x24BEADCA8]();
}

uint64_t DisambiguationView.init(title:content:)()
{
  return MEMORY[0x24BEADE20]();
}

uint64_t SimpleItemRichView.init(text1:text2:text3:text4:text5:text6:text7:text8:thumbnail:)()
{
  return MEMORY[0x24BEADE80]();
}

uint64_t type metadata accessor for SimpleItemRichView()
{
  return MEMORY[0x24BEADE98]();
}

uint64_t ButtonContainerView.init(buttons:)()
{
  return MEMORY[0x24BEADEE8]();
}

uint64_t type metadata accessor for ButtonContainerView()
{
  return MEMORY[0x24BEADF00]();
}

uint64_t DisambiguationTitle.init(text1:thumbnail:)()
{
  return MEMORY[0x24BEADF20]();
}

uint64_t type metadata accessor for DisambiguationTitle()
{
  return MEMORY[0x24BEADF30]();
}

uint64_t PrimaryHeaderRichView.init(text1:text2:text3:text4:thumbnail:addTint:)()
{
  return MEMORY[0x24BEAE040]();
}

uint64_t type metadata accessor for PrimaryHeaderRichView()
{
  return MEMORY[0x24BEAE048]();
}

uint64_t StandardActionHandler.perform(_:interactionType:)()
{
  return MEMORY[0x24BEAE090]();
}

uint64_t type metadata accessor for StandardActionHandler()
{
  return MEMORY[0x24BEAE0A0]();
}

uint64_t DisambiguationStandardView.init(header:content:)()
{
  return MEMORY[0x24BEAE320]();
}

uint64_t dispatch thunk of Context.didEndEditing()()
{
  return MEMORY[0x24BEAE488]();
}

uint64_t dispatch thunk of Context.willBeginEditing()()
{
  return MEMORY[0x24BEAE490]();
}

uint64_t type metadata accessor for Context()
{
  return MEMORY[0x24BEAE578]();
}

uint64_t MapView.init(markers:annotations:mapItemIdentifiers:polyline:aspectRatio:cameraDistance:showsUserLocation:)()
{
  return MEMORY[0x24BEAE5A0]();
}

uint64_t type metadata accessor for MapView()
{
  return MEMORY[0x24BEAE5A8]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x24BDCF808]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x24BEE0618]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t String.init(format:_:)()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x24BEE0B20]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BB8](a1._countAndFlagsBits, a1._object);
}

{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t RFMapMarker.init(coordinate:title:image:tint:)()
{
  return MEMORY[0x24BEAE5D0]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t VRXIdiom.isWatchOS.getter()
{
  return MEMORY[0x24BEAE630]();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t Substring.subscript.getter()
{
  return MEMORY[0x24BEE1E50]();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t StringProtocol.addingPercentEncoding(withAllowedCharacters:)()
{
  return MEMORY[0x24BDD0570]();
}

uint64_t StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)()
{
  return MEMORY[0x24BEE5E68]();
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

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
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

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x24BEE3098]();
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

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x24BEE3350]();
}

{
  return MEMORY[0x24BEE3360]();
}

{
  return MEMORY[0x24BEE3370]();
}

{
  return MEMORY[0x24BEE3378]();
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

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x24BEE34A0]();
}

{
  return MEMORY[0x24BEE34B0]();
}

{
  return MEMORY[0x24BEE34C0]();
}

{
  return MEMORY[0x24BEE34C8]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x24BEE42F8](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
  MEMORY[0x24BEE4300](a1);
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

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x24BEE4C28]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x24BEE4E00]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

