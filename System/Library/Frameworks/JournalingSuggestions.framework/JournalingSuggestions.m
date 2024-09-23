NSData *createUrlForImage(_:)@<X0>(UIImage *a1@<X0>, char *a2@<X8>)
{
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
  char *v14;
  id v15;
  id v16;
  void (*v17)(char *, uint64_t);
  UIImage *v18;
  char *v19;
  void (*v20)(char *, uint64_t);
  NSData *v21;
  NSData *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  NSData *result;
  NSData *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  uint64_t v35;

  v34 = a2;
  v3 = type metadata accessor for UUID();
  v4 = *(_QWORD *)(v3 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for URL();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v32 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v33 = (char *)&v31 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v31 - v13;
  v15 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v16 = objc_msgSend(v15, sel_temporaryDirectory);

  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  UUID.init()();
  UUID.uuidString.getter();
  v17 = *(void (**)(char *, uint64_t))(v4 + 8);
  v18 = a1;
  v17(v6, v3);
  v19 = v34;
  URL.appendingPathComponent(_:)();
  swift_bridgeObjectRelease();
  v20 = *(void (**)(char *, uint64_t))(v8 + 8);
  v20(v14, v7);
  v21 = UIImageHEICRepresentation(v18);
  if (v21)
  {
    v22 = v21;
    v23 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v25 = v24;

    outlined copy of Data._Representation(v23, v25);
    v26 = v33;
  }
  else
  {
    v26 = v32;
    result = UIImagePNGRepresentation(v18);
    if (!result)
      return result;
    v28 = result;
    v23 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v25 = v29;

    outlined copy of Data._Representation(v23, v25);
  }
  URL.appendingPathExtension(_:)();
  outlined consume of Data._Representation(v23, v25);
  v20(v19, v7);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v19, v26, v7);
  outlined copy of Data._Representation(v23, v25);
  v30 = v35;
  Data.write(to:options:)();
  if (v30)
  {
    outlined consume of Data._Representation(v23, v25);
    outlined consume of Data?(v23, v25);
    return (NSData *)((uint64_t (*)(char *, uint64_t))v20)(v19, v7);
  }
  else
  {
    outlined consume of Data?(v23, v25);
    return (NSData *)outlined consume of Data._Representation(v23, v25);
  }
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

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return outlined consume of Data._Representation(a1, a2);
  return a1;
}

uint64_t prepareUrlAccess(_:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[9] = a1;
  v2[10] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t prepareUrlAccess(_:)()
{
  _QWORD *v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t, uint64_t);
  NSURL *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(void);
  uint64_t v24;
  uint64_t v25;

  v1 = v0[12];
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1570]), sel_init);
  v3 = type metadata accessor for URL();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56);
  v5(v1, 1, 1, v3);
  URL._bridgeToObjectiveC()(v6);
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v1;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = partial apply for closure #1 in prepareUrlAccess(_:);
  *(_QWORD *)(v10 + 24) = v9;
  v0[6] = partial apply for thunk for @callee_guaranteed (@in_guaranteed URL) -> ();
  v0[7] = v10;
  v0[2] = MEMORY[0x24BDAC760];
  v0[3] = 1107296256;
  v0[4] = thunk for @escaping @callee_guaranteed (@in_guaranteed URL) -> ();
  v0[5] = &block_descriptor;
  v11 = _Block_copy(v0 + 2);
  swift_retain();
  swift_release();
  v0[8] = 0;
  objc_msgSend(v2, sel_coordinateReadingItemAtURL_options_error_byAccessor_, v8, 0, v0 + 8, v11);
  _Block_release(v11);

  v12 = (id)v0[8];
  LOBYTE(v11) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v11 & 1) != 0)
    __break(1u);
  v13 = v0[12];
  if (v12)
  {
    v14 = v12;
    swift_willThrow();

    outlined destroy of URL?(v13, &demangling cache variable for type metadata for URL?);
  }
  else
  {
    v15 = v0[11];
    outlined init with copy of URL?(v0[12], v15, &demangling cache variable for type metadata for URL?);
    v16 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v15, 1, v3);
    v18 = v0[11];
    v17 = v0[12];
    if (v16 != 1)
    {
      v24 = v0[9];

      (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v24, v18, v3);
      outlined destroy of URL?(v17, &demangling cache variable for type metadata for URL?);
      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
      v22 = (uint64_t (*)(void))v0[1];
      return v22();
    }
    v25 = v0[10];
    outlined destroy of URL?(v18, &demangling cache variable for type metadata for URL?);
    type metadata accessor for JournalingSuggestionsError();
    lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError((unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestionsError and conformance JournalingSuggestionsError, (uint64_t (*)(uint64_t))type metadata accessor for JournalingSuggestionsError, (uint64_t)&protocol conformance descriptor for JournalingSuggestionsError);
    swift_allocError();
    v19 = v5;
    v21 = v20;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v20, v25, v3);
    v19(v21, 0, 1, v3);
    swift_storeEnumTagMultiPayload();
    swift_willThrow();

    outlined destroy of URL?(v17, &demangling cache variable for type metadata for URL?);
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  v22 = (uint64_t (*)(void))v0[1];
  return v22();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23493ADF4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void closure #1 in prepareUrlAccess(_:)(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;

  v4 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v5 = URL.path.getter();
  v6 = (void *)MEMORY[0x23493A4E8](v5);
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v4, sel_fileExistsAtPath_, v6);

  if (v7)
  {
    outlined destroy of URL?(a2, &demangling cache variable for type metadata for URL?);
    v8 = type metadata accessor for URL();
    v9 = *(_QWORD *)(v8 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(a2, a1, v8);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v9 + 56))(a2, 0, 1, v8);
  }
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed URL) -> ()(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *);
  uint64_t v8;

  v2 = type metadata accessor for URL();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))(a1 + 32);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  v6(v5);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void assetImageContentToUrl(_:)(void *a1@<X0>, char *a2@<X8>)
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
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  int v23;
  void (*v24)(char *, uint64_t, uint64_t, uint64_t);
  void (*v25)(char *, char *, uint64_t);
  uint64_t v26;
  UIImage *v27;
  id v28;
  id v29;
  void (*v30)(char *, uint64_t);
  NSData *v31;
  NSData *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char *v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  NSData *v41;
  NSData *v42;
  unint64_t v43;
  void (*v44)(char *, char *, uint64_t);
  uint64_t v45;
  _QWORD *v46;
  id v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  id v54;

  v52 = a2;
  v3 = type metadata accessor for UUID();
  v50 = *(_QWORD *)(v3 - 8);
  v51 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for URL();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v48 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v49 = (char *)&v48 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v48 - v16;
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v48 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v48 - v21;
  v54 = objc_msgSend(a1, sel_content);
  v23 = swift_dynamicCast();
  v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  if (v23)
  {
    v24(v8, 0, 1, v9);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
    {
      v25 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
      v25(v22, v8, v9);
      v25(v52, v22, v9);
      return;
    }
  }
  else
  {
    v24(v8, 1, 1, v9);
  }
  outlined destroy of URL?((uint64_t)v8, &demangling cache variable for type metadata for URL?);
  objc_msgSend(a1, sel_content);
  objc_opt_self();
  v26 = swift_dynamicCastObjCClass();
  if (v26)
  {
    v27 = (UIImage *)v26;
    v28 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    v29 = objc_msgSend(v28, sel_temporaryDirectory);

    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    UUID.init()();
    UUID.uuidString.getter();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v5, v51);
    URL.appendingPathComponent(_:)();
    swift_bridgeObjectRelease();
    v30 = *(void (**)(char *, uint64_t))(v10 + 8);
    v30(v17, v9);
    v31 = UIImageHEICRepresentation(v27);
    if (v31)
    {
      v32 = v31;
      v33 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      v35 = v34;

      outlined copy of Data._Representation(v33, v35);
      v36 = v49;
    }
    else
    {
      v41 = UIImagePNGRepresentation(v27);
      if (!v41)
      {
        v44 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
        goto LABEL_19;
      }
      v42 = v41;
      v33 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      v35 = v43;

      outlined copy of Data._Representation(v33, v35);
      v36 = v48;
    }
    URL.appendingPathExtension(_:)();
    outlined consume of Data._Representation(v33, v35);
    v30(v20, v9);
    v44 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v44(v20, v36, v9);
    v45 = v53;
    outlined copy of Data._Representation(v33, v35);
    Data.write(to:options:)();
    if (v45)
    {
      outlined consume of Data._Representation(v33, v35);
      outlined consume of Data?(v33, v35);
      v30(v20, v9);
LABEL_20:
      swift_unknownObjectRelease();
      return;
    }
    outlined consume of Data?(v33, v35);
    outlined consume of Data._Representation(v33, v35);
LABEL_19:
    v44(v52, v20, v9);
    goto LABEL_20;
  }
  swift_unknownObjectRelease();
  v37 = objc_msgSend(a1, sel_content);
  objc_opt_self();
  v38 = swift_dynamicCastObjCClass();
  if (v38)
  {
    v39 = (void *)v38;
    if (getCurrentTheme()() == 2)
    {
      v40 = objc_msgSend(v39, sel_darkURL);
      static URL._unconditionallyBridgeFromObjectiveC(_:)();
      swift_unknownObjectRelease();

    }
    else
    {
      v47 = objc_msgSend(v39, sel_lightURL);
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      swift_unknownObjectRelease();
    }
  }
  else
  {
    swift_unknownObjectRelease();
    type metadata accessor for JournalingSuggestionsError();
    lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError((unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestionsError and conformance JournalingSuggestionsError, (uint64_t (*)(uint64_t))type metadata accessor for JournalingSuggestionsError, (uint64_t)&protocol conformance descriptor for JournalingSuggestionsError);
    swift_allocError();
    *v46 = 0x6D4949552C4C5255;
    v46[1] = 0xEB00000000656761;
    v46[2] = 0;
    v46[3] = 0;
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
  }
}

uint64_t getCurrentTheme()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t result;
  uint64_t v5;
  _QWORD aBlock[6];
  uint64_t v7;

  v7 = 1;
  type metadata accessor for OS_dispatch_queue();
  v0 = static OS_dispatch_queue.main.getter();
  v1 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = &v7;
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = partial apply for closure #1 in getCurrentTheme();
  *(_QWORD *)(v2 + 24) = v1;
  aBlock[4] = partial apply for thunk for @callee_guaranteed (@in_guaranteed URL) -> ();
  aBlock[5] = v2;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
  aBlock[3] = &block_descriptor_13;
  v3 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  dispatch_sync((dispatch_queue_t)v0, v3);

  _Block_release(v3);
  LOBYTE(v0) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v0 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v5 = v7;
    swift_release();
    return v5;
  }
  return result;
}

uint64_t makeDateInternal(start:end:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
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
  char *v22;
  uint64_t v23;
  char *v24;
  unsigned int (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  void (*v28)(char *, char *, uint64_t);
  void (*v29)(char *, char *, uint64_t);
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;

  v34 = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v33 - v9;
  v11 = type metadata accessor for Date();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v36 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v35 = (char *)&v33 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v33 - v18;
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v33 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v33 - v23;
  outlined init with copy of URL?(a1, (uint64_t)v10, &demangling cache variable for type metadata for Date?);
  v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  if (v25(v10, 1, v11) == 1)
  {
    outlined destroy of URL?((uint64_t)v10, &demangling cache variable for type metadata for Date?);
    v26 = type metadata accessor for DateInterval();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(a3, 1, 1, v26);
  }
  else
  {
    v33 = a3;
    v28 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
    v28(v24, v10, v11);
    outlined init with copy of URL?(v34, (uint64_t)v8, &demangling cache variable for type metadata for Date?);
    v29 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
    v29(v19, v24, v11);
    if (v25(v8, 1, v11) == 1)
    {
      v28(v22, v19, v11);
      outlined destroy of URL?((uint64_t)v8, &demangling cache variable for type metadata for Date?);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v12 + 8))(v19, v11);
      v28(v22, v8, v11);
    }
    v29(v35, v24, v11);
    v29(v36, v22, v11);
    v30 = v33;
    DateInterval.init(start:end:)();
    v31 = *(void (**)(char *, uint64_t))(v12 + 8);
    v31(v22, v11);
    v31(v24, v11);
    v32 = type metadata accessor for DateInterval();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v30, 0, 1, v32);
  }
}

void closure #1 in getCurrentTheme()(_QWORD *a1)
{
  id v2;
  id v3;
  id v4;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB08]), sel_init);
  v3 = objc_msgSend(v2, sel_traitCollection);
  v4 = objc_msgSend(v3, sel_userInterfaceStyle);

  *a1 = v4;
}

uint64_t thunk for @escaping @callee_guaranteed () -> ()(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

_QWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance UIUserInterfaceStyle@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance UIUserInterfaceStyle(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance MOSuggestionAssetsType(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance MOSuggestionAssetsType(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance MOSuggestionAssetsType@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance MOSuggestionAssetsType(uint64_t a1, id *a2)
{
  uint64_t result;

  result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance MOSuggestionAssetsType(uint64_t a1, id *a2)
{
  char v3;

  v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance MOSuggestionAssetsType@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = MEMORY[0x23493A4E8](v2);
  result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance MOSuggestionSheetTask(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_233A5F994()
{
  return swift_deallocObject();
}

void partial apply for closure #1 in prepareUrlAccess(_:)(uint64_t a1)
{
  uint64_t v1;

  closure #1 in prepareUrlAccess(_:)(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_233A5F9AC()
{
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @callee_guaranteed (@in_guaranteed URL) -> ()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t type metadata accessor for JournalingSuggestionsError()
{
  uint64_t result;

  result = type metadata singleton initialization cache for JournalingSuggestionsError;
  if (!type metadata singleton initialization cache for JournalingSuggestionsError)
    return swift_getSingletonMetadata();
  return result;
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

uint64_t sub_233A5FA6C()
{
  return swift_deallocObject();
}

void partial apply for closure #1 in getCurrentTheme()()
{
  uint64_t v0;

  closure #1 in getCurrentTheme()(*(_QWORD **)(v0 + 16));
}

uint64_t sub_233A5FA84()
{
  return swift_deallocObject();
}

uint64_t outlined init with copy of URL?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t outlined destroy of URL?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for JournalingSuggestionsError(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    v5 = (char *)&loc_233A5FB68 + 4 * byte_233A8D620[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

uint64_t destroy for JournalingSuggestionsError(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      v3 = type metadata accessor for URL();
      v4 = *(_QWORD *)(v3 - 8);
      result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, 1, v3);
      if (!(_DWORD)result)
        result = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
      break;
    case 1:
    case 3:
      goto LABEL_5;
    case 2:
      swift_bridgeObjectRelease();
LABEL_5:
      result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

void initializeWithCopy for JournalingSuggestionsError()
{
  char *v0;

  v0 = (char *)sub_233A5FD88 + 4 * byte_233A8D628[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void *sub_233A5FD88()
{
  void *v0;
  const void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = type metadata accessor for URL();
  v3 = *(_QWORD *)(v2 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2))
  {
    v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v0, v1, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v3 + 16))(v0, v1, v2);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v0, 0, 1, v2);
  }
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t assignWithCopy for JournalingSuggestionsError(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    outlined destroy of JournalingSuggestionsError(result);
    v2 = (char *)&loc_233A5FEE4 + 4 * byte_233A8D62C[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

uint64_t outlined destroy of JournalingSuggestionsError(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for JournalingSuggestionsError();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *initializeWithTake for JournalingSuggestionsError(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v6 = type metadata accessor for URL();
    v7 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithTake for JournalingSuggestionsError(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a1 != a2)
  {
    outlined destroy of JournalingSuggestionsError((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v6 = type metadata accessor for URL();
      v7 = *(_QWORD *)(v6 - 8);
      if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
        (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestionsError(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestionsError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t destructiveInjectEnumTag for JournalingSuggestionsError()
{
  return swift_storeEnumTagMultiPayload();
}

void type metadata completion function for JournalingSuggestionsError()
{
  unint64_t v0;

  type metadata accessor for URL?();
  if (v0 <= 0x3F)
    swift_initEnumMetadataMultiPayload();
}

void type metadata accessor for URL?()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for URL?)
  {
    type metadata accessor for URL();
    v0 = type metadata accessor for Optional();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for URL?);
  }
}

void type metadata accessor for HKWorkoutActivityType(uint64_t a1)
{
  type metadata accessor for HKWorkoutActivityType(a1, &lazy cache variable for type metadata for HKWorkoutActivityType);
}

void type metadata accessor for MOSuggestionSheetViewState(uint64_t a1)
{
  type metadata accessor for HKWorkoutActivityType(a1, &lazy cache variable for type metadata for MOSuggestionSheetViewState);
}

void type metadata accessor for MOSuggestionAssetMetadataKey(uint64_t a1)
{
  type metadata accessor for HKWorkoutActivityType(a1, &lazy cache variable for type metadata for MOSuggestionAssetMetadataKey);
}

void type metadata accessor for UIUserInterfaceStyle(uint64_t a1)
{
  type metadata accessor for HKWorkoutActivityType(a1, &lazy cache variable for type metadata for UIUserInterfaceStyle);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance MOSuggestionAssetMotionActivityType()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3)
    v5 = 1;
  else
    v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance MOSuggestionAssetsType()
{
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type MOSuggestionAssetsType and conformance MOSuggestionAssetsType, (uint64_t (*)(uint64_t))type metadata accessor for MOSuggestionAssetsType, (uint64_t)&protocol conformance descriptor for MOSuggestionAssetsType);
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type MOSuggestionAssetsType and conformance MOSuggestionAssetsType, (uint64_t (*)(uint64_t))type metadata accessor for MOSuggestionAssetsType, (uint64_t)&protocol conformance descriptor for MOSuggestionAssetsType);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance MOSuggestionAssetsType@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = MEMORY[0x23493A4E8](*a1, a1[1]);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance MOSuggestionAssetMetadataKey()
{
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError((unint64_t *)&lazy protocol witness table cache variable for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey, (uint64_t (*)(uint64_t))type metadata accessor for MOSuggestionAssetMetadataKey, (uint64_t)&protocol conformance descriptor for MOSuggestionAssetMetadataKey);
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey, (uint64_t (*)(uint64_t))type metadata accessor for MOSuggestionAssetMetadataKey, (uint64_t)&protocol conformance descriptor for MOSuggestionAssetMetadataKey);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t base witness table accessor for RawRepresentable in MOSuggestionAssetMetadataKey()
{
  return lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey, (uint64_t (*)(uint64_t))type metadata accessor for MOSuggestionAssetMetadataKey, (uint64_t)&protocol conformance descriptor for MOSuggestionAssetMetadataKey);
}

uint64_t lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23493AE0C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in MOSuggestionAssetMetadataKey()
{
  return lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey, (uint64_t (*)(uint64_t))type metadata accessor for MOSuggestionAssetMetadataKey, (uint64_t)&protocol conformance descriptor for MOSuggestionAssetMetadataKey);
}

uint64_t base witness table accessor for Equatable in MOSuggestionAssetMetadataKey()
{
  return lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey, (uint64_t (*)(uint64_t))type metadata accessor for MOSuggestionAssetMetadataKey, (uint64_t)&protocol conformance descriptor for MOSuggestionAssetMetadataKey);
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance MOSuggestionAssetMotionActivityType()
{
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type MOSuggestionAssetMotionActivityType and conformance MOSuggestionAssetMotionActivityType, (uint64_t (*)(uint64_t))type metadata accessor for MOSuggestionAssetMotionActivityType, (uint64_t)&protocol conformance descriptor for MOSuggestionAssetMotionActivityType);
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type MOSuggestionAssetMotionActivityType and conformance MOSuggestionAssetMotionActivityType, (uint64_t (*)(uint64_t))type metadata accessor for MOSuggestionAssetMotionActivityType, (uint64_t)&protocol conformance descriptor for MOSuggestionAssetMotionActivityType);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance MOSuggestionAssetsType(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance MOSuggestionAssetsType(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance MOSuggestionAssetsType(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t protocol witness for Hashable.hash(into:) in conformance MOSuggestionAssetMetadataKey()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance MOSuggestionAssetMetadataKey()
{
  Swift::Int v0;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

void type metadata accessor for HKStateOfMindLabel(uint64_t a1)
{
  type metadata accessor for HKWorkoutActivityType(a1, &lazy cache variable for type metadata for HKStateOfMindLabel);
}

void type metadata accessor for HKStateOfMindAssociation(uint64_t a1)
{
  type metadata accessor for HKWorkoutActivityType(a1, &lazy cache variable for type metadata for HKStateOfMindAssociation);
}

void type metadata accessor for HKStateOfMindKind(uint64_t a1)
{
  type metadata accessor for HKWorkoutActivityType(a1, &lazy cache variable for type metadata for HKStateOfMindKind);
}

void type metadata accessor for MOSuggestionAssetMotionActivityType(uint64_t a1)
{
  type metadata accessor for HKWorkoutActivityType(a1, &lazy cache variable for type metadata for MOSuggestionAssetMotionActivityType);
}

void type metadata accessor for MOSuggestionAssetsType(uint64_t a1)
{
  type metadata accessor for HKWorkoutActivityType(a1, &lazy cache variable for type metadata for MOSuggestionAssetsType);
}

void type metadata accessor for HKWorkoutActivityType(uint64_t a1, unint64_t *a2)
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

uint64_t base witness table accessor for RawRepresentable in MOSuggestionAssetsType()
{
  return lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type MOSuggestionAssetsType and conformance MOSuggestionAssetsType, (uint64_t (*)(uint64_t))type metadata accessor for MOSuggestionAssetsType, (uint64_t)&protocol conformance descriptor for MOSuggestionAssetsType);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in MOSuggestionAssetsType()
{
  return lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type MOSuggestionAssetsType and conformance MOSuggestionAssetsType, (uint64_t (*)(uint64_t))type metadata accessor for MOSuggestionAssetsType, (uint64_t)&protocol conformance descriptor for MOSuggestionAssetsType);
}

uint64_t base witness table accessor for Equatable in MOSuggestionAssetsType()
{
  return lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type MOSuggestionAssetsType and conformance MOSuggestionAssetsType, (uint64_t (*)(uint64_t))type metadata accessor for MOSuggestionAssetsType, (uint64_t)&protocol conformance descriptor for MOSuggestionAssetsType);
}

uint64_t base witness table accessor for RawRepresentable in MOSuggestionAssetMotionActivityType()
{
  return lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type MOSuggestionAssetMotionActivityType and conformance MOSuggestionAssetMotionActivityType, (uint64_t (*)(uint64_t))type metadata accessor for MOSuggestionAssetMotionActivityType, (uint64_t)&protocol conformance descriptor for MOSuggestionAssetMotionActivityType);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in MOSuggestionAssetMotionActivityType()
{
  return lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type MOSuggestionAssetMotionActivityType and conformance MOSuggestionAssetMotionActivityType, (uint64_t (*)(uint64_t))type metadata accessor for MOSuggestionAssetMotionActivityType, (uint64_t)&protocol conformance descriptor for MOSuggestionAssetMotionActivityType);
}

uint64_t base witness table accessor for Equatable in MOSuggestionAssetMotionActivityType()
{
  return lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type MOSuggestionAssetMotionActivityType and conformance MOSuggestionAssetMotionActivityType, (uint64_t (*)(uint64_t))type metadata accessor for MOSuggestionAssetMotionActivityType, (uint64_t)&protocol conformance descriptor for MOSuggestionAssetMotionActivityType);
}

void SuggestionSheetManager.viewState.setter()
{
  swift_deletedMethodError();
  __break(1u);
}

void static JournalingSuggestion.StateOfMind.loaderError(_:for:)(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (one-time initialization token for bridge != -1)
    swift_once();
  v6 = type metadata accessor for Logger();
  __swift_project_value_buffer(v6, (uint64_t)static Logger.bridge);
  swift_bridgeObjectRetain_n();
  v7 = a3;
  v8 = Logger.logObject.getter();
  v9 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v18 = v11;
    *(_DWORD *)v10 = 136315650;
    type metadata accessor for JournalingSuggestion.StateOfMind(0);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.StateOfMind.Type);
    v12 = String.init<A>(describing:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v12, v13, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    swift_bridgeObjectRetain();
    v17 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v10 + 22) = 2080;
    v14 = objc_msgSend(v7, sel_content, v17, v18);
    v15 = String.init<A>(describing:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_233A5C000, v8, v9, "%s.getAssetLoader, Unexpected content %s: %s", (uint8_t *)v10, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x23493AEA8](v11, -1, -1);
    MEMORY[0x23493AEA8](v10, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t specialized getMetadataValue<A>(_:key:as:)@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  unint64_t v13;
  Swift::String v14;
  Swift::String v15;
  uint64_t v16;
  unint64_t v17;
  Swift::String v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v22;
  unint64_t v23;
  id v24;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  specialized getMetadata<A>(_:key:as:)(a1, a2, (uint64_t)v8);
  v9 = type metadata accessor for Date();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a3, v8, v9);
  outlined destroy of URL?((uint64_t)v8, &demangling cache variable for type metadata for Date?);
  type metadata accessor for JournalingSuggestionsError();
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
  swift_allocError();
  v12 = v11;
  v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v23 = v13;
  v14._countAndFlagsBits = 8250;
  v14._object = (void *)0xE200000000000000;
  String.append(_:)(v14);
  v24 = (id)v9;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date.Type);
  v15._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v15);
  swift_bridgeObjectRelease();
  v16 = v22;
  v17 = v23;
  v22 = 0x203A7465737341;
  v23 = 0xE700000000000000;
  v24 = objc_msgSend(a1, sel_content);
  v18._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v18);
  swift_bridgeObjectRelease();
  v19 = v22;
  v20 = v23;
  *v12 = v16;
  v12[1] = v17;
  v12[2] = v19;
  v12[3] = v20;
  swift_storeEnumTagMultiPayload();
  return swift_willThrow();
}

uint64_t specialized getMetadataValue<A>(_:key:as:)(void *a1, void *a2)
{
  uint64_t v3;
  char v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  Swift::String v8;
  Swift::String v9;
  Swift::String v10;
  uint64_t v12;
  uint64_t v13;

  v3 = specialized getMetadata<A>(_:key:as:)(a1, a2);
  if ((v4 & 1) != 0)
  {
    type metadata accessor for JournalingSuggestionsError();
    lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
    swift_allocError();
    v6 = v5;
    v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v13 = v7;
    v8._countAndFlagsBits = 8250;
    v8._object = (void *)0xE200000000000000;
    String.append(_:)(v8);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Int.Type);
    v9._countAndFlagsBits = String.init<A>(describing:)();
    String.append(_:)(v9);
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_content);
    v10._countAndFlagsBits = String.init<A>(describing:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    *v6 = v12;
    v6[1] = v13;
    v6[2] = 0x203A7465737341;
    v6[3] = 0xE700000000000000;
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
  }
  return v3;
}

{
  uint64_t result;
  char v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  Swift::String v8;
  Swift::String v9;
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;

  result = specialized getMetadata<A>(_:key:as:)(a1, a2);
  if ((v4 & 1) != 0)
  {
    type metadata accessor for JournalingSuggestionsError();
    lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
    swift_allocError();
    v6 = v5;
    v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v12 = v7;
    v8._countAndFlagsBits = 8250;
    v8._object = (void *)0xE200000000000000;
    String.append(_:)(v8);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Double.Type);
    v9._countAndFlagsBits = String.init<A>(describing:)();
    String.append(_:)(v9);
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_content);
    v10._countAndFlagsBits = String.init<A>(describing:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    *v6 = v11;
    v6[1] = v12;
    v6[2] = 0x203A7465737341;
    v6[3] = 0xE700000000000000;
    swift_storeEnumTagMultiPayload();
    return swift_willThrow();
  }
  return result;
}

uint64_t closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, uint64_t a10, void *a11)
{
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
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;
  void *v32;
  char *v33;
  uint64_t v34;
  id v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v49 = a8;
  v50 = a2;
  v47 = a7;
  v48 = a1;
  v44 = a4;
  v45 = a6;
  v42 = a5;
  v37 = a3;
  v46 = a11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  MEMORY[0x24BDAC7A8](v13);
  v41 = (uint64_t)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for Date();
  v17 = *(_QWORD *)(v16 - 8);
  v39 = v16;
  v18 = *(_QWORD *)(v17 + 64);
  v19 = v17;
  MEMORY[0x24BDAC7A8](v16);
  v40 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = v22;
  v23 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v22, 1, 1, v23);
  v38 = v19;
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))((char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), v42, v16);
  outlined init with copy of URL?(a10, (uint64_t)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), &demangling cache variable for type metadata for URL?);
  v24 = (*(unsigned __int8 *)(v19 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v25 = (v18 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  v26 = (v25 + 15) & 0xFFFFFFFFFFFFFFF8;
  v27 = (v26 + 15) & 0xFFFFFFFFFFFFFFF8;
  v28 = (v27 + 15) & 0xFFFFFFFFFFFFFFF8;
  v29 = (*(unsigned __int8 *)(v14 + 80) + v28 + 8) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v30 = (v15 + v29 + 7) & 0xFFFFFFFFFFFFFFF8;
  v31 = (char *)swift_allocObject();
  *((_QWORD *)v31 + 2) = 0;
  *((_QWORD *)v31 + 3) = 0;
  *((_QWORD *)v31 + 4) = a3;
  *((_QWORD *)v31 + 5) = v44;
  (*(void (**)(char *, char *, uint64_t))(v38 + 32))(&v31[v24], v40, v39);
  *(_QWORD *)&v31[v25] = v45;
  *(double *)&v31[v26] = a9;
  *(_QWORD *)&v31[v27] = v47;
  *(_QWORD *)&v31[v28] = v49;
  outlined init with take of URL?(v41, (uint64_t)&v31[v29]);
  v32 = v46;
  *(_QWORD *)&v31[v30] = v46;
  v33 = &v31[(v30 + 15) & 0xFFFFFFFFFFFFFFF8];
  v34 = v50;
  *(_QWORD *)v33 = v48;
  *((_QWORD *)v33 + 1) = v34;
  swift_bridgeObjectRetain();
  v35 = v32;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v43, (uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:), (uint64_t)v31);
  return swift_release();
}

uint64_t closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:)(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  *(_QWORD *)(v9 + 168) = v15;
  *(_OWORD *)(v9 + 152) = v14;
  *(_OWORD *)(v9 + 136) = v13;
  *(_QWORD *)(v9 + 128) = a9;
  *(double *)(v9 + 120) = a1;
  *(_QWORD *)(v9 + 104) = a7;
  *(_QWORD *)(v9 + 112) = a8;
  *(_QWORD *)(v9 + 88) = a5;
  *(_QWORD *)(v9 + 96) = a6;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  *(_QWORD *)(v9 + 176) = swift_task_alloc();
  v10 = type metadata accessor for URL();
  *(_QWORD *)(v9 + 184) = v10;
  *(_QWORD *)(v9 + 192) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v9 + 200) = swift_task_alloc();
  *(_QWORD *)(v9 + 208) = swift_task_alloc();
  *(_QWORD *)(v9 + 216) = type metadata accessor for JournalingSuggestion.StateOfMind(0);
  *(_QWORD *)(v9 + 224) = swift_task_alloc();
  v11 = type metadata accessor for Date();
  *(_QWORD *)(v9 + 232) = v11;
  *(_QWORD *)(v9 + 240) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v9 + 248) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  int *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  char *v25;
  void (*v26)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  void (*v32)(uint64_t, _QWORD);
  uint64_t *boxed_opaque_existential_1;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t, uint64_t);
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = (uint64_t *)(v1 + 32);
    swift_bridgeObjectRetain();
    v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      v6 = *v3++;
      v5 = v6;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4[2] + 1, 1, v4);
      v8 = v4[2];
      v7 = v4[3];
      if (v8 >= v7 >> 1)
        v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v7 > 1), v8 + 1, 1, v4);
      v4[2] = v8 + 1;
      v4[v8 + 4] = v5;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  v9 = *(_QWORD *)(v0 + 96);
  v10 = *(_QWORD *)(v9 + 16);
  if (v10)
  {
    v11 = (uint64_t *)(v9 + 32);
    swift_bridgeObjectRetain();
    v12 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      v14 = *v11++;
      v13 = v14;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v12[2] + 1, 1, v12);
      v16 = v12[2];
      v15 = v12[3];
      if (v16 >= v15 >> 1)
        v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v15 > 1), v16 + 1, 1, v12);
      v12[2] = v16 + 1;
      v12[v16 + 4] = v13;
      --v10;
    }
    while (v10);
    swift_bridgeObjectRelease();
  }
  v17 = *(_QWORD *)(v0 + 240);
  v18 = *(_QWORD *)(v0 + 248);
  v19 = *(_QWORD **)(v0 + 224);
  v20 = *(_QWORD *)(v0 + 232);
  v21 = *(int **)(v0 + 216);
  v40 = *(_QWORD *)(v0 + 192);
  v41 = *(_QWORD *)(v0 + 184);
  v44 = *(_QWORD *)(v0 + 144);
  v45 = *(_QWORD *)(v0 + 176);
  v42 = *(_QWORD *)(v0 + 128);
  v43 = *(_QWORD *)(v0 + 136);
  v22 = *(_QWORD *)(v0 + 104);
  type metadata accessor for HKStateOfMind();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v18, v22, v20);
  specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x24BEE4AF8]);
  v23 = (void *)HKStateOfMind.init(date:kind:valence:labels:associations:metadata:)();
  *(_QWORD *)(v0 + 256) = v23;
  v24 = v21[5];
  *(_DWORD *)(v0 + 296) = v24;
  v25 = (char *)v19 + v24;
  v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v40 + 56);
  *(_QWORD *)(v0 + 264) = v26;
  v26(v25, 1, 1, v41);
  *v19 = v23;
  v27 = v21[6];
  v28 = v21[7];
  v29 = v23;
  *(_QWORD *)((char *)v19 + v27) = specialized static JournalingSuggestion.StateOfMind.uiColorsToGradient(_:)(v42);
  *(_QWORD *)((char *)v19 + v28) = specialized static JournalingSuggestion.StateOfMind.uiColorsToGradient(_:)(v43);
  outlined init with copy of URL?(v44, v45, &demangling cache variable for type metadata for URL?);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v40 + 48))(v45, 1, v41) == 1)
  {
    outlined destroy of URL?(*(_QWORD *)(v0 + 176), &demangling cache variable for type metadata for URL?);
    v30 = *(void **)(v0 + 256);
    v31 = *(_QWORD *)(v0 + 224);
    v32 = *(void (**)(uint64_t, _QWORD))(v0 + 160);
    *(_QWORD *)(v0 + 40) = *(_QWORD *)(v0 + 216);
    *(_QWORD *)(v0 + 48) = &protocol witness table for JournalingSuggestion.StateOfMind;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 16));
    outlined init with copy of JournalingSuggestion.StateOfMind(v31, (uint64_t)boxed_opaque_existential_1);
    v32(v0 + 16, 0);

    outlined destroy of URL?(v0 + 16, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
    outlined destroy of JournalingSuggestion.StateOfMind(v31);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v35 = *(_QWORD *)(v0 + 208);
    v36 = *(_QWORD *)(v0 + 184);
    v37 = *(_QWORD *)(v0 + 176);
    v38 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 192) + 32);
    *(_QWORD *)(v0 + 272) = v38;
    v38(v35, v37, v36);
    v39 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 280) = v39;
    *v39 = v0;
    v39[1] = closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:);
    return prepareUrlAccess(_:)(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 208));
  }
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 288) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, uint64_t);
  void (*v2)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void (*v8)(uint64_t, _QWORD);
  uint64_t *boxed_opaque_existential_1;

  v2 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v0 + 264);
  v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 272);
  v3 = *(_QWORD *)(v0 + 200);
  v4 = *(_QWORD *)(v0 + 184);
  v5 = *(_QWORD *)(v0 + 224) + *(int *)(v0 + 296);
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v0 + 192) + 8))(*(_QWORD *)(v0 + 208), v4);
  outlined destroy of URL?(v5, &demangling cache variable for type metadata for URL?);
  v1(v5, v3, v4);
  v2(v5, 0, 1, v4);
  v6 = *(void **)(v0 + 256);
  v7 = *(_QWORD *)(v0 + 224);
  v8 = *(void (**)(uint64_t, _QWORD))(v0 + 160);
  *(_QWORD *)(v0 + 40) = *(_QWORD *)(v0 + 216);
  *(_QWORD *)(v0 + 48) = &protocol witness table for JournalingSuggestion.StateOfMind;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 16));
  outlined init with copy of JournalingSuggestion.StateOfMind(v7, (uint64_t)boxed_opaque_existential_1);
  v8(v0 + 16, 0);

  outlined destroy of URL?(v0 + 16, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  outlined destroy of JournalingSuggestion.StateOfMind(v7);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void (*v20)(uint64_t, _QWORD);
  uint64_t *boxed_opaque_existential_1;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if (one-time initialization token for bridge != -1)
    swift_once();
  v1 = *(void **)(v0 + 152);
  v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Logger.bridge);
  v3 = v1;
  v4 = Logger.logObject.getter();
  v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(_QWORD *)(v0 + 216);
    v23 = *(id *)(v0 + 288);
    v24 = *(_QWORD *)(v0 + 192);
    v25 = *(_QWORD *)(v0 + 184);
    v26 = *(_QWORD *)(v0 + 208);
    v7 = *(void **)(v0 + 152);
    v8 = swift_slowAlloc();
    v9 = swift_slowAlloc();
    v27 = v9;
    *(_DWORD *)v8 = 136315394;
    *(_QWORD *)(v0 + 56) = v6;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.StateOfMind.Type);
    v10 = String.init<A>(describing:)();
    *(_QWORD *)(v0 + 64) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v11, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2080;
    *(_QWORD *)(v0 + 72) = objc_msgSend(v7, sel_content);
    v12 = String.init<A>(describing:)();
    *(_QWORD *)(v0 + 80) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v12, v13, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_233A5C000, v4, v5, "Unable to access state of mind image url: %s.getAssetLoader, Unexpected content: %s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23493AEA8](v9, -1, -1);
    MEMORY[0x23493AEA8](v8, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v26, v25);
  }
  else
  {
    v14 = *(_QWORD *)(v0 + 208);
    v15 = *(_QWORD *)(v0 + 184);
    v16 = *(_QWORD *)(v0 + 192);
    v17 = *(void **)(v0 + 152);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
  }
  v18 = *(void **)(v0 + 256);
  v19 = *(_QWORD *)(v0 + 224);
  v20 = *(void (**)(uint64_t, _QWORD))(v0 + 160);
  *(_QWORD *)(v0 + 40) = *(_QWORD *)(v0 + 216);
  *(_QWORD *)(v0 + 48) = &protocol witness table for JournalingSuggestion.StateOfMind;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 16));
  outlined init with copy of JournalingSuggestion.StateOfMind(v19, (uint64_t)boxed_opaque_existential_1);
  v20(v0 + 16, 0);

  outlined destroy of URL?(v0 + 16, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  outlined destroy of JournalingSuggestion.StateOfMind(v19);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
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
    outlined init with copy of URL?(v6, (uint64_t)&v15, &demangling cache variable for type metadata for (String, Any));
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

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;

  Hasher.init(_seed:)();
  String.hash(into:)();
  v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

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
  unint64_t i;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v15;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      v12 = ~v5;
      i = (i + 1) & v12;
      if (((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v13 = (_QWORD *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        {
          for (i = (i + 1) & v12; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v12)
          {
            v15 = (_QWORD *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2)
              break;
            if ((_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
              break;
          }
        }
      }
    }
  }
  return i;
}

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
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
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

unint64_t specialized static JournalingSuggestion.StateOfMind.uiColorsToGradient(_:)(unint64_t result)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void **v7;
  void *v8;
  uint64_t v9;

  if (result)
  {
    v1 = result;
    if (result >> 62)
    {
      swift_bridgeObjectRetain();
      v2 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      v2 = *(_QWORD *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    v3 = MEMORY[0x24BEE4AF8];
    if (v2)
    {
      v9 = MEMORY[0x24BEE4AF8];
      result = specialized ContiguousArray.reserveCapacity(_:)();
      if (v2 < 0)
      {
        __break(1u);
        return result;
      }
      if ((v1 & 0xC000000000000001) != 0)
      {
        v4 = 0;
        do
        {
          v5 = v4 + 1;
          v6 = MEMORY[0x23493A800]();
          MEMORY[0x23493A404](v6);
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
          v4 = v5;
        }
        while (v2 != v5);
      }
      else
      {
        v7 = (void **)(v1 + 32);
        do
        {
          v8 = *v7++;
          MEMORY[0x23493A404](v8);
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
          --v2;
        }
        while (v2);
      }
      v3 = v9;
    }
    return MEMORY[0x23493A47C](v3);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t (*specialized static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:)(void *a1))(uint64_t a1, uint64_t a2)
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
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v22;
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  v51 = *(_QWORD *)(v2 - 8);
  v3 = *(_QWORD *)(v51 + 64);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v53 = (uint64_t)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v46 - v5;
  v54 = type metadata accessor for Date();
  v56 = *(_QWORD *)(v54 - 8);
  v7 = *(_QWORD *)(v56 + 64);
  v8 = MEMORY[0x24BDAC7A8](v54);
  v52 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v46 - v10;
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v46 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v55 = (char *)&v46 - v15;
  v16 = objc_msgSend(a1, sel_assetType);
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v19 = v18;
  if (v17 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v19 == v20)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v22 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v22 & 1) == 0)
      return 0;
  }
  specialized getMetadataValue<A>(_:key:as:)(a1, (void *)*MEMORY[0x24BE68D38], (uint64_t)v14);
  v23 = *(void (**)(char *, char *, uint64_t))(v56 + 32);
  v23(v55, v14, v54);
  v24 = specialized getMetadataValue<A>(_:key:as:)(a1, (void *)*MEMORY[0x24BE68D30]);
  specialized getMetadataValue<A>(_:key:as:)(a1, (void *)*MEMORY[0x24BE68D40]);
  v27 = v26;
  v50 = v24;
  v28 = v55;
  v29 = v54;
  (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v11, v55, v54);
  v30 = specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x24BE68D28]);
  v31 = MEMORY[0x24BEE4AF8];
  if (v30)
    v32 = v30;
  else
    v32 = MEMORY[0x24BEE4AF8];
  v49 = v32;
  v33 = specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x24BE68D20]);
  if (v33)
    v34 = v33;
  else
    v34 = v31;
  v47 = v34;
  v48 = specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x24BE68D18]);
  v46 = specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x24BE68D10]);
  assetImageContentToUrl(_:)(a1, v6);
  v35 = v56;
  (*(void (**)(char *, uint64_t))(v56 + 8))(v28, v29);
  v36 = type metadata accessor for URL();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v6, 0, 1, v36);
  v23(v52, v11, v29);
  outlined init with take of URL?((uint64_t)v6, v53);
  v37 = (*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
  v38 = (v7 + v37 + 7) & 0xFFFFFFFFFFFFFFF8;
  v39 = (v38 + 15) & 0xFFFFFFFFFFFFFFF8;
  v40 = (v39 + 15) & 0xFFFFFFFFFFFFFFF8;
  v41 = (v40 + 15) & 0xFFFFFFFFFFFFFFF8;
  v42 = (*(unsigned __int8 *)(v51 + 80) + v41 + 8) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80);
  v43 = swift_allocObject();
  v44 = v47;
  *(_QWORD *)(v43 + 16) = v49;
  *(_QWORD *)(v43 + 24) = v44;
  v23((char *)(v43 + v37), v52, v54);
  *(_QWORD *)(v43 + v38) = v50;
  *(_QWORD *)(v43 + v39) = v27;
  *(_QWORD *)(v43 + v40) = v48;
  *(_QWORD *)(v43 + v41) = v46;
  outlined init with take of URL?(v53, v43 + v42);
  *(_QWORD *)(v43 + ((v3 + v42 + 7) & 0xFFFFFFFFFFFFFFF8)) = a1;
  v45 = a1;
  return partial apply for closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:);
}

uint64_t outlined init with take of URL?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_233A62CC0()
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

  v1 = type metadata accessor for Date();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (((((((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
      + 15) & 0xFFFFFFFFFFFFFFF8;
  v5 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?)
                 - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + v4 + 8) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = *(_QWORD *)(v5 + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = type metadata accessor for URL();
  v9 = *(_QWORD *)(v8 - 8);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v9 + 48))(v0 + v6, 1, v8))
    (*(void (**)(unint64_t, uint64_t))(v9 + 8))(v0 + v6, v8);

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v5 = *(_QWORD *)(type metadata accessor for Date() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = (*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;
  v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF8;
  v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF8;
  v11 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?)
                  - 8);
  v12 = (*(unsigned __int8 *)(v11 + 80) + v10 + 8) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  return closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:)(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), v2 + v6, *(_QWORD *)(v2 + v7), *(_QWORD *)(v2 + v9), *(_QWORD *)(v2 + v10), *(double *)(v2 + v8), v2 + v12, *(void **)(v2 + ((*(_QWORD *)(v11 + 64) + v12 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_233A62ED8()
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

  v1 = type metadata accessor for Date();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (((((((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
      + 15) & 0xFFFFFFFFFFFFFFF8;
  v5 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?)
                 - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + v4 + 8) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = *(_QWORD *)(v5 + 64);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = type metadata accessor for URL();
  v9 = *(_QWORD *)(v8 - 8);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v9 + 48))(v0 + v6, 1, v8))
    (*(void (**)(unint64_t, uint64_t))(v9 + 8))(v0 + v6, v8);

  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = *(_QWORD *)(type metadata accessor for Date() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  v15 = v1[2];
  v14 = v1[3];
  v7 = v1[5];
  v13 = v1[4];
  v8 = *(_QWORD *)((char *)v1 + v5);
  v9 = *(double *)((char *)v1 + v6);
  v10 = *(_QWORD *)((char *)v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = partial apply for closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:);
  return closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:)(v9, a1, v15, v14, v13, v7, (uint64_t)v1 + v4, v8, v10);
}

uint64_t partial apply for closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:)()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t type metadata accessor for HKStateOfMind()
{
  unint64_t result;

  result = lazy cache variable for type metadata for HKStateOfMind;
  if (!lazy cache variable for type metadata for HKStateOfMind)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for HKStateOfMind);
  }
  return result;
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

uint64_t outlined init with copy of JournalingSuggestion.StateOfMind(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for JournalingSuggestion.StateOfMind(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of JournalingSuggestion.StateOfMind(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for JournalingSuggestion.StateOfMind(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
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

unint64_t lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type JournalingSuggestionsError and conformance JournalingSuggestionsError;
  if (!lazy protocol witness table cache variable for type JournalingSuggestionsError and conformance JournalingSuggestionsError)
  {
    v1 = type metadata accessor for JournalingSuggestionsError();
    result = MEMORY[0x23493AE0C](&protocol conformance descriptor for JournalingSuggestionsError, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestionsError and conformance JournalingSuggestionsError);
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

uint64_t (*static UIImage.getLoaderForImageUrl(_:)(uint64_t a1))()
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = type metadata accessor for URL();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v6 + v5, (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  return partial apply for closure #1 in static UIImage.getLoaderForImageUrl(_:);
}

uint64_t closure #1 in static UIImage.getLoaderForImageUrl(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;

  v6 = type metadata accessor for URL();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v6);
  v13 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = 0;
  *(_QWORD *)(v14 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v14 + v13, (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  v15 = (_QWORD *)(v14 + ((v8 + v13 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v15 = a1;
  v15[1] = a2;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v11, (uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in static UIImage.getLoaderForImageUrl(_:), v14);
  return swift_release();
}

uint64_t closure #1 in closure #1 in static UIImage.getLoaderForImageUrl(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v6[18] = a5;
  v6[19] = a6;
  v6[17] = a4;
  v6[20] = type metadata accessor for JournalingSuggestionsError();
  v6[21] = swift_task_alloc();
  v6[22] = swift_task_alloc();
  v8 = type metadata accessor for URL();
  v6[23] = v8;
  v6[24] = *(_QWORD *)(v8 - 8);
  v9 = swift_task_alloc();
  v6[25] = v9;
  v10 = (_QWORD *)swift_task_alloc();
  v6[26] = v10;
  *v10 = v6;
  v10[1] = closure #1 in closure #1 in static UIImage.getLoaderForImageUrl(_:);
  return prepareUrlAccess(_:)(v9, a4);
}

uint64_t closure #1 in closure #1 in static UIImage.getLoaderForImageUrl(_:)()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 216) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  Class isa;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, _QWORD);
  id v20;

  v1 = *(void **)(v0 + 216);
  v2 = Data.init(contentsOf:options:)();
  if (v1)
  {

  }
  else
  {
    v11 = v2;
    v12 = v3;
    v13 = objc_allocWithZone(MEMORY[0x24BEBD640]);
    outlined copy of Data._Representation(v11, v12);
    isa = Data._bridgeToObjectiveC()().super.isa;
    v15 = objc_msgSend(v13, sel_initWithData_, isa);
    outlined consume of Data._Representation(v11, v12);

    if (v15)
    {
      v17 = *(_QWORD *)(v0 + 192);
      v16 = *(_QWORD *)(v0 + 200);
      v18 = *(_QWORD *)(v0 + 184);
      v19 = *(void (**)(uint64_t, _QWORD))(v0 + 144);
      *(_QWORD *)(v0 + 120) = type metadata accessor for UIImage();
      *(_QWORD *)(v0 + 128) = &protocol witness table for UIImage;
      *(_QWORD *)(v0 + 96) = v15;
      v20 = v15;
      v19(v0 + 96, 0);

      outlined consume of Data._Representation(v11, v12);
      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
      outlined destroy of URL?(v0 + 96, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
      goto LABEL_6;
    }
    outlined consume of Data._Representation(v11, v12);
  }
  v5 = *(_QWORD *)(v0 + 192);
  v4 = *(_QWORD *)(v0 + 200);
  v7 = *(_QWORD *)(v0 + 176);
  v6 = *(_QWORD *)(v0 + 184);
  v8 = *(void (**)(uint64_t, void *))(v0 + 144);
  *(_QWORD *)v7 = 0x6567616D494955;
  *(_QWORD *)(v7 + 8) = 0xE700000000000000;
  *(_OWORD *)(v7 + 16) = xmmword_233A8DCD0;
  swift_storeEnumTagMultiPayload();
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
  *(_OWORD *)(v0 + 56) = 0u;
  *(_OWORD *)(v0 + 72) = 0u;
  *(_QWORD *)(v0 + 88) = 0;
  v9 = (void *)swift_allocError();
  outlined init with copy of JournalingSuggestionsError(v7, v10);
  v8(v0 + 56, v9);

  outlined destroy of URL?(v0 + 56, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  outlined destroy of JournalingSuggestionsError(v7, (uint64_t (*)(_QWORD))type metadata accessor for JournalingSuggestionsError);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
LABEL_6:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  void *v6;
  uint64_t v7;

  v1 = *(void **)(v0 + 216);
  v2 = *(_QWORD *)(v0 + 184);
  v3 = *(_QWORD *)(v0 + 192);
  v4 = *(_QWORD *)(v0 + 168);
  v5 = *(void (**)(uint64_t, void *))(v0 + 144);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 16))(v4, *(_QWORD *)(v0 + 136), v2);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v3 + 56))(v4, 0, 1, v2);
  swift_storeEnumTagMultiPayload();
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
  *(_OWORD *)(v0 + 32) = 0u;
  *(_QWORD *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  v6 = (void *)swift_allocError();
  outlined init with copy of JournalingSuggestionsError(v4, v7);
  v5(v0 + 16, v6);

  outlined destroy of URL?(v0 + 16, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  outlined destroy of JournalingSuggestionsError(v4, (uint64_t (*)(_QWORD))type metadata accessor for JournalingSuggestionsError);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t (*static UIImage.getImageLoaderForLivePhoto(for:inside:)(void *a1))(uint64_t a1, uint64_t a2)
{
  uint64_t (*result)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  _QWORD *v6;
  id v7;

  result = specialized static JournalingSuggestion.LivePhoto.getAssetLoader(for:inside:)(a1);
  v4 = v3;
  if (result)
  {
    v5 = result;
    v6 = (_QWORD *)swift_allocObject();
    v6[2] = v5;
    v6[3] = v4;
    v6[4] = a1;
    v7 = a1;
    return partial apply for closure #1 in static UIImage.getImageLoaderForLivePhoto(for:inside:);
  }
  return result;
}

uint64_t closure #1 in static UIImage.getImageLoaderForLivePhoto(for:inside:)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t (*)(uint64_t a1, void *a2), _QWORD *), uint64_t a4, void *a5)
{
  _QWORD *v9;
  id v10;

  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a1;
  v9[3] = a2;
  v9[4] = a5;
  swift_retain();
  v10 = a5;
  a3(partial apply for closure #1 in closure #1 in static UIImage.getImageLoaderForLivePhoto(for:inside:), v9);
  return swift_release();
}

uint64_t closure #1 in closure #1 in static UIImage.getImageLoaderForLivePhoto(for:inside:)(uint64_t a1, void *a2, void (*a3)(__int128 *, void *), uint64_t a4, void *a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  id v21;
  int v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t (*v32)(_QWORD);
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  id v37;
  Class isa;
  id v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  _UNKNOWN **v49;

  v46 = a1;
  v8 = type metadata accessor for JournalingSuggestionsError();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (uint64_t *)((char *)&v42 - v12);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.LivePhoto?);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for JournalingSuggestion.LivePhoto(0);
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v49 = 0;
    v47 = 0u;
    v48 = 0u;
    v21 = a2;
    a3(&v47, a2);

    return outlined destroy of URL?((uint64_t)&v47, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  }
  v43 = v11;
  v44 = v20;
  v45 = v8;
  outlined init with copy of JournalingSuggestionAsset?(v46, (uint64_t)&v47);
  if (!*((_QWORD *)&v48 + 1))
  {
    outlined destroy of URL?((uint64_t)&v47, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, 1, 1, v17);
    goto LABEL_8;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestionAsset);
  v23 = swift_dynamicCast();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v16, v23 ^ 1u, 1, v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
  {
LABEL_8:
    outlined destroy of URL?((uint64_t)v16, &demangling cache variable for type metadata for JournalingSuggestion.LivePhoto?);
    v26 = objc_msgSend(a5, sel_assetType);
    v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v29 = v28;

    *v13 = 0x6567616D494955;
    v13[1] = 0xE700000000000000;
    v13[2] = v27;
    v13[3] = v29;
    swift_storeEnumTagMultiPayload();
    lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
    v47 = 0u;
    v48 = 0u;
    v49 = 0;
    v30 = (void *)swift_allocError();
    outlined init with copy of JournalingSuggestionsError((uint64_t)v13, v31);
    a3(&v47, v30);

    outlined destroy of URL?((uint64_t)&v47, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
    v32 = (uint64_t (*)(_QWORD))type metadata accessor for JournalingSuggestionsError;
    v33 = (uint64_t)v13;
    return outlined destroy of JournalingSuggestionsError(v33, v32);
  }
  outlined init with take of JournalingSuggestion.LivePhoto((uint64_t)v16, (uint64_t)v44);
  v34 = Data.init(contentsOf:options:)();
  v36 = v35;
  v37 = objc_allocWithZone(MEMORY[0x24BEBD640]);
  outlined copy of Data._Representation(v34, v36);
  isa = Data._bridgeToObjectiveC()().super.isa;
  v39 = objc_msgSend(v37, sel_initWithData_, isa);
  outlined consume of Data._Representation(v34, v36);

  v40 = (uint64_t)v43;
  if (v39)
  {
    *((_QWORD *)&v48 + 1) = type metadata accessor for UIImage();
    v49 = &protocol witness table for UIImage;
    *(_QWORD *)&v47 = v39;
    v41 = v39;
    a3(&v47, 0);

    outlined consume of Data._Representation(v34, v36);
    outlined destroy of JournalingSuggestionsError((uint64_t)v44, type metadata accessor for JournalingSuggestion.LivePhoto);
    return outlined destroy of URL?((uint64_t)&v47, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  }
  outlined consume of Data._Representation(v34, v36);
  *(_QWORD *)v40 = 0x6567616D494955;
  *(_QWORD *)(v40 + 8) = 0xE700000000000000;
  *(_OWORD *)(v40 + 16) = xmmword_233A8DCE0;
  swift_storeEnumTagMultiPayload();
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
  v47 = 0u;
  v48 = 0u;
  v49 = 0;
  v24 = (void *)swift_allocError();
  outlined init with copy of JournalingSuggestionsError(v40, v25);
  a3(&v47, v24);

  outlined destroy of URL?((uint64_t)&v47, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  outlined destroy of JournalingSuggestionsError(v40, (uint64_t (*)(_QWORD))type metadata accessor for JournalingSuggestionsError);
  v32 = type metadata accessor for JournalingSuggestion.LivePhoto;
  v33 = (uint64_t)v44;
  return outlined destroy of JournalingSuggestionsError(v33, v32);
}

uint64_t (*static UIImage.getLoaderForImageUrlPair(_:)(void *a1))(uint64_t a1, uint64_t a2)
{
  id v2;

  *(_QWORD *)(swift_allocObject() + 16) = a1;
  v2 = a1;
  return partial apply for closure #1 in static UIImage.getLoaderForImageUrlPair(_:);
}

uint64_t closure #1 in static UIImage.getLoaderForImageUrlPair(_:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  uint64_t v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = a3;
  v10[5] = a1;
  v10[6] = a2;
  v11 = a3;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v8, (uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:), (uint64_t)v10);
  return swift_release();
}

uint64_t closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[23] = a5;
  v6[24] = a6;
  v6[22] = a4;
  v6[25] = type metadata accessor for JournalingSuggestionsError();
  v6[26] = swift_task_alloc();
  v6[27] = swift_task_alloc();
  v7 = type metadata accessor for URL();
  v6[28] = v7;
  v6[29] = *(_QWORD *)(v7 - 8);
  v6[30] = swift_task_alloc();
  v6[31] = swift_task_alloc();
  v6[32] = swift_task_alloc();
  v6[33] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:)()
{
  uint64_t v0;
  id v1;
  _QWORD *v2;

  v1 = objc_msgSend(*(id *)(v0 + 176), sel_lightURL);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 272) = v2;
  *v2 = v0;
  v2[1] = closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:);
  return prepareUrlAccess(_:)(*(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 256));
}

{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 256);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 224);
  v5 = *(_QWORD *)(*(_QWORD *)v1 + 232);
  *(_QWORD *)(*(_QWORD *)v1 + 280) = v0;
  swift_task_dealloc();
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v2[36] = v6;
  v6(v3, v4);
  if (!v0)
    v6(v2[33], v2[28]);
  return swift_task_switch();
}

{
  uint64_t v0;
  id v1;
  _QWORD *v2;

  v1 = objc_msgSend(*(id *)(v0 + 176), sel_darkURL);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 296) = v2;
  *v2 = v0;
  v2[1] = closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:);
  return prepareUrlAccess(_:)(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 240));
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;

  v2 = *v1;
  v3 = *(void (**)(uint64_t, uint64_t))(*v1 + 288);
  v4 = *(_QWORD *)(*v1 + 240);
  v5 = *(_QWORD *)(*v1 + 224);
  *(_QWORD *)(*v1 + 304) = v0;
  swift_task_dealloc();
  v3(v4, v5);
  if (!v0)
    (*(void (**)(_QWORD, _QWORD))(v2 + 288))(*(_QWORD *)(v2 + 248), *(_QWORD *)(v2 + 224));
  return swift_task_switch();
}

{
  uint64_t v0;
  id v1;
  void *v2;
  void (*v3)(uint64_t, _QWORD);
  unint64_t v4;
  id v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  uint64_t v9;

  v1 = objc_msgSend(*(id *)(v0 + 176), sel_constructedImage);
  if (v1)
  {
    v2 = v1;
    v3 = *(void (**)(uint64_t, _QWORD))(v0 + 184);
    v4 = type metadata accessor for UIImage();
    *(_QWORD *)(v0 + 136) = v2;
    *(_QWORD *)(v0 + 160) = v4;
    *(_QWORD *)(v0 + 168) = &protocol witness table for UIImage;
    v5 = v2;
    v3(v0 + 136, 0);

    outlined destroy of URL?(v0 + 136, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  }
  else
  {
    v6 = *(_QWORD *)(v0 + 216);
    v7 = *(void (**)(uint64_t, void *))(v0 + 184);
    *(_QWORD *)v6 = 0x6567616D494955;
    *(_QWORD *)(v6 + 8) = 0xE700000000000000;
    *(_OWORD *)(v6 + 16) = xmmword_233A8DCF0;
    swift_storeEnumTagMultiPayload();
    lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
    *(_OWORD *)(v0 + 96) = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
    *(_QWORD *)(v0 + 128) = 0;
    v8 = (void *)swift_allocError();
    outlined init with copy of JournalingSuggestionsError(v6, v9);
    v7(v0 + 96, v8);

    outlined destroy of URL?(v0 + 96, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
    outlined destroy of JournalingSuggestionsError(v6, (uint64_t (*)(_QWORD))type metadata accessor for JournalingSuggestionsError);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;

  v1 = *(void **)(v0 + 280);
  v2 = *(_QWORD *)(v0 + 224);
  v3 = *(_QWORD *)(v0 + 232);
  v4 = *(_QWORD *)(v0 + 208);
  v5 = *(void (**)(uint64_t, void *))(v0 + 184);
  v6 = objc_msgSend(*(id *)(v0 + 176), sel_lightURL);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v3 + 56))(v4, 0, 1, v2);
  swift_storeEnumTagMultiPayload();
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
  *(_OWORD *)(v0 + 32) = 0u;
  *(_QWORD *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  v7 = (void *)swift_allocError();
  outlined init with copy of JournalingSuggestionsError(v4, v8);
  v5(v0 + 16, v7);

  outlined destroy of URL?(v0 + 16, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  outlined destroy of JournalingSuggestionsError(v4, (uint64_t (*)(_QWORD))type metadata accessor for JournalingSuggestionsError);
  v9 = objc_msgSend(*(id *)(v0 + 176), sel_darkURL);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 296) = v10;
  *v10 = v0;
  v10[1] = closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:);
  return prepareUrlAccess(_:)(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 240));
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  id v6;
  void *v7;
  uint64_t v8;

  v1 = *(void **)(v0 + 304);
  v2 = *(_QWORD *)(v0 + 224);
  v3 = *(_QWORD *)(v0 + 232);
  v4 = *(_QWORD *)(v0 + 208);
  v5 = *(void (**)(uint64_t, void *))(v0 + 184);
  v6 = objc_msgSend(*(id *)(v0 + 176), sel_darkURL);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v3 + 56))(v4, 0, 1, v2);
  swift_storeEnumTagMultiPayload();
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
  *(_OWORD *)(v0 + 72) = 0u;
  *(_QWORD *)(v0 + 88) = 0;
  *(_OWORD *)(v0 + 56) = 0u;
  v7 = (void *)swift_allocError();
  outlined init with copy of JournalingSuggestionsError(v4, v8);
  v5(v0 + 56, v7);

  outlined destroy of URL?(v0 + 56, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  outlined destroy of JournalingSuggestionsError(v4, (uint64_t (*)(_QWORD))type metadata accessor for JournalingSuggestionsError);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t closure #1 in static UIImage.getAssetLoader(for:inside:)(void (*a1)(_QWORD *, _QWORD), uint64_t a2, void *a3)
{
  id v5;
  _QWORD v7[5];

  v7[3] = type metadata accessor for UIImage();
  v7[4] = &protocol witness table for UIImage;
  v7[0] = a3;
  v5 = a3;
  a1(v7, 0);
  return outlined destroy of URL?((uint64_t)v7, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
}

uint64_t partial apply for closure #1 in static UIImage.getImageLoaderForLivePhoto(for:inside:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return closure #1 in static UIImage.getImageLoaderForLivePhoto(for:inside:)(a1, a2, *(void (**)(uint64_t (*)(uint64_t, void *), _QWORD *))(v2 + 16), *(_QWORD *)(v2 + 24), *(void **)(v2 + 32));
}

uint64_t partial apply for closure #1 in static UIImage.getLoaderForImageUrlPair(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return closure #1 in static UIImage.getLoaderForImageUrlPair(_:)(a1, a2, *(void **)(v2 + 16));
}

uint64_t (*specialized static UIImage.getAssetLoader(for:inside:)(void *a1))()
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  int v19;
  void (*v20)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t (*v30)();
  id v31;
  void *v32;
  id v33;
  void *v34;
  char *v35;
  uint64_t v36;
  void (*v37)(char *, char *, uint64_t);
  char *v38;
  unint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  _QWORD *v46;
  id v47;
  void (*v48)(char *, uint64_t);
  id v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t);
  char *v52;
  unint64_t v53;
  uint64_t v54;
  void (*v56)(char *, char *, uint64_t);
  char *v57;
  uint64_t v58;
  id v59;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v56 - v6;
  v8 = type metadata accessor for URL();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v56 = (void (*)(char *, char *, uint64_t))((char *)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = MEMORY[0x24BDAC7A8](v11);
  v57 = (char *)&v56 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v56 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v56 - v17;
  v59 = objc_msgSend(a1, sel_content);
  v19 = swift_dynamicCast();
  v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
  v58 = v9;
  if (v19)
  {
    v20(v7, 0, 1, v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
    {
      v21 = v58;
      v56 = *(void (**)(char *, char *, uint64_t))(v58 + 32);
      v56(v18, v7, v8);
      v22 = *(void (**)(char *, char *, uint64_t))(v21 + 16);
      v22(v16, v18, v8);
      v23 = objc_msgSend(a1, sel_assetType);
      v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v26 = v25;
      if (v24 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v26 == v27)
      {

        swift_bridgeObjectRelease_n();
      }
      else
      {
        v41 = _stringCompareWithSmolCheck(_:_:expecting:)();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v41 & 1) == 0)
        {
          v50 = v58;
          v51 = *(void (**)(char *, uint64_t))(v58 + 8);
          v51(v18, v8);
          v52 = v57;
          v22(v57, v16, v8);
          v53 = (*(unsigned __int8 *)(v50 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
          v54 = swift_allocObject();
          v56((char *)(v54 + v53), v52, v8);
          v51(v16, v8);
          return partial apply for closure #1 in static UIImage.getLoaderForImageUrl(_:);
        }
      }
      v42 = specialized static JournalingSuggestion.LivePhoto.getAssetLoader(for:inside:)(a1);
      v44 = v43;
      if (v42)
      {
        v45 = v42;
        v46 = (_QWORD *)swift_allocObject();
        v46[2] = v45;
        v46[3] = v44;
        v46[4] = a1;
        v47 = a1;
        v30 = closure #1 in static UIImage.getImageLoaderForLivePhoto(for:inside:)partial apply;
      }
      else
      {
        v30 = 0;
      }
      v48 = *(void (**)(char *, uint64_t))(v58 + 8);
      v48(v16, v8);
      v48(v18, v8);
      return v30;
    }
  }
  else
  {
    v20(v7, 1, 1, v8);
  }
  outlined destroy of URL?((uint64_t)v7, &demangling cache variable for type metadata for URL?);
  v28 = objc_msgSend(a1, (SEL)0x2504D0548);
  objc_opt_self();
  v29 = swift_dynamicCastObjCClass();
  if (v29)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v29;
    return (uint64_t (*)())partial apply for closure #1 in static UIImage.getAssetLoader(for:inside:);
  }
  else
  {
    swift_unknownObjectRelease();
    v31 = objc_msgSend(a1, (SEL)0x2504D0548);
    objc_opt_self();
    v32 = (void *)swift_dynamicCastObjCClass();
    if (v32)
    {
      v33 = objc_msgSend(v32, sel_imageURL);
      if (v33)
      {
        v34 = v33;
        v35 = v57;
        static URL._unconditionallyBridgeFromObjectiveC(_:)();
        swift_unknownObjectRelease();

        v36 = v58;
        v37 = *(void (**)(char *, char *, uint64_t))(v58 + 32);
        v37(v5, v35, v8);
        v20(v5, 0, 1, v8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v5, 1, v8) != 1)
        {
          v38 = (char *)v56;
          v37((char *)v56, v5, v8);
          (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v35, v38, v8);
          v39 = (*(unsigned __int8 *)(v36 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
          v40 = swift_allocObject();
          v37((char *)(v40 + v39), v35, v8);
          (*(void (**)(char *, uint64_t))(v36 + 8))(v38, v8);
          return partial apply for closure #1 in static UIImage.getLoaderForImageUrl(_:);
        }
      }
      else
      {
        swift_unknownObjectRelease();
        v20(v5, 1, 1, v8);
      }
      outlined destroy of URL?((uint64_t)v5, &demangling cache variable for type metadata for URL?);
    }
    else
    {
      swift_unknownObjectRelease();
    }
    v49 = objc_msgSend(a1, (SEL)0x2504D0548);
    objc_opt_self();
    v30 = (uint64_t (*)())swift_dynamicCastObjCClass();
    if (v30)
    {
      *(_QWORD *)(swift_allocObject() + 16) = v30;
      return closure #1 in static UIImage.getLoaderForImageUrlPair(_:)partial apply;
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
  return v30;
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in UIImage()
{
  return &protocol witness table for UIImage;
}

uint64_t sub_233A64DF4()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static UIImage.getAssetLoader(for:inside:)(void (*a1)(_QWORD *, _QWORD), uint64_t a2)
{
  uint64_t v2;

  return closure #1 in static UIImage.getAssetLoader(for:inside:)(a1, a2, *(void **)(v2 + 16));
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;

  v1 = type metadata accessor for URL();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static UIImage.getLoaderForImageUrl(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for URL() - 8) + 80);
  return closure #1 in static UIImage.getLoaderForImageUrl(_:)(a1, a2, v2 + ((v5 + 16) & ~v5));
}

unint64_t type metadata accessor for UIImage()
{
  unint64_t result;

  result = lazy cache variable for type metadata for UIImage;
  if (!lazy cache variable for type metadata for UIImage)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for UIImage);
  }
  return result;
}

uint64_t sub_233A64F10()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:)(uint64_t a1)
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
  v9[1] = partial apply for closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:);
  return closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:)(a1, v4, v5, v6, v7, v8);
}

uint64_t outlined init with copy of JournalingSuggestionsError(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for JournalingSuggestionsError();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t objectdestroy_2Tm()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in static UIImage.getImageLoaderForLivePhoto(for:inside:)(uint64_t a1, void *a2)
{
  uint64_t v2;

  return closure #1 in closure #1 in static UIImage.getImageLoaderForLivePhoto(for:inside:)(a1, a2, *(void (**)(__int128 *, void *))(v2 + 16), *(_QWORD *)(v2 + 24), *(void **)(v2 + 32));
}

uint64_t outlined init with copy of JournalingSuggestionAsset?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestionAsset?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with take of JournalingSuggestion.LivePhoto(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for JournalingSuggestion.LivePhoto(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of JournalingSuggestionsError(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_233A6510C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = type metadata accessor for URL();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in static UIImage.getLoaderForImageUrl(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(type metadata accessor for URL() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = (uint64_t *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  v10 = *v9;
  v11 = v9[1];
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = partial apply for closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:);
  return closure #1 in closure #1 in static UIImage.getLoaderForImageUrl(_:)(a1, v6, v7, v8, v10, v11);
}

uint64_t (*static Image.getAssetLoader(for:inside:)(void *a1))()
{
  uint64_t (*result)();
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();
  _QWORD *v6;
  id v7;

  result = specialized static UIImage.getAssetLoader(for:inside:)(a1);
  v4 = v3;
  if (result)
  {
    v5 = result;
    v6 = (_QWORD *)swift_allocObject();
    v6[2] = v5;
    v6[3] = v4;
    v6[4] = a1;
    v7 = a1;
    return (uint64_t (*)())partial apply for closure #1 in static Image.getAssetLoader(for:inside:);
  }
  return result;
}

uint64_t closure #1 in static Image.getAssetLoader(for:inside:)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t (*)(uint64_t a1, void *a2), _QWORD *), uint64_t a4, void *a5)
{
  _QWORD *v9;
  id v10;

  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a1;
  v9[3] = a2;
  v9[4] = a5;
  swift_retain();
  v10 = a5;
  a3(partial apply for closure #1 in closure #1 in static Image.getAssetLoader(for:inside:), v9);
  return swift_release();
}

uint64_t closure #1 in closure #1 in static Image.getAssetLoader(for:inside:)(uint64_t a1, void *a2, void (*a3)(__int128 *, void *), uint64_t a4, void *a5)
{
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22[2];
  __int128 v23;
  __int128 v24;
  _UNKNOWN **v25;

  v9 = type metadata accessor for JournalingSuggestionsError();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (id *)((char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (a2)
  {
    v25 = 0;
    v23 = 0u;
    v24 = 0u;
    v12 = a2;
    a3(&v23, a2);

    return outlined destroy of JournalingSuggestionAsset?((uint64_t)&v23);
  }
  outlined init with copy of JournalingSuggestionAsset?(a1, (uint64_t)&v23);
  if (*((_QWORD *)&v24 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestionAsset);
    type metadata accessor for UIImage();
    if ((swift_dynamicCast() & 1) != 0)
    {
      v14 = v22[1];
      v15 = Image.init(uiImage:)();
      *((_QWORD *)&v24 + 1) = MEMORY[0x24BDF4108];
      v25 = &protocol witness table for Image;
      *(_QWORD *)&v23 = v15;
      a3(&v23, 0);

      return outlined destroy of JournalingSuggestionAsset?((uint64_t)&v23);
    }
  }
  else
  {
    outlined destroy of JournalingSuggestionAsset?((uint64_t)&v23);
  }
  v16 = objc_msgSend(a5, sel_assetType);
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v19 = v18;

  *v11 = 0x6567616D494955;
  v11[1] = 0xE700000000000000;
  v11[2] = v17;
  v11[3] = v19;
  swift_storeEnumTagMultiPayload();
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
  v23 = 0u;
  v24 = 0u;
  v25 = 0;
  v20 = (void *)swift_allocError();
  outlined init with copy of JournalingSuggestionsError((uint64_t)v11, v21);
  a3(&v23, v20);

  outlined destroy of JournalingSuggestionAsset?((uint64_t)&v23);
  return outlined destroy of JournalingSuggestionsError((uint64_t)v11);
}

uint64_t (*protocol witness for static InternalAssetProvider.getAssetLoader(for:inside:) in conformance Image(void *a1))()
{
  uint64_t (*result)();
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();
  _QWORD *v6;
  id v7;

  result = specialized static UIImage.getAssetLoader(for:inside:)(a1);
  v4 = v3;
  if (result)
  {
    v5 = result;
    v6 = (_QWORD *)swift_allocObject();
    v6[2] = v5;
    v6[3] = v4;
    v6[4] = a1;
    v7 = a1;
    return closure #1 in static Image.getAssetLoader(for:inside:)partial apply;
  }
  return result;
}

uint64_t partial apply for closure #1 in static Image.getAssetLoader(for:inside:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return closure #1 in static Image.getAssetLoader(for:inside:)(a1, a2, *(void (**)(uint64_t (*)(uint64_t, void *), _QWORD *))(v2 + 16), *(_QWORD *)(v2 + 24), *(void **)(v2 + 32));
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in Image()
{
  return &protocol witness table for Image;
}

uint64_t partial apply for closure #1 in closure #1 in static Image.getAssetLoader(for:inside:)(uint64_t a1, void *a2)
{
  uint64_t v2;

  return closure #1 in closure #1 in static Image.getAssetLoader(for:inside:)(a1, a2, *(void (**)(__int128 *, void *))(v2 + 16), *(_QWORD *)(v2 + 24), *(void **)(v2 + 32));
}

uint64_t outlined destroy of JournalingSuggestionAsset?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestionAsset?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t closure #1 in static JournalingSuggestion.Video.getAssetLoader(for:inside:)(void (*a1)(uint64_t *, _QWORD), uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v19[5];

  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v19[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for JournalingSuggestion.Video(0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v19[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v12, a3, v13);
  v14 = (uint64_t)&v12[*(int *)(v10 + 20)];
  v15 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  specialized getMetadata<A>(_:key:as:)(a4, (void *)*MEMORY[0x24BE68D00], (uint64_t)v9);
  outlined assign with take of Date?((uint64_t)v9, v14);
  v19[3] = v10;
  v19[4] = (uint64_t)&protocol witness table for JournalingSuggestion.Video;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v19);
  outlined init with copy of JournalingSuggestion.Video((uint64_t)v12, (uint64_t)boxed_opaque_existential_1);
  a1(v19, 0);
  outlined destroy of URL?((uint64_t)v19, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  return outlined destroy of JournalingSuggestion.Video((uint64_t)v12);
}

uint64_t (*specialized static JournalingSuggestion.Video.getAssetLoader(for:inside:)(void *a1))(void (*a1)(uint64_t *, _QWORD), uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  __objc2_meth *v17;
  int v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  void (*v20)(char *, char *, uint64_t);
  char *v21;
  char *v22;
  unint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  char *v35;
  char *v36;
  id v37;
  id v38;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for URL();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v36 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v35 = (char *)&v35 - v9;
  v10 = objc_msgSend(a1, sel_assetType);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = v12;
  if (v11 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v13 == v14)
  {

    swift_bridgeObjectRelease_n();
    v17 = &stru_2504D0000;
  }
  else
  {
    v16 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v17 = &stru_2504D0000;
    if ((v16 & 1) == 0)
      goto LABEL_13;
  }
  v38 = objc_msgSend(a1, v17[19].name);
  v18 = swift_dynamicCast();
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
  if (v18)
  {
    v19(v4, 0, 1, v5);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
    {
      v20 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
      v21 = v35;
      v20(v35, v4, v5);
      v22 = v36;
      v20(v36, v21, v5);
      v23 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      v24 = swift_allocObject();
      v20((char *)(v24 + v23), v22, v5);
      *(_QWORD *)(v24 + ((v7 + v23 + 7) & 0xFFFFFFFFFFFFFFF8)) = a1;
      v25 = a1;
      return partial apply for closure #1 in static JournalingSuggestion.Video.getAssetLoader(for:inside:);
    }
  }
  else
  {
    v19(v4, 1, 1, v5);
  }
  outlined destroy of URL?((uint64_t)v4, &demangling cache variable for type metadata for URL?);
LABEL_13:
  if (one-time initialization token for bridge != -1)
    swift_once();
  v27 = type metadata accessor for Logger();
  __swift_project_value_buffer(v27, (uint64_t)static Logger.bridge);
  v28 = a1;
  v29 = Logger.logObject.getter();
  v30 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    v32 = (id)swift_slowAlloc();
    v38 = v32;
    *(_DWORD *)v31 = 136315138;
    v37 = objc_msgSend(v28, v17[19].name);
    v33 = String.init<A>(describing:)();
    v37 = (id)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v33, v34, (uint64_t *)&v38);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_233A5C000, v29, v30, "SuggestionVideo.getAssetLoader, Unexpected content: %s", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23493AEA8](v32, -1, -1);
    MEMORY[0x23493AEA8](v31, -1, -1);

  }
  else
  {

  }
  return 0;
}

uint64_t sub_233A65BA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = type metadata accessor for URL();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.Video.getAssetLoader(for:inside:)(void (*a1)(uint64_t *, _QWORD), uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(type metadata accessor for URL() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return closure #1 in static JournalingSuggestion.Video.getAssetLoader(for:inside:)(a1, a2, v2 + v6, *(void **)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t outlined assign with take of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of JournalingSuggestion.Video(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for JournalingSuggestion.Video(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of JournalingSuggestion.Video(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for JournalingSuggestion.Video(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static JournalingSuggestionAsset.make(from:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v10;

  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a4;
  v10[3] = a5;
  v10[4] = a2;
  v10[5] = a3;
  swift_retain();
  static JournalingSuggestionAsset.make(from:completionHandler:)(a1, (void (*)(char *, void *))partial apply for closure #1 in static JournalingSuggestionAsset.make(from:completionHandler:), (uint64_t)v10, a4, a5);
  return swift_release();
}

uint64_t closure #1 in static JournalingSuggestionAsset.make(from:completionHandler:)(uint64_t a1, void *a2, void (*a3)(uint64_t *), uint64_t a4, uint64_t a5)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  id v22;
  int v23;
  void (*v24)(uint64_t *);
  uint64_t v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  _QWORD v30[2];
  uint64_t v31;
  void (*v32)(uint64_t *);
  uint64_t v33;
  uint64_t v34;

  v34 = a4;
  v31 = a1;
  v32 = a3;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  v30[1] = AssociatedTypeWitness;
  v8 = type metadata accessor for Result();
  v33 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (_QWORD *)((char *)v30 - v9);
  v11 = type metadata accessor for Optional();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v30 - v14;
  v16 = *(_QWORD *)(a5 - 8);
  v17 = MEMORY[0x24BDAC7A8](v13);
  v19 = (char *)v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)v30 - v20;
  if (a2)
  {
    *v10 = (uint64_t)a2;
    swift_storeEnumTagMultiPayload();
    v22 = a2;
    v32(v10);
  }
  else
  {
    v30[0] = v8;
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v31, v11);
    v23 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48))(v15, 1, a5);
    v24 = v32;
    if (v23 == 1)
    {
      (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
      type metadata accessor for JournalingSuggestionsError();
      lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
      v25 = swift_allocError();
      v27 = v26;
      *v26 = _typeName(_:qualified:)();
      v27[1] = v28;
      v27[2] = 0;
      v27[3] = 0;
      swift_storeEnumTagMultiPayload();
      *v10 = v25;
      v8 = v30[0];
      swift_storeEnumTagMultiPayload();
      v24(v10);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v15, a5);
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v21, a5);
      swift_dynamicCast();
      v8 = v30[0];
      swift_storeEnumTagMultiPayload();
      v24(v10);
      (*(void (**)(char *, uint64_t))(v16 + 8))(v21, a5);
    }
  }
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v33 + 8))(v10, v8);
}

uint64_t sub_233A66088()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static JournalingSuggestionAsset.make(from:completionHandler:)(uint64_t a1, void *a2)
{
  uint64_t v2;

  return closure #1 in static JournalingSuggestionAsset.make(from:completionHandler:)(a1, a2, *(void (**)(uint64_t *))(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 16));
}

uint64_t static JournalingSuggestionAsset.make(from:completionHandler:)(uint64_t a1, void (*a2)(char *, void *), uint64_t a3, uint64_t a4, uint64_t a5)
{
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void (*v24)(uint64_t (*)(uint64_t, void *), _QWORD *);
  unint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, void *);
  uint64_t v33;

  v31 = a5;
  v32 = a2;
  v33 = a3;
  v7 = type metadata accessor for Optional();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v30 - v9;
  v11 = type metadata accessor for JournalingSuggestionsError();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (uint64_t *)((char *)&v30 - v16);
  v18 = *(_QWORD *)(a1 + *(int *)(type metadata accessor for JournalingSuggestion.ItemContent(0) + 24));
  swift_bridgeObjectRetain();
  *v17 = _typeName(_:qualified:)();
  v17[1] = v19;
  v17[2] = 0;
  v17[3] = 0;
  swift_storeEnumTagMultiPayload();
  v20 = *(_QWORD *)(v18 + 16);
  if (v20)
  {
    v21 = v18 + 56;
    while (*(_QWORD *)(v21 - 24) != a4)
    {
      v21 += 32;
      if (!--v20)
        goto LABEL_5;
    }
    v24 = *(void (**)(uint64_t (*)(uint64_t, void *), _QWORD *))(v21 - 8);
    swift_retain();
    swift_bridgeObjectRelease();
    outlined init with copy of JournalingSuggestionsError((uint64_t)v17, (uint64_t)v15);
    v25 = (*(unsigned __int8 *)(v12 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
    v26 = (_QWORD *)swift_allocObject();
    v27 = v31;
    v26[2] = a4;
    v26[3] = v27;
    v28 = v33;
    v26[4] = v32;
    v26[5] = v28;
    outlined init with take of JournalingSuggestionsError((uint64_t)v15, (uint64_t)v26 + v25);
    swift_retain();
    swift_retain();
    v24(partial apply for closure #2 in static JournalingSuggestionAsset.make(from:completionHandler:), v26);
    swift_release_n();
    swift_release();
  }
  else
  {
LABEL_5:
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 56))(v10, 1, 1, a4);
    lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
    v22 = (void *)swift_allocError();
    outlined init with copy of JournalingSuggestionsError((uint64_t)v17, v23);
    v32(v10, v22);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  return outlined destroy of JournalingSuggestionsError((uint64_t)v17);
}

uint64_t closure #2 in static JournalingSuggestionAsset.make(from:completionHandler:)(uint64_t a1, void *a2, void (*a3)(char *, void *), uint64_t a4, uint64_t a5, uint64_t a6)
{
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
  uint64_t v21;
  char *v22;
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  id v25;
  char v27;
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[40];

  v35 = a4;
  v11 = type metadata accessor for Optional();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v33 - v17;
  v19 = *(_QWORD *)(a6 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v22 = (char *)&v33 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56);
    v24 = v20;
    v23(v15, 1, 1, a6);
    v25 = a2;
    a3(v15, a2);

    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v15, v24);
  }
  else
  {
    v33 = a5;
    v34 = v20;
    outlined init with copy of JournalingSuggestionAsset?(a1, (uint64_t)v36);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestionAsset?);
    v27 = swift_dynamicCast();
    v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56);
    if ((v27 & 1) != 0)
    {
      v28(v18, 0, 1, a6);
      (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v22, v18, a6);
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v15, v22, a6);
      v28(v15, 0, 1, a6);
      a3(v15, 0);
      (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v34);
      return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v22, a6);
    }
    else
    {
      v28(v18, 1, 1, a6);
      v29 = *(void (**)(char *, uint64_t))(v12 + 8);
      v30 = v34;
      v29(v18, v34);
      v28(v15, 1, 1, a6);
      type metadata accessor for JournalingSuggestionsError();
      lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
      v31 = (void *)swift_allocError();
      outlined init with copy of JournalingSuggestionsError(v33, v32);
      a3(v15, v31);

      return ((uint64_t (*)(char *, uint64_t))v29)(v15, v30);
    }
  }
}

uint64_t sub_233A66580()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for JournalingSuggestionsError() - 8) + 80);
  v2 = (v1 + 48) & ~v1;
  swift_release();
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      v3 = type metadata accessor for URL();
      v4 = *(_QWORD *)(v3 - 8);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v0 + v2, 1, v3))
        (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v2, v3);
      break;
    case 1u:
    case 3u:
      goto LABEL_5;
    case 2u:
      swift_bridgeObjectRelease();
LABEL_5:
      swift_bridgeObjectRelease();
      break;
    default:
      return swift_deallocObject();
  }
  return swift_deallocObject();
}

uint64_t outlined init with take of JournalingSuggestionsError(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for JournalingSuggestionsError();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #2 in static JournalingSuggestionAsset.make(from:completionHandler:)(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;

  v5 = *(_QWORD *)(v2 + 16);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for JournalingSuggestionsError() - 8) + 80);
  return closure #2 in static JournalingSuggestionAsset.make(from:completionHandler:)(a1, a2, *(void (**)(char *, void *))(v2 + 32), *(_QWORD *)(v2 + 40), v2 + ((v6 + 48) & ~v6), v5);
}

uint64_t static JournalingSuggestionAsset.content(forItem:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch();
}

uint64_t static JournalingSuggestionAsset.content(forItem:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v2;
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v2 + 32) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v3;
  type metadata accessor for Optional();
  *v3 = v0;
  v3[1] = static JournalingSuggestionAsset.content(forItem:);
  return withCheckedThrowingContinuation<A>(isolation:function:_:)();
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t closure #1 in static JournalingSuggestionAsset.content(forItem:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v15;

  type metadata accessor for Optional();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  v8 = type metadata accessor for CheckedContinuation();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v15 - v10, a1, v8);
  v12 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  *(_QWORD *)(v13 + 24) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v13 + v12, v11, v8);
  static JournalingSuggestionAsset.make(from:completionHandler:)(a2, (uint64_t)partial apply for closure #1 in closure #1 in static JournalingSuggestionAsset.content(forItem:), v13, a3, a4);
  return swift_release();
}

uint64_t partial apply for closure #1 in static JournalingSuggestionAsset.content(forItem:)(uint64_t a1)
{
  uint64_t *v1;

  return closure #1 in static JournalingSuggestionAsset.content(forItem:)(a1, v1[4], v1[2], v1[3]);
}

uint64_t closure #1 in closure #1 in static JournalingSuggestionAsset.content(forItem:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v24;
  char v25;
  void (*v26)(char *, uint64_t, uint64_t, uint64_t);
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v38 = a1;
  v39 = a2;
  v4 = type metadata accessor for Optional();
  v34 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v36 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v33 - v8;
  v10 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v35 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v37 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v13 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v33 - v16;
  v18 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  v19 = type metadata accessor for Result();
  MEMORY[0x24BDAC7A8](v19);
  v21 = (uint64_t *)((char *)&v33 - v20);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))((char *)&v33 - v20, v38, v19);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v40 = *v21;
    type metadata accessor for CheckedContinuation();
    return CheckedContinuation.resume(throwing:)();
  }
  else
  {
    v38 = v18;
    v24 = v37;
    (*(void (**)(char *, uint64_t *, uint64_t))(v37 + 32))(v17, v21, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v15, v17, AssociatedTypeWitness);
    v25 = swift_dynamicCast();
    v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    if ((v25 & 1) != 0)
    {
      v26(v9, 0, 1, a3);
      v27 = v35;
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v35, v9, a3);
      v28 = v36;
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v36, v27, a3);
      v26(v28, 0, 1, a3);
      type metadata accessor for CheckedContinuation();
      CheckedContinuation.resume(returning:)();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v27, a3);
    }
    else
    {
      v26(v9, 1, 1, a3);
      (*(void (**)(char *, uint64_t))(v34 + 8))(v9, v4);
      type metadata accessor for JournalingSuggestionsError();
      lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
      v29 = swift_allocError();
      v31 = v30;
      *v30 = _typeName(_:qualified:)();
      v31[1] = v32;
      v31[2] = 0;
      v31[3] = 0;
      swift_storeEnumTagMultiPayload();
      v40 = v29;
      type metadata accessor for CheckedContinuation();
      CheckedContinuation.resume(throwing:)();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v17, AssociatedTypeWitness);
  }
}

uint64_t InternalAssetContent.AssetProvider.loader.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_retain();
  return a3;
}

uint64_t InternalAssetContent.providers.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*InternalAssetContent.providers.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

JournalingSuggestions::InternalAssetContent __swiftcall InternalAssetContent.init()()
{
  return (JournalingSuggestions::InternalAssetContent)MEMORY[0x24BEE4AF8];
}

uint64_t default argument 0 of InternalAssetContent.init(providers:)()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t default associated conformance accessor for JournalingSuggestionAsset.JournalingSuggestionAsset.JournalingSuggestionContent: JournalingSuggestionAsset()
{
  swift_getAssociatedTypeWitness();
  return swift_getAssociatedConformanceWitness();
}

uint64_t dispatch thunk of static InternalAssetProvider.getAssetLoader(for:inside:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

ValueMetadata *type metadata accessor for InternalAssetContent()
{
  return &type metadata for InternalAssetContent;
}

uint64_t initializeBufferWithCopyOfBuffer for InternalAssetContent.AssetProvider(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for InternalAssetContent.AssetProvider()
{
  return swift_release();
}

uint64_t initializeWithCopy for InternalAssetContent.AssetProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for InternalAssetContent.AssetProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
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

_OWORD *assignWithTake for InternalAssetContent.AssetProvider(_OWORD *a1, _OWORD *a2)
{
  __int128 v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for InternalAssetContent.AssetProvider(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InternalAssetContent.AssetProvider(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for InternalAssetContent.AssetProvider()
{
  return &type metadata for InternalAssetContent.AssetProvider;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23493AE00](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_233A6702C()
{
  uint64_t v0;
  uint64_t v1;

  type metadata accessor for Optional();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  v1 = type metadata accessor for CheckedContinuation();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in static JournalingSuggestionAsset.content(forItem:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v1 + 16);
  type metadata accessor for Optional();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for CheckedContinuation() - 8) + 80);
  return closure #1 in closure #1 in static JournalingSuggestionAsset.content(forItem:)(a1, v1 + ((v4 + 32) & ~v4), v3);
}

uint64_t closure #1 in static JournalingSuggestion.Song.getAssetLoader(for:inside:)(void (*a1)(uint64_t *, _QWORD), uint64_t a2, void *a3, void *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t, uint64_t);
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void (*v44)(uint64_t *, _QWORD);
  uint64_t v45[5];

  v42 = a4;
  v43 = a2;
  v44 = a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8](v5);
  v41 = (uint64_t)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for JournalingSuggestion.Song(0);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (uint64_t *)((char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = (uint64_t)v13 + *(int *)(v11 + 28);
  v15 = type metadata accessor for URL();
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56);
  v17 = 1;
  v40 = v14;
  v16(v14, 1, 1, v15);
  v18 = (uint64_t)v13 + *(int *)(v10 + 32);
  v19 = type metadata accessor for Date();
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56);
  v39 = v18;
  v20(v18, 1, 1, v19);
  v21 = objc_msgSend(a3, sel_title);
  v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v24 = v23;

  *v13 = v22;
  v13[1] = v24;
  v25 = objc_msgSend(a3, sel_artistName);
  v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v28 = v27;

  v13[2] = v26;
  v13[3] = v28;
  v29 = objc_msgSend(a3, sel_albumTitle);
  v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v32 = v31;

  v13[4] = v30;
  v13[5] = v32;
  v33 = objc_msgSend(a3, sel_imageURL);
  if (v33)
  {
    v34 = v33;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v17 = 0;
  }
  v16((uint64_t)v9, v17, 1, v15);
  outlined assign with take of URL?((uint64_t)v9, v40, &demangling cache variable for type metadata for URL?);
  v35 = v41;
  specialized getMetadata<A>(_:key:as:)(v42, (void *)*MEMORY[0x24BE68CE0], v41);
  outlined assign with take of URL?(v35, v39, &demangling cache variable for type metadata for Date?);
  v45[3] = v10;
  v45[4] = (uint64_t)&protocol witness table for JournalingSuggestion.Song;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v45);
  outlined init with copy of JournalingSuggestion.Song((uint64_t)v13, (uint64_t)boxed_opaque_existential_1);
  v44(v45, 0);
  outlined destroy of JournalingSuggestionAsset?((uint64_t)v45);
  return outlined destroy of JournalingSuggestion.Song((uint64_t)v13);
}

uint64_t (*specialized static JournalingSuggestion.Song.getAssetLoader(for:inside:)(void *a1))(void (*a1)(uint64_t *, _QWORD), uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = objc_msgSend(a1, sel_assetType);
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = v4;
  if (v3 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v5 == v6)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
      goto LABEL_13;
  }
  v9 = objc_msgSend(a1, sel_content);
  objc_opt_self();
  v10 = (void *)swift_dynamicCastObjCClass();
  if (!v10)
  {
    swift_unknownObjectRelease();
LABEL_13:
    if (one-time initialization token for bridge != -1)
      swift_once();
    v15 = type metadata accessor for Logger();
    __swift_project_value_buffer(v15, (uint64_t)static Logger.bridge);
    v16 = a1;
    v17 = Logger.logObject.getter();
    v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = swift_slowAlloc();
      v20 = swift_slowAlloc();
      v27 = v20;
      *(_DWORD *)v19 = 136315394;
      type metadata accessor for JournalingSuggestion.Song(0);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.Song.Type);
      v21 = String.init<A>(describing:)();
      v26 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v19 + 12) = 2080;
      v23 = objc_msgSend(v16, sel_content, v26, v27);
      v24 = String.init<A>(describing:)();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_233A5C000, v17, v18, "%s.getAssetLoader, Unexpected content: %s", (uint8_t *)v19, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23493AEA8](v20, -1, -1);
      MEMORY[0x23493AEA8](v19, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  v11 = v10;
  if (objc_msgSend(v10, sel_mediaType) == (id)1 || objc_msgSend(v11, sel_mediaType) == (id)4)
  {
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = v11;
    *(_QWORD *)(v12 + 24) = a1;
    v13 = a1;
    return partial apply for closure #1 in static JournalingSuggestion.Song.getAssetLoader(for:inside:);
  }
  swift_unknownObjectRelease();
  return 0;
}

uint64_t sub_233A67750()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.Song.getAssetLoader(for:inside:)(void (*a1)(uint64_t *, _QWORD), uint64_t a2)
{
  uint64_t v2;

  return closure #1 in static JournalingSuggestion.Song.getAssetLoader(for:inside:)(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t outlined assign with take of URL?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t outlined init with copy of JournalingSuggestion.Song(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for JournalingSuggestion.Song(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of JournalingSuggestion.Song(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for JournalingSuggestion.Song(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

double static JournalingSuggestion.Workout.Details.toCountPerMinute(_:)(void *a1)
{
  id v2;
  double v3;
  double v4;

  v2 = objc_msgSend((id)objc_opt_self(), sel__countPerMinuteUnit);
  objc_msgSend(a1, sel_doubleValueForUnit_, v2);
  v4 = v3;

  return v4;
}

uint64_t closure #1 in static JournalingSuggestion.Workout.Details.getAssetLoader(for:inside:)(void (*a1)(_QWORD, _QWORD), uint64_t a2, void (*a3)(_QWORD, _QWORD), void *a4)
{
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, _QWORD, uint64_t, uint64_t);
  id *v31;
  void *v32;
  unsigned int (*v33)(char *, uint64_t, uint64_t);
  void *v34;
  void (*v35)(char *, char *, uint64_t);
  void (*v36)(char *, char *, uint64_t);
  uint64_t v37;
  void (*v38)(char *, char *, uint64_t);
  char *v39;
  void (*v40)(char *, uint64_t);
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v49;
  char *v50;
  void (*v51)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  char *v56;
  void (*v57)(_QWORD, _QWORD);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60[5];

  v57 = a3;
  v59 = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
  MEMORY[0x24BDAC7A8](v6);
  v56 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v49 - v12;
  v14 = type metadata accessor for Date();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v54 = (char *)&v49 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v53 = (char *)&v49 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v50 = (char *)&v49 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v49 - v22;
  v24 = type metadata accessor for JournalingSuggestion.Workout.Details(0);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)&v49 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = v25;
  v28 = (uint64_t)&v27[*(int *)(v25 + 32)];
  v29 = type metadata accessor for DateInterval();
  v30 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56);
  v55 = v28;
  v51 = v30;
  v52 = v29;
  ((void (*)(uint64_t, uint64_t, uint64_t))v30)(v28, 1, 1);
  *((_QWORD *)v27 + 1) = 0;
  v31 = (id *)(v27 + 8);
  *(_QWORD *)v27 = v57;
  *((_QWORD *)v27 + 2) = 0;
  *((_QWORD *)v27 + 3) = 0;
  v32 = a4;
  specialized getMetadata<A>(_:key:as:)(a4, (void *)*MEMORY[0x24BE68DA8], (uint64_t)v13);
  v33 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  if (v33(v13, 1, v14) == 1)
  {
    outlined destroy of URL?((uint64_t)v13, &demangling cache variable for type metadata for Date?);
    v34 = v32;
  }
  else
  {
    v57 = a1;
    v35 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
    v35(v23, v13, v14);
    specialized getMetadata<A>(_:key:as:)(v32, (void *)*MEMORY[0x24BE68DA0], (uint64_t)v11);
    v34 = v32;
    if (v33(v11, 1, v14) == 1)
    {
      outlined destroy of URL?((uint64_t)v11, &demangling cache variable for type metadata for Date?);
      v36 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
      v36(v53, v23, v14);
      v36(v54, v23, v14);
      v37 = (uint64_t)v56;
      DateInterval.init(start:end:)();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v23, v14);
    }
    else
    {
      v35(v50, v11, v14);
      v38 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
      v38(v53, v23, v14);
      v39 = v50;
      v38(v54, v50, v14);
      DateInterval.init(start:end:)();
      v40 = *(void (**)(char *, uint64_t))(v15 + 8);
      v40(v39, v14);
      v40(v23, v14);
      v37 = (uint64_t)v56;
    }
    v51(v37, 0, 1, v52);
    outlined assign with take of URL?(v37, v55, &demangling cache variable for type metadata for DateInterval?);
    a1 = v57;
  }
  v41 = specialized getMetadata<A>(_:key:as:)(v34, (void *)*MEMORY[0x24BE68D50]);
  if (v41)
  {
    v42 = (void *)v41;

    *v31 = v42;
  }
  v43 = specialized getMetadata<A>(_:key:as:)(v34, (void *)*MEMORY[0x24BE68D98]);
  if (v43)
  {
    v44 = v43;

    *((_QWORD *)v27 + 2) = v44;
  }
  v45 = specialized getMetadata<A>(_:key:as:)(v34, (void *)*MEMORY[0x24BE68D48]);
  if (v45)
  {
    v46 = v45;

    *((_QWORD *)v27 + 3) = v46;
  }
  v60[3] = v58;
  v60[4] = (uint64_t)&protocol witness table for JournalingSuggestion.Workout.Details;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v60);
  outlined init with copy of JournalingSuggestion.Workout.Details((uint64_t)v27, (uint64_t)boxed_opaque_existential_1, type metadata accessor for JournalingSuggestion.Workout.Details);
  a1(v60, 0);
  outlined destroy of URL?((uint64_t)v60, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  return outlined destroy of JournalingSuggestionsError((uint64_t)v27, type metadata accessor for JournalingSuggestion.Workout.Details);
}

uint64_t closure #1 in static JournalingSuggestion.Workout.getAssetLoader(for:inside:)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t (*)(uint64_t a1, void *a2), _QWORD *), uint64_t a4, void *a5)
{
  _QWORD *v9;
  id v10;

  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a5;
  v9[3] = a1;
  v9[4] = a2;
  v10 = a5;
  swift_retain();
  a3(partial apply for closure #1 in closure #1 in static JournalingSuggestion.Workout.getAssetLoader(for:inside:), v9);
  return swift_release();
}

uint64_t closure #1 in closure #1 in static JournalingSuggestion.Workout.getAssetLoader(for:inside:)(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  id v16;
  _BYTE v19[40];

  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v10);
  v12 = &v19[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v13 = type metadata accessor for TaskPriority();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 1, 1, v13);
  outlined init with copy of URL?(a1, (uint64_t)v19, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  outlined init with take of JournalingSuggestionAsset?((uint64_t)v19, (uint64_t)(v14 + 4));
  v14[9] = a3;
  v14[10] = a4;
  v14[11] = a5;
  v14[12] = a2;
  v15 = a3;
  swift_retain();
  v16 = a2;
  _sScTss5Error_pRs_rlE8priority9operationScTyxsAA_pGScPSg_xyYaKYAcntcfCyt_Tgm5((uint64_t)v12, (uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in closure #1 in static JournalingSuggestion.Workout.getAssetLoader(for:inside:), (uint64_t)v14);
  return swift_release();
}

uint64_t closure #1 in closure #1 in closure #1 in static JournalingSuggestion.Workout.getAssetLoader(for:inside:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8[20] = a7;
  v8[21] = a8;
  v8[18] = a5;
  v8[19] = a6;
  v8[17] = a4;
  v9 = type metadata accessor for UUID();
  v8[22] = v9;
  v8[23] = *(_QWORD *)(v9 - 8);
  v8[24] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  v8[25] = swift_task_alloc();
  v8[26] = swift_task_alloc();
  v10 = type metadata accessor for URL();
  v8[27] = v10;
  v8[28] = *(_QWORD *)(v10 - 8);
  v8[29] = swift_task_alloc();
  v8[30] = swift_task_alloc();
  v8[31] = swift_task_alloc();
  v8[32] = swift_task_alloc();
  v8[33] = swift_task_alloc();
  v8[34] = type metadata accessor for JournalingSuggestion.Workout(0);
  v8[35] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.Workout.Details?);
  v8[36] = swift_task_alloc();
  v11 = type metadata accessor for JournalingSuggestion.Workout.Details(0);
  v8[37] = v11;
  v8[38] = *(_QWORD *)(v11 - 8);
  v8[39] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #1 in closure #1 in closure #1 in static JournalingSuggestion.Workout.getAssetLoader(for:inside:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  void (*v6)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void *v30;
  UIImage *v31;
  UIImage *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  UIImage *v40;
  void (*v41)(uint64_t, uint64_t);
  NSData *v42;
  NSData *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  void (*v51)(uint64_t, uint64_t, uint64_t);
  void (*v52)(uint64_t, uint64_t, uint64_t, uint64_t);
  NSData *v53;
  NSData *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(uint64_t, _QWORD);
  uint64_t *boxed_opaque_existential_1;
  void (*v71)(uint64_t, uint64_t);
  uint64_t v72;
  uint64_t v73;
  void (*v74)(uint64_t, uint64_t, uint64_t, uint64_t);
  UIImage *v75;
  uint64_t v76;

  v1 = *(_QWORD *)(v0 + 304);
  outlined init with copy of URL?(*(_QWORD *)(v0 + 136), v0 + 16, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  if (!*(_QWORD *)(v0 + 40))
  {
    v27 = *(_QWORD *)(v0 + 288);
    v26 = *(_QWORD *)(v0 + 296);
    outlined destroy of URL?(v0 + 16, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 56))(v27, 1, 1, v26);
    goto LABEL_7;
  }
  v2 = *(_QWORD *)(v0 + 296);
  v3 = *(_QWORD *)(v0 + 304);
  v4 = *(_QWORD *)(v0 + 288);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestionAsset);
  v5 = swift_dynamicCast();
  v6 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v1 + 56);
  v6(v4, v5 ^ 1u, 1, v2);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v4, 1, v2) == 1)
  {
LABEL_7:
    v28 = *(_QWORD *)(v0 + 168);
    v29 = *(void (**)(uint64_t, uint64_t))(v0 + 152);
    outlined destroy of URL?(*(_QWORD *)(v0 + 288), &demangling cache variable for type metadata for JournalingSuggestion.Workout.Details?);
    *(_OWORD *)(v0 + 56) = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
    *(_QWORD *)(v0 + 88) = 0;
    v29(v0 + 56, v28);
    outlined destroy of URL?(v0 + 56, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
    goto LABEL_20;
  }
  v7 = *(_QWORD *)(v0 + 312);
  v8 = *(_QWORD *)(v0 + 296);
  v10 = *(_QWORD *)(v0 + 272);
  v9 = *(_QWORD *)(v0 + 280);
  v11 = *(_QWORD *)(v0 + 216);
  v12 = *(_QWORD *)(v0 + 224);
  v13 = *(void **)(v0 + 144);
  outlined init with take of JournalingSuggestion.Workout(*(_QWORD *)(v0 + 288), v7, type metadata accessor for JournalingSuggestion.Workout.Details);
  outlined init with copy of JournalingSuggestion.Workout.Details(v7, v9, type metadata accessor for JournalingSuggestion.Workout.Details);
  v6(v9, 0, 1, v8);
  v14 = v9 + *(int *)(v10 + 20);
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
  v15(v14, 1, 1, v11);
  v16 = *(int *)(v10 + 24);
  *(_QWORD *)(v9 + v16) = 0;
  v17 = objc_msgSend(v13, sel_iconURL);
  v76 = v14;
  if (!v17)
  {
    v15(*(_QWORD *)(v0 + 208), 1, 1, *(_QWORD *)(v0 + 216));
LABEL_9:
    v30 = *(void **)(v0 + 144);
    outlined destroy of URL?(*(_QWORD *)(v0 + 208), &demangling cache variable for type metadata for URL?);
    v31 = (UIImage *)objc_msgSend(v30, sel_icon);
    if (!v31)
      goto LABEL_17;
    v32 = v31;
    v72 = v16;
    v33 = *(_QWORD *)(v0 + 256);
    v34 = *(_QWORD *)(v0 + 224);
    v73 = *(_QWORD *)(v0 + 216);
    v74 = v15;
    v36 = *(_QWORD *)(v0 + 184);
    v35 = *(_QWORD *)(v0 + 192);
    v37 = *(_QWORD *)(v0 + 176);
    v38 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    v75 = v32;
    v39 = objc_msgSend(v38, sel_temporaryDirectory);

    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    UUID.init()();
    UUID.uuidString.getter();
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v35, v37);
    v40 = v75;
    URL.appendingPathComponent(_:)();
    swift_bridgeObjectRelease();
    v41 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
    v41(v33, v73);
    v42 = UIImageHEICRepresentation(v75);
    v71 = v41;
    if (v42)
    {
      v43 = v42;
      v45 = *(_QWORD *)(v0 + 240);
      v44 = *(_QWORD *)(v0 + 248);
      v47 = *(_QWORD *)(v0 + 216);
      v46 = *(_QWORD *)(v0 + 224);
      v48 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      v50 = v49;

      outlined copy of Data._Representation(v48, v50);
      URL.appendingPathExtension(_:)();
      outlined consume of Data._Representation(v48, v50);
      v41(v44, v47);
      v51 = *(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 32);
      v51(v44, v45, v47);
      v52 = v74;
    }
    else
    {
      v53 = UIImagePNGRepresentation(v75);
      v52 = v74;
      if (!v53)
      {
        v51 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 224) + 32);
        v16 = v72;
        goto LABEL_16;
      }
      v54 = v53;
      v55 = *(_QWORD *)(v0 + 248);
      v56 = *(_QWORD *)(v0 + 224);
      v57 = *(_QWORD *)(v0 + 232);
      v58 = *(_QWORD *)(v0 + 216);
      v48 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      v50 = v59;

      outlined copy of Data._Representation(v48, v50);
      URL.appendingPathExtension(_:)();
      outlined consume of Data._Representation(v48, v50);
      v71(v55, v58);
      v51 = *(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 32);
      v51(v55, v57, v58);
    }
    outlined copy of Data._Representation(v48, v50);
    Data.write(to:options:)();
    v16 = v72;
    outlined consume of Data?(v48, v50);
    outlined consume of Data._Representation(v48, v50);
    v40 = v75;
LABEL_16:
    v60 = *(_QWORD *)(v0 + 216);
    v61 = *(_QWORD *)(v0 + 200);
    v51(v61, *(_QWORD *)(v0 + 248), v60);

    v52(v61, 0, 1, v60);
    outlined assign with take of URL?(v61, v76, &demangling cache variable for type metadata for URL?);
    goto LABEL_17;
  }
  v18 = v17;
  v19 = *(_QWORD *)(v0 + 256);
  v20 = *(_QWORD *)(v0 + 216);
  v21 = *(_QWORD *)(v0 + 224);
  v22 = *(_QWORD *)(v0 + 208);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 32);
  v23(v22, v19, v20);
  v15(v22, 0, 1, v20);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v21 + 48))(v22, 1, v20) == 1)
    goto LABEL_9;
  v24 = *(_QWORD *)(v0 + 264);
  v25 = *(_QWORD *)(v0 + 216);
  v23(v24, *(_QWORD *)(v0 + 208), v25);
  outlined destroy of URL?(v76, &demangling cache variable for type metadata for URL?);
  v23(v76, v24, v25);
  v15(v76, 0, 1, v25);
LABEL_17:
  v62 = objc_msgSend(*(id *)(v0 + 144), sel_route);
  if (v62)
  {
    v63 = v62;
    v64 = objc_msgSend(v62, sel_locationReadings);
    type metadata accessor for CLLocation();
    v65 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    swift_bridgeObjectRelease();
    *(_QWORD *)(v9 + v16) = v65;
  }
  v66 = *(_QWORD *)(v0 + 312);
  v67 = *(_QWORD *)(v0 + 280);
  v68 = *(void (**)(uint64_t, _QWORD))(v0 + 152);
  *(_QWORD *)(v0 + 120) = *(_QWORD *)(v0 + 272);
  *(_QWORD *)(v0 + 128) = &protocol witness table for JournalingSuggestion.Workout;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 96));
  outlined init with copy of JournalingSuggestion.Workout.Details(v67, (uint64_t)boxed_opaque_existential_1, type metadata accessor for JournalingSuggestion.Workout);
  v68(v0 + 96, 0);
  outlined destroy of JournalingSuggestionsError(v66, type metadata accessor for JournalingSuggestion.Workout.Details);
  outlined destroy of URL?(v0 + 96, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  outlined destroy of JournalingSuggestionsError(v67, type metadata accessor for JournalingSuggestion.Workout);
LABEL_20:
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

uint64_t _sScTss5Error_pRs_rlE8priority9operationScTyxsAA_pGScPSg_xyYaKYAcntcfCyt_Tgm5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = type metadata accessor for TaskPriority();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  outlined destroy of URL?(a1, &demangling cache variable for type metadata for TaskPriority?);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t specialized closure #1 in static JournalingSuggestion.WorkoutGroup.getAssetLoader(for:inside:)(void (*a1)(uint64_t *, _QWORD), uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  int *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char v21;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v25[5];

  v9 = (int *)type metadata accessor for JournalingSuggestion.WorkoutGroup(0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (uint64_t *)((char *)&v25[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = (char *)v12 + *(int *)(v10 + 20);
  v14 = type metadata accessor for URL();
  v15 = *(_QWORD *)(v14 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v13, a4, v14);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v13, 0, 1, v14);
  *v12 = a3;
  v16 = v9[6];
  *(_QWORD *)((char *)v12 + v16) = 0;
  v17 = (void *)*MEMORY[0x24BE68D78];
  swift_bridgeObjectRetain();
  v18 = specialized getMetadata<A>(_:key:as:)(a5, v17);
  if (v18)
    *(_QWORD *)((char *)v12 + v16) = v18;
  v19 = v9[7];
  v20 = (char *)v12 + v9[8];
  *(_QWORD *)((char *)v12 + v19) = specialized getMetadata<A>(_:key:as:)(a5, (void *)*MEMORY[0x24BE68D58]);
  *(_QWORD *)v20 = specialized getMetadata<A>(_:key:as:)(a5, (void *)*MEMORY[0x24BE68D80]);
  v20[8] = v21 & 1;
  v25[3] = (uint64_t)v9;
  v25[4] = (uint64_t)&protocol witness table for JournalingSuggestion.WorkoutGroup;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v25);
  outlined init with copy of JournalingSuggestion.Workout.Details((uint64_t)v12, (uint64_t)boxed_opaque_existential_1, type metadata accessor for JournalingSuggestion.WorkoutGroup);
  a1(v25, 0);
  outlined destroy of URL?((uint64_t)v25, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  return outlined destroy of JournalingSuggestionsError((uint64_t)v12, type metadata accessor for JournalingSuggestion.WorkoutGroup);
}

uint64_t (*specialized static JournalingSuggestion.Workout.Details.getAssetLoader(for:inside:)(void *a1))(void (*a1)(_QWORD, _QWORD), uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;

  v2 = objc_msgSend(a1, sel_assetType);
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = v4;
  if (v3 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v5 == v6)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
      return 0;
  }
  v9 = specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x24BE68D90]);
  if ((v10 & 1) == 0)
  {
    v11 = v9;
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = v11;
    *(_QWORD *)(v12 + 24) = a1;
    v13 = a1;
    return partial apply for closure #1 in static JournalingSuggestion.Workout.Details.getAssetLoader(for:inside:);
  }
  if (one-time initialization token for bridge != -1)
    swift_once();
  v15 = type metadata accessor for Logger();
  __swift_project_value_buffer(v15, (uint64_t)static Logger.bridge);
  v16 = Logger.logObject.getter();
  v17 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_233A5C000, v16, v17, "Workout asset should carry .workoutHKType of type Int metadata", v18, 2u);
    MEMORY[0x23493AEA8](v18, -1, -1);
  }

  return 0;
}

uint64_t (*specialized static JournalingSuggestion.Workout.getAssetLoader(for:inside:)(void *a1))(uint64_t a1, uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void (*)(_QWORD, _QWORD), uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(void (*)(_QWORD, _QWORD), uint64_t);
  _QWORD *v16;
  id v18;
  uint64_t v19;
  id v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34[5];

  v2 = objc_msgSend(a1, sel_assetType);
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = v4;
  if (v3 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v5 == v6)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
      return 0;
  }
  v9 = objc_msgSend(a1, sel_content);
  objc_opt_self();
  v10 = swift_dynamicCastObjCClass();
  if (!v10)
  {
    swift_unknownObjectRelease();
    v18 = objc_msgSend(a1, sel_metadata);
    v19 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    *(_QWORD *)&v32 = *MEMORY[0x24BE68D88];
    type metadata accessor for MOSuggestionAssetMetadataKey(0);
    lazy protocol witness table accessor for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey();
    v20 = (id)v32;
    AnyHashable.init<A>(_:)();
    if (*(_QWORD *)(v19 + 16) && (v21 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v34), (v22 & 1) != 0))
    {
      outlined init with copy of Any(*(_QWORD *)(v19 + 56) + 32 * v21, (uint64_t)&v32);
    }
    else
    {
      v32 = 0u;
      v33 = 0u;
    }
    swift_bridgeObjectRelease();
    outlined destroy of AnyHashable((uint64_t)v34);
    v23 = *((_QWORD *)&v33 + 1);
    outlined destroy of URL?((uint64_t)&v32, &demangling cache variable for type metadata for Any?);
    if (!v23)
    {
      if (one-time initialization token for bridge != -1)
        swift_once();
      v24 = type metadata accessor for Logger();
      __swift_project_value_buffer(v24, (uint64_t)static Logger.bridge);
      v25 = a1;
      v26 = Logger.logObject.getter();
      v27 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v26, v27))
      {
        v28 = (uint8_t *)swift_slowAlloc();
        v29 = swift_slowAlloc();
        v34[0] = v29;
        *(_DWORD *)v28 = 136315138;
        *(_QWORD *)&v32 = objc_msgSend(v25, sel_content, (_QWORD)v32);
        v30 = String.init<A>(describing:)();
        *(_QWORD *)&v32 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v31, v34);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_233A5C000, v26, v27, "SuggestionWorkout.getAssetLoader, Unexpected content: %s", v28, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23493AEA8](v29, -1, -1);
        MEMORY[0x23493AEA8](v28, -1, -1);

      }
      else
      {

      }
    }
    return 0;
  }
  v11 = v10;
  v12 = specialized static JournalingSuggestion.Workout.Details.getAssetLoader(for:inside:)(a1);
  v14 = v13;
  if (v12)
  {
    v15 = v12;
    v16 = (_QWORD *)swift_allocObject();
    v16[2] = v15;
    v16[3] = v14;
    v16[4] = v11;
    return partial apply for closure #1 in static JournalingSuggestion.Workout.getAssetLoader(for:inside:);
  }
  else
  {
    swift_unknownObjectRelease();
    return 0;
  }
}

uint64_t (*specialized static JournalingSuggestion.WorkoutGroup.getAssetLoader(for:inside:)(void *a1))(void (*a1)(uint64_t *, _QWORD), uint64_t a2)
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  void *v36;
  char v37;
  char *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t (*result)(void (*)(uint64_t *, _QWORD), uint64_t);
  uint64_t v49;
  void *v50;
  uint64_t (*v51)(void (*)(uint64_t *, _QWORD), uint64_t);
  uint64_t v52;
  void *v53;
  uint64_t (*v54)(void (*)(uint64_t *, _QWORD), uint64_t);
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  void (*v61)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  unsigned int (*v71)(uint64_t, uint64_t, uint64_t);
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void (*v75)(char *, uint64_t, uint64_t);
  char *v76;
  uint64_t v77;
  uint64_t v78;
  void (*v79)(char *, char *, uint64_t);
  char *v80;
  char *v81;
  uint64_t v82;
  void (*v83)(char *, uint64_t);
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  void (*v88)(char *, char *, uint64_t);
  char *v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  uint64_t v93;
  void *v94;
  id v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD *v102;
  uint64_t v103;
  uint64_t (*v104)(void (*)(uint64_t *, _QWORD), uint64_t);
  uint64_t v105;
  unint64_t v106;
  unint64_t v107;
  void (*v108)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  char *v112;
  char *v113;
  uint64_t v114;
  char *v115;
  char *v116;
  char *v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  char *v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  _QWORD *v129;

  v2 = type metadata accessor for JournalingSuggestion.Workout(0);
  v122 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v127 = (uint64_t)&v96 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Date();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v116 = (char *)&v96 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v115 = (char *)&v96 - v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v118 = (char *)&v96 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v113 = (char *)&v96 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v121 = (char *)&v96 - v14;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
  MEMORY[0x24BDAC7A8](v15);
  v117 = (char *)&v96 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v126 = type metadata accessor for JournalingSuggestion.Workout.Details(0);
  v120 = *(_QWORD *)(v126 - 8);
  MEMORY[0x24BDAC7A8](v126);
  v129 = (uint64_t *)((char *)&v96 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v114 = (uint64_t)&v96 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v119 = (uint64_t)&v96 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v124 = (char *)&v96 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v128 = (uint64_t)&v96 - v25;
  v26 = type metadata accessor for URL();
  v125 = *(_QWORD *)(v26 - 8);
  v27 = MEMORY[0x24BDAC7A8](v26);
  v112 = (char *)&v96 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = v28;
  MEMORY[0x24BDAC7A8](v27);
  v123 = (char *)&v96 - v29;
  v30 = objc_msgSend(a1, sel_assetType);
  v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v33 = v32;
  if (v31 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v33 == v34)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v35 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v35 & 1) == 0)
      return 0;
  }
  v36 = (void *)*MEMORY[0x24BE68D60];
  specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x24BE68D60]);
  if ((v37 & 1) != 0)
    return 0;
  v38 = v123;
  assetImageContentToUrl(_:)(a1, v123);
  v39 = specialized getMetadata<A>(_:key:as:)(a1, v36);
  if ((v40 & 1) != 0)
  {
    (*(void (**)(char *, uint64_t))(v125 + 8))(v38, v26);
    return 0;
  }
  v41 = v39;
  v42 = specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x24BE68D88]);
  if (!v42)
  {
LABEL_10:
    if (one-time initialization token for bridge != -1)
      goto LABEL_50;
    goto LABEL_11;
  }
  v43 = v42;
  if (*(_QWORD *)(v42 + 16) < v41)
  {
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  v49 = specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x24BE68D70]);
  v50 = a1;
  v51 = (uint64_t (*)(void (*)(uint64_t *, _QWORD), uint64_t))MEMORY[0x24BEE4AF8];
  if (v49)
    v52 = v49;
  else
    v52 = MEMORY[0x24BEE4AF8];
  v100 = v52;
  v53 = (void *)*MEMORY[0x24BE68D68];
  v97 = v50;
  result = (uint64_t (*)(void (*)(uint64_t *, _QWORD), uint64_t))specialized getMetadata<A>(_:key:as:)(v50, v53);
  if (result)
    v54 = result;
  else
    v54 = v51;
  if (v41 < 0)
  {
    __break(1u);
LABEL_52:
    __break(1u);
    return result;
  }
  v55 = (uint64_t)v117;
  v96 = v43;
  if (v41)
  {
    if ((unint64_t)(v41 - 1) < *(_QWORD *)(v43 + 16))
    {
      v56 = v43;
      v57 = 0;
      v107 = *(_QWORD *)(v100 + 16);
      v106 = *((_QWORD *)v54 + 2);
      v103 = v56 + 32;
      v102 = v129 + 1;
      v101 = v2;
      v58 = (uint64_t)v124;
      v105 = v41;
      v59 = MEMORY[0x24BEE4AF8];
      v104 = v54;
      v99 = v26;
      v98 = v5;
      while (1)
      {
        v110 = v59;
        if (v57 >= v107)
        {
          v61 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
          v61(v128, 1, 1, v4);
        }
        else
        {
          if (v57 >= *(_QWORD *)(v100 + 16))
          {
            __break(1u);
LABEL_49:
            __break(1u);
LABEL_50:
            swift_once();
LABEL_11:
            v44 = type metadata accessor for Logger();
            __swift_project_value_buffer(v44, (uint64_t)static Logger.bridge);
            v45 = Logger.logObject.getter();
            v46 = static os_log_type_t.error.getter();
            if (os_log_type_enabled(v45, v46))
            {
              v47 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v47 = 0;
              _os_log_impl(&dword_233A5C000, v45, v46, "Can't get enough workout group activity types", v47, 2u);
              MEMORY[0x23493AEA8](v47, -1, -1);
            }

            (*(void (**)(char *, uint64_t))(v125 + 8))(v123, v26);
            return 0;
          }
          v60 = v128;
          (*(void (**)(uint64_t, unint64_t, uint64_t))(v5 + 16))(v128, v100+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v57, v4);
          v61 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
          v61(v60, 0, 1, v4);
        }
        if (v57 >= v106)
        {
          v62 = 1;
        }
        else
        {
          if (v57 >= *((_QWORD *)v54 + 2))
            goto LABEL_49;
          (*(void (**)(uint64_t, unint64_t, uint64_t))(v5 + 16))(v58, (unint64_t)v54+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v57, v4);
          v62 = 0;
        }
        v61(v58, v62, 1, v4);
        v63 = *(_QWORD *)(v103 + 8 * v57);
        v64 = v129;
        v65 = (uint64_t)v129 + *(int *)(v126 + 32);
        v66 = type metadata accessor for DateInterval();
        v67 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v66 - 8) + 56);
        v109 = v65;
        v108 = v67;
        v67(v65, 1, 1, v66);
        *v64 = v63;
        v68 = v102;
        v102[1] = 0;
        v68[2] = 0;
        *v68 = 0;
        v69 = v119;
        outlined init with copy of URL?(v128, v119, &demangling cache variable for type metadata for Date?);
        v70 = v58;
        v71 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
        if (v71(v69, 1, v4) == 1)
        {
          outlined destroy of URL?(v69, &demangling cache variable for type metadata for Date?);
          v72 = 1;
          v73 = v101;
        }
        else
        {
          v74 = v69;
          v75 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 32);
          v76 = v121;
          v75(v121, v74, v4);
          v77 = v70;
          v78 = v114;
          outlined init with copy of URL?(v77, v114, &demangling cache variable for type metadata for Date?);
          v79 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
          v79(v118, v76, v4);
          if (v71(v78, 1, v4) == 1)
          {
            v80 = v113;
            v75(v113, (uint64_t)v118, v4);
            outlined destroy of URL?(v78, &demangling cache variable for type metadata for Date?);
          }
          else
          {
            (*(void (**)(char *, uint64_t))(v5 + 8))(v118, v4);
            v80 = v113;
            v75(v113, v78, v4);
          }
          v73 = v101;
          v81 = v121;
          v79(v115, v121, v4);
          v79(v116, v80, v4);
          v55 = (uint64_t)v117;
          DateInterval.init(start:end:)();
          v82 = v98;
          v83 = *(void (**)(char *, uint64_t))(v98 + 8);
          v83(v80, v4);
          v83(v81, v4);
          v72 = 0;
          v26 = v99;
          v5 = v82;
        }
        v108(v55, v72, 1, v66);
        outlined assign with take of URL?(v55, v109, &demangling cache variable for type metadata for DateInterval?);
        v84 = v127;
        outlined init with copy of JournalingSuggestion.Workout.Details((uint64_t)v129, v127, type metadata accessor for JournalingSuggestion.Workout.Details);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v120 + 56))(v84, 0, 1, v126);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v125 + 56))(v84 + *(int *)(v73 + 20), 1, 1, v26);
        *(_QWORD *)(v84 + *(int *)(v73 + 24)) = 0;
        v59 = v110;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v59 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v59 + 16) + 1, 1, v59);
        v58 = (uint64_t)v124;
        v86 = *(_QWORD *)(v59 + 16);
        v85 = *(_QWORD *)(v59 + 24);
        if (v86 >= v85 >> 1)
          v59 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v85 > 1, v86 + 1, 1, v59);
        ++v57;
        *(_QWORD *)(v59 + 16) = v86 + 1;
        outlined init with take of JournalingSuggestion.Workout(v127, v59+ ((*(unsigned __int8 *)(v122 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v122 + 80))+ *(_QWORD *)(v122 + 72) * v86, type metadata accessor for JournalingSuggestion.Workout);
        outlined destroy of URL?(v58, &demangling cache variable for type metadata for Date?);
        outlined destroy of URL?(v128, &demangling cache variable for type metadata for Date?);
        outlined destroy of JournalingSuggestionsError((uint64_t)v129, type metadata accessor for JournalingSuggestion.Workout.Details);
        v54 = v104;
        if (v105 == v57)
          goto LABEL_47;
      }
    }
    goto LABEL_52;
  }
  v59 = MEMORY[0x24BEE4AF8];
LABEL_47:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v87 = v125;
  v88 = *(void (**)(char *, char *, uint64_t))(v125 + 32);
  v89 = v112;
  v88(v112, v123, v26);
  v90 = v59;
  v91 = (*(unsigned __int8 *)(v87 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v87 + 80);
  v92 = (v111 + v91 + 7) & 0xFFFFFFFFFFFFFFF8;
  v93 = swift_allocObject();
  *(_QWORD *)(v93 + 16) = v90;
  v88((char *)(v93 + v91), v89, v26);
  v94 = v97;
  *(_QWORD *)(v93 + v92) = v97;
  v95 = v94;
  return partial apply for specialized closure #1 in static JournalingSuggestion.WorkoutGroup.getAssetLoader(for:inside:);
}

uint64_t sub_233A69C84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = type metadata accessor for URL();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  return swift_deallocObject();
}

uint64_t partial apply for specialized closure #1 in static JournalingSuggestion.WorkoutGroup.getAssetLoader(for:inside:)(void (*a1)(uint64_t *, _QWORD), uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(type metadata accessor for URL() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return specialized closure #1 in static JournalingSuggestion.WorkoutGroup.getAssetLoader(for:inside:)(a1, a2, *(_QWORD *)(v2 + 16), v2 + v6, *(void **)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8)));
}

unint64_t lazy protocol witness table accessor for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey;
  if (!lazy protocol witness table cache variable for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey)
  {
    type metadata accessor for MOSuggestionAssetMetadataKey(255);
    result = MEMORY[0x23493AE0C](&protocol conformance descriptor for MOSuggestionAssetMetadataKey, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey);
  }
  return result;
}

uint64_t outlined destroy of AnyHashable(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_233A69DF4()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.Workout.getAssetLoader(for:inside:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return closure #1 in static JournalingSuggestion.Workout.getAssetLoader(for:inside:)(a1, a2, *(void (**)(uint64_t (*)(uint64_t, void *), _QWORD *))(v2 + 16), *(_QWORD *)(v2 + 24), *(void **)(v2 + 32));
}

uint64_t sub_233A69E2C()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in static JournalingSuggestion.Workout.getAssetLoader(for:inside:)(uint64_t a1, void *a2)
{
  uint64_t v2;

  return closure #1 in closure #1 in static JournalingSuggestion.Workout.getAssetLoader(for:inside:)(a1, a2, *(void **)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t sub_233A69E64()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  if (*(_QWORD *)(v0 + 56))
    __swift_destroy_boxed_opaque_existential_0(v0 + 32);

  swift_release();
  return swift_deallocObject();
}

uint64_t outlined init with take of JournalingSuggestionAsset?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestionAsset?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in closure #1 in closure #1 in static JournalingSuggestion.Workout.getAssetLoader(for:inside:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (uint64_t)(v1 + 4);
  v7 = v1[9];
  v8 = v1[10];
  v10 = v1[11];
  v9 = v1[12];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = partial apply for closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:);
  return closure #1 in closure #1 in closure #1 in static JournalingSuggestion.Workout.getAssetLoader(for:inside:)(a1, v4, v5, v6, v7, v8, v10, v9);
}

uint64_t outlined init with take of JournalingSuggestion.Workout(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t outlined init with copy of JournalingSuggestion.Workout.Details(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t type metadata accessor for CLLocation()
{
  unint64_t result;

  result = lazy cache variable for type metadata for CLLocation;
  if (!lazy cache variable for type metadata for CLLocation)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for CLLocation);
  }
  return result;
}

uint64_t sub_233A6A050()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.Workout.Details.getAssetLoader(for:inside:)(void (*a1)(_QWORD, _QWORD), uint64_t a2)
{
  uint64_t v2;

  return closure #1 in static JournalingSuggestion.Workout.Details.getAssetLoader(for:inside:)(a1, a2, *(void (**)(_QWORD, _QWORD))(v2 + 16), *(void **)(v2 + 24));
}

uint64_t MOSuggestionAssetMotionActivityType.movementType.getter@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;
  uint64_t result;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;

  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = v3;
  if (v2 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v4 == v5)
  {
    v9 = 0;
    goto LABEL_13;
  }
  v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  v9 = 0;
  if ((v7 & 1) != 0)
    goto LABEL_14;
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = v11;
  if (v10 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v12 == v13)
  {
    v9 = 1;
    goto LABEL_13;
  }
  v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if ((v15 & 1) != 0)
  {
    v9 = 1;
    goto LABEL_14;
  }
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v18 = v17;
  v9 = 2;
  if (v16 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v18 == v19)
  {
LABEL_13:
    result = swift_bridgeObjectRelease_n();
    goto LABEL_14;
  }
  v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if ((v20 & 1) != 0)
    v9 = 2;
  else
    v9 = 3;
LABEL_14:
  *a1 = v9;
  return result;
}

uint64_t closure #1 in static JournalingSuggestion.MotionActivity.getAssetLoader(for:inside:)(void (*a1)(__int128 *, _QWORD), uint64_t a2, void *a3, uint64_t a4)
{
  int *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *boxed_opaque_existential_1;
  __int128 v22;
  __int128 v23;
  _UNKNOWN **v24;

  v7 = (int *)type metadata accessor for JournalingSuggestion.MotionActivity(0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = specialized getMetadata<A>(_:key:as:)(a3, (void *)*MEMORY[0x24BE68CE8]);
  if ((v11 & 1) == 0)
  {
    v12 = v10;
    v13 = specialized getMetadata<A>(_:key:as:)(a3, (void *)*MEMORY[0x24BE68CF0]);
    if (v13)
    {
      v14 = (void *)v13;
      MOSuggestionAssetMotionActivityType.movementType.getter((char *)&v22);
      v15 = v22;
      if (v22 != 3)
      {
        v17 = type metadata accessor for URL();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v9, 1, 1, v17);
        v18 = &v9[v7[6]];
        v19 = type metadata accessor for DateInterval();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v18, 1, 1, v19);
        *(_QWORD *)&v9[v7[5]] = v12;
        v20 = v7[7];
        v9[v20] = 3;
        outlined assign with copy of URL?(a4, (uint64_t)v9);
        v9[v20] = v15;
        *((_QWORD *)&v23 + 1) = v7;
        v24 = &protocol witness table for JournalingSuggestion.MotionActivity;
        boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v22);
        outlined init with copy of JournalingSuggestion.MotionActivity((uint64_t)v9, (uint64_t)boxed_opaque_existential_1);
        a1(&v22, 0);

        outlined destroy of JournalingSuggestionAsset?((uint64_t)&v22);
        return outlined destroy of JournalingSuggestion.MotionActivity((uint64_t)v9);
      }

    }
  }
  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  a1(&v22, 0);
  return outlined destroy of JournalingSuggestionAsset?((uint64_t)&v22);
}

uint64_t (*specialized static JournalingSuggestion.MotionActivity.getAssetLoader(for:inside:)(void *a1))(void (*a1)(__int128 *, _QWORD), uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  _BYTE v21[16];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v6 = &v21[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v21[-v7];
  v9 = objc_msgSend(a1, sel_assetType);
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = v11;
  if (v10 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v12 == v13)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v15 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
      return 0;
  }
  assetImageContentToUrl(_:)(a1, v8);
  v17 = type metadata accessor for URL();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v8, 0, 1, v17);
  outlined init with take of URL?((uint64_t)v8, (uint64_t)v6);
  v18 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = a1;
  outlined init with take of URL?((uint64_t)v6, v19 + v18);
  v20 = a1;
  return partial apply for closure #1 in static JournalingSuggestion.MotionActivity.getAssetLoader(for:inside:);
}

uint64_t sub_233A6A5A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?)
                                      - 8)
                          + 80);
  v2 = (v1 + 24) & ~v1;

  v3 = type metadata accessor for URL();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v0 + v2, 1, v3))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v2, v3);
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.MotionActivity.getAssetLoader(for:inside:)(void (*a1)(__int128 *, _QWORD), uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?)
                                      - 8)
                          + 80);
  return closure #1 in static JournalingSuggestion.MotionActivity.getAssetLoader(for:inside:)(a1, a2, *(void **)(v2 + 16), v2 + ((v5 + 24) & ~v5));
}

uint64_t outlined assign with copy of URL?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of JournalingSuggestion.MotionActivity(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for JournalingSuggestion.MotionActivity(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of JournalingSuggestion.MotionActivity(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for JournalingSuggestion.MotionActivity(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t closure #1 in static JournalingSuggestion.Podcast.getAssetLoader(for:inside:)(void (*a1)(uint64_t *, _QWORD), uint64_t a2, void *a3, void *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t, uint64_t);
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void (*v40)(uint64_t *, _QWORD);
  uint64_t v41[5];

  v38 = a4;
  v39 = a2;
  v40 = a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8](v5);
  v37 = (uint64_t)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for JournalingSuggestion.Podcast(0);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (uint64_t *)((char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = (uint64_t)v13 + *(int *)(v11 + 24);
  v15 = type metadata accessor for URL();
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56);
  v17 = 1;
  v36 = v14;
  v16(v14, 1, 1, v15);
  v18 = (uint64_t)v13 + *(int *)(v10 + 28);
  v19 = type metadata accessor for Date();
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56);
  v35 = v18;
  v20(v18, 1, 1, v19);
  v21 = objc_msgSend(a3, sel_artistName);
  v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v24 = v23;

  v13[2] = v22;
  v13[3] = v24;
  v25 = objc_msgSend(a3, sel_title);
  v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v28 = v27;

  *v13 = v26;
  v13[1] = v28;
  v29 = objc_msgSend(a3, sel_imageURL);
  if (v29)
  {
    v30 = v29;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v17 = 0;
  }
  v16((uint64_t)v9, v17, 1, v15);
  outlined assign with take of URL?((uint64_t)v9, v36, &demangling cache variable for type metadata for URL?);
  v31 = v37;
  specialized getMetadata<A>(_:key:as:)(v38, (void *)*MEMORY[0x24BE68CE0], v37);
  outlined assign with take of URL?(v31, v35, &demangling cache variable for type metadata for Date?);
  v41[3] = v10;
  v41[4] = (uint64_t)&protocol witness table for JournalingSuggestion.Podcast;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v41);
  outlined init with copy of JournalingSuggestion.Podcast((uint64_t)v13, (uint64_t)boxed_opaque_existential_1);
  v40(v41, 0);
  outlined destroy of JournalingSuggestionAsset?((uint64_t)v41);
  return outlined destroy of JournalingSuggestion.Podcast((uint64_t)v13);
}

uint64_t (*specialized static JournalingSuggestion.Podcast.getAssetLoader(for:inside:)(void *a1))(void (*a1)(uint64_t *, _QWORD), uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = objc_msgSend(a1, sel_assetType);
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = v4;
  if (v3 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v5 == v6)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
      goto LABEL_13;
  }
  v9 = objc_msgSend(a1, sel_content);
  objc_opt_self();
  v10 = (void *)swift_dynamicCastObjCClass();
  if (!v10)
  {
    swift_unknownObjectRelease();
LABEL_13:
    if (one-time initialization token for bridge != -1)
      swift_once();
    v15 = type metadata accessor for Logger();
    __swift_project_value_buffer(v15, (uint64_t)static Logger.bridge);
    v16 = a1;
    v17 = Logger.logObject.getter();
    v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = swift_slowAlloc();
      v20 = swift_slowAlloc();
      v27 = v20;
      *(_DWORD *)v19 = 136315394;
      type metadata accessor for JournalingSuggestion.Podcast(0);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.Podcast.Type);
      v21 = String.init<A>(describing:)();
      v26 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v19 + 12) = 2080;
      v23 = objc_msgSend(v16, sel_content, v26, v27);
      v24 = String.init<A>(describing:)();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_233A5C000, v17, v18, "%s.getAssetLoader, Unexpected content: %s", (uint8_t *)v19, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23493AEA8](v20, -1, -1);
      MEMORY[0x23493AEA8](v19, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  v11 = v10;
  if (objc_msgSend(v10, sel_mediaType) == (id)2 || objc_msgSend(v11, sel_mediaType) == (id)5)
  {
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = v11;
    *(_QWORD *)(v12 + 24) = a1;
    v13 = a1;
    return partial apply for closure #1 in static JournalingSuggestion.Podcast.getAssetLoader(for:inside:);
  }
  swift_unknownObjectRelease();
  return 0;
}

uint64_t sub_233A6AD40()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.Podcast.getAssetLoader(for:inside:)(void (*a1)(uint64_t *, _QWORD), uint64_t a2)
{
  uint64_t v2;

  return closure #1 in static JournalingSuggestion.Podcast.getAssetLoader(for:inside:)(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t outlined init with copy of JournalingSuggestion.Podcast(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for JournalingSuggestion.Podcast(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of JournalingSuggestion.Podcast(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for JournalingSuggestion.Podcast(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t getMetadataValue<A>(_:key:as:)@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  unint64_t v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t v18;
  unint64_t v19;
  Swift::String v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v24;
  unint64_t v25;
  id v26;

  v8 = type metadata accessor for Optional();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v24 - v10;
  getMetadata<A>(_:key:as:)(a1, a2, a3, (uint64_t)&v24 - v10);
  v12 = *(_QWORD *)(a3 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v11, 1, a3) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v12 + 32))(a4, v11, a3);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  type metadata accessor for JournalingSuggestionsError();
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError((unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestionsError and conformance JournalingSuggestionsError, (uint64_t (*)(uint64_t))type metadata accessor for JournalingSuggestionsError, (uint64_t)&protocol conformance descriptor for JournalingSuggestionsError);
  swift_allocError();
  v14 = v13;
  v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v25 = v15;
  v16._countAndFlagsBits = 8250;
  v16._object = (void *)0xE200000000000000;
  String.append(_:)(v16);
  v26 = (id)a3;
  swift_getMetatypeMetadata();
  v17._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v17);
  swift_bridgeObjectRelease();
  v18 = v24;
  v19 = v25;
  v24 = 0x203A7465737341;
  v25 = 0xE700000000000000;
  v26 = objc_msgSend(a1, sel_content);
  v20._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v20);
  swift_bridgeObjectRelease();
  v21 = v24;
  v22 = v25;
  *v14 = v18;
  v14[1] = v19;
  v14[2] = v21;
  v14[3] = v22;
  swift_storeEnumTagMultiPayload();
  return swift_willThrow();
}

uint64_t getMetadata<A>(_:key:as:)@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  id v7;
  uint64_t v8;
  id v9;
  unint64_t v10;
  char v11;
  int v12;
  _OWORD v14[2];
  _BYTE v15[40];

  v7 = objc_msgSend(a1, sel_metadata);
  v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  *(_QWORD *)&v14[0] = a2;
  type metadata accessor for MOSuggestionAssetMetadataKey(0);
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError((unint64_t *)&lazy protocol witness table cache variable for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey, (uint64_t (*)(uint64_t))type metadata accessor for MOSuggestionAssetMetadataKey, (uint64_t)&protocol conformance descriptor for MOSuggestionAssetMetadataKey);
  v9 = a2;
  AnyHashable.init<A>(_:)();
  if (*(_QWORD *)(v8 + 16) && (v10 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v15), (v11 & 1) != 0))
    outlined init with copy of Any(*(_QWORD *)(v8 + 56) + 32 * v10, (uint64_t)v14);
  else
    memset(v14, 0, sizeof(v14));
  swift_bridgeObjectRelease();
  outlined destroy of AnyHashable((uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  v12 = swift_dynamicCast();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 56))(a4, v12 ^ 1u, 1, a3);
}

uint64_t getMetadata<A>(_:key:as:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  id v8;
  unint64_t v9;
  char v10;
  int v11;
  _OWORD v13[2];
  _BYTE v14[40];

  *(_QWORD *)&v13[0] = a2;
  type metadata accessor for MOSuggestionAssetMetadataKey(0);
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError((unint64_t *)&lazy protocol witness table cache variable for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey, (uint64_t (*)(uint64_t))type metadata accessor for MOSuggestionAssetMetadataKey, (uint64_t)&protocol conformance descriptor for MOSuggestionAssetMetadataKey);
  v8 = a2;
  AnyHashable.init<A>(_:)();
  if (*(_QWORD *)(a1 + 16) && (v9 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v14), (v10 & 1) != 0))
    outlined init with copy of Any(*(_QWORD *)(a1 + 56) + 32 * v9, (uint64_t)v13);
  else
    memset(v13, 0, sizeof(v13));
  outlined destroy of AnyHashable((uint64_t)v14);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  v11 = swift_dynamicCast();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 56))(a4, v11 ^ 1u, 1, a3);
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

{
  uint64_t v2;

  type metadata accessor for UUID();
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  v2 = dispatch thunk of Hashable._rawHashValue(seed:)();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
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
      v7 = MEMORY[0x23493A7D0](v9, a1);
      outlined destroy of AnyHashable((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

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
  v5 = type metadata accessor for UUID();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
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
      lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v14 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

uint64_t outlined init with copy of AnyHashable(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t Logger.bridge.unsafeMutableAddressor()
{
  return Logger.bridge.unsafeMutableAddressor(&one-time initialization token for bridge, (uint64_t)static Logger.bridge);
}

void *Logger.subystemPrefix.unsafeMutableAddressor()
{
  return &static Logger.subystemPrefix;
}

unint64_t static Logger.subystemPrefix.getter()
{
  return 0xD00000000000001FLL;
}

uint64_t one-time initialization function for shared()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.shared);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.shared);
  return Logger.init(subsystem:category:)();
}

uint64_t static Logger.osLogger(category:)()
{
  swift_bridgeObjectRetain();
  return Logger.init(subsystem:category:)();
}

uint64_t Logger.shared.unsafeMutableAddressor()
{
  return Logger.bridge.unsafeMutableAddressor(&one-time initialization token for shared, (uint64_t)static Logger.shared);
}

uint64_t static Logger.shared.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.shared.getter(&one-time initialization token for shared, (uint64_t)static Logger.shared, a1);
}

uint64_t one-time initialization function for picker()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.picker);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.picker);
  return Logger.init(subsystem:category:)();
}

uint64_t Logger.picker.unsafeMutableAddressor()
{
  return Logger.bridge.unsafeMutableAddressor(&one-time initialization token for picker, (uint64_t)static Logger.picker);
}

uint64_t static Logger.picker.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.shared.getter(&one-time initialization token for picker, (uint64_t)static Logger.picker, a1);
}

uint64_t one-time initialization function for assets()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.assets);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.assets);
  return Logger.init(subsystem:category:)();
}

uint64_t Logger.assets.unsafeMutableAddressor()
{
  return Logger.bridge.unsafeMutableAddressor(&one-time initialization token for assets, (uint64_t)static Logger.assets);
}

uint64_t Logger.bridge.unsafeMutableAddressor(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static Logger.assets.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.shared.getter(&one-time initialization token for assets, (uint64_t)static Logger.assets, a1);
}

uint64_t one-time initialization function for bridge()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.bridge);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.bridge);
  return Logger.init(subsystem:category:)();
}

uint64_t static Logger.bridge.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.shared.getter(&one-time initialization token for bridge, (uint64_t)static Logger.bridge, a1);
}

uint64_t static Logger.shared.getter@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = type metadata accessor for Logger();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
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
  outlined destroy of URL?(a1, &demangling cache variable for type metadata for TaskPriority?);
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

BOOL static PlatformVersion.< infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1 < a3 || a2 < a4;
}

uint64_t PlatformVersion.minor.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

BOOL static PlatformVersion.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1 == a3 && a2 == a4;
}

BOOL protocol witness for static Comparable.< infix(_:_:) in conformance PlatformVersion(_QWORD *a1, _QWORD *a2)
{
  return *a1 < *a2 || a1[1] < a2[1];
}

BOOL protocol witness for static Comparable.<= infix(_:_:) in conformance PlatformVersion(_QWORD *a1, _QWORD *a2)
{
  return *a2 >= *a1 && a2[1] >= a1[1];
}

BOOL protocol witness for static Comparable.>= infix(_:_:) in conformance PlatformVersion(_QWORD *a1, _QWORD *a2)
{
  return *a1 >= *a2 && a1[1] >= a2[1];
}

BOOL protocol witness for static Comparable.> infix(_:_:) in conformance PlatformVersion(_QWORD *a1, _QWORD *a2)
{
  return *a2 < *a1 || a2[1] < a1[1];
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance PlatformVersion(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

void one-time initialization function for DEFAULT_OPTIONS()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  Class isa;
  _BOOL8 v13;
  id v14;
  uint64_t v15;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v15 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for UUID();
  v4 = *(_QWORD *)(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  v5 = specialized static SuggestionSheetManager.getClientPlatformVersion()();
  v7 = v6;
  v9 = v8;
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) != 1)
  {
    isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v3);
  }
  v13 = (v9 & 1) == 0 && v5 > 17 && v7 >= 0;
  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE68EB8]), sel_initWithShowCancelButton_showBlankEntryButton_peekDetentRatio_presentFullScreen_presentationIsAnimated_selectedTabIsRecommended_selectedSuggestionId_contentOptions_, 1, 1, 1, 1, 1, isa, 1.0, v13);

  static SuggestionSheetManager.DEFAULT_OPTIONS = (uint64_t)v14;
}

uint64_t *SuggestionSheetManager.DEFAULT_OPTIONS.unsafeMutableAddressor()
{
  if (one-time initialization token for DEFAULT_OPTIONS != -1)
    swift_once();
  return &static SuggestionSheetManager.DEFAULT_OPTIONS;
}

id static SuggestionSheetManager.DEFAULT_OPTIONS.getter()
{
  return static SuggestionSheetManager.DEFAULT_OPTIONS.getter(&one-time initialization token for DEFAULT_OPTIONS, (id *)&static SuggestionSheetManager.DEFAULT_OPTIONS);
}

id one-time initialization function for shared()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SuggestionSheetManager()), sel_init);
  static SuggestionSheetManager.shared = (uint64_t)result;
  return result;
}

id SuggestionSheetManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t *SuggestionSheetManager.shared.unsafeMutableAddressor()
{
  if (one-time initialization token for shared != -1)
    swift_once();
  return &static SuggestionSheetManager.shared;
}

id static SuggestionSheetManager.shared.getter()
{
  return static SuggestionSheetManager.DEFAULT_OPTIONS.getter(&one-time initialization token for shared, (id *)&static SuggestionSheetManager.shared);
}

id static SuggestionSheetManager.DEFAULT_OPTIONS.getter(_QWORD *a1, id *a2)
{
  if (*a1 != -1)
    swift_once();
  return *a2;
}

id SuggestionSheetManager.presentationOptions.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationOptions);
}

uint64_t SuggestionSheetManager.servicePickerViewState()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[2];
  uint64_t v14;
  uint64_t v15;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = type metadata accessor for DispatchWorkItemFlags();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v14 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[1] = *(_QWORD *)(v1 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_pickerQueue);
  v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = partial apply for closure #1 in SuggestionSheetManager.servicePickerViewState();
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = &block_descriptor_53;
  v11 = _Block_copy(aBlock);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  v15 = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, v3, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], &demangling cache variable for type metadata for [DispatchWorkItemFlags], MEMORY[0x24BEE12C8]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x23493A6F8](0, v9, v5, v11);
  _Block_release(v11);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_release();
  return swift_release();
}

void closure #1 in SuggestionSheetManager.servicePickerViewState()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  char *v8;
  uint64_t v9;
  int v10;
  char *v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  char v18;
  char *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  const char *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint32_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  os_log_type_t v34;
  NSObject *v35;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x23493AF2C](v1);
  if (v2)
  {
    v3 = (char *)v2;
    v4 = *(void **)(v2 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_controller);
    if (!v4)
    {
LABEL_35:

      return;
    }
    v5 = OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock;
    v6 = *(void **)(v2 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock);
    v7 = v4;
    objc_msgSend(v6, sel_lock);
    v8 = &v3[OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState];
    v9 = *(_QWORD *)&v3[OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState];
    v10 = v3[OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState + 8];
    v11 = &v3[OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_viewState];
    v12 = v3[OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_viewState + 8];
    if ((v10 & 1) != 0)
    {
      if (!v3[OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_viewState + 8])
        goto LABEL_10;
    }
    else
    {
      if (v9 != *(_QWORD *)v11)
        v12 = 1;
      if ((v12 & 1) != 0)
      {
LABEL_10:
        objc_msgSend(*(id *)&v3[v5], sel_unlock);
        if (one-time initialization token for bridge != -1)
          swift_once();
        v13 = type metadata accessor for Logger();
        __swift_project_value_buffer(v13, (uint64_t)static Logger.bridge);
        v14 = v3;
        v15 = Logger.logObject.getter();
        v16 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v15, v16))
        {
          v17 = swift_slowAlloc();
          *(_DWORD *)v17 = 134218496;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *(_WORD *)(v17 + 12) = 2048;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *(_WORD *)(v17 + 22) = 2048;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();

          _os_log_impl(&dword_233A5C000, v15, v16, "servicePickerViewState, target, %lu, targetView, %lu, view, %lu", (uint8_t *)v17, 0x20u);
          MEMORY[0x23493AEA8](v17, -1, -1);

          if (v10)
            goto LABEL_24;
        }
        else
        {

          if (v10)
          {
LABEL_24:
            v23 = Logger.logObject.getter();
            v24 = static os_log_type_t.debug.getter();
            if (!os_log_type_enabled(v23, v24))
            {
              v35 = v14;
              goto LABEL_34;
            }
            v25 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v25 = 0;
            v26 = "nil targetViewState, ignoring update";
            v27 = v23;
            v28 = v24;
            v29 = v25;
            v30 = 2;
LABEL_31:
            _os_log_impl(&dword_233A5C000, v27, v28, v26, v29, v30);
            v35 = v23;
            MEMORY[0x23493AEA8](v25, -1, -1);
            v23 = v14;
LABEL_34:

            v3 = (char *)v7;
            goto LABEL_35;
          }
        }
        v18 = v8[8];
        v19 = (char *)v14 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_transitionViewState;
        *(_QWORD *)v19 = *(_QWORD *)v8;
        v19[8] = v18;
        if ((v11[8] & 1) != 0)
        {
          if ((unint64_t)(v9 - 1) > 1)
            goto LABEL_26;
        }
        else if (*(_QWORD *)v11 || (unint64_t)(v9 - 1) >= 2)
        {
LABEL_26:
          v31 = Logger.logObject.getter();
          v32 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v31, v32))
          {
            v33 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v33 = 0;
            _os_log_impl(&dword_233A5C000, v31, v32, "Posting picker state update: .dismissed", v33, 2u);
            MEMORY[0x23493AEA8](v33, -1, -1);
          }

          -[NSObject updatePickerState:animated:](v7, sel_updatePickerState_animated_, 0, objc_msgSend(*(id *)((char *)&v14->isa+ OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationOptions), sel_presentationIsAnimated));
          *(_QWORD *)v19 = 0;
          v19[8] = 1;
LABEL_29:
          v23 = Logger.logObject.getter();
          v34 = static os_log_type_t.debug.getter();
          if (!os_log_type_enabled(v23, v34))
          {
            v35 = v7;
            v7 = v14;
            goto LABEL_34;
          }
          v25 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v25 = 134217984;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          v26 = "Expecting transition to %lu";
          v27 = v23;
          v28 = v34;
          v29 = v25;
          v30 = 12;
          goto LABEL_31;
        }
        v20 = Logger.logObject.getter();
        v21 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v20, v21))
        {
          v22 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v22 = 0;
          _os_log_impl(&dword_233A5C000, v20, v21, "Requesting picker", v22, 2u);
          MEMORY[0x23493AEA8](v22, -1, -1);
        }

        -[NSObject requestPickerWithOptions:](v7, sel_requestPickerWithOptions_, *(Class *)((char *)&v14->isa+ OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationOptions));
        goto LABEL_29;
      }
    }
    *(_QWORD *)v8 = 0;
    v8[8] = 1;
    goto LABEL_10;
  }
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

uint64_t SuggestionSheetManager.remoteViewStateChangedTo(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[2];
  uint64_t v17;
  uint64_t v18;
  _QWORD aBlock[6];

  v2 = v1;
  v4 = type metadata accessor for DispatchWorkItemFlags();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v17 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[1] = *(_QWORD *)(v2 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_pickerQueue);
  v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  *(_QWORD *)(v13 + 24) = a1;
  aBlock[4] = partial apply for closure #1 in SuggestionSheetManager.remoteViewStateChangedTo(_:);
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = &block_descriptor_42;
  v14 = _Block_copy(aBlock);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  v18 = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, v5, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], &demangling cache variable for type metadata for [DispatchWorkItemFlags], MEMORY[0x24BEE12C8]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x23493A6F8](0, v11, v7, v14);
  _Block_release(v14);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  swift_release();
  return swift_release();
}

void closure #1 in SuggestionSheetManager.remoteViewStateChangedTo(_:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint32_t v22;
  uint64_t v23;
  uint64_t v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t *v27;
  int64_t v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  int64_t v46;
  unint64_t v47;
  int64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  int64_t v52;
  int v53;
  void *v54;
  uint64_t v55;
  __int128 v56;
  uint64_t *v57;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: SuggestionSheetManager.TrackingHandlers)?);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v52 - v8;
  swift_beginAccess();
  v10 = MEMORY[0x23493AF2C](a1 + 16);
  if (v10)
  {
    v11 = v10;
    v12 = OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock;
    objc_msgSend(*(id *)(v10 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock), sel_lock);
    v13 = v11 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_transitionViewState;
    if (*(_BYTE *)(v11 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_transitionViewState + 8) != 1)
    {
      v23 = *(_QWORD *)v13;
      *(_QWORD *)v13 = 0;
      *(_BYTE *)(v13 + 8) = 1;
      if ((*(_BYTE *)(v11 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState + 8) & 1) != 0
        || v23 != *(_QWORD *)(v11 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState))
      {
        v53 = 1;
        if (!a2)
          goto LABEL_15;
        goto LABEL_13;
      }
      if (one-time initialization token for bridge != -1)
        goto LABEL_49;
      goto LABEL_9;
    }
    if (one-time initialization token for bridge != -1)
      goto LABEL_47;
LABEL_4:
    v14 = type metadata accessor for Logger();
    __swift_project_value_buffer(v14, (uint64_t)static Logger.bridge);
    v15 = Logger.logObject.getter();
    v16 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v15, v16))
      goto LABEL_12;
    v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v17 = 0;
    v18 = "No view state updated expected.";
    v19 = v15;
    v20 = v16;
    v21 = v17;
    v22 = 2;
LABEL_11:
    _os_log_impl(&dword_233A5C000, v19, v20, v18, v21, v22);
    MEMORY[0x23493AEA8](v17, -1, -1);
    while (1)
    {
LABEL_12:

      v53 = 0;
      if (a2)
      {
LABEL_13:
        v26 = MEMORY[0x24BEE4B00];
      }
      else
      {
LABEL_15:
        v27 = (uint64_t *)(v11 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_trackingTokens);
        swift_beginAccess();
        v26 = *v27;
        *v27 = MEMORY[0x24BEE4B00];
      }
      objc_msgSend(*(id *)(v11 + v12), sel_unlock, v52);
      v28 = 0;
      v29 = v11 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_viewState;
      *(_QWORD *)v29 = a2;
      *(_BYTE *)(v29 + 8) = 0;
      v30 = *(_QWORD *)(v26 + 64);
      v54 = (void *)v11;
      v55 = v26 + 64;
      v31 = 1 << *(_BYTE *)(v26 + 32);
      v32 = -1;
      if (v31 < 64)
        v32 = ~(-1 << v31);
      v33 = v32 & v30;
      v11 = (unint64_t)(v31 + 63) >> 6;
      v52 = v11 - 1;
      a2 = &demangling cache variable for type metadata for (key: UUID, value: SuggestionSheetManager.TrackingHandlers);
      if ((v32 & v30) != 0)
        break;
LABEL_23:
      v46 = v28 + 1;
      if (__OFADD__(v28, 1))
      {
        __break(1u);
LABEL_47:
        swift_once();
        goto LABEL_4;
      }
      if (v46 >= v11)
        goto LABEL_40;
      v47 = *(_QWORD *)(v55 + 8 * v46);
      if (v47)
        goto LABEL_26;
      v48 = v28 + 2;
      ++v28;
      if (v46 + 1 >= v11)
        goto LABEL_40;
      v47 = *(_QWORD *)(v55 + 8 * v48);
      if (v47)
      {
LABEL_29:
        v46 = v48;
LABEL_26:
        v33 = (v47 - 1) & v47;
        v37 = __clz(__rbit64(v47)) + (v46 << 6);
        v28 = v46;
        goto LABEL_22;
      }
      v28 = v46 + 1;
      if (v46 + 2 >= v11)
        goto LABEL_40;
      v47 = *(_QWORD *)(v55 + 8 * (v46 + 2));
      if (v47)
      {
        v46 += 2;
        goto LABEL_26;
      }
      v48 = v46 + 3;
      v28 = v46 + 2;
      if (v46 + 3 >= v11)
      {
LABEL_40:
        v49 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: SuggestionSheetManager.TrackingHandlers));
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56))(v7, 1, 1, v49);
        v33 = 0;
        goto LABEL_41;
      }
      v47 = *(_QWORD *)(v55 + 8 * v48);
      if (v47)
        goto LABEL_29;
      while (1)
      {
        v46 = v48 + 1;
        if (__OFADD__(v48, 1))
          break;
        if (v46 >= v11)
        {
          v28 = v52;
          goto LABEL_40;
        }
        v47 = *(_QWORD *)(v55 + 8 * v46);
        ++v48;
        if (v47)
          goto LABEL_26;
      }
      __break(1u);
LABEL_49:
      swift_once();
LABEL_9:
      v24 = type metadata accessor for Logger();
      __swift_project_value_buffer(v24, (uint64_t)static Logger.bridge);
      v15 = Logger.logObject.getter();
      v25 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v15, v25))
      {
        v17 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v17 = 134217984;
        v57 = a2;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        v18 = "Completed transition to %lu";
        v19 = v15;
        v20 = v25;
        v21 = v17;
        v22 = 12;
        goto LABEL_11;
      }
    }
    while (1)
    {
      v36 = __clz(__rbit64(v33));
      v33 &= v33 - 1;
      v37 = v36 | (v28 << 6);
LABEL_22:
      v38 = *(_QWORD *)(v26 + 48);
      v39 = type metadata accessor for UUID();
      (*(void (**)(char *, unint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 16))(v7, v38 + *(_QWORD *)(*(_QWORD *)(v39 - 8) + 72) * v37, v39);
      v40 = *(_QWORD *)(v26 + 56) + 32 * v37;
      v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: SuggestionSheetManager.TrackingHandlers));
      v42 = &v7[*(int *)(v41 + 48)];
      v43 = *(_QWORD *)v40;
      v44 = *(_QWORD *)(v40 + 24);
      v56 = *(_OWORD *)(v40 + 8);
      v45 = v56;
      *(_QWORD *)v42 = v43;
      *(_OWORD *)(v42 + 8) = v45;
      *((_QWORD *)v42 + 3) = v44;
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v7, 0, 1, v41);
      swift_retain();
      swift_retain();
LABEL_41:
      outlined init with take of JournalingSuggestion.ItemContent?((uint64_t)v7, (uint64_t)v9, &demangling cache variable for type metadata for (key: UUID, value: SuggestionSheetManager.TrackingHandlers)?);
      v50 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: SuggestionSheetManager.TrackingHandlers));
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 48))(v9, 1, v50) == 1)
        break;
      v34 = &v9[*(int *)(v50 + 48)];
      v12 = *((_QWORD *)v34 + 1);
      (*((void (**)(void))v34 + 2))();
      swift_release();
      swift_release();
      v35 = type metadata accessor for UUID();
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v35 - 8) + 8))(v9, v35);
      if (!v33)
        goto LABEL_23;
    }
    swift_release();
    v51 = v54;
    if ((v53 & 1) != 0)
      SuggestionSheetManager.servicePickerViewState()();

  }
}

Swift::Bool __swiftcall SuggestionSheetManager.activate()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  Swift::Bool result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18[2];
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[6];

  v1 = type metadata accessor for DispatchWorkItemFlags();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchQoS();
  v19 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v9 = objc_msgSend(v8, sel_connectedScenes);

  type metadata accessor for UIScene(0, &lazy cache variable for type metadata for UIScene);
  lazy protocol witness table accessor for type UIScene and conformance NSObject();
  v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  v11 = (void *)specialized Collection.first.getter(v10);
  result = swift_bridgeObjectRelease();
  if (v11)
  {
    objc_opt_self();
    v13 = swift_dynamicCastObjCClassUnconditional();
    if (*(_QWORD *)(v0 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_controller))
    {

      return (*(_BYTE *)(v0 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_viewState + 8) & 1) == 0
          && (unint64_t)(*(_QWORD *)(v0
                                          + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_viewState)
                              - 1) < 2;
    }
    else
    {
      v14 = v13;
      v18[1] = *(id *)(v0 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_pickerQueue);
      v15 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v16 = swift_allocObject();
      *(_QWORD *)(v16 + 16) = v15;
      *(_QWORD *)(v16 + 24) = v14;
      aBlock[4] = partial apply for closure #1 in SuggestionSheetManager.activate();
      aBlock[5] = v16;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
      aBlock[3] = &block_descriptor_0;
      v17 = _Block_copy(aBlock);
      swift_retain();
      v18[0] = v11;
      static DispatchQoS.unspecified.getter();
      v20 = MEMORY[0x24BEE4AF8];
      lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
      lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], &demangling cache variable for type metadata for [DispatchWorkItemFlags], MEMORY[0x24BEE12C8]);
      dispatch thunk of SetAlgebra.init<A>(_:)();
      MEMORY[0x23493A6F8](0, v7, v4, v17);
      _Block_release(v17);

      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v5);
      swift_release();
      swift_release();
      return 0;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t specialized Collection.first.getter(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    v3 = __CocoaSet.startIndex.getter();
    v5 = v4;
    v6 = __CocoaSet.endIndex.getter();
    v8 = MEMORY[0x23493A788](v3, v5, v6, v7);
    swift_bridgeObjectRelease();
    if ((v8 & 1) != 0)
    {
LABEL_3:
      outlined consume of Set<UIScene>.Index._Variant(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    specialized Set.subscript.getter(v3, v5, v2 != 0, a1);
    v9 = v13;
    outlined consume of Set<UIScene>.Index._Variant(v3, v5, v2 != 0);
    return v9;
  }
  result = specialized _NativeSet.startIndex.getter(a1);
  if ((v12 & 1) == 0)
  {
    v5 = v11;
    if (*(_DWORD *)(a1 + 36) == (_DWORD)v11)
    {
      v3 = result;
      if (result == 1 << *(_BYTE *)(a1 + 32))
        goto LABEL_3;
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t specialized Collection.first.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  int v9;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: SuggestionSheetManager.TrackingHandlers));
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = specialized Dictionary.startIndex.getter(a1);
  if ((v10 & 1) != 0)
    goto LABEL_7;
  if (*(_DWORD *)(a1 + 36) != v9)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }
  if (result == 1 << *(_BYTE *)(a1 + 32))
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, 1, 1, v4);
  v11 = (uint64_t *)&v7[*(int *)(v4 + 48)];
  v12 = specialized Dictionary.subscript.getter((uint64_t)v7, result, v9, 0, a1);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  *v11 = v12;
  v11[1] = v13;
  v11[2] = v15;
  v11[3] = v17;
  v19 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(a2, v7, v19);
  v20 = (uint64_t *)(a2 + *(int *)(v4 + 48));
  *v20 = v12;
  v20[1] = v14;
  v20[2] = v16;
  v20[3] = v18;
  swift_retain();
  swift_retain();
  outlined destroy of URL?((uint64_t)v7, &demangling cache variable for type metadata for (key: UUID, value: SuggestionSheetManager.TrackingHandlers));
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, v4);
}

void closure #1 in SuggestionSheetManager.activate()(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  id v11;
  void *v12;
  char *v13;

  v3 = a1 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x23493AF2C](v3);
  if (v4)
  {
    v5 = (char *)v4;
    v6 = OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_controller;
    if (!*(_QWORD *)(v4 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_controller))
    {
      if (one-time initialization token for bridge != -1)
        swift_once();
      v7 = type metadata accessor for Logger();
      __swift_project_value_buffer(v7, (uint64_t)static Logger.bridge);
      v8 = Logger.logObject.getter();
      v9 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v8, v9))
      {
        v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_233A5C000, v8, v9, "Activating JournalingSuggestionsPicker", v10, 2u);
        MEMORY[0x23493AEA8](v10, -1, -1);
      }

      v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE68EB0]), sel_initForScene_, a2);
      objc_msgSend(v11, sel_setDelegate_, v5);
      v12 = *(void **)&v5[v6];
      *(_QWORD *)&v5[v6] = v11;
      v13 = (char *)v11;

      objc_msgSend(v13, sel_activate);
      v5 = v13;
    }

  }
}

uint64_t SuggestionSheetManager.show(token:onCompletion:onDismiss:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t *v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v6 = v5;
  v35 = a2;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for UUID();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = a4;
  *(_QWORD *)(v18 + 24) = a5;
  if (*(_QWORD *)(v6 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_controller))
  {
    v19 = OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock;
    v20 = *(void **)(v6 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock);
    swift_retain();
    objc_msgSend(v20, sel_lock);
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a1, v14);
    v21 = (uint64_t *)(v6 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_trackingTokens);
    swift_beginAccess();
    swift_retain();
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v36 = *v21;
    *v21 = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v35, a3, (uint64_t)partial apply for closure #1 in SuggestionSheetManager.show(token:onCompletion:onDismiss:), v18, (uint64_t)v17, isUniquelyReferenced_nonNull_native);
    *v21 = v36;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    swift_endAccess();
    objc_msgSend(*(id *)(v6 + v19), sel_unlock);
    objc_msgSend(*(id *)(v6 + v19), sel_lock);
    v23 = v6 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState;
    if ((*(_BYTE *)(v6 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState + 8) & 1) != 0
      || *(_QWORD *)v23 != 2)
    {
      *(_QWORD *)v23 = 2;
      *(_BYTE *)(v23 + 8) = 0;
    }
    objc_msgSend(*(id *)(v6 + v19), sel_unlock);
    SuggestionSheetManager.servicePickerViewState()();
  }
  else
  {
    v24 = one-time initialization token for bridge;
    swift_retain();
    if (v24 != -1)
      swift_once();
    v25 = type metadata accessor for Logger();
    __swift_project_value_buffer(v25, (uint64_t)static Logger.bridge);
    v26 = Logger.logObject.getter();
    v27 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_233A5C000, v26, v27, "Can't show suggestions picker, not activated", v28, 2u);
      MEMORY[0x23493AEA8](v28, -1, -1);
    }

    v29 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v13, 1, 1, v29);
    type metadata accessor for MainActor();
    swift_retain();
    v30 = static MainActor.shared.getter();
    v31 = (_QWORD *)swift_allocObject();
    v32 = MEMORY[0x24BEE6930];
    v31[2] = v30;
    v31[3] = v32;
    v31[4] = a4;
    v31[5] = a5;
    _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v13, (uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in SuggestionSheetManager.show(token:onCompletion:onDismiss:), (uint64_t)v31);
    swift_release();
  }
  return swift_release();
}

uint64_t closure #1 in SuggestionSheetManager.show(token:onCompletion:onDismiss:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  type metadata accessor for MainActor();
  swift_retain();
  v8 = static MainActor.shared.getter();
  v9 = (_QWORD *)swift_allocObject();
  v10 = MEMORY[0x24BEE6930];
  v9[2] = v8;
  v9[3] = v10;
  v9[4] = a1;
  v9[5] = a2;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v6, (uint64_t)&closure #1 in closure #1 in SuggestionSheetManager.show(token:onCompletion:onDismiss:)partial apply, (uint64_t)v9);
  return swift_release();
}

uint64_t closure #1 in closure #1 in SuggestionSheetManager.show(token:onCompletion:onDismiss:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[2] = a4;
  v5[3] = a5;
  type metadata accessor for MainActor();
  v5[4] = static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  return swift_task_switch();
}

uint64_t closure #1 in closure #1 in SuggestionSheetManager.show(token:onCompletion:onDismiss:)()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(v0 + 16);
  v2 = swift_release();
  v1(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

BOOL static SuggestionSheetManager.DismissReason.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void SuggestionSheetManager.DismissReason.hash(into:)(uint64_t a1, char a2)
{
  Hasher._combine(_:)(a2 & 1);
}

Swift::Int SuggestionSheetManager.DismissReason.hashValue.getter(char a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1 & 1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance SuggestionSheetManager.DismissReason(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SuggestionSheetManager.DismissReason()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance SuggestionSheetManager.DismissReason()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SuggestionSheetManager.DismissReason()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

id SuggestionSheetManager.dismiss(presentationToken:reason:)(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id result;
  BOOL v11;
  uint64_t v12;

  v3 = v2;
  v5 = a2 & 1;
  v6 = OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock;
  objc_msgSend(*(id *)(v3 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock), sel_lock);
  v7 = v3 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_trackingTokens;
  swift_beginAccess();
  v8 = specialized Dictionary._Variant.removeValue(forKey:)(a1);
  swift_endAccess();
  outlined consume of SuggestionSheetManager.TrackingHandlers?(v8);
  v9 = *(_QWORD *)(*(_QWORD *)v7 + 16);
  result = objc_msgSend(*(id *)(v3 + v6), sel_unlock);
  if (v9)
    v11 = v5 == 0;
  else
    v11 = 1;
  if (v11)
  {
    objc_msgSend(*(id *)(v3 + v6), sel_lock);
    v12 = v3 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState;
    if ((*(_BYTE *)(v3 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState + 8) & 1) != 0
      || *(_QWORD *)v12)
    {
      *(_QWORD *)v12 = 0;
      *(_BYTE *)(v12 + 8) = 0;
    }
    objc_msgSend(*(id *)(v3 + v6), sel_unlock);
    return (id)SuggestionSheetManager.servicePickerViewState()();
  }
  return result;
}

Swift::Void __swiftcall SuggestionSheetManager.onApplicationMovedToForeground()()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState);
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState + 8) & 1) == 0)
  {
    v2 = *v1;
    if ((unint64_t)(*v1 - 3) >= 0xFFFFFFFFFFFFFFFELL)
    {
      v3 = OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock;
      objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock), sel_lock);
      *v1 = v2;
      *((_BYTE *)v1 + 8) = 0;
      v4 = v0 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_viewState;
      *(_QWORD *)v4 = 0;
      *(_BYTE *)(v4 + 8) = 1;
      v5 = v0 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_transitionViewState;
      *(_QWORD *)v5 = 0;
      *(_BYTE *)(v5 + 8) = 1;
      objc_msgSend(*(id *)(v0 + v3), sel_unlock);
      SuggestionSheetManager.servicePickerViewState()();
    }
  }
}

uint64_t SuggestionSheetManager.suggestionSheetController(_:didTransitionTo:)(uint64_t a1, uint64_t a2)
{
  return specialized SuggestionSheetManager.suggestionSheetController(_:didTransitionTo:)(a2);
}

void SuggestionSheetManager.suggestionSheetControllerShouldShowBlankComposeView(_:)()
{
  uint64_t v0;
  os_log_type_t v1;
  uint8_t *v2;
  NSObject *oslog;

  if (one-time initialization token for bridge != -1)
    swift_once();
  v0 = type metadata accessor for Logger();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.bridge);
  oslog = Logger.logObject.getter();
  v1 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_233A5C000, oslog, v1, "Picker:BCV", v2, 2u);
    MEMORY[0x23493AEA8](v2, -1, -1);
  }

}

void SuggestionSheetManager.suggestionSheetControllerShouldShowMomentsValidator(_:)()
{
  uint64_t v0;
  os_log_type_t v1;
  uint8_t *v2;
  NSObject *oslog;

  if (one-time initialization token for bridge != -1)
    swift_once();
  v0 = type metadata accessor for Logger();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.bridge);
  oslog = Logger.logObject.getter();
  v1 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_233A5C000, oslog, v1, "Picker:MV", v2, 2u);
    MEMORY[0x23493AEA8](v2, -1, -1);
  }

}

uint64_t SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t ObjectType;

  ObjectType = swift_getObjectType();
  v3[7] = a3;
  v3[8] = ObjectType;
  v3[5] = a1;
  v3[6] = a2;
  type metadata accessor for Date();
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:)()
{
  int8x16_t *v0;
  uint64_t v1;
  int8x16_t *v2;
  _QWORD *v3;

  v1 = v0[4].i64[0];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.ItemContent?);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [JournalingSuggestion.ItemContent]);
  v2 = (int8x16_t *)swift_task_alloc();
  v0[5].i64[1] = (uint64_t)v2;
  v2[1] = vextq_s8(v0[3], v0[3], 8uLL);
  v2[2].i64[0] = v1;
  v3 = (_QWORD *)swift_task_alloc();
  v0[6].i64[0] = (uint64_t)v3;
  *v3 = v0;
  v3[1] = SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:);
  return withTaskGroup<A, B>(of:returning:isolation:body:)();
}

{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v28;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 56);
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      v4 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v2 != v4)
        goto LABEL_4;
    }
    else
    {
      v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v2 != v4)
      {
LABEL_4:
        if (one-time initialization token for bridge != -1)
          swift_once();
        v5 = type metadata accessor for Logger();
        __swift_project_value_buffer(v5, (uint64_t)static Logger.bridge);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v6 = Logger.logObject.getter();
        v7 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v6, v7))
        {
          v8 = swift_slowAlloc();
          *(_DWORD *)v8 = 134218240;
          *(_QWORD *)(v0 + 24) = v4;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          *(_WORD *)(v8 + 12) = 2048;
          *(_QWORD *)(v0 + 32) = v2;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_233A5C000, v6, v7, "assets input count=%ld, output count=%ld", (uint8_t *)v8, 0x16u);
          MEMORY[0x23493AEA8](v8, -1, -1);
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }

      }
    }
    v16 = *(_QWORD **)(v0 + 40);
    v15 = *(void **)(v0 + 48);
    v17 = objc_msgSend(v15, sel_title);
    v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v19 = v18;

    v20 = type metadata accessor for JournalingSuggestion(0);
    v21 = (char *)v16 + *(int *)(v20 + 24);
    v22 = objc_msgSend(v15, sel_startDate);
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    v23 = objc_msgSend(v15, sel_endDate);
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    DateInterval.init(start:end:)();
    v24 = type metadata accessor for DateInterval();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v21, 0, 1, v24);
    v25 = objc_msgSend(v15, sel_suggestionIdentifier);
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    v26 = NSObject.hashValue.getter();
    *v16 = v1;
    v16[1] = v28;
    v16[2] = v19;
    *(_QWORD *)((char *)v16 + *(int *)(v20 + 32)) = v26;
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v16, 0, 1, v20);
    goto LABEL_16;
  }
  swift_bridgeObjectRelease();
  if (one-time initialization token for bridge != -1)
    swift_once();
  v9 = type metadata accessor for Logger();
  __swift_project_value_buffer(v9, (uint64_t)static Logger.bridge);
  v10 = Logger.logObject.getter();
  v11 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_233A5C000, v10, v11, "Error: No valid representation available for asset, dropping, asset type", v12, 2u);
    MEMORY[0x23493AEA8](v12, -1, -1);
  }
  v13 = *(_QWORD *)(v0 + 40);

  v14 = type metadata accessor for JournalingSuggestion(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
LABEL_16:
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t closure #1 in SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[12] = a3;
  v4[13] = a4;
  v4[10] = a1;
  v4[11] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  v4[14] = swift_task_alloc();
  v4[15] = swift_task_alloc();
  v5 = type metadata accessor for JournalingSuggestion.ItemContent(0);
  v4[16] = v5;
  v4[17] = *(_QWORD *)(v5 - 8);
  v4[18] = swift_task_alloc();
  v4[19] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.ItemContent??);
  v4[20] = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.ItemContent?);
  v4[21] = v6;
  v4[22] = *(_QWORD *)(v6 - 8);
  v4[23] = swift_task_alloc();
  v4[24] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskGroup<JournalingSuggestion.ItemContent?>.Iterator);
  v4[25] = v7;
  v4[26] = *(_QWORD *)(v7 - 8);
  v4[27] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #1 in SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:)()
{
  _QWORD *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  int v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  _QWORD *v50;
  unint64_t v51;
  _QWORD *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;

  v1 = v0[12];
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_30:
    swift_bridgeObjectRelease();
    TaskGroup.makeAsyncIterator()();
    v0[28] = lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type TaskGroup<JournalingSuggestion.ItemContent?>.Iterator and conformance TaskGroup<A>.Iterator, &demangling cache variable for type metadata for TaskGroup<JournalingSuggestion.ItemContent?>.Iterator, MEMORY[0x24BEE68A8]);
    v44 = (_QWORD *)swift_task_alloc();
    v0[29] = v44;
    *v44 = v0;
    v44[1] = closure #1 in SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:);
    return dispatch thunk of AsyncIteratorProtocol.next()();
  }
  swift_bridgeObjectRetain();
  result = _CocoaArrayWrapper.endIndex.getter();
  v2 = result;
  if (!result)
    goto LABEL_30;
LABEL_3:
  if (v2 >= 1)
  {
    v4 = 0;
    v46 = v0 + 9;
    v51 = v1 & 0xC000000000000001;
    v47 = v0[12] + 32;
    v48 = v0 + 2;
    v45 = MEMORY[0x24BEE4AD8] + 8;
    v49 = v2;
    v50 = v0;
    do
    {
      if (v51)
        v6 = (id)MEMORY[0x23493A800](v4, v0[12]);
      else
        v6 = *(id *)(v47 + 8 * v4);
      v7 = v6;
      v8 = objc_msgSend(v6, sel_assetType, v45);
      v9 = specialized static SuggestionSheetManager.content(bySpiType:)();

      if (v9)
      {
        if (one-time initialization token for bridge != -1)
          swift_once();
        v52 = v9;
        v10 = type metadata accessor for Logger();
        __swift_project_value_buffer(v10, (uint64_t)static Logger.bridge);
        v11 = v7;
        v12 = Logger.logObject.getter();
        v13 = static os_log_type_t.debug.getter();
        v54 = v4;
        if (os_log_type_enabled(v12, v13))
        {
          v14 = swift_slowAlloc();
          v15 = swift_slowAlloc();
          v55 = v15;
          *(_DWORD *)v14 = 136315138;
          v16 = objc_msgSend(v11, sel_assetType);
          v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          v19 = v18;

          v0 = v50;
          *(_QWORD *)(v14 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v19, &v55);
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_233A5C000, v12, v13, "Got asset with internal asset type: %s", (uint8_t *)v14, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x23493AEA8](v15, -1, -1);
          MEMORY[0x23493AEA8](v14, -1, -1);
        }
        else
        {

        }
        v28 = v0[14];
        v29 = v0[15];
        v30 = (void *)v0[13];
        v31 = type metadata accessor for TaskPriority();
        v32 = v0;
        v33 = *(_QWORD *)(v31 - 8);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v33 + 56))(v29, 1, 1, v31);
        v34 = (_QWORD *)swift_allocObject();
        v34[2] = 0;
        v34[3] = 0;
        v34[4] = v52;
        v34[5] = v11;
        v34[6] = v30;
        outlined init with copy of URL?(v29, v28, &demangling cache variable for type metadata for TaskPriority?);
        v35 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v33 + 48))(v28, 1, v31);
        v53 = v11;
        v36 = v30;
        v37 = v32[14];
        if (v35 == 1)
        {
          outlined destroy of URL?(v32[14], &demangling cache variable for type metadata for TaskPriority?);
        }
        else
        {
          TaskPriority.rawValue.getter();
          (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v37, v31);
        }
        v2 = v49;
        v4 = v54;
        v0 = v50;
        if (v34[2])
        {
          swift_getObjectType();
          swift_unknownObjectRetain();
          v38 = dispatch thunk of Actor.unownedExecutor.getter();
          v40 = v39;
          swift_unknownObjectRelease();
        }
        else
        {
          v38 = 0;
          v40 = 0;
        }
        v41 = *(_QWORD *)v50[11];
        v42 = swift_allocObject();
        *(_QWORD *)(v42 + 16) = &async function pointer to partial apply for closure #1 in closure #1 in SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:);
        *(_QWORD *)(v42 + 24) = v34;
        v43 = (_QWORD *)(v40 | v38);
        if (v40 | v38)
        {
          v43 = v48;
          *v48 = 0;
          v48[1] = 0;
          v50[4] = v38;
          v50[5] = v40;
        }
        v5 = v50[15];
        v50[6] = 1;
        v50[7] = v43;
        v50[8] = v41;
        swift_task_create();

        swift_release();
        outlined destroy of URL?(v5, &demangling cache variable for type metadata for TaskPriority?);
      }
      else
      {
        if (one-time initialization token for bridge != -1)
          swift_once();
        v20 = type metadata accessor for Logger();
        __swift_project_value_buffer(v20, (uint64_t)static Logger.bridge);
        v21 = v7;
        v22 = Logger.logObject.getter();
        v23 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v22, v23))
        {
          v24 = swift_slowAlloc();
          v25 = swift_slowAlloc();
          v55 = v25;
          *(_DWORD *)v24 = 136315138;
          *v46 = objc_msgSend(v21, sel_assetType);
          type metadata accessor for MOSuggestionAssetsType(0);
          v26 = String.init<A>(describing:)();
          *(_QWORD *)(v24 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v26, v27, &v55);
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_233A5C000, v22, v23, "Error: Not implemented internal asset type: %s", (uint8_t *)v24, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x23493AEA8](v25, -1, -1);
          MEMORY[0x23493AEA8](v24, -1, -1);

        }
        else
        {

        }
      }
      ++v4;
    }
    while (v2 != v4);
    goto LABEL_30;
  }
  __break(1u);
  return result;
}

{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (_QWORD *)*v1;
  swift_task_dealloc();
  if (v0)
  {
    v4 = v2[26];
    v3 = v2[27];
    v5 = v2[25];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  else
  {
    v2[30] = MEMORY[0x24BEE4AF8];
  }
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;

  v1 = *(_QWORD *)(v0 + 160);
  if ((*(unsigned int (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 176) + 48))(v1, 1, *(_QWORD *)(v0 + 168)) == 1)
  {
    v2 = *(_QWORD *)(v0 + 240);
    v3 = *(_QWORD **)(v0 + 80);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 208) + 8))(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 200));
    outlined destroy of URL?(v1, &demangling cache variable for type metadata for JournalingSuggestion.ItemContent??);
    *v3 = v2;
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
    v6 = *(_QWORD *)(v0 + 184);
    v5 = *(_QWORD *)(v0 + 192);
    v7 = *(_QWORD *)(v0 + 128);
    v8 = *(_QWORD *)(v0 + 136);
    outlined init with take of JournalingSuggestion.ItemContent?(v1, v5, &demangling cache variable for type metadata for JournalingSuggestion.ItemContent?);
    outlined init with copy of URL?(v5, v6, &demangling cache variable for type metadata for JournalingSuggestion.ItemContent?);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    {
      outlined destroy of URL?(*(_QWORD *)(v0 + 184), &demangling cache variable for type metadata for JournalingSuggestion.ItemContent?);
      v9 = *(_QWORD *)(v0 + 240);
    }
    else
    {
      v11 = *(_QWORD *)(v0 + 144);
      v10 = *(_QWORD *)(v0 + 152);
      outlined init with take of JournalingSuggestion.Workout(*(_QWORD *)(v0 + 184), v10, type metadata accessor for JournalingSuggestion.ItemContent);
      outlined init with copy of JournalingSuggestion.Workout.Details(v10, v11, type metadata accessor for JournalingSuggestion.ItemContent);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v9 = *(_QWORD *)(v0 + 240);
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v9 + 16) + 1, 1, *(_QWORD *)(v0 + 240));
      v14 = *(_QWORD *)(v9 + 16);
      v13 = *(_QWORD *)(v9 + 24);
      v15 = v14 + 1;
      if (v14 >= v13 >> 1)
      {
        v20 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v13 > 1, v14 + 1, 1, v9);
        v15 = v14 + 1;
        v9 = v20;
      }
      v16 = *(_QWORD *)(v0 + 144);
      v17 = *(_QWORD *)(v0 + 152);
      v18 = *(_QWORD *)(v0 + 136);
      *(_QWORD *)(v9 + 16) = v15;
      outlined init with take of JournalingSuggestion.Workout(v16, v9+ ((*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80))+ *(_QWORD *)(v18 + 72) * v14, type metadata accessor for JournalingSuggestion.ItemContent);
      outlined destroy of JournalingSuggestionsError(v17, type metadata accessor for JournalingSuggestion.ItemContent);
    }
    *(_QWORD *)(v0 + 248) = v9;
    outlined destroy of URL?(*(_QWORD *)(v0 + 192), &demangling cache variable for type metadata for JournalingSuggestion.ItemContent?);
    v19 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 256) = v19;
    *v19 = v0;
    v19[1] = closure #1 in SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:);
    return dispatch thunk of AsyncIteratorProtocol.next()();
  }
}

{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (_QWORD *)*v1;
  swift_task_dealloc();
  if (v0)
  {
    v4 = v2[26];
    v3 = v2[27];
    v5 = v2[25];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  else
  {
    v2[30] = v2[31];
  }
  return swift_task_switch();
}

uint64_t closure #1 in closure #1 in SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[13] = a5;
  v6[14] = a6;
  v6[11] = a1;
  v6[12] = a4;
  v7 = type metadata accessor for JournalingSuggestion.ItemContent(0);
  v6[15] = v7;
  v6[16] = *(_QWORD *)(v7 - 8);
  v6[17] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #1 in closure #1 in SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  NSObject *v36;
  os_log_type_t v37;
  _BOOL4 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 96);
  UUID.init()();
  v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v1 + *(int *)(v2 + 20)) = MEMORY[0x24BEE4AF8];
  v48 = v2;
  *(_QWORD *)(v1 + *(int *)(v2 + 24)) = v4;
  v5 = *(_QWORD *)(v3 + 16);
  if (v5)
  {
    v6 = (uint64_t *)(*(_QWORD *)(v0 + 96) + 32);
    swift_bridgeObjectRetain();
    do
    {
      v50 = *(_OWORD *)v6;
      v8 = JournalingSuggestion.ItemContent.getContentProviderOfType<A>(assetType:for:inside:)(*v6, *(void **)(v0 + 104), *(_QWORD *)(v0 + 112), *v6, v6[1]);
      if (v8)
      {
        v12 = v8;
        v13 = v9;
        v14 = v10;
        v15 = v11;
        swift_retain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4[2] + 1, 1, v4);
        v17 = v4[2];
        v16 = v4[3];
        if (v17 >= v16 >> 1)
          v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v16 > 1), v17 + 1, 1, v4);
        v4[2] = v17 + 1;
        v7 = &v4[6 * v17];
        v7[4] = v12;
        v7[5] = v13;
        v7[6] = v14;
        v7[7] = v15;
        *((_OWORD *)v7 + 4) = v50;
        outlined consume of InternalAssetContent.AssetProvider?(v12);
      }
      v6 += 2;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
  }
  if (v4[2])
  {
    JournalingSuggestion.ItemContent.appendAssetContent(_:)((Swift::OpaquePointer)v4);
    swift_bridgeObjectRelease();
    if (one-time initialization token for bridge != -1)
      swift_once();
    v18 = type metadata accessor for Logger();
    __swift_project_value_buffer(v18, (uint64_t)static Logger.bridge);
    v19 = Logger.logObject.getter();
    v20 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = *(_QWORD *)(v0 + 136);
      v22 = (uint8_t *)swift_slowAlloc();
      v23 = swift_slowAlloc();
      v52 = v23;
      *(_DWORD *)v22 = 136315138;
      swift_beginAccess();
      v24 = *(_QWORD *)(v21 + *(int *)(v48 + 20));
      swift_bridgeObjectRetain();
      v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestionAsset.Type);
      v26 = MEMORY[0x23493A5C0](v24, v25);
      v28 = v27;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 64) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v26, v28, &v52);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_233A5C000, v19, v20, "Got asset representations: %s", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23493AEA8](v23, -1, -1);
      MEMORY[0x23493AEA8](v22, -1, -1);
    }

    v30 = *(_QWORD *)(v0 + 128);
    v29 = *(_QWORD *)(v0 + 136);
    v31 = *(_QWORD *)(v0 + 120);
    v32 = *(_QWORD *)(v0 + 88);
    swift_beginAccess();
    outlined init with copy of JournalingSuggestion.Workout.Details(v29, v32, type metadata accessor for JournalingSuggestion.ItemContent);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v30 + 56))(v32, 0, 1, v31);
  }
  else
  {
    swift_bridgeObjectRelease();
    if (one-time initialization token for bridge != -1)
      swift_once();
    v33 = *(void **)(v0 + 104);
    v34 = type metadata accessor for Logger();
    __swift_project_value_buffer(v34, (uint64_t)static Logger.bridge);
    v35 = v33;
    v36 = Logger.logObject.getter();
    v37 = static os_log_type_t.error.getter();
    v38 = os_log_type_enabled(v36, v37);
    v39 = *(_QWORD *)(v0 + 88);
    v40 = *(_QWORD *)(v0 + 120);
    v41 = *(_QWORD *)(v0 + 128);
    v42 = *(void **)(v0 + 104);
    if (v38)
    {
      v51 = *(_QWORD *)(v0 + 88);
      v49 = *(_QWORD *)(v0 + 128);
      v43 = (uint8_t *)swift_slowAlloc();
      v44 = swift_slowAlloc();
      v52 = v44;
      *(_DWORD *)v43 = 136315138;
      *(_QWORD *)(v0 + 72) = objc_msgSend(v42, sel_assetType);
      type metadata accessor for MOSuggestionAssetsType(0);
      v45 = String.init<A>(describing:)();
      *(_QWORD *)(v0 + 80) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v45, v46, &v52);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_233A5C000, v36, v37, "Error: Couldn't load any representation for asset of type: %s", v43, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23493AEA8](v44, -1, -1);
      MEMORY[0x23493AEA8](v43, -1, -1);

      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v49 + 56))(v51, 1, 1, v40);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v41 + 56))(v39, 1, 1, v40);
    }
  }
  outlined destroy of JournalingSuggestionsError(*(_QWORD *)(v0 + 136), type metadata accessor for JournalingSuggestion.ItemContent);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SuggestionSheetManager.getAssetsFor(suggestion:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v1;
  return swift_task_switch();
}

uint64_t SuggestionSheetManager.getAssetsFor(suggestion:)()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;
  _QWORD *v7;

  v1 = *(void **)(*(_QWORD *)(v0 + 32) + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_controller);
  *(_QWORD *)(v0 + 40) = v1;
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 24);
    v3 = swift_task_alloc();
    *(_QWORD *)(v0 + 48) = v3;
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = v1;
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 56) = v5;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [MOSuggestionAsset]);
    *v5 = v0;
    v5[1] = SuggestionSheetManager.getAssetsFor(suggestion:);
    return withCheckedThrowingContinuation<A>(isolation:function:_:)();
  }
  else
  {
    type metadata accessor for JournalingSuggestionsError();
    lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError((unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestionsError and conformance JournalingSuggestionsError, (uint64_t (*)(uint64_t))type metadata accessor for JournalingSuggestionsError, (uint64_t)&protocol conformance descriptor for JournalingSuggestionsError);
    swift_allocError();
    *v7 = 0xD000000000000028;
    v7[1] = 0x8000000233A904D0;
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void closure #1 in SuggestionSheetManager.getAssetsFor(suggestion:)(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[MOSuggestionAsset], Error>);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v9 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  *(_QWORD *)(v10 + ((v8 + v9 + 7) & 0xFFFFFFFFFFFFFFF8)) = a3;
  aBlock[4] = partial apply for closure #1 in closure #1 in SuggestionSheetManager.getAssetsFor(suggestion:);
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed [MOSuggestionAsset<Swift.AnyObject>]?, @guaranteed Error?) -> ();
  aBlock[3] = &block_descriptor_23;
  v11 = _Block_copy(aBlock);
  v12 = a3;
  swift_release();
  objc_msgSend(a2, sel_getAssetsForSuggestion_withTypes_onAssetsCallback_, v12, 0, v11);
  _Block_release(v11);
}

uint64_t closure #1 in closure #1 in SuggestionSheetManager.getAssetsFor(suggestion:)(unint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  id v20;
  id v22;
  Swift::String v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;

  v7 = type metadata accessor for UUID();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for JournalingSuggestionsError();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (unint64_t *)((char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (a1)
  {
    v14 = one-time initialization token for bridge;
    swift_bridgeObjectRetain();
    if (v14 != -1)
      swift_once();
    v15 = type metadata accessor for Logger();
    __swift_project_value_buffer(v15, (uint64_t)static Logger.bridge);
    swift_bridgeObjectRetain_n();
    v16 = Logger.logObject.getter();
    v17 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v18 = 134217984;
      if (a1 >> 62)
      {
        swift_bridgeObjectRetain();
        v19 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
      }
      else
      {
        v19 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      v27 = v19;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_233A5C000, v16, v17, "got %ld assets from system picker", v18, 0xCu);
      MEMORY[0x23493AEA8](v18, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v27 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[MOSuggestionAsset], Error>);
    return CheckedContinuation.resume(returning:)();
  }
  else if (a2)
  {
    v27 = (unint64_t)a2;
    v20 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[MOSuggestionAsset], Error>);
    return CheckedContinuation.resume(throwing:)();
  }
  else
  {
    v27 = 0;
    v28 = 0xE000000000000000;
    _StringGuts.grow(_:)(37);
    swift_bridgeObjectRelease();
    v27 = 0xD000000000000023;
    v28 = 0x8000000233A90540;
    v22 = objc_msgSend(a4, sel_suggestionIdentifier);
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v23._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v23);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    v24 = v28;
    *v13 = v27;
    v13[1] = v24;
    swift_storeEnumTagMultiPayload();
    lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError((unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestionsError and conformance JournalingSuggestionsError, (uint64_t (*)(uint64_t))type metadata accessor for JournalingSuggestionsError, (uint64_t)&protocol conformance descriptor for JournalingSuggestionsError);
    v25 = swift_allocError();
    outlined init with copy of JournalingSuggestion.Workout.Details((uint64_t)v13, v26, (uint64_t (*)(_QWORD))type metadata accessor for JournalingSuggestionsError);
    v27 = v25;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[MOSuggestionAsset], Error>);
    CheckedContinuation.resume(throwing:)();
    return outlined destroy of JournalingSuggestionsError((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for JournalingSuggestionsError);
  }
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed [MOSuggestionAsset<Swift.AnyObject>]?, @guaranteed Error?) -> ()(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  id v6;

  v4 = a2;
  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MOSuggestionAsset);
    v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_retain();
  v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

void SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:)(void *a1, uint64_t a2, void *a3)
{
  _BYTE *v3;
  _BYTE *v4;
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
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  char *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  id v43;
  uint8_t *v44;
  uint8_t *v45;
  uint64_t v46;
  _QWORD *v47;
  id v48;
  id v49;
  _BYTE *v50;
  _QWORD v51[3];
  uint64_t v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60[3];

  v4 = v3;
  v58 = a2;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: SuggestionSheetManager.TrackingHandlers)?);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for UUID();
  v56 = *(_QWORD *)(v13 - 8);
  v57 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for bridge != -1)
    swift_once();
  v16 = type metadata accessor for Logger();
  v17 = __swift_project_value_buffer(v16, (uint64_t)static Logger.bridge);
  v18 = a3;
  v55 = v17;
  v19 = Logger.logObject.getter();
  v20 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = swift_slowAlloc();
    v22 = swift_slowAlloc();
    v52 = v22;
    v53 = a1;
    *(_DWORD *)v21 = 134218242;
    v59 = v58;
    v60[0] = v22;
    v54 = v18;
    v51[2] = v60;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v21 + 12) = 2080;
    v51[1] = v21 + 14;
    v23 = objc_msgSend(v54, sel_suggestionIdentifier);
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v24 = v57;
    v25 = dispatch thunk of CustomStringConvertible.description.getter();
    v26 = v4;
    v27 = v9;
    v29 = v28;
    (*(void (**)(char *, uint64_t))(v56 + 8))(v15, v24);
    v59 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v25, v29, v60);
    v18 = v54;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    v9 = v27;
    v4 = v26;
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_233A5C000, v19, v20, "sheet delegate shouldPerform:%lu, for:'%s'", (uint8_t *)v21, 0x16u);
    v30 = v52;
    swift_arrayDestroy();
    a1 = v53;
    MEMORY[0x23493AEA8](v30, -1, -1);
    MEMORY[0x23493AEA8](v21, -1, -1);
  }
  else
  {

  }
  v31 = OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock;
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock], sel_lock);
  swift_beginAccess();
  v32 = swift_bridgeObjectRetain();
  specialized Collection.first.getter(v32, (uint64_t)v12);
  swift_bridgeObjectRelease();
  v33 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: SuggestionSheetManager.TrackingHandlers));
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 48))(v12, 1, v33) == 1)
  {
    outlined destroy of URL?((uint64_t)v12, &demangling cache variable for type metadata for (key: UUID, value: SuggestionSheetManager.TrackingHandlers)?);
    objc_msgSend(*(id *)&v4[v31], sel_unlock);
    objc_msgSend(*(id *)&v4[v31], sel_lock);
    v34 = &v4[OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState];
    if ((v4[OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState + 8] & 1) != 0
      || *(_QWORD *)v34)
    {
      *(_QWORD *)v34 = 0;
      v34[8] = 0;
    }
    objc_msgSend(*(id *)&v4[v31], sel_unlock);
    SuggestionSheetManager.servicePickerViewState()();
    v35 = Logger.logObject.getter();
    v36 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_233A5C000, v35, v36, "Ignoring selection, sheet already dismissed", v37, 2u);
      MEMORY[0x23493AEA8](v37, -1, -1);
    }

  }
  else
  {
    v38 = &v12[*(int *)(v33 + 48)];
    v40 = *(_QWORD *)v38;
    v39 = *((_QWORD *)v38 + 1);
    swift_release();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v12, v57);
    objc_msgSend(*(id *)&v4[v31], sel_unlock);
    if (v58 != 2)
    {
      v41 = Logger.logObject.getter();
      v42 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v41, v42))
      {
        v43 = v18;
        v44 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v44 = 0;
        _os_log_impl(&dword_233A5C000, v41, v42, "requesting assets...", v44, 2u);
        v45 = v44;
        v18 = v43;
        MEMORY[0x23493AEA8](v45, -1, -1);
      }

      MEMORY[0x23493A650]();
      v46 = type metadata accessor for TaskPriority();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 56))(v9, 0, 1, v46);
      v47 = (_QWORD *)swift_allocObject();
      v47[2] = 0;
      v47[3] = 0;
      v47[4] = a1;
      v47[5] = v4;
      v47[6] = v18;
      v47[7] = v40;
      v47[8] = v39;
      v48 = v18;
      v49 = a1;
      v50 = v4;
      _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v9, (uint64_t)&async function pointer to partial apply for closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:), (uint64_t)v47);
    }
    swift_release();
  }
}

uint64_t closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v8[7] = a7;
  v8[8] = a8;
  v8[5] = a5;
  v8[6] = a6;
  v8[4] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  v8[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for JournalingSuggestion?);
  v8[10] = swift_task_alloc();
  v9 = type metadata accessor for JournalingSuggestion(0);
  v8[11] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v8[12] = v10;
  v8[13] = *(_QWORD *)(v10 + 64);
  v8[14] = swift_task_alloc();
  v8[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:)()
{
  uint64_t v0;
  uint64_t v1;

  objc_msgSend(*(id *)(v0 + 32), sel_setDisableAssetUnwrapping_, 1);
  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v1;
  *(_QWORD *)v1 = v0;
  *(_QWORD *)(v1 + 8) = closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:);
  *(int8x16_t *)(v1 + 24) = vextq_s8(*(int8x16_t *)(v0 + 40), *(int8x16_t *)(v0 + 40), 8uLL);
  return swift_task_switch();
}

{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  _BOOL4 v4;
  unint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  _QWORD *v8;

  if (one-time initialization token for bridge != -1)
    swift_once();
  v1 = type metadata accessor for Logger();
  __swift_project_value_buffer(v1, (uint64_t)static Logger.bridge);
  swift_bridgeObjectRetain_n();
  v2 = Logger.logObject.getter();
  v3 = static os_log_type_t.debug.getter();
  v4 = os_log_type_enabled(v2, v3);
  v5 = v0[17];
  if (v4)
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v6 = 134217984;
    if (v5 >> 62)
    {
      swift_bridgeObjectRetain();
      v7 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      v7 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    v0[3] = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_233A5C000, v2, v3, "getAssetsFor count=%ld", v6, 0xCu);
    MEMORY[0x23493AEA8](v6, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v8 = (_QWORD *)swift_task_alloc();
  v0[19] = v8;
  *v8 = v0;
  v8[1] = closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:);
  return SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:)(v0[10], v0[6], v0[17]);
}

{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
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
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v21;
  uint64_t v22;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 80);
  if ((*(unsigned int (**)(uint64_t, uint64_t, _QWORD))(v1 + 48))(v2, 1, *(_QWORD *)(v0 + 88)) == 1)
  {
    outlined destroy of URL?(v2, (uint64_t *)&demangling cache variable for type metadata for JournalingSuggestion?);
    v3 = *(_QWORD *)(v0 + 40);
    v4 = OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock;
    objc_msgSend(*(id *)(v3 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock), sel_lock);
    v5 = v3 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState;
    if ((*(_BYTE *)(v3 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState + 8) & 1) != 0
      || *(_QWORD *)v5)
    {
      *(_QWORD *)v5 = 0;
      *(_BYTE *)(v5 + 8) = 0;
    }
    objc_msgSend(*(id *)(v3 + v4), sel_unlock);
    SuggestionSheetManager.servicePickerViewState()();
  }
  else
  {
    v7 = *(_QWORD *)(v0 + 112);
    v6 = *(_QWORD *)(v0 + 120);
    v8 = *(_QWORD *)(v0 + 104);
    v10 = *(_QWORD *)(v0 + 64);
    v9 = *(_QWORD *)(v0 + 72);
    v21 = v9;
    v22 = *(_QWORD *)(v0 + 56);
    v11 = *(void **)(v0 + 40);
    outlined init with take of JournalingSuggestion.Workout(v2, v6, type metadata accessor for JournalingSuggestion);
    v12 = type metadata accessor for TaskPriority();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
    outlined init with copy of JournalingSuggestion.Workout.Details(v6, v7, type metadata accessor for JournalingSuggestion);
    type metadata accessor for MainActor();
    swift_retain();
    v13 = v11;
    v14 = static MainActor.shared.getter();
    v15 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
    v16 = (v8 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
    v17 = swift_allocObject();
    v18 = MEMORY[0x24BEE6930];
    *(_QWORD *)(v17 + 16) = v14;
    *(_QWORD *)(v17 + 24) = v18;
    outlined init with take of JournalingSuggestion.Workout(v7, v17 + v15, type metadata accessor for JournalingSuggestion);
    v19 = (_QWORD *)(v17 + v16);
    *v19 = v22;
    v19[1] = v10;
    *(_QWORD *)(v17 + ((v16 + 23) & 0xFFFFFFFFFFFFFFF8)) = v13;
    _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(v21, (uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:), v17);
    swift_release();
    outlined destroy of JournalingSuggestionsError(v6, type metadata accessor for JournalingSuggestion);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  void *v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (one-time initialization token for bridge != -1)
    swift_once();
  v1 = *(void **)(v0 + 144);
  v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Logger.bridge);
  v3 = v1;
  v4 = v1;
  v5 = Logger.logObject.getter();
  v6 = static os_log_type_t.error.getter();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 144);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    v11 = v8;
    v12 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 16) = v12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *v10 = v12;

    _os_log_impl(&dword_233A5C000, v5, v6, "getAssetsError: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x23493AEA8](v10, -1, -1);
    MEMORY[0x23493AEA8](v9, -1, -1);

  }
  else
  {

  }
  v13 = *(_QWORD *)(v0 + 40);
  v14 = OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock;
  objc_msgSend(*(id *)(v13 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock), sel_lock);
  v15 = v13 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState;
  if ((*(_BYTE *)(v13 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState + 8) & 1) != 0
    || *(_QWORD *)v15)
  {
    *(_QWORD *)v15 = 0;
    *(_BYTE *)(v15 + 8) = 0;
  }
  objc_msgSend(*(id *)(v13 + v14), sel_unlock);
  SuggestionSheetManager.servicePickerViewState()();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 136) = a1;
  *(_QWORD *)(v3 + 144) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t closure #1 in closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;

  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  v7[4] = a5;
  type metadata accessor for JournalingSuggestion(0);
  v7[7] = swift_task_alloc();
  type metadata accessor for MainActor();
  v7[8] = static MainActor.shared.getter();
  v7[9] = dispatch thunk of Actor.unownedExecutor.getter();
  v7[10] = v8;
  return swift_task_switch();
}

uint64_t closure #1 in closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*v12)(_QWORD);

  if (one-time initialization token for bridge != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = type metadata accessor for Logger();
  __swift_project_value_buffer(v3, (uint64_t)static Logger.bridge);
  outlined init with copy of JournalingSuggestion.Workout.Details(v1, v2, type metadata accessor for JournalingSuggestion);
  v4 = Logger.logObject.getter();
  v5 = static os_log_type_t.debug.getter();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(_QWORD *)(v0 + 56);
  if (v6)
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v8 = 134217984;
    v9 = *(_QWORD *)(*(_QWORD *)v7 + 16);
    outlined destroy of JournalingSuggestionsError(v7, type metadata accessor for JournalingSuggestion);
    *(_QWORD *)(v0 + 16) = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_233A5C000, v4, v5, "Calling picker .onCompletion with %ld assets", v8, 0xCu);
    MEMORY[0x23493AEA8](v8, -1, -1);
  }
  else
  {
    outlined destroy of JournalingSuggestionsError(*(_QWORD *)(v0 + 56), type metadata accessor for JournalingSuggestion);
  }

  v12 = (uint64_t (*)(_QWORD))(**(int **)(v0 + 32) + *(_QWORD *)(v0 + 32));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v10;
  *v10 = v0;
  v10[1] = closure #1 in closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:);
  return v12(*(_QWORD *)(v0 + 24));
}

{
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 48);
  swift_release();
  v2 = OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock;
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock), sel_lock);
  v3 = v1 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState;
  if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState + 8) & 1) != 0
    || *(_QWORD *)v3)
  {
    *(_QWORD *)v3 = 0;
    *(_BYTE *)(v3 + 8) = 0;
  }
  objc_msgSend(*(id *)(v1 + v2), sel_unlock);
  SuggestionSheetManager.servicePickerViewState()();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t specialized FixedWidthInteger.init(_:)(uint64_t result, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  unsigned __int8 *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  unsigned int v20;
  uint64_t v21;
  char v22;
  _QWORD v23[3];

  v3 = HIBYTE(a2) & 0xF;
  v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0)
    v5 = v3;
  else
    v5 = result & 0xFFFFFFFFFFFFLL;
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0)
        v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v6 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
      v7 = (uint64_t)specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(v6, v4, 10);
      v9 = v8 & 1;
      goto LABEL_37;
    }
    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3)
        goto LABEL_50;
      if (v3 == 1 || (BYTE1(result) - 48) > 9u)
        goto LABEL_34;
      v7 = (BYTE1(result) - 48);
      v14 = v3 - 2;
      if (v14)
      {
        v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          v16 = *v15 - 48;
          if (v16 > 9)
            goto LABEL_34;
          v17 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
            goto LABEL_34;
          v7 = v17 + v16;
          if (__OFADD__(v17, v16))
            goto LABEL_34;
          v9 = 0;
          ++v15;
          if (!--v14)
            goto LABEL_37;
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            v7 = -(uint64_t)(BYTE1(result) - 48);
            v10 = v3 - 2;
            if (v10)
            {
              v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                v12 = *v11 - 48;
                if (v12 > 9)
                  goto LABEL_34;
                v13 = 10 * v7;
                if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
                  goto LABEL_34;
                v7 = v13 - v12;
                if (__OFSUB__(v13, v12))
                  goto LABEL_34;
                v9 = 0;
                ++v11;
                if (!--v10)
                  goto LABEL_37;
              }
            }
            goto LABEL_36;
          }
LABEL_34:
          v7 = 0;
          v9 = 1;
          goto LABEL_37;
        }
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u)
        goto LABEL_34;
      v7 = (result - 48);
      v18 = v3 - 1;
      if (v18)
      {
        v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          v20 = *v19 - 48;
          if (v20 > 9)
            goto LABEL_34;
          v21 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
            goto LABEL_34;
          v7 = v21 + v20;
          if (__OFADD__(v21, v20))
            goto LABEL_34;
          v9 = 0;
          ++v19;
          if (!--v18)
            goto LABEL_37;
        }
      }
    }
LABEL_36:
    v9 = 0;
    goto LABEL_37;
  }
  v7 = (uint64_t)specialized _parseInteger<A, B>(ascii:radix:)(result, a2, 10);
  v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
    return 0;
  else
    return v7;
}

id SuggestionSheetManager.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  id v13;
  id v14;
  char *v15;
  objc_class *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v21;
  uint64_t v22;

  v20 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  v1 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for OS_dispatch_queue.Attributes();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v4);
  v6 = type metadata accessor for DispatchQoS();
  MEMORY[0x24BDAC7A8](v6);
  *(_QWORD *)&v0[OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_controller] = 0;
  v19 = OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_pickerQueue;
  v18 = type metadata accessor for UIScene(0, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue);
  v7 = v0;
  static DispatchQoS.unspecified.getter();
  v22 = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, v5, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A], &demangling cache variable for type metadata for [OS_dispatch_queue.Attributes], MEMORY[0x24BEE12C8]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5750], v20);
  *(_QWORD *)&v0[v19] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  v8 = OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationOptions;
  if (one-time initialization token for DEFAULT_OPTIONS != -1)
    swift_once();
  v9 = (void *)static SuggestionSheetManager.DEFAULT_OPTIONS;
  *(_QWORD *)&v7[v8] = static SuggestionSheetManager.DEFAULT_OPTIONS;
  v10 = &v7[OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_viewState];
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  v11 = &v7[OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_transitionViewState];
  *(_QWORD *)v11 = 0;
  v11[8] = 1;
  v12 = OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock;
  v13 = objc_allocWithZone(MEMORY[0x24BDD1788]);
  v14 = v9;
  *(_QWORD *)&v7[v12] = objc_msgSend(v13, sel_init);
  v15 = &v7[OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState];
  *(_QWORD *)v15 = 0;
  v15[8] = 1;
  *(_QWORD *)&v7[OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_trackingTokens] = MEMORY[0x24BEE4B00];

  v16 = (objc_class *)type metadata accessor for SuggestionSheetManager();
  v21.receiver = v7;
  v21.super_class = v16;
  return objc_msgSendSuper2(&v21, sel_init);
}

id SuggestionSheetManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SuggestionSheetManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t protocol witness for ObservableObject.objectWillChange.getter in conformance SuggestionSheetManager@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for SuggestionSheetManager();
  result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
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

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzlTR21JournalingSuggestions0C10SuggestionV11ItemContentVSg_Tg5(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzlTR21JournalingSuggestions0C10SuggestionV11ItemContentVSg_Tg5TQ0_;
  return v6(a1);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzlTR21JournalingSuggestions0C10SuggestionV11ItemContentVSg_Tg5TQ0_()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t _StringGuts._slowEnsureMatchingEncoding(_:)(unint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = String.UTF16View.index(_:offsetBy:)();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x23493A56C](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t specialized Dictionary._Variant.removeValue(forKey:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t v4;
  char v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v2 = v1;
  swift_bridgeObjectRetain();
  v4 = specialized __RawDictionaryStorage.find<A>(_:)(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = *v2;
  v12 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    specialized _NativeDictionary.copy()();
    v7 = v12;
  }
  v8 = *(_QWORD *)(v7 + 48);
  v9 = type metadata accessor for UUID();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * v4, v9);
  v10 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 32 * v4);
  specialized _NativeDictionary._delete(at:)(v4, v7);
  *v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, int a2)
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
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char v35;
  unint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  int64_t v42;
  _QWORD *v43;
  uint64_t i;
  int v45;
  __int128 v46;
  uint64_t v47;

  v3 = v2;
  v5 = type metadata accessor for UUID();
  v47 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<UUID, SuggestionSheetManager.TrackingHandlers>);
  v45 = a2;
  v9 = static _DictionaryStorage.resize(original:capacity:move:)();
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_41;
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 64);
  v43 = (_QWORD *)(v8 + 64);
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v41 = v2;
  v42 = (unint64_t)(v11 + 63) >> 6;
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
    if (v22 >= v42)
      break;
    v23 = v43;
    v24 = v43[v22];
    ++v17;
    if (!v24)
    {
      v17 = v22 + 1;
      if (v22 + 1 >= v42)
        goto LABEL_34;
      v24 = v43[v17];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v42)
        {
LABEL_34:
          swift_release();
          v3 = v41;
          if ((v45 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v43[v25];
        if (!v24)
        {
          while (1)
          {
            v17 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v17 >= v42)
              goto LABEL_34;
            v24 = v43[v17];
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
    v26 = *(_QWORD *)(v47 + 72);
    v27 = *(_QWORD *)(v8 + 48) + v26 * v21;
    if ((v45 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v47 + 32))(v7, v27, v5);
      v28 = *(_QWORD *)(v8 + 56) + 32 * v21;
      v29 = *(_QWORD *)v28;
      v46 = *(_OWORD *)(v28 + 8);
      v30 = *(_QWORD *)(v28 + 24);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v47 + 16))(v7, v27, v5);
      v31 = *(_QWORD *)(v8 + 56) + 32 * v21;
      v29 = *(_QWORD *)v31;
      v30 = *(_QWORD *)(v31 + 24);
      v46 = *(_OWORD *)(v31 + 8);
      swift_retain();
      swift_retain();
    }
    lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    result = dispatch thunk of Hashable._rawHashValue(seed:)();
    v32 = -1 << *(_BYTE *)(v10 + 32);
    v33 = result & ~v32;
    v34 = v33 >> 6;
    if (((-1 << v33) & ~*(_QWORD *)(v15 + 8 * (v33 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v33) & ~*(_QWORD *)(v15 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v35 = 0;
      v36 = (unint64_t)(63 - v32) >> 6;
      do
      {
        if (++v34 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v37 = v34 == v36;
        if (v34 == v36)
          v34 = 0;
        v35 |= v37;
        v38 = *(_QWORD *)(v15 + 8 * v34);
      }
      while (v38 == -1);
      v18 = __clz(__rbit64(~v38)) + (v34 << 6);
    }
    *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v47 + 32))(*(_QWORD *)(v10 + 48) + v18 * v26, v7, v5);
    v19 = *(_QWORD *)(v10 + 56) + 32 * v18;
    *(_QWORD *)v19 = v29;
    *(_OWORD *)(v19 + 8) = v46;
    *(_QWORD *)(v19 + 24) = v30;
    ++*(_QWORD *)(v10 + 16);
  }
  swift_release();
  v3 = v41;
  v23 = v43;
  if ((v45 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v39 = 1 << *(_BYTE *)(v8 + 32);
  if (v39 >= 64)
    bzero(v23, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v39;
  *(_QWORD *)(v8 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v10;
  return result;
}

unint64_t specialized _NativeDictionary._delete(at:)(int64_t a1, uint64_t a2)
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
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  _OWORD *v25;
  __int128 v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, unint64_t, uint64_t);
  unint64_t v35;
  uint64_t v36;

  v4 = type metadata accessor for UUID();
  v36 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = _HashTable.previousHole(before:)();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v35 = (result + 1) & v11;
      v12 = *(_QWORD *)(v36 + 72);
      v34 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 16);
      v13 = v11;
      do
      {
        v14 = v8;
        v15 = v12;
        v16 = v12 * v10;
        v17 = v13;
        v34(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
        v18 = dispatch thunk of Hashable._rawHashValue(seed:)();
        result = (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v7, v4);
        v13 = v17;
        v19 = v18 & v17;
        if (a1 >= (uint64_t)v35)
        {
          if (v19 >= v35 && a1 >= (uint64_t)v19)
          {
LABEL_16:
            v22 = *(_QWORD *)(a2 + 48);
            result = v22 + v15 * a1;
            v8 = v14;
            if (v15 * a1 < v16 || (v12 = v15, result >= v22 + v16 + v15))
            {
              result = swift_arrayInitWithTakeFrontToBack();
LABEL_21:
              v13 = v17;
              v12 = v15;
            }
            else if (v15 * a1 != v16)
            {
              result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_21;
            }
            v23 = *(_QWORD *)(a2 + 56);
            v24 = (_OWORD *)(v23 + 32 * a1);
            v25 = (_OWORD *)(v23 + 32 * v10);
            if (a1 != v10 || (a1 = v10, v24 >= v25 + 2))
            {
              v26 = v25[1];
              *v24 = *v25;
              v24[1] = v26;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v19 >= v35 || a1 >= (uint64_t)v19)
        {
          goto LABEL_16;
        }
        v8 = v14;
        v12 = v15;
LABEL_5:
        v10 = (v10 + 1) & v13;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v27 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v28 = *v27;
    v29 = (-1 << a1) - 1;
  }
  else
  {
    v27 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v29 = *v27;
    v28 = (-1 << a1) - 1;
  }
  *v27 = v29 & v28;
  v30 = *(_QWORD *)(a2 + 16);
  v31 = __OFSUB__(v30, 1);
  v32 = v30 - 1;
  if (v31)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v32;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  _QWORD *v6;
  _QWORD **v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  _QWORD *v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v7 = (_QWORD **)v6;
  v32 = a3;
  v33 = a4;
  v31 = a2;
  v11 = type metadata accessor for UUID();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (_QWORD *)*v6;
  v17 = specialized __RawDictionaryStorage.find<A>(_:)(a5);
  v18 = v15[2];
  v19 = (v16 & 1) == 0;
  v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
    __break(1u);
    goto LABEL_14;
  }
  v21 = v16;
  v22 = v15[3];
  if (v22 >= v20 && (a6 & 1) != 0)
  {
LABEL_7:
    v23 = *v7;
    if ((v21 & 1) != 0)
    {
LABEL_8:
      v24 = (uint64_t *)(v23[7] + 32 * v17);
      swift_release();
      result = swift_release();
      v26 = v31;
      *v24 = a1;
      v24[1] = v26;
      v27 = v33;
      v24[2] = v32;
      v24[3] = v27;
      return result;
    }
    goto LABEL_11;
  }
  if (v22 >= v20 && (a6 & 1) == 0)
  {
    specialized _NativeDictionary.copy()();
    goto LABEL_7;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v20, a6 & 1);
  v28 = specialized __RawDictionaryStorage.find<A>(_:)(a5);
  if ((v21 & 1) != (v29 & 1))
  {
LABEL_14:
    result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  v17 = v28;
  v23 = *v7;
  if ((v21 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a5, v11);
  return specialized _NativeDictionary._insert(at:key:value:)(v17, (uint64_t)v14, a1, v31, v32, v33, v23);
}

uint64_t specialized _NativeDictionary._insert(at:key:value:)(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  _QWORD *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;

  a7[(a1 >> 6) + 8] |= 1 << a1;
  v14 = a7[6];
  v15 = type metadata accessor for UUID();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v14 + *(_QWORD *)(*(_QWORD *)(v15 - 8) + 72) * a1, a2, v15);
  v17 = (_QWORD *)(a7[7] + 32 * a1);
  *v17 = a3;
  v17[1] = a4;
  v17[2] = a5;
  v17[3] = a6;
  v18 = a7[2];
  v19 = __OFADD__(v18, 1);
  v20 = v18 + 1;
  if (v19)
    __break(1u);
  else
    a7[2] = v20;
  return result;
}

void *specialized _NativeDictionary.copy()()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *result;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void (*v26)(unint64_t, char *, uint64_t);
  uint64_t v27;
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  const void *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;

  v38 = type metadata accessor for UUID();
  v1 = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  v37 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<UUID, SuggestionSheetManager.TrackingHandlers>);
  v34 = v0;
  v3 = *v0;
  v4 = static _DictionaryStorage.copy(original:)();
  v5 = *(_QWORD *)(v3 + 16);
  v40 = v4;
  if (!v5)
  {
    result = (void *)swift_release();
    v32 = v40;
    v31 = v34;
LABEL_28:
    *v31 = v32;
    return result;
  }
  v6 = v4;
  result = (void *)(v4 + 64);
  v8 = (unint64_t)((1 << *(_BYTE *)(v6 + 32)) + 63) >> 6;
  v36 = (const void *)(v3 + 64);
  if (v6 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
  {
    result = memmove(result, v36, 8 * v8);
    v6 = v40;
    v5 = *(_QWORD *)(v3 + 16);
  }
  v10 = 0;
  *(_QWORD *)(v6 + 16) = v5;
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v39 = v3;
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v35 = (unint64_t)(v11 + 63) >> 6;
  v15 = v37;
  v14 = v38;
  v16 = v40;
  while (1)
  {
    if (v13)
    {
      v17 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v18 = v17 | (v10 << 6);
      v19 = v39;
      goto LABEL_12;
    }
    v28 = v10 + 1;
    v19 = v39;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v28 >= v35)
      goto LABEL_26;
    v29 = *((_QWORD *)v36 + v28);
    ++v10;
    if (!v29)
    {
      v10 = v28 + 1;
      if (v28 + 1 >= v35)
        goto LABEL_26;
      v29 = *((_QWORD *)v36 + v10);
      if (!v29)
        break;
    }
LABEL_25:
    v13 = (v29 - 1) & v29;
    v18 = __clz(__rbit64(v29)) + (v10 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v1 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v15, *(_QWORD *)(v19 + 48) + v20, v14);
    v21 = 32 * v18;
    v22 = *(_QWORD *)(v19 + 56) + 32 * v18;
    v23 = *(_QWORD *)v22;
    v24 = *(_QWORD *)(v22 + 24);
    v25 = *(_QWORD *)(v16 + 48) + v20;
    v26 = *(void (**)(unint64_t, char *, uint64_t))(v1 + 32);
    v41 = *(_OWORD *)(v22 + 8);
    v26(v25, v15, v14);
    v27 = *(_QWORD *)(v16 + 56) + v21;
    *(_QWORD *)v27 = v23;
    *(_OWORD *)(v27 + 8) = v41;
    *(_QWORD *)(v27 + 24) = v24;
    swift_retain();
    result = (void *)swift_retain();
  }
  v30 = v28 + 2;
  if (v30 >= v35)
  {
LABEL_26:
    result = (void *)swift_release();
    v31 = v34;
    v32 = v40;
    goto LABEL_28;
  }
  v29 = *((_QWORD *)v36 + v30);
  if (v29)
  {
    v10 = v30;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    if (v10 >= v35)
      goto LABEL_26;
    v29 = *((_QWORD *)v36 + v10);
    ++v30;
    if (v29)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

unsigned __int8 *specialized _parseInteger<A, B>(ascii:radix:)(uint64_t a1, uint64_t a2, uint64_t a3)
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
  v5 = String.init<A>(_:)();
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
  v5 = static String._copying(_:)();
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
    v7 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
  }
LABEL_7:
  v11 = specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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

uint64_t static String._copying(_:)()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = String.subscript.getter();
  v4 = static String._copying(_:)(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t static String._copying(_:)(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = specialized Collection.count.getter(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v9, 0);
      v12 = specialized Sequence._copySequenceContents(initializing:)((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
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
    v13 = MEMORY[0x23493A530](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x23493A530);
LABEL_9:
      _StringObject.sharedUTF8.getter();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x23493A530]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t specialized Collection.count.getter(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
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
    result = _StringGuts._slowEnsureMatchingEncoding(_:)(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = _StringGuts._slowEnsureMatchingEncoding(_:)(a2, a3, a4);
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
    return String.UTF8View._foreignDistance(from:to:)();
  }
  __break(1u);
  return result;
}

unint64_t specialized Sequence._copySequenceContents(initializing:)(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
      result = _StringGuts._slowEnsureMatchingEncoding(_:)(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = String.UTF8View._foreignSubscript(position:)();
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
          result = _StringObject.sharedUTF8.getter();
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
    result = _StringGuts._slowEnsureMatchingEncoding(_:)(v12, a6, a7);
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
    v12 = String.UTF8View._foreignIndex(after:)();
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

void specialized Set.subscript.getter(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  void *v4;
  unint64_t v6;
  uint64_t v7;
  Swift::Int v8;
  uint64_t v9;
  id v10;
  char v11;
  uint64_t v12;
  id v13;
  char v14;
  id v15;
  void *v16;

  v6 = a1;
  if ((a4 & 0xC000000000000001) == 0)
  {
    if ((a3 & 1) != 0)
      goto LABEL_13;
    if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
        goto LABEL_20;
      __break(1u);
LABEL_13:
      if (__CocoaSet.Index.age.getter() == *(_DWORD *)(a4 + 36))
      {
        __CocoaSet.Index.element.getter();
        type metadata accessor for UIScene(0, &lazy cache variable for type metadata for UIScene);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v4 = v16;
        swift_unknownObjectRelease();
        v8 = NSObject._rawHashValue(seed:)(*(_QWORD *)(a4 + 40));
        v9 = -1 << *(_BYTE *)(a4 + 32);
        v6 = v8 & ~v9;
        if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
        {
          v10 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
          v11 = static NSObject.== infix(_:_:)();

          if ((v11 & 1) == 0)
          {
            v12 = ~v9;
            do
            {
              v6 = (v6 + 1) & v12;
              if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
                goto LABEL_24;
              v13 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
              v14 = static NSObject.== infix(_:_:)();

            }
            while ((v14 & 1) == 0);
          }

LABEL_20:
          v15 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
          return;
        }
LABEL_24:

        __break(1u);
        goto LABEL_25;
      }
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    __break(1u);
    goto LABEL_23;
  }
  if ((a3 & 1) == 0)
  {
LABEL_25:
    __break(1u);
    return;
  }
  if (a4 < 0)
    v7 = a4;
  else
    v7 = a4 & 0xFFFFFFFFFFFFFF8;
  MEMORY[0x23493A7AC](a1, a2, v7);
  type metadata accessor for UIScene(0, &lazy cache variable for type metadata for UIScene);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
}

uint64_t specialized _NativeSet.startIndex.getter(uint64_t a1)
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
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 72);
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

uint64_t specialized Dictionary.startIndex.getter(uint64_t a1)
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

uint64_t specialized Dictionary.subscript.getter(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a2 < 0 || 1 << *(_BYTE *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a5 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    v7 = result;
    v8 = *(_QWORD *)(a5 + 48);
    v9 = type metadata accessor for UUID();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a2, v9);
    v10 = *(_QWORD *)(*(_QWORD *)(a5 + 56) + 32 * a2);
    swift_retain();
    swift_retain();
    return v10;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t specialized static SuggestionSheetManager.getClientPlatformVersion()()
{
  id v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  char v4;
  _QWORD *v5;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 *v18;
  char v19;
  uint64_t v20;
  unsigned __int8 *v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unsigned __int8 *v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  unsigned __int8 *v37;
  unsigned int v38;
  uint64_t v39;
  char v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;

  v0 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v1 = objc_msgSend(v0, sel_infoDictionary);

  if (!v1)
  {
    v42 = 0u;
    v43 = 0u;
    goto LABEL_10;
  }
  v2 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  if (!*(_QWORD *)(v2 + 16)
    || (v3 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000011, 0x8000000233A90570), (v4 & 1) == 0))
  {
    v42 = 0u;
    v43 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  outlined init with copy of Any(*(_QWORD *)(v2 + 56) + 32 * v3, (uint64_t)&v42);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v43 + 1))
  {
LABEL_10:
    outlined destroy of URL?((uint64_t)&v42, &demangling cache variable for type metadata for Any?);
    goto LABEL_11;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_11:
    if (one-time initialization token for bridge != -1)
      swift_once();
    v10 = type metadata accessor for Logger();
    __swift_project_value_buffer(v10, (uint64_t)static Logger.bridge);
    v11 = Logger.logObject.getter();
    v12 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_233A5C000, v11, v12, "Client info missing PlatformVersion", v13, 2u);
      MEMORY[0x23493AEA8](v13, -1, -1);
    }

    return 0;
  }
  v42 = v41;
  lazy protocol witness table accessor for type String and conformance String();
  v5 = (_QWORD *)StringProtocol.components<A>(separatedBy:)();
  result = swift_bridgeObjectRelease();
  v7 = v5[2];
  if (v7)
  {
    v9 = v5[4];
    v8 = v5[5];
    result = swift_bridgeObjectRetain();
  }
  else
  {
    v9 = 0;
    v8 = 0xE000000000000000;
  }
  v15 = HIBYTE(v8) & 0xF;
  v16 = v9 & 0xFFFFFFFFFFFFLL;
  if ((v8 & 0x2000000000000000) != 0)
    v17 = HIBYTE(v8) & 0xF;
  else
    v17 = v9 & 0xFFFFFFFFFFFFLL;
  if (!v17)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((v8 & 0x1000000000000000) != 0)
  {
    v14 = (uint64_t)specialized _parseInteger<A, B>(ascii:radix:)(v9, v8, 10);
    LOBYTE(v9) = v40;
    goto LABEL_62;
  }
  if ((v8 & 0x2000000000000000) == 0)
  {
    if ((v9 & 0x1000000000000000) != 0)
      v18 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v18 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
    v14 = (uint64_t)specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(v18, v16, 10);
    LOBYTE(v9) = v19 & 1;
LABEL_62:
    swift_bridgeObjectRelease();
    if ((v9 & 1) != 0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      if (v7 < 2)
      {
        swift_bridgeObjectRelease();
        v29 = 0;
        v30 = 0xE000000000000000;
      }
      else
      {
        if (v5[2] < 2uLL)
        {
          __break(1u);
          goto LABEL_83;
        }
        v29 = v5[6];
        v30 = v5[7];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      v31 = specialized FixedWidthInteger.init(_:)(v29, v30);
      if ((v32 & 1) == 0)
      {
        v5 = (_QWORD *)v31;
        if (one-time initialization token for bridge == -1)
        {
LABEL_70:
          v33 = type metadata accessor for Logger();
          __swift_project_value_buffer(v33, (uint64_t)static Logger.bridge);
          v34 = Logger.logObject.getter();
          v35 = static os_log_type_t.info.getter();
          if (os_log_type_enabled(v34, v35))
          {
            v36 = swift_slowAlloc();
            *(_DWORD *)v36 = 134218240;
            *(_QWORD *)&v42 = v14;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            *(_WORD *)(v36 + 12) = 2048;
            *(_QWORD *)&v42 = v5;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            _os_log_impl(&dword_233A5C000, v34, v35, "Client PlatformVersion: %ld.%ld", (uint8_t *)v36, 0x16u);
            MEMORY[0x23493AEA8](v36, -1, -1);
          }

          return v14;
        }
LABEL_83:
        swift_once();
        goto LABEL_70;
      }
    }
    return 0;
  }
  *(_QWORD *)&v42 = v9;
  *((_QWORD *)&v42 + 1) = v8 & 0xFFFFFFFFFFFFFFLL;
  if (v9 == 43)
  {
    if (!v15)
      goto LABEL_85;
    if (v15 == 1 || (BYTE1(v9) - 48) > 9u)
      goto LABEL_49;
    v14 = (BYTE1(v9) - 48);
    if (v15 != 2)
    {
      if ((BYTE2(v9) - 48) > 9u)
        goto LABEL_49;
      v14 = 10 * (BYTE1(v9) - 48) + (BYTE2(v9) - 48);
      v20 = v15 - 3;
      if (v20)
      {
        v21 = (unsigned __int8 *)&v42 + 3;
        while (1)
        {
          v22 = *v21 - 48;
          if (v22 > 9)
            goto LABEL_49;
          v23 = 10 * v14;
          if ((unsigned __int128)(v14 * (__int128)10) >> 64 != (10 * v14) >> 63)
            goto LABEL_49;
          v14 = v23 + v22;
          if (__OFADD__(v23, v22))
            goto LABEL_49;
          LOBYTE(v9) = 0;
          ++v21;
          if (!--v20)
            goto LABEL_62;
        }
      }
    }
LABEL_61:
    LOBYTE(v9) = 0;
    goto LABEL_62;
  }
  if (v9 != 45)
  {
    if (!v15 || (v9 - 48) > 9u)
      goto LABEL_49;
    v14 = (v9 - 48);
    if (v15 != 1)
    {
      if ((BYTE1(v9) - 48) > 9u)
        goto LABEL_49;
      v14 = 10 * (v9 - 48) + (BYTE1(v9) - 48);
      v24 = v15 - 2;
      if (v24)
      {
        v25 = (unsigned __int8 *)&v42 + 2;
        while (1)
        {
          v26 = *v25 - 48;
          if (v26 > 9)
            goto LABEL_49;
          v27 = 10 * v14;
          if ((unsigned __int128)(v14 * (__int128)10) >> 64 != (10 * v14) >> 63)
            goto LABEL_49;
          v14 = v27 + v26;
          if (__OFADD__(v27, v26))
            goto LABEL_49;
          LOBYTE(v9) = 0;
          ++v25;
          if (!--v24)
            goto LABEL_62;
        }
      }
    }
    goto LABEL_61;
  }
  if (v15)
  {
    if (v15 != 1 && (BYTE1(v9) - 48) <= 9u)
    {
      if (v15 == 2)
      {
        LOBYTE(v9) = 0;
        v14 = -(uint64_t)(BYTE1(v9) - 48);
        goto LABEL_62;
      }
      if ((BYTE2(v9) - 48) <= 9u)
      {
        v14 = -10 * (BYTE1(v9) - 48) - (BYTE2(v9) - 48);
        v28 = v15 - 3;
        if (!v28)
          goto LABEL_61;
        v37 = (unsigned __int8 *)&v42 + 3;
        while (1)
        {
          v38 = *v37 - 48;
          if (v38 > 9)
            break;
          v39 = 10 * v14;
          if ((unsigned __int128)(v14 * (__int128)10) >> 64 != (10 * v14) >> 63)
            break;
          v14 = v39 - v38;
          if (__OFSUB__(v39, v38))
            break;
          LOBYTE(v9) = 0;
          ++v37;
          if (!--v28)
            goto LABEL_62;
        }
      }
    }
LABEL_49:
    v14 = 0;
    LOBYTE(v9) = 1;
    goto LABEL_62;
  }
  __break(1u);
LABEL_85:
  __break(1u);
  return result;
}

uint64_t specialized static SuggestionSheetManager.contentImpl(bySpiType:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _UNKNOWN **v18;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  _UNKNOWN **v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;

  v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_15;
  }
  v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v5 & 1) != 0)
  {
LABEL_15:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InternalAssetProvider.Type>);
    v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_233A8DEA0;
    v17 = type metadata accessor for JournalingSuggestion.Photo(0);
    v18 = &protocol witness table for JournalingSuggestion.Photo;
LABEL_16:
    *(_QWORD *)(v16 + 32) = v17;
    *(_QWORD *)(v16 + 40) = v18;
    return v16;
  }
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;
  if (v6 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v8 == v9)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_19;
  }
  v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v11 & 1) != 0)
  {
LABEL_19:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InternalAssetProvider.Type>);
    v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_233A8DEA0;
    v17 = type metadata accessor for JournalingSuggestion.Video(0);
    v18 = &protocol witness table for JournalingSuggestion.Video;
    goto LABEL_16;
  }
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v14 = v13;
  if (v12 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v14 == v15)
  {
    swift_bridgeObjectRelease_n();
LABEL_21:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InternalAssetProvider.Type>);
    v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_233A8DEA0;
    v17 = type metadata accessor for JournalingSuggestion.LivePhoto(0);
    v18 = &protocol witness table for JournalingSuggestion.LivePhoto;
    goto LABEL_16;
  }
  v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v20 & 1) != 0)
    goto LABEL_21;
  v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v23 = v22;
  if (v21 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v23 == v24)
  {
    swift_bridgeObjectRelease_n();
LABEL_26:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InternalAssetProvider.Type>);
    v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_233A8DEC0;
    *(_QWORD *)(v16 + 32) = type metadata accessor for JournalingSuggestion.Song(0);
    *(_QWORD *)(v16 + 40) = &protocol witness table for JournalingSuggestion.Song;
    *(_QWORD *)(v16 + 48) = type metadata accessor for JournalingSuggestion.Podcast(0);
    *(_QWORD *)(v16 + 56) = &protocol witness table for JournalingSuggestion.Podcast;
    *(_QWORD *)(v16 + 64) = type metadata accessor for JournalingSuggestion.GenericMedia(0);
    *(_QWORD *)(v16 + 72) = &protocol witness table for JournalingSuggestion.GenericMedia;
    return v16;
  }
  v25 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v25 & 1) != 0)
    goto LABEL_26;
  v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v28 = v27;
  if (v26 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v28 == v29)
  {
    swift_bridgeObjectRelease_n();
LABEL_31:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InternalAssetProvider.Type>);
    v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_233A8DEA0;
    v17 = type metadata accessor for JournalingSuggestion.Contact(0);
    v18 = &protocol witness table for JournalingSuggestion.Contact;
    goto LABEL_16;
  }
  v30 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v30 & 1) != 0)
    goto LABEL_31;
  v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v33 = v32;
  if (v31 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v33 == v34)
  {
    swift_bridgeObjectRelease_n();
LABEL_36:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InternalAssetProvider.Type>);
    v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_233A8DEB0;
    *(_QWORD *)(v16 + 32) = type metadata accessor for JournalingSuggestion.Workout(0);
    *(_QWORD *)(v16 + 40) = &protocol witness table for JournalingSuggestion.Workout;
    v36 = type metadata accessor for JournalingSuggestion.Workout.Details(0);
    v37 = &protocol witness table for JournalingSuggestion.Workout.Details;
LABEL_37:
    *(_QWORD *)(v16 + 48) = v36;
    *(_QWORD *)(v16 + 56) = v37;
    return v16;
  }
  v35 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v35 & 1) != 0)
    goto LABEL_36;
  v38 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v40 = v39;
  if (v38 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v40 == v41)
  {
    swift_bridgeObjectRelease_n();
LABEL_42:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InternalAssetProvider.Type>);
    v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_233A8DEA0;
    v17 = type metadata accessor for JournalingSuggestion.WorkoutGroup(0);
    v18 = &protocol witness table for JournalingSuggestion.WorkoutGroup;
    goto LABEL_16;
  }
  v42 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v42 & 1) != 0)
    goto LABEL_42;
  v43 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v45 = v44;
  if (v43 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v45 == v46)
  {
    swift_bridgeObjectRelease_n();
LABEL_47:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InternalAssetProvider.Type>);
    v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_233A8DEB0;
    *(_QWORD *)(v16 + 32) = &type metadata for JournalingSuggestion.LocationGroup;
    *(_QWORD *)(v16 + 40) = &protocol witness table for JournalingSuggestion.LocationGroup;
    v36 = type metadata accessor for JournalingSuggestion.Location(0);
    v37 = &protocol witness table for JournalingSuggestion.Location;
    goto LABEL_37;
  }
  v47 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v47 & 1) != 0)
    goto LABEL_47;
  v48 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v50 = v49;
  if (v48 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v50 == v51)
  {
    swift_bridgeObjectRelease_n();
LABEL_52:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InternalAssetProvider.Type>);
    v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_233A8DEA0;
    v17 = type metadata accessor for JournalingSuggestion.MotionActivity(0);
    v18 = &protocol witness table for JournalingSuggestion.MotionActivity;
    goto LABEL_16;
  }
  v52 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v52 & 1) != 0)
    goto LABEL_52;
  v53 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v55 = v54;
  if (v53 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v55 == v56)
    goto LABEL_55;
  v57 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v57 & 1) != 0)
    goto LABEL_60;
  v58 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v60 = v59;
  if (v58 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v60 == v61)
  {
LABEL_55:
    swift_bridgeObjectRelease_n();
LABEL_60:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InternalAssetProvider.Type>);
    v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_233A8DEA0;
    v17 = type metadata accessor for JournalingSuggestion.Location(0);
    v18 = &protocol witness table for JournalingSuggestion.Location;
    goto LABEL_16;
  }
  v62 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v62 & 1) != 0)
    goto LABEL_60;
  v63 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v65 = v64;
  if (v63 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v65 == v66)
  {
LABEL_63:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  v67 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v67 & 1) != 0)
    return 0;
  v68 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v70 = v69;
  if (v68 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v70 == v71)
  {
    swift_bridgeObjectRelease_n();
LABEL_70:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InternalAssetProvider.Type>);
    v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_233A8DEA0;
    *(_QWORD *)(v16 + 32) = &type metadata for JournalingSuggestion.Reflection;
    *(_QWORD *)(v16 + 40) = &protocol witness table for JournalingSuggestion.Reflection;
    return v16;
  }
  v72 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v72 & 1) != 0)
    goto LABEL_70;
  v73 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v75 = v74;
  if (v73 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v75 == v76)
  {
    swift_bridgeObjectRelease_n();
LABEL_75:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InternalAssetProvider.Type>);
    v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_233A8DEA0;
    v17 = type metadata accessor for JournalingSuggestion.StateOfMind(0);
    v18 = &protocol witness table for JournalingSuggestion.StateOfMind;
    goto LABEL_16;
  }
  v77 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v77 & 1) != 0)
    goto LABEL_75;
  v78 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v80 = v79;
  if (v78 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v80 == v81)
    goto LABEL_63;
  v82 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v82 & 1) != 0)
    return 0;
  v83 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v85 = v84;
  if (v83 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v85 == v86)
    goto LABEL_63;
  v87 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v87 & 1) != 0)
    return 0;
  v88 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v90 = v89;
  if (v88 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v90 == v91)
    goto LABEL_63;
  v92 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v92 & 1) != 0)
    return 0;
  v93 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v95 = v94;
  if (v93 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v95 == v96)
    goto LABEL_63;
  v97 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v97 & 1) != 0)
    return 0;
  v98 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v100 = v99;
  if (v98 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v100 == v101)
    goto LABEL_63;
  v102 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v102 & 1) != 0)
    return 0;
  v103 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v105 = v104;
  if (v103 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v105 == v106)
    goto LABEL_63;
  v107 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v107 & 1) != 0)
    return 0;
  v108 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v110 = v109;
  if (v108 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v110 == v111)
    goto LABEL_63;
  v112 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v112 & 1) != 0)
    return 0;
  v113 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v115 = v114;
  if (v113 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v115 == v116)
    goto LABEL_63;
  v117 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v117 & 1) != 0)
    return 0;
  v118 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v120 = v119;
  if (v118 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v120 == v121)
  {
    v16 = 0;
  }
  else if ((_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    v16 = 0;
  }
  else
  {
    v16 = MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v16;
}

_QWORD *specialized static SuggestionSheetManager.content(bySpiType:)()
{
  unint64_t v0;
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  int64_t v8;
  _QWORD *v9;
  int64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v1 = specialized static SuggestionSheetManager.contentImpl(bySpiType:)();
  if (v1)
  {
    v3 = (_QWORD *)v1;
    v4 = *(_QWORD **)(v1 + 16);
    if (!v4)
    {
LABEL_16:
      swift_bridgeObjectRelease();
      return v4;
    }
    v5 = (int64_t)v4 + 2;
    if (__OFADD__(v4, 2))
    {
      __break(1u);
    }
    else
    {
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
      if ((_DWORD)isUniquelyReferenced_nonNull_native && (v2 = v3[3], v7 = v2 >> 1, (uint64_t)(v2 >> 1) >= v5))
      {
        v4 = v3;
      }
      else
      {
        if ((uint64_t)v4 <= v5)
          v8 = (int64_t)v4 + 2;
        else
          v8 = (int64_t)v4;
        v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v8, 1, v3);
        v2 = v4[3];
        v7 = v2 >> 1;
      }
      v0 = v4[2];
      v5 = v0 + 1;
      if (v7 > v0)
        goto LABEL_13;
    }
    v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v2 > 1), v5, 1, v4);
    v2 = v4[3];
    v7 = v2 >> 1;
LABEL_13:
    v4[2] = v5;
    v9 = &v4[2 * v0];
    v9[4] = MEMORY[0x24BDF4108];
    v9[5] = &protocol witness table for Image;
    v10 = v0 + 2;
    if ((uint64_t)v7 < v10)
      v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v2 > 1), v10, 1, v4);
    v11 = type metadata accessor for UIScene(0, (unint64_t *)&lazy cache variable for type metadata for UIImage);
    v4[2] = v10;
    v12 = &v4[2 * v5];
    v12[4] = v11;
    v12[5] = &protocol witness table for UIImage;
    goto LABEL_16;
  }
  return 0;
}

unint64_t lazy protocol witness table accessor for type UIScene and conformance NSObject()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type UIScene and conformance NSObject;
  if (!lazy protocol witness table cache variable for type UIScene and conformance NSObject)
  {
    v1 = type metadata accessor for UIScene(255, &lazy cache variable for type metadata for UIScene);
    result = MEMORY[0x23493AE0C](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UIScene and conformance NSObject);
  }
  return result;
}

uint64_t sub_233A745F4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_233A74618()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void partial apply for closure #1 in SuggestionSheetManager.activate()()
{
  uint64_t v0;

  closure #1 in SuggestionSheetManager.activate()(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
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

uint64_t partial apply for closure #1 in SuggestionSheetManager.show(token:onCompletion:onDismiss:)()
{
  uint64_t v0;

  return closure #1 in SuggestionSheetManager.show(token:onCompletion:onDismiss:)(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t partial apply for closure #1 in closure #1 in SuggestionSheetManager.show(token:onCompletion:onDismiss:)(uint64_t a1)
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
  v8[1] = partial apply for closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:);
  return closure #1 in closure #1 in SuggestionSheetManager.show(token:onCompletion:onDismiss:)(a1, v4, v5, v7, v6);
}

uint64_t outlined consume of SuggestionSheetManager.TrackingHandlers?(uint64_t result)
{
  if (result)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t specialized SuggestionSheetManager.suggestionSheetController(_:didTransitionTo:)(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  if (one-time initialization token for bridge != -1)
    swift_once();
  v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Logger.bridge);
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v5 = 134217984;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_233A5C000, v3, v4, "Picker didTransitionTo %lu", v5, 0xCu);
    MEMORY[0x23493AEA8](v5, -1, -1);
  }

  return SuggestionSheetManager.remoteViewStateChangedTo(_:)(a1);
}

uint64_t specialized SuggestionSheetManager.suggestionSheetControllerDidCancel(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;

  v1 = v0;
  if (one-time initialization token for bridge != -1)
    swift_once();
  v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Logger.bridge);
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_233A5C000, v3, v4, "Picker sheet cancel", v5, 2u);
    MEMORY[0x23493AEA8](v5, -1, -1);
  }

  v6 = OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock;
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock), sel_lock);
  v7 = v1 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState;
  if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState + 8) & 1) != 0
    || *(_QWORD *)v7)
  {
    *(_QWORD *)v7 = 0;
    *(_BYTE *)(v7 + 8) = 0;
  }
  objc_msgSend(*(id *)(v1 + v6), sel_unlock);
  return SuggestionSheetManager.servicePickerViewState()();
}

uint64_t sub_233A7494C()
{
  id *v0;

  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = partial apply for closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:);
  return closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:)(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t type metadata accessor for SuggestionSheetManager()
{
  return objc_opt_self();
}

unint64_t lazy protocol witness table accessor for type PlatformVersion and conformance PlatformVersion()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type PlatformVersion and conformance PlatformVersion;
  if (!lazy protocol witness table cache variable for type PlatformVersion and conformance PlatformVersion)
  {
    result = MEMORY[0x23493AE0C](&protocol conformance descriptor for PlatformVersion, &type metadata for PlatformVersion);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PlatformVersion and conformance PlatformVersion);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SuggestionSheetManager.DismissReason and conformance SuggestionSheetManager.DismissReason()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SuggestionSheetManager.DismissReason and conformance SuggestionSheetManager.DismissReason;
  if (!lazy protocol witness table cache variable for type SuggestionSheetManager.DismissReason and conformance SuggestionSheetManager.DismissReason)
  {
    result = MEMORY[0x23493AE0C](&protocol conformance descriptor for SuggestionSheetManager.DismissReason, &type metadata for SuggestionSheetManager.DismissReason);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SuggestionSheetManager.DismissReason and conformance SuggestionSheetManager.DismissReason);
  }
  return result;
}

uint64_t associated type witness table accessor for ObservableObject.ObjectWillChangePublisher : Publisher in SuggestionSheetManager()
{
  return MEMORY[0x24BDB9D70];
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PlatformVersion(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for PlatformVersion(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PlatformVersion()
{
  return &type metadata for PlatformVersion;
}

uint64_t method lookup function for SuggestionSheetManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SuggestionSheetManager.activate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of SuggestionSheetManager.show(token:onCompletion:onDismiss:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of SuggestionSheetManager.dismiss(presentationToken:reason:)(uint64_t a1, char a2)
{
  _QWORD *v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))((*MEMORY[0x24BEE4EA0] & *v2) + 0x150))(a1, a2 & 1);
}

uint64_t dispatch thunk of SuggestionSheetManager.onApplicationMovedToForeground()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of SuggestionSheetManager.suggestionSheetController(_:didTransitionTo:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of SuggestionSheetManager.suggestionSheetControllerDidCancel(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of SuggestionSheetManager.suggestionSheetControllerShouldShowBlankComposeView(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of SuggestionSheetManager.suggestionSheetControllerShouldShowMomentsValidator(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SuggestionSheetManager.DismissReason(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SuggestionSheetManager.DismissReason(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_233A74D3C + 4 * byte_233A8DED5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_233A74D70 + 4 * byte_233A8DED0[v4]))();
}

uint64_t sub_233A74D70(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_233A74D78(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x233A74D80);
  return result;
}

uint64_t sub_233A74D8C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x233A74D94);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_233A74D98(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_233A74DA0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for SuggestionSheetManager.DismissReason(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for SuggestionSheetManager.DismissReason(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SuggestionSheetManager.DismissReason()
{
  return &type metadata for SuggestionSheetManager.DismissReason;
}

uint64_t destroy for SuggestionSheetManager.TrackingHandlers()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for SuggestionSheetManager.TrackingHandlers(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for SuggestionSheetManager.TrackingHandlers(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for SuggestionSheetManager.TrackingHandlers(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

void *type metadata accessor for SuggestionSheetManager.TrackingHandlers()
{
  return &unk_2504CEF08;
}

void partial apply for closure #1 in SuggestionSheetManager.getAssetsFor(suggestion:)(uint64_t a1)
{
  uint64_t v1;

  closure #1 in SuggestionSheetManager.getAssetsFor(suggestion:)(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_233A74EF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[MOSuggestionAsset], Error>);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in SuggestionSheetManager.getAssetsFor(suggestion:)(unint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[MOSuggestionAsset], Error>)
                 - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return closure #1 in closure #1 in SuggestionSheetManager.getAssetsFor(suggestion:)(a1, a2, v2 + v6, *(void **)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t partial apply for closure #1 in SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = *(_QWORD *)(v2 + 16);
  v7 = *(_QWORD *)(v2 + 24);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v8;
  *v8 = v3;
  v8[1] = partial apply for closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:);
  return closure #1 in SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:)(a1, a2, v6, v7);
}

uint64_t lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23493AE0C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_233A75090()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:)(uint64_t a1)
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
  v9[1] = partial apply for closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:);
  return closure #1 in closure #1 in SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:)(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_233A7514C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzlTR21JournalingSuggestions0C10SuggestionV11ItemContentVSg_Tg5TA(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = partial apply for closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:);
  return ((uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzlTR21JournalingSuggestions0C10SuggestionV11ItemContentVSg_Tg5Tu
                                                 + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzlTR21JournalingSuggestions0C10SuggestionV11ItemContentVSg_Tg5Tu))(a1, v4);
}

uint64_t outlined consume of InternalAssetContent.AssetProvider?(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_233A751F0()
{
  swift_release();
  return swift_deallocObject();
}

void partial apply for closure #1 in SuggestionSheetManager.remoteViewStateChangedTo(_:)()
{
  uint64_t v0;

  closure #1 in SuggestionSheetManager.remoteViewStateChangedTo(_:)(*(_QWORD *)(v0 + 16), *(uint64_t **)(v0 + 24));
}

uint64_t outlined init with take of JournalingSuggestion.ItemContent?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_233A75260()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v1 = type metadata accessor for JournalingSuggestion(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = v0 + v3 + *(int *)(v1 + 24);
  v6 = type metadata accessor for DateInterval();
  v7 = *(_QWORD *)(v6 - 8);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6))
    (*(void (**)(unint64_t, uint64_t))(v7 + 8))(v5, v6);
  v8 = v0 + v3 + *(int *)(v1 + 28);
  v9 = type metadata accessor for UUID();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  swift_release();

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;

  v4 = *(_QWORD *)(type metadata accessor for JournalingSuggestion(0) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 23) & 0xFFFFFFFFFFFFF8;
  v8 = *(_QWORD *)(v1 + 16);
  v9 = *(_QWORD *)(v1 + 24);
  v10 = v1 + v5;
  v11 = (uint64_t *)(v1 + v6);
  v12 = *v11;
  v13 = v11[1];
  v14 = *(_QWORD *)(v1 + v7);
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v15;
  *v15 = v2;
  v15[1] = partial apply for closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:);
  return closure #1 in closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:)(a1, v8, v9, v10, v12, v13, v14);
}

void partial apply for closure #1 in SuggestionSheetManager.servicePickerViewState()()
{
  uint64_t v0;

  closure #1 in SuggestionSheetManager.servicePickerViewState()(v0);
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
  v5[1] = partial apply for closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:);
  return ((uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5Tu
                                                 + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5Tu))(a1, v4);
}

uint64_t objectdestroy_8Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t outlined consume of Set<UIScene>.Index._Variant(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t type metadata accessor for UIScene(uint64_t a1, unint64_t *a2)
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

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    result = MEMORY[0x23493AE0C](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

uint64_t specialized getMetadata<A>(_:key:as:)(uint64_t a1, void *a2)
{
  id v4;
  unint64_t v5;
  char v6;
  _OWORD v8[2];
  _BYTE v9[40];
  uint64_t v10;

  *(_QWORD *)&v8[0] = a2;
  type metadata accessor for MOSuggestionAssetMetadataKey(0);
  lazy protocol witness table accessor for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey();
  v4 = a2;
  AnyHashable.init<A>(_:)();
  if (*(_QWORD *)(a1 + 16) && (v5 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v9), (v6 & 1) != 0))
    outlined init with copy of Any(*(_QWORD *)(a1 + 56) + 32 * v5, (uint64_t)v8);
  else
    memset(v8, 0, sizeof(v8));
  outlined destroy of AnyHashable((uint64_t)v9);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  if (swift_dynamicCast())
    return v10;
  else
    return 0;
}

{
  id v4;
  unint64_t v5;
  char v6;
  int v7;
  uint64_t v8;
  _OWORD v10[2];
  _BYTE v11[40];
  uint64_t v12;

  *(_QWORD *)&v10[0] = a2;
  type metadata accessor for MOSuggestionAssetMetadataKey(0);
  lazy protocol witness table accessor for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey();
  v4 = a2;
  AnyHashable.init<A>(_:)();
  if (*(_QWORD *)(a1 + 16) && (v5 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v11), (v6 & 1) != 0))
    outlined init with copy of Any(*(_QWORD *)(a1 + 56) + 32 * v5, (uint64_t)v10);
  else
    memset(v10, 0, sizeof(v10));
  outlined destroy of AnyHashable((uint64_t)v11);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  v7 = swift_dynamicCast();
  v8 = v12;
  if (!v7)
    return 0;
  return v8;
}

uint64_t specialized getMetadata<A>(_:key:as:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  int v10;
  _OWORD v12[2];
  _BYTE v13[40];

  *(_QWORD *)&v12[0] = a2;
  type metadata accessor for MOSuggestionAssetMetadataKey(0);
  lazy protocol witness table accessor for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey();
  v6 = a2;
  AnyHashable.init<A>(_:)();
  if (*(_QWORD *)(a1 + 16) && (v7 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v13), (v8 & 1) != 0))
    outlined init with copy of Any(*(_QWORD *)(a1 + 56) + 32 * v7, (uint64_t)v12);
  else
    memset(v12, 0, sizeof(v12));
  outlined destroy of AnyHashable((uint64_t)v13);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  v9 = type metadata accessor for Date();
  v10 = swift_dynamicCast();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(a3, v10 ^ 1u, 1, v9);
}

void static JournalingSuggestion.Location.fromMedatata(_:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
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
  char v15;
  double v16;
  uint64_t v17;
  char v18;
  double v19;
  double v20;
  double v21;
  char v22;
  double v23;
  id v24;
  Class isa;
  id v26;
  uint64_t v27;

  v4 = type metadata accessor for Date();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(a2 + 32) = 0;
  v11 = a2 + *(int *)(type metadata accessor for JournalingSuggestion.Location(0) + 28);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v11, 1, 1, v4);
  *(_QWORD *)a2 = specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x24BE68CB8]);
  *(_QWORD *)(a2 + 8) = v12;
  *(_QWORD *)(a2 + 16) = specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x24BE68CB0]);
  *(_QWORD *)(a2 + 24) = v13;
  specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x24BE68CD8], (uint64_t)v10);
  outlined assign with take of Date?((uint64_t)v10, v11);
  v14 = specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x24BE68CC8]);
  if ((v15 & 1) == 0)
  {
    v16 = *(double *)&v14;
    *(double *)&v17 = COERCE_DOUBLE(specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x24BE68CD0]));
    if ((v18 & 1) == 0)
    {
      v19 = v16;
      v20 = *(double *)&v17;
      v21 = COERCE_DOUBLE(specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x24BE68CC0]));
      if ((v22 & 1) != 0)
        v23 = 0.0;
      else
        v23 = v21;
      static Date.distantPast.getter();
      v24 = objc_allocWithZone(MEMORY[0x24BDBFA80]);
      isa = Date._bridgeToObjectiveC()().super.isa;
      v26 = objc_msgSend(v24, sel_initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_timestamp_, isa, v19, v20, 0.0, v23, -1.0);

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      *(_QWORD *)(a2 + 32) = v26;
    }
  }
}

uint64_t closure #1 in static JournalingSuggestion.Location.getAssetLoaderForPlainLocation(for:inside:)(void (*a1)(uint64_t *, _QWORD), uint64_t a2, void *a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v17[5];

  v7 = type metadata accessor for JournalingSuggestion.Location(0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend(a3, sel_metadata);
  v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  static JournalingSuggestion.Location.fromMedatata(_:)(v11, (uint64_t)v9);
  swift_bridgeObjectRelease();
  v12 = (void *)*((_QWORD *)v9 + 4);
  v13 = a4;

  *((_QWORD *)v9 + 4) = a4;
  v17[3] = v7;
  v17[4] = (uint64_t)&protocol witness table for JournalingSuggestion.Location;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v17);
  outlined init with copy of JournalingSuggestion.Location((uint64_t)v9, (uint64_t)boxed_opaque_existential_1);
  a1(v17, 0);
  outlined destroy of JournalingSuggestionAsset?((uint64_t)v17);
  return outlined destroy of JournalingSuggestion.Location((uint64_t)v9);
}

uint64_t closure #1 in static JournalingSuggestion.Location.getAssetLoaderMultiPinMap(for:inside:)(void (*a1)(uint64_t *, _QWORD), uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v11[5];

  v5 = type metadata accessor for JournalingSuggestion.Location(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static JournalingSuggestion.Location.fromMedatata(_:)(a3, (uint64_t)v7);
  v11[3] = v5;
  v11[4] = (uint64_t)&protocol witness table for JournalingSuggestion.Location;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v11);
  outlined init with copy of JournalingSuggestion.Location((uint64_t)v7, (uint64_t)boxed_opaque_existential_1);
  a1(v11, 0);
  outlined destroy of JournalingSuggestion.Location((uint64_t)v7);
  return outlined destroy of JournalingSuggestionAsset?((uint64_t)v11);
}

uint64_t closure #1 in static JournalingSuggestion.LocationGroup.getAssetLoader(for:inside:)(void (*a1)(_QWORD, _QWORD), uint64_t a2, uint64_t a3)
{
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
  char *v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  char v38;
  double v39;
  uint64_t v40;
  char v41;
  double v42;
  double v43;
  double v44;
  char v45;
  double v46;
  char *v47;
  id v48;
  Class isa;
  id v50;
  unint64_t v51;
  unint64_t v52;
  _QWORD v54[2];
  void (*v55)(_QWORD, _QWORD);
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  unint64_t v63;
  void (*v64)(uint64_t, uint64_t, uint64_t, uint64_t);
  _OWORD v65[2];
  _QWORD v66[6];

  v6 = type metadata accessor for Date();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v57 = (char *)v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8](v9);
  v62 = (char *)v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for JournalingSuggestion.Location(0);
  v60 = *(_QWORD *)(v11 - 8);
  v61 = v11;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)v54 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v54 - v18;
  v59 = *(_QWORD *)(a3 + 16);
  if (v59)
  {
    v54[1] = a2;
    v55 = a1;
    v56 = v7;
    v64 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
    swift_bridgeObjectRetain();
    v20 = 0;
    v21 = MEMORY[0x24BEE4AF8];
    v58 = v19;
    do
    {
      v63 = v21;
      v22 = v14;
      v23 = a3;
      v24 = *(_QWORD *)(a3 + 8 * v20 + 32);
      *((_QWORD *)v17 + 4) = 0;
      v25 = (uint64_t)&v17[*(int *)(v61 + 28)];
      v64(v25, 1, 1, v6);
      v26 = (void *)*MEMORY[0x24BE68CB8];
      v27 = swift_bridgeObjectRetain();
      *(_QWORD *)v17 = specialized getMetadata<A>(_:key:as:)(v27, v26);
      *((_QWORD *)v17 + 1) = v28;
      *((_QWORD *)v17 + 2) = specialized getMetadata<A>(_:key:as:)(v24, (void *)*MEMORY[0x24BE68CB0]);
      *((_QWORD *)v17 + 3) = v29;
      *(_QWORD *)&v65[0] = *MEMORY[0x24BE68CD8];
      v30 = *(void **)&v65[0];
      type metadata accessor for MOSuggestionAssetMetadataKey(0);
      lazy protocol witness table accessor for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey();
      v31 = v30;
      AnyHashable.init<A>(_:)();
      if (*(_QWORD *)(v24 + 16) && (v32 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v66), (v33 & 1) != 0))
        outlined init with copy of Any(*(_QWORD *)(v24 + 56) + 32 * v32, (uint64_t)v65);
      else
        memset(v65, 0, sizeof(v65));
      a3 = v23;
      v14 = v22;
      v34 = (uint64_t)v58;
      outlined destroy of AnyHashable((uint64_t)v66);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
      v35 = (uint64_t)v62;
      v36 = swift_dynamicCast();
      v64(v35, v36 ^ 1u, 1, v6);
      outlined assign with take of Date?(v35, v25);
      v37 = specialized getMetadata<A>(_:key:as:)(v24, (void *)*MEMORY[0x24BE68CC8]);
      if ((v38 & 1) == 0)
      {
        v39 = *(double *)&v37;
        *(double *)&v40 = COERCE_DOUBLE(specialized getMetadata<A>(_:key:as:)(v24, (void *)*MEMORY[0x24BE68CD0]));
        if ((v41 & 1) == 0)
        {
          v42 = v39;
          v43 = *(double *)&v40;
          v44 = COERCE_DOUBLE(specialized getMetadata<A>(_:key:as:)(v24, (void *)*MEMORY[0x24BE68CC0]));
          if ((v45 & 1) != 0)
            v46 = 0.0;
          else
            v46 = v44;
          v47 = v57;
          static Date.distantPast.getter();
          v48 = objc_allocWithZone(MEMORY[0x24BDBFA80]);
          isa = Date._bridgeToObjectiveC()().super.isa;
          v50 = objc_msgSend(v48, sel_initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_timestamp_, isa, v42, v43, 0.0, v46, -1.0);

          (*(void (**)(char *, uint64_t))(v56 + 8))(v47, v6);
          *((_QWORD *)v17 + 4) = v50;
        }
      }
      outlined init with take of JournalingSuggestion.Location((uint64_t)v17, v34);
      swift_bridgeObjectRelease();
      outlined init with copy of JournalingSuggestion.Location(v34, (uint64_t)v14);
      v21 = v63;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v21 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v21 + 16) + 1, 1, v21);
      v52 = *(_QWORD *)(v21 + 16);
      v51 = *(_QWORD *)(v21 + 24);
      if (v52 >= v51 >> 1)
        v21 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v51 > 1, v52 + 1, 1, v21);
      ++v20;
      *(_QWORD *)(v21 + 16) = v52 + 1;
      outlined init with take of JournalingSuggestion.Location((uint64_t)v14, v21+ ((*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80))+ *(_QWORD *)(v60 + 72) * v52);
      outlined destroy of JournalingSuggestion.Location(v34);
    }
    while (v59 != v20);
    swift_bridgeObjectRelease();
    a1 = v55;
  }
  else
  {
    v21 = MEMORY[0x24BEE4AF8];
  }
  v66[3] = &type metadata for JournalingSuggestion.LocationGroup;
  v66[4] = &protocol witness table for JournalingSuggestion.LocationGroup;
  v66[0] = v21;
  a1(v66, 0);
  return outlined destroy of JournalingSuggestionAsset?((uint64_t)v66);
}

uint64_t (*specialized static JournalingSuggestion.LocationGroup.getAssetLoader(for:inside:)(void *a1))(void (*a1)(_QWORD, _QWORD), uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t v9;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  const char *v15;
  uint64_t v16;

  v2 = objc_msgSend(a1, sel_assetType);
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = v4;
  if (v3 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v5 == v6)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
      return 0;
  }
  v9 = specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x24BE68CF8]);
  if (v9)
  {
    if (*(_QWORD *)(v9 + 16) >= 2uLL)
    {
      *(_QWORD *)(swift_allocObject() + 16) = v9;
      return partial apply for closure #1 in static JournalingSuggestion.LocationGroup.getAssetLoader(for:inside:);
    }
    swift_bridgeObjectRelease();
    if (one-time initialization token for bridge != -1)
      swift_once();
    v16 = type metadata accessor for Logger();
    __swift_project_value_buffer(v16, (uint64_t)static Logger.bridge);
    v12 = Logger.logObject.getter();
    v13 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v12, v13))
      goto LABEL_20;
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    v15 = "SuggestionLocationGroup, skip single location group";
  }
  else
  {
    if (one-time initialization token for bridge != -1)
      swift_once();
    v11 = type metadata accessor for Logger();
    __swift_project_value_buffer(v11, (uint64_t)static Logger.bridge);
    v12 = Logger.logObject.getter();
    v13 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v12, v13))
      goto LABEL_20;
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    v15 = "SuggestionLocationGroup.getAssetLoader, Unexpected .multiPinMapLocations type";
  }
  _os_log_impl(&dword_233A5C000, v12, v13, v15, v14, 2u);
  MEMORY[0x23493AEA8](v14, -1, -1);
LABEL_20:

  return 0;
}

uint64_t (*specialized static JournalingSuggestion.Location.getAssetLoaderForPlainLocation(for:inside:)(void *a1))(void (*a1)(uint64_t *, _QWORD), uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;

  v2 = objc_msgSend(a1, sel_assetType);
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = v4;
  if (v3 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v5 == v6)
  {
LABEL_12:

    swift_bridgeObjectRelease_n();
    goto LABEL_13;
  }
  v8 = _stringCompareWithSmolCheck(_:_:expecting:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v8 & 1) == 0)
  {
    v2 = objc_msgSend(a1, sel_assetType);
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v11 = v10;
    if (v9 != static String._unconditionallyBridgeFromObjectiveC(_:)() || v11 != v12)
    {
      v14 = _stringCompareWithSmolCheck(_:_:expecting:)();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v14 & 1) == 0)
        return 0;
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_13:
  v15 = objc_msgSend(a1, sel_content);
  objc_opt_self();
  v16 = swift_dynamicCastObjCClass();
  if (v16)
  {
    v17 = v16;
    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = a1;
    *(_QWORD *)(v18 + 24) = v17;
    v19 = a1;
    return partial apply for closure #1 in static JournalingSuggestion.Location.getAssetLoaderForPlainLocation(for:inside:);
  }
  swift_unknownObjectRelease();
  if (one-time initialization token for bridge != -1)
    swift_once();
  v21 = type metadata accessor for Logger();
  __swift_project_value_buffer(v21, (uint64_t)static Logger.bridge);
  v22 = a1;
  v23 = Logger.logObject.getter();
  v24 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = (uint8_t *)swift_slowAlloc();
    v26 = swift_slowAlloc();
    v30 = v26;
    *(_DWORD *)v25 = 136315138;
    v27 = objc_msgSend(v22, sel_content);
    v28 = String.init<A>(describing:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v28, v29, &v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_233A5C000, v23, v24, "SuggestionLocation.getAssetLoader, Unexpected content: %s", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23493AEA8](v26, -1, -1);
    MEMORY[0x23493AEA8](v25, -1, -1);

  }
  else
  {

  }
  return 0;
}

uint64_t (*specialized static JournalingSuggestion.Location.getAssetLoaderMultiPinMap(for:inside:)(void *a1))(void (*a1)(uint64_t *, _QWORD), uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;

  v2 = objc_msgSend(a1, sel_assetType);
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = v4;
  if (v3 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v5 == v6)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
      return 0;
  }
  v9 = specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x24BE68CF8]);
  if (v9)
  {
    if (*(_QWORD *)(v9 + 16) == 1)
    {
      v10 = *(_QWORD *)(v9 + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(swift_allocObject() + 16) = v10;
      return partial apply for closure #1 in static JournalingSuggestion.Location.getAssetLoaderMultiPinMap(for:inside:);
    }
    swift_bridgeObjectRelease();
  }
  if (one-time initialization token for bridge != -1)
    swift_once();
  v12 = type metadata accessor for Logger();
  __swift_project_value_buffer(v12, (uint64_t)static Logger.bridge);
  v13 = Logger.logObject.getter();
  v14 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_233A5C000, v13, v14, "SuggestionLocation, ignoring multiPinMap group", v15, 2u);
    MEMORY[0x23493AEA8](v15, -1, -1);
  }

  return 0;
}

uint64_t (*specialized static JournalingSuggestion.Location.getAssetLoader(for:inside:)(void *a1))(void (*a1)(uint64_t *, _QWORD), uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v21;

  v2 = objc_msgSend(a1, sel_assetType);
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = v4;
  if (v3 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v5 == v6)
    goto LABEL_14;
  v8 = _stringCompareWithSmolCheck(_:_:expecting:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v8 & 1) != 0)
    return specialized static JournalingSuggestion.Location.getAssetLoaderForPlainLocation(for:inside:)(a1);
  v2 = objc_msgSend(a1, sel_assetType);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;
  if (v9 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v11 == v12)
  {
LABEL_14:

    swift_bridgeObjectRelease_n();
    return specialized static JournalingSuggestion.Location.getAssetLoaderForPlainLocation(for:inside:)(a1);
  }
  v14 = _stringCompareWithSmolCheck(_:_:expecting:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v14 & 1) != 0)
    return specialized static JournalingSuggestion.Location.getAssetLoaderForPlainLocation(for:inside:)(a1);
  v15 = objc_msgSend(a1, sel_assetType);
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v18 = v17;
  if (v16 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v18 == v19)
  {

    swift_bridgeObjectRelease_n();
    return specialized static JournalingSuggestion.Location.getAssetLoaderMultiPinMap(for:inside:)(a1);
  }
  v21 = _stringCompareWithSmolCheck(_:_:expecting:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v21 & 1) != 0)
    return specialized static JournalingSuggestion.Location.getAssetLoaderMultiPinMap(for:inside:)(a1);
  return 0;
}

uint64_t sub_233A76A40()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.LocationGroup.getAssetLoader(for:inside:)(void (*a1)(_QWORD, _QWORD), uint64_t a2)
{
  uint64_t v2;

  return closure #1 in static JournalingSuggestion.LocationGroup.getAssetLoader(for:inside:)(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t outlined init with take of JournalingSuggestion.Location(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for JournalingSuggestion.Location(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of JournalingSuggestion.Location(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for JournalingSuggestion.Location(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of JournalingSuggestion.Location(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for JournalingSuggestion.Location(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_233A76B30()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.Location.getAssetLoaderForPlainLocation(for:inside:)(void (*a1)(uint64_t *, _QWORD), uint64_t a2)
{
  uint64_t v2;

  return closure #1 in static JournalingSuggestion.Location.getAssetLoaderForPlainLocation(for:inside:)(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.Location.getAssetLoaderMultiPinMap(for:inside:)(void (*a1)(uint64_t *, _QWORD), uint64_t a2)
{
  uint64_t v2;

  return closure #1 in static JournalingSuggestion.Location.getAssetLoaderMultiPinMap(for:inside:)(a1, a2, *(_QWORD *)(v2 + 16));
}

BOOL static JournalingSuggestion.GenericMedia.isThirdPartyMediaAsset(_:)(uint64_t a1)
{
  return (unint64_t)(a1 - 6) < 3;
}

uint64_t closure #1 in static JournalingSuggestion.GenericMedia.getAssetLoader(for:inside:)(void (*a1)(uint64_t *, _QWORD), uint64_t a2, void *a3, void *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t, uint64_t);
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void (*v42)(uint64_t *, _QWORD);
  uint64_t v43[5];

  v40 = a4;
  v41 = a2;
  v42 = a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8](v5);
  v39 = (uint64_t)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for JournalingSuggestion.GenericMedia(0);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (uint64_t *)((char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = (uint64_t)v13 + *(int *)(v11 + 28);
  v15 = type metadata accessor for Date();
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56);
  v38 = v14;
  v16(v14, 1, 1, v15);
  v17 = (uint64_t)v13 + *(int *)(v10 + 32);
  v18 = type metadata accessor for URL();
  v19 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
  v19(v17, 1, 1, v18);
  v20 = objc_msgSend(a3, sel_title);
  v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v23 = v22;

  *v13 = v21;
  v13[1] = v23;
  v24 = objc_msgSend(a3, sel_artistName);
  v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v27 = v26;

  v13[2] = v25;
  v13[3] = v27;
  v28 = objc_msgSend(a3, sel_albumTitle);
  v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v31 = v30;

  v13[4] = v29;
  v13[5] = v31;
  v32 = objc_msgSend(a3, sel_imageURL);
  if (v32)
  {
    v33 = v32;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v34 = 0;
  }
  else
  {
    v34 = 1;
  }
  v19((uint64_t)v9, v34, 1, v18);
  outlined assign with take of URL?((uint64_t)v9, v17, &demangling cache variable for type metadata for URL?);
  v35 = v39;
  specialized getMetadata<A>(_:key:as:)(v40, (void *)*MEMORY[0x24BE68CE0], v39);
  outlined assign with take of URL?(v35, v38, &demangling cache variable for type metadata for Date?);
  v43[3] = v10;
  v43[4] = (uint64_t)&protocol witness table for JournalingSuggestion.GenericMedia;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v43);
  outlined init with copy of JournalingSuggestion.GenericMedia((uint64_t)v13, (uint64_t)boxed_opaque_existential_1);
  v42(v43, 0);
  outlined destroy of JournalingSuggestionAsset?((uint64_t)v43);
  return outlined destroy of JournalingSuggestion.GenericMedia((uint64_t)v13);
}

uint64_t (*specialized static JournalingSuggestion.GenericMedia.getAssetLoader(for:inside:)(void *a1))(void (*a1)(uint64_t *, _QWORD), uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = objc_msgSend(a1, sel_assetType);
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = v4;
  if (v3 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v5 == v6)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
      goto LABEL_12;
  }
  v9 = objc_msgSend(a1, sel_content);
  objc_opt_self();
  v10 = (void *)swift_dynamicCastObjCClass();
  if (!v10)
  {
    swift_unknownObjectRelease();
LABEL_12:
    if (one-time initialization token for bridge != -1)
      swift_once();
    v15 = type metadata accessor for Logger();
    __swift_project_value_buffer(v15, (uint64_t)static Logger.bridge);
    v16 = a1;
    v17 = Logger.logObject.getter();
    v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = swift_slowAlloc();
      v20 = swift_slowAlloc();
      v27 = v20;
      *(_DWORD *)v19 = 136315394;
      type metadata accessor for JournalingSuggestion.GenericMedia(0);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.GenericMedia.Type);
      v21 = String.init<A>(describing:)();
      v26 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v19 + 12) = 2080;
      v23 = objc_msgSend(v16, sel_content, v26, v27);
      v24 = String.init<A>(describing:)();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_233A5C000, v17, v18, "%s.getAssetLoader, Unexpected content: %s", (uint8_t *)v19, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23493AEA8](v20, -1, -1);
      MEMORY[0x23493AEA8](v19, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  v11 = v10;
  if ((char *)objc_msgSend(v10, sel_mediaType) - 6 < (char *)3)
  {
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = v11;
    *(_QWORD *)(v12 + 24) = a1;
    v13 = a1;
    return partial apply for closure #1 in static JournalingSuggestion.GenericMedia.getAssetLoader(for:inside:);
  }
  swift_unknownObjectRelease();
  return 0;
}

uint64_t sub_233A77180()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.GenericMedia.getAssetLoader(for:inside:)(void (*a1)(uint64_t *, _QWORD), uint64_t a2)
{
  uint64_t v2;

  return closure #1 in static JournalingSuggestion.GenericMedia.getAssetLoader(for:inside:)(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t outlined init with copy of JournalingSuggestion.GenericMedia(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for JournalingSuggestion.GenericMedia(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of JournalingSuggestion.GenericMedia(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for JournalingSuggestion.GenericMedia(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id static UIColor.dynamicColor(light:dark:)(void *a1, void *a2)
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[6];

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a2;
  *(_QWORD *)(v4 + 24) = a1;
  v5 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
  v11[4] = partial apply for closure #1 in static UIColor.dynamicColor(light:dark:);
  v11[5] = v4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 1107296256;
  v11[2] = thunk for @escaping @callee_guaranteed (@guaranteed UITraitCollection) -> (@owned UIColor);
  v11[3] = &block_descriptor_1;
  v6 = _Block_copy(v11);
  v7 = a2;
  v8 = a1;
  v9 = objc_msgSend(v5, sel_initWithDynamicProvider_, v6);
  _Block_release(v6);
  swift_release();
  return v9;
}

uint64_t sub_233A77308()
{
  uint64_t v0;

  return swift_deallocObject();
}

id UIColor.init(rgbColorCodeRed:green:blue:alpha:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithRed_green_blue_alpha_, (double)a1 / 255.0, (double)a2 / 255.0, (double)a3 / 255.0, a4);
}

uint64_t Color.init(light:dark:)(void *a1, void *a2)
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  _QWORD v12[6];

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a2;
  *(_QWORD *)(v4 + 24) = a1;
  v5 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
  v12[4] = partial apply for closure #1 in static UIColor.dynamicColor(light:dark:);
  v12[5] = v4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1107296256;
  v12[2] = thunk for @escaping @callee_guaranteed (@guaranteed UITraitCollection) -> (@owned UIColor);
  v12[3] = &block_descriptor_7;
  v6 = _Block_copy(v12);
  v7 = a2;
  v8 = a1;
  v9 = objc_msgSend(v5, sel_initWithDynamicProvider_, v6);
  _Block_release(v6);
  swift_release();
  v10 = MEMORY[0x23493A404](v9);

  return v10;
}

void one-time initialization function for resilienceBackground()
{
  id v0;
  id v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v9[6];

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.450980392, 0.435294118, 0.674509804, 1.0);
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.349019608, 0.333333333, 0.57254902, 1.0);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v1;
  *(_QWORD *)(v2 + 24) = v0;
  v3 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
  v9[4] = partial apply for closure #1 in static UIColor.dynamicColor(light:dark:);
  v9[5] = v2;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@guaranteed UITraitCollection) -> (@owned UIColor);
  v9[3] = &block_descriptor_52;
  v4 = _Block_copy(v9);
  v5 = v1;
  v6 = v0;
  v7 = objc_msgSend(v3, sel_initWithDynamicProvider_, v4);
  _Block_release(v4);
  swift_release();
  v8 = MEMORY[0x23493A404](v7);

  static JournalingSuggestion.Reflection.resilienceBackground = v8;
}

uint64_t *JournalingSuggestion.Reflection.resilienceBackground.unsafeMutableAddressor()
{
  if (one-time initialization token for resilienceBackground != -1)
    swift_once();
  return &static JournalingSuggestion.Reflection.resilienceBackground;
}

uint64_t static JournalingSuggestion.Reflection.resilienceBackground.getter()
{
  return static JournalingSuggestion.Reflection.resilienceBackground.getter(&one-time initialization token for resilienceBackground);
}

void one-time initialization function for gratitudeBackground()
{
  id v0;
  id v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v9[6];

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.866666667, 0.352941176, 0.345098039, 1.0);
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.764705882, 0.250980392, 0.243137255, 1.0);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v1;
  *(_QWORD *)(v2 + 24) = v0;
  v3 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
  v9[4] = partial apply for closure #1 in static UIColor.dynamicColor(light:dark:);
  v9[5] = v2;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@guaranteed UITraitCollection) -> (@owned UIColor);
  v9[3] = &block_descriptor_45;
  v4 = _Block_copy(v9);
  v5 = v1;
  v6 = v0;
  v7 = objc_msgSend(v3, sel_initWithDynamicProvider_, v4);
  _Block_release(v4);
  swift_release();
  v8 = MEMORY[0x23493A404](v7);

  static JournalingSuggestion.Reflection.gratitudeBackground = v8;
}

uint64_t *JournalingSuggestion.Reflection.gratitudeBackground.unsafeMutableAddressor()
{
  if (one-time initialization token for gratitudeBackground != -1)
    swift_once();
  return &static JournalingSuggestion.Reflection.gratitudeBackground;
}

uint64_t static JournalingSuggestion.Reflection.gratitudeBackground.getter()
{
  return static JournalingSuggestion.Reflection.resilienceBackground.getter(&one-time initialization token for gratitudeBackground);
}

void one-time initialization function for purposeBackground()
{
  id v0;
  id v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v9[6];

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.537254902, 0.611764706, 0.968627451, 1.0);
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.435294118, 0.509803922, 0.866666667, 1.0);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v1;
  *(_QWORD *)(v2 + 24) = v0;
  v3 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
  v9[4] = partial apply for closure #1 in static UIColor.dynamicColor(light:dark:);
  v9[5] = v2;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@guaranteed UITraitCollection) -> (@owned UIColor);
  v9[3] = &block_descriptor_38;
  v4 = _Block_copy(v9);
  v5 = v1;
  v6 = v0;
  v7 = objc_msgSend(v3, sel_initWithDynamicProvider_, v4);
  _Block_release(v4);
  swift_release();
  v8 = MEMORY[0x23493A404](v7);

  static JournalingSuggestion.Reflection.purposeBackground = v8;
}

uint64_t *JournalingSuggestion.Reflection.purposeBackground.unsafeMutableAddressor()
{
  if (one-time initialization token for purposeBackground != -1)
    swift_once();
  return &static JournalingSuggestion.Reflection.purposeBackground;
}

uint64_t static JournalingSuggestion.Reflection.purposeBackground.getter()
{
  return static JournalingSuggestion.Reflection.resilienceBackground.getter(&one-time initialization token for purposeBackground);
}

void one-time initialization function for kindnessBackground()
{
  id v0;
  id v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v9[6];

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.854901961, 0.533333333, 0.533333333, 1.0);
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.752941176, 0.431372549, 0.431372549, 1.0);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v1;
  *(_QWORD *)(v2 + 24) = v0;
  v3 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
  v9[4] = partial apply for closure #1 in static UIColor.dynamicColor(light:dark:);
  v9[5] = v2;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@guaranteed UITraitCollection) -> (@owned UIColor);
  v9[3] = &block_descriptor_31;
  v4 = _Block_copy(v9);
  v5 = v1;
  v6 = v0;
  v7 = objc_msgSend(v3, sel_initWithDynamicProvider_, v4);
  _Block_release(v4);
  swift_release();
  v8 = MEMORY[0x23493A404](v7);

  static JournalingSuggestion.Reflection.kindnessBackground = v8;
}

uint64_t *JournalingSuggestion.Reflection.kindnessBackground.unsafeMutableAddressor()
{
  if (one-time initialization token for kindnessBackground != -1)
    swift_once();
  return &static JournalingSuggestion.Reflection.kindnessBackground;
}

uint64_t static JournalingSuggestion.Reflection.kindnessBackground.getter()
{
  return static JournalingSuggestion.Reflection.resilienceBackground.getter(&one-time initialization token for kindnessBackground);
}

void one-time initialization function for creativityBackground()
{
  id v0;
  id v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v9[6];

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.568627451, 0.31372549, 0.447058824, 1.0);
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.466666667, 0.211764706, 0.345098039, 1.0);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v1;
  *(_QWORD *)(v2 + 24) = v0;
  v3 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
  v9[4] = partial apply for closure #1 in static UIColor.dynamicColor(light:dark:);
  v9[5] = v2;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@guaranteed UITraitCollection) -> (@owned UIColor);
  v9[3] = &block_descriptor_24;
  v4 = _Block_copy(v9);
  v5 = v1;
  v6 = v0;
  v7 = objc_msgSend(v3, sel_initWithDynamicProvider_, v4);
  _Block_release(v4);
  swift_release();
  v8 = MEMORY[0x23493A404](v7);

  static JournalingSuggestion.Reflection.creativityBackground = v8;
}

uint64_t *JournalingSuggestion.Reflection.creativityBackground.unsafeMutableAddressor()
{
  if (one-time initialization token for creativityBackground != -1)
    swift_once();
  return &static JournalingSuggestion.Reflection.creativityBackground;
}

uint64_t static JournalingSuggestion.Reflection.creativityBackground.getter()
{
  return static JournalingSuggestion.Reflection.resilienceBackground.getter(&one-time initialization token for creativityBackground);
}

void one-time initialization function for wisdomBackground()
{
  id v0;
  id v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v9[6];

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.129411765, 0.141176471, 0.219607843, 1.0);
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.231372549, 0.243137255, 0.321568627, 1.0);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v1;
  *(_QWORD *)(v2 + 24) = v0;
  v3 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
  v9[4] = partial apply for closure #1 in static UIColor.dynamicColor(light:dark:);
  v9[5] = v2;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@guaranteed UITraitCollection) -> (@owned UIColor);
  v9[3] = &block_descriptor_17;
  v4 = _Block_copy(v9);
  v5 = v1;
  v6 = v0;
  v7 = objc_msgSend(v3, sel_initWithDynamicProvider_, v4);
  _Block_release(v4);
  swift_release();
  v8 = MEMORY[0x23493A404](v7);

  static JournalingSuggestion.Reflection.wisdomBackground = v8;
}

uint64_t *JournalingSuggestion.Reflection.wisdomBackground.unsafeMutableAddressor()
{
  if (one-time initialization token for wisdomBackground != -1)
    swift_once();
  return &static JournalingSuggestion.Reflection.wisdomBackground;
}

uint64_t static JournalingSuggestion.Reflection.wisdomBackground.getter()
{
  return static JournalingSuggestion.Reflection.resilienceBackground.getter(&one-time initialization token for wisdomBackground);
}

uint64_t static JournalingSuggestion.Reflection.resilienceBackground.getter(_QWORD *a1)
{
  if (*a1 != -1)
    swift_once();
  return swift_retain();
}

uint64_t closure #1 in static JournalingSuggestion.Reflection.getAssetLoader(for:inside:)(void (*a1)(_QWORD *, _QWORD), uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  _QWORD v10[5];

  swift_bridgeObjectRetain();
  v10[3] = &type metadata for JournalingSuggestion.Reflection;
  v10[4] = &protocol witness table for JournalingSuggestion.Reflection;
  v10[0] = a3;
  v10[1] = a4;
  v10[2] = specialized static JournalingSuggestion.Reflection.evergreenColorOfType(_:)((uint64_t)objc_msgSend(a5, sel_reflectionType));
  swift_retain();
  swift_bridgeObjectRetain();
  a1(v10, 0);
  outlined destroy of JournalingSuggestionAsset?((uint64_t)v10);
  swift_release();
  return swift_bridgeObjectRelease();
}

id thunk for @escaping @callee_guaranteed (@guaranteed UITraitCollection) -> (@owned UIColor)(uint64_t a1, void *a2)
{
  uint64_t (*v3)(void);
  id v4;
  void *v5;

  v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v5 = (void *)v3();
  swift_release();

  return v5;
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

uint64_t (*specialized static JournalingSuggestion.Reflection.getAssetLoader(for:inside:)(void *a1))(void (*a1)(_QWORD *, _QWORD), uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v2 = objc_msgSend(a1, sel_assetType);
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = v4;
  if (v3 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v5 == v6)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
      goto LABEL_13;
  }
  v9 = objc_msgSend(a1, sel_content);
  objc_opt_self();
  v10 = (void *)swift_dynamicCastObjCClass();
  if (v10)
  {
    v11 = v10;
    v12 = objc_msgSend(v10, sel_reflectionPrompts);
    v13 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v13[2])
    {
      v15 = v13[4];
      v14 = v13[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v16 = (_QWORD *)swift_allocObject();
      v16[2] = v15;
      v16[3] = v14;
      v16[4] = v11;
      return partial apply for closure #1 in static JournalingSuggestion.Reflection.getAssetLoader(for:inside:);
    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
  }
LABEL_13:
  if (one-time initialization token for bridge != -1)
    swift_once();
  v18 = type metadata accessor for Logger();
  __swift_project_value_buffer(v18, (uint64_t)static Logger.bridge);
  v19 = a1;
  v20 = Logger.logObject.getter();
  v21 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = swift_slowAlloc();
    v23 = swift_slowAlloc();
    v30 = v23;
    *(_DWORD *)v22 = 136315394;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.Reflection.Type);
    v24 = String.init<A>(describing:)();
    v29 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, &v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2080;
    v26 = objc_msgSend(v19, sel_content, v29, v30);
    v27 = String.init<A>(describing:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v27, v28, &v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_233A5C000, v20, v21, "%s.getAssetLoader, Unexpected content: %s", (uint8_t *)v22, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23493AEA8](v23, -1, -1);
    MEMORY[0x23493AEA8](v22, -1, -1);

  }
  else
  {

  }
  return 0;
}

uint64_t specialized static JournalingSuggestion.Reflection.evergreenColorOfType(_:)(uint64_t a1)
{
  uint64_t result;

  switch(a1)
  {
    case 1:
      if (one-time initialization token for wisdomBackground != -1)
        goto LABEL_15;
      goto LABEL_14;
    case 2:
      if (one-time initialization token for gratitudeBackground == -1)
        goto LABEL_14;
      goto LABEL_15;
    case 3:
      if (one-time initialization token for kindnessBackground == -1)
        goto LABEL_14;
      goto LABEL_15;
    case 4:
      if (one-time initialization token for purposeBackground == -1)
        goto LABEL_14;
      goto LABEL_15;
    case 5:
      if (one-time initialization token for resilienceBackground == -1)
        goto LABEL_14;
      goto LABEL_15;
    case 6:
      if (one-time initialization token for creativityBackground == -1)
        goto LABEL_14;
LABEL_15:
      swift_once();
LABEL_14:
      result = swift_retain();
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t sub_233A78508()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.Reflection.getAssetLoader(for:inside:)(void (*a1)(_QWORD *, _QWORD), uint64_t a2)
{
  uint64_t v2;

  return closure #1 in static JournalingSuggestion.Reflection.getAssetLoader(for:inside:)(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(void **)(v2 + 32));
}

id partial apply for closure #1 in static UIColor.dynamicColor(light:dark:)(void *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(v1 + 16);
  v3 = *(void **)(v1 + 24);
  if (objc_msgSend(a1, sel_userInterfaceStyle) == (id)2)
    v4 = v2;
  else
    v4 = v3;
  return v4;
}

uint64_t specialized getMetadata<A>(_:key:as:)(void *a1, void *a2)
{
  return specialized getMetadata<A>(_:key:as:)(a1, a2, &demangling cache variable for type metadata for [Int]);
}

{
  return specialized getMetadata<A>(_:key:as:)(a1, a2, &demangling cache variable for type metadata for [UIColor]);
}

{
  return specialized getMetadata<A>(_:key:as:)(a1, a2);
}

{
  return specialized getMetadata<A>(_:key:as:)(a1, a2);
}

{
  return specialized getMetadata<A>(_:key:as:)(a1, a2);
}

{
  id v3;
  uint64_t v4;
  id v5;
  unint64_t v6;
  char v7;
  int v8;
  uint64_t v9;
  _OWORD v11[2];
  _BYTE v12[40];
  uint64_t v13;

  v3 = objc_msgSend(a1, sel_metadata);
  v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  *(_QWORD *)&v11[0] = a2;
  type metadata accessor for MOSuggestionAssetMetadataKey(0);
  lazy protocol witness table accessor for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey();
  v5 = a2;
  AnyHashable.init<A>(_:)();
  if (*(_QWORD *)(v4 + 16) && (v6 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v12), (v7 & 1) != 0))
    outlined init with copy of Any(*(_QWORD *)(v4 + 56) + 32 * v6, (uint64_t)v11);
  else
    memset(v11, 0, sizeof(v11));
  swift_bridgeObjectRelease();
  outlined destroy of AnyHashable((uint64_t)v12);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  v8 = swift_dynamicCast();
  v9 = v13;
  if (!v8)
    return 0;
  return v9;
}

{
  return specialized getMetadata<A>(_:key:as:)(a1, a2, &lazy cache variable for type metadata for HKQuantity);
}

{
  return specialized getMetadata<A>(_:key:as:)(a1, a2, &demangling cache variable for type metadata for [UInt]);
}

{
  return specialized getMetadata<A>(_:key:as:)(a1, a2, &demangling cache variable for type metadata for [Date]);
}

{
  id v3;
  uint64_t v4;
  id v5;
  unint64_t v6;
  char v7;
  _OWORD v9[2];
  _BYTE v10[40];
  uint64_t v11;

  v3 = objc_msgSend(a1, sel_metadata);
  v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  *(_QWORD *)&v9[0] = a2;
  type metadata accessor for MOSuggestionAssetMetadataKey(0);
  lazy protocol witness table accessor for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey();
  v5 = a2;
  AnyHashable.init<A>(_:)();
  if (*(_QWORD *)(v4 + 16) && (v6 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v10), (v7 & 1) != 0))
    outlined init with copy of Any(*(_QWORD *)(v4 + 56) + 32 * v6, (uint64_t)v9);
  else
    memset(v9, 0, sizeof(v9));
  swift_bridgeObjectRelease();
  outlined destroy of AnyHashable((uint64_t)v10);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  type metadata accessor for MOSuggestionAssetMotionActivityType(0);
  if (swift_dynamicCast())
    return v11;
  else
    return 0;
}

{
  return specialized getMetadata<A>(_:key:as:)(a1, a2, &demangling cache variable for type metadata for [[AnyHashable : Any]]);
}

{
  id v3;
  uint64_t v4;
  id v5;
  unint64_t v6;
  char v7;
  _OWORD v9[2];
  _BYTE v10[40];
  uint64_t v11;

  v3 = objc_msgSend(a1, sel_metadata);
  v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  *(_QWORD *)&v9[0] = a2;
  type metadata accessor for MOSuggestionAssetMetadataKey(0);
  lazy protocol witness table accessor for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey();
  v5 = a2;
  AnyHashable.init<A>(_:)();
  if (*(_QWORD *)(v4 + 16) && (v6 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v10), (v7 & 1) != 0))
    outlined init with copy of Any(*(_QWORD *)(v4 + 56) + 32 * v6, (uint64_t)v9);
  else
    memset(v9, 0, sizeof(v9));
  swift_bridgeObjectRelease();
  outlined destroy of AnyHashable((uint64_t)v10);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  if (swift_dynamicCast())
    return v11;
  else
    return 0;
}

uint64_t specialized getMetadata<A>(_:key:as:)@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  int v11;
  _OWORD v13[2];
  _BYTE v14[40];

  v5 = objc_msgSend(a1, sel_metadata);
  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  *(_QWORD *)&v13[0] = a2;
  type metadata accessor for MOSuggestionAssetMetadataKey(0);
  lazy protocol witness table accessor for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey();
  v7 = a2;
  AnyHashable.init<A>(_:)();
  if (*(_QWORD *)(v6 + 16) && (v8 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v14), (v9 & 1) != 0))
    outlined init with copy of Any(*(_QWORD *)(v6 + 56) + 32 * v8, (uint64_t)v13);
  else
    memset(v13, 0, sizeof(v13));
  swift_bridgeObjectRelease();
  outlined destroy of AnyHashable((uint64_t)v14);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  v10 = type metadata accessor for Date();
  v11 = swift_dynamicCast();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(a3, v11 ^ 1u, 1, v10);
}

uint64_t specialized getMetadata<A>(_:key:as:)(void *a1, void *a2, uint64_t *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  char v9;
  _OWORD v11[2];
  _BYTE v12[40];
  uint64_t v13;

  v5 = objc_msgSend(a1, sel_metadata);
  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  *(_QWORD *)&v11[0] = a2;
  type metadata accessor for MOSuggestionAssetMetadataKey(0);
  lazy protocol witness table accessor for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey();
  v7 = a2;
  AnyHashable.init<A>(_:)();
  if (*(_QWORD *)(v6 + 16) && (v8 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v12), (v9 & 1) != 0))
    outlined init with copy of Any(*(_QWORD *)(v6 + 56) + 32 * v8, (uint64_t)v11);
  else
    memset(v11, 0, sizeof(v11));
  swift_bridgeObjectRelease();
  outlined destroy of AnyHashable((uint64_t)v12);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  __swift_instantiateConcreteTypeFromMangledName(a3);
  if (swift_dynamicCast())
    return v13;
  else
    return 0;
}

uint64_t specialized getMetadata<A>(_:key:as:)(void *a1, void *a2, unint64_t *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  char v9;
  _OWORD v11[2];
  _BYTE v12[40];
  uint64_t v13;

  v5 = objc_msgSend(a1, sel_metadata);
  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  *(_QWORD *)&v11[0] = a2;
  type metadata accessor for MOSuggestionAssetMetadataKey(0);
  lazy protocol witness table accessor for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey();
  v7 = a2;
  AnyHashable.init<A>(_:)();
  if (*(_QWORD *)(v6 + 16) && (v8 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v12), (v9 & 1) != 0))
    outlined init with copy of Any(*(_QWORD *)(v6 + 56) + 32 * v8, (uint64_t)v11);
  else
    memset(v11, 0, sizeof(v11));
  swift_bridgeObjectRelease();
  outlined destroy of AnyHashable((uint64_t)v12);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  type metadata accessor for UIScene(0, a3);
  if (swift_dynamicCast())
    return v13;
  else
    return 0;
}

void static JournalingSuggestion.Photo.getCropRect(_:key:)(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = (void *)specialized getMetadata<A>(_:key:as:)(a1, a2, &lazy cache variable for type metadata for MOSuggestionAssetPhotoCropRect);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, sel_cgRect);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

  }
  else
  {
    v7 = 0;
    v9 = 0;
    v11 = 0;
    v13 = 0;
  }
  *(_QWORD *)a3 = v7;
  *(_QWORD *)(a3 + 8) = v9;
  *(_QWORD *)(a3 + 16) = v11;
  *(_QWORD *)(a3 + 24) = v13;
  *(_BYTE *)(a3 + 32) = v5 == 0;
}

uint64_t closure #1 in static JournalingSuggestion.Photo.getAssetLoader(for:inside:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;

  v22 = a1;
  v7 = type metadata accessor for URL();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a3, v7);
  v15 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v16 = (v9 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = 0;
  *(_QWORD *)(v17 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v17 + v15, v10, v7);
  *(_QWORD *)(v17 + v16) = a4;
  v18 = (_QWORD *)(v17 + ((v16 + 15) & 0xFFFFFFFFFFFFFFF8));
  *v18 = v22;
  v18[1] = a2;
  v19 = a4;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v13, (uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in static JournalingSuggestion.Photo.getAssetLoader(for:inside:), v17);
  return swift_release();
}

uint64_t closure #1 in closure #1 in static JournalingSuggestion.Photo.getAssetLoader(for:inside:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v7[23] = a6;
  v7[24] = a7;
  v7[22] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v7[25] = swift_task_alloc();
  v7[26] = type metadata accessor for JournalingSuggestion.Photo(0);
  v7[27] = swift_task_alloc();
  v9 = type metadata accessor for URL();
  v7[28] = v9;
  v7[29] = *(_QWORD *)(v9 - 8);
  v10 = swift_task_alloc();
  v7[30] = v10;
  v11 = (_QWORD *)swift_task_alloc();
  v7[31] = v11;
  *v11 = v7;
  v11[1] = closure #1 in closure #1 in static JournalingSuggestion.Photo.getAssetLoader(for:inside:);
  return prepareUrlAccess(_:)(v10, a4);
}

uint64_t closure #1 in closure #1 in static JournalingSuggestion.Photo.getAssetLoader(for:inside:)()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 256) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, _QWORD);
  uint64_t *boxed_opaque_existential_1;
  uint64_t v24;

  v1 = *(_QWORD *)(v0 + 216);
  v2 = *(_QWORD *)(v0 + 208);
  v3 = *(void **)(v0 + 176);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 232) + 16))(v1, *(_QWORD *)(v0 + 240), *(_QWORD *)(v0 + 224));
  v4 = v1 + *(int *)(v2 + 20);
  v5 = type metadata accessor for Date();
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
  v24 = v4;
  v6(v4, 1, 1, v5);
  v7 = objc_msgSend(v3, sel_metadata);
  v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  v9 = (void *)*MEMORY[0x24BE68D00];
  *(_QWORD *)(v0 + 168) = *MEMORY[0x24BE68D00];
  type metadata accessor for MOSuggestionAssetMetadataKey(0);
  lazy protocol witness table accessor for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey();
  v10 = v9;
  AnyHashable.init<A>(_:)();
  if (*(_QWORD *)(v8 + 16) && (v11 = specialized __RawDictionaryStorage.find<A>(_:)(v0 + 56), (v12 & 1) != 0))
  {
    outlined init with copy of Any(*(_QWORD *)(v8 + 56) + 32 * v11, v0 + 136);
  }
  else
  {
    *(_OWORD *)(v0 + 136) = 0u;
    *(_OWORD *)(v0 + 152) = 0u;
  }
  swift_bridgeObjectRelease();
  outlined destroy of AnyHashable(v0 + 56);
  v13 = *(_QWORD *)(v0 + 200);
  if (*(_QWORD *)(v0 + 160))
  {
    v14 = swift_dynamicCast() ^ 1;
    v15 = v13;
  }
  else
  {
    outlined destroy of URL?(v0 + 136, &demangling cache variable for type metadata for Any?);
    v15 = v13;
    v14 = 1;
  }
  v6(v15, v14, 1, v5);
  v16 = *(_QWORD *)(v0 + 232);
  v17 = *(_QWORD *)(v0 + 240);
  v19 = *(_QWORD *)(v0 + 216);
  v18 = *(_QWORD *)(v0 + 224);
  v20 = *(_QWORD *)(v0 + 208);
  v21 = *(void (**)(uint64_t, _QWORD))(v0 + 184);
  outlined assign with take of Date?(*(_QWORD *)(v0 + 200), v24);
  *(_QWORD *)(v0 + 120) = v20;
  *(_QWORD *)(v0 + 128) = &protocol witness table for JournalingSuggestion.Photo;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 96));
  outlined init with copy of JournalingSuggestion.Photo(v19, (uint64_t)boxed_opaque_existential_1);
  v21(v0 + 96, 0);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v17, v18);
  outlined destroy of URL?(v0 + 96, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  outlined destroy of JournalingSuggestion.Photo(v19);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t, void *);
  id v3;

  v1 = *(void **)(v0 + 256);
  v2 = *(void (**)(uint64_t, void *))(v0 + 184);
  *(_OWORD *)(v0 + 32) = 0u;
  *(_QWORD *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  v3 = v1;
  v2(v0 + 16, v1);

  outlined destroy of URL?(v0 + 16, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t (*specialized static JournalingSuggestion.Photo.getAssetLoader(for:inside:)(void *a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  void (*v16)(char *, char *, uint64_t);
  unint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v21;

  v2 = type metadata accessor for URL();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v21 - v7;
  v9 = objc_msgSend(a1, sel_assetType);
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = v11;
  if (v10 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v12 == v13)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v15 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
      return 0;
  }
  assetImageContentToUrl(_:)(a1, v8);
  v16 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
  v16(v6, v8, v2);
  v17 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v18 = swift_allocObject();
  v16((char *)(v18 + v17), v6, v2);
  *(_QWORD *)(v18 + ((v4 + v17 + 7) & 0xFFFFFFFFFFFFFFF8)) = a1;
  v19 = a1;
  return partial apply for closure #1 in static JournalingSuggestion.Photo.getAssetLoader(for:inside:);
}

uint64_t sub_233A79710()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = type metadata accessor for URL();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.Photo.getAssetLoader(for:inside:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(type metadata accessor for URL() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return closure #1 in static JournalingSuggestion.Photo.getAssetLoader(for:inside:)(a1, a2, v2 + v6, *(void **)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_233A797E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = type metadata accessor for URL();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in static JournalingSuggestion.Photo.getAssetLoader(for:inside:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v4 = *(_QWORD *)(type metadata accessor for URL() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = *(_QWORD *)(v1 + 16);
  v8 = *(_QWORD *)(v1 + 24);
  v9 = *(_QWORD *)(v1 + v6);
  v10 = v1 + v5;
  v11 = (uint64_t *)(v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  v12 = *v11;
  v13 = v11[1];
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v14;
  *v14 = v2;
  v14[1] = partial apply for closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:);
  return closure #1 in closure #1 in static JournalingSuggestion.Photo.getAssetLoader(for:inside:)(a1, v7, v8, v10, v9, v12, v13);
}

uint64_t outlined init with copy of JournalingSuggestion.Photo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for JournalingSuggestion.Photo(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of JournalingSuggestion.Photo(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for JournalingSuggestion.Photo(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static JournalingSuggestion.LivePhoto.getLivePhotoComponentURLs(pvtURL:)@<X0>(char *a1@<X8>)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  void (*v20)(void);
  uint64_t v21;
  id v22;
  NSURL *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  unint64_t v30;
  void (*v31)(char *, char *, uint64_t);
  Swift::String v32;
  char v33;
  uint64_t v34;
  char v35;
  uint64_t inited;
  Swift::String v37;
  uint64_t v38;
  char v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t, uint64_t);
  int v44;
  char *v45;
  void (*v46)(char *, uint64_t, uint64_t);
  char *v47;
  uint64_t v48;
  char *v50;
  uint64_t v51;
  char *v52;
  char *v53;
  char *v54;
  __int128 v55;
  char *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  _QWORD *v63;
  void (*v64)(void);
  char *v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  _QWORD v71[4];
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;

  v58 = a1;
  v76 = *MEMORY[0x24BDAC8D0];
  v1 = type metadata accessor for URL();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v56 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v60 = (char *)&v55 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v55 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v57 = (uint64_t)&v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v59 = (uint64_t)&v55 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v55 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v55 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v20 = *(void (**)(void))(v2 + 56);
  v69 = (uint64_t)&v55 - v21;
  v20();
  v61 = v19;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v20)(v19, 1, 1, v1);
  v22 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  URL._bridgeToObjectiveC()(v23);
  v25 = v24;
  v70 = 0;
  v26 = objc_msgSend(v22, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v24, 0, 0, &v70);

  v27 = v70;
  if (v26)
  {
    v28 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    v29 = v27;

    v68 = v28;
    v67 = *(_QWORD *)(v28 + 16);
    if (v67)
    {
      v30 = 0;
      v66 = v68 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
      v63 = v71;
      v62 = 6778480;
      v55 = xmmword_233A8DEB0;
      v64 = v20;
      v65 = v16;
      while (1)
      {
        if (v30 >= *(_QWORD *)(v68 + 16))
          __break(1u);
        (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v16, v66 + *(_QWORD *)(v2 + 72) * v30, v1);
        ((void (*)(char *, _QWORD, uint64_t, uint64_t))v20)(v16, 0, 1, v1);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v16, 1, v1) == 1)
          goto LABEL_34;
        v31 = *(void (**)(char *, char *, uint64_t))(v2 + 32);
        v31(v8, v16, v1);
        v71[0] = 6778986;
        v71[1] = 0xE300000000000000;
        v71[2] = 1734701162;
        v71[3] = 0xE400000000000000;
        v72 = v62;
        v73 = (void *)0xE300000000000000;
        v74 = 1667851624;
        v75 = (void *)0xE400000000000000;
        URL.pathExtension.getter();
        v32 = String.lowercased()();
        swift_bridgeObjectRelease();
        if (v32._countAndFlagsBits == 6778986 && v32._object == (void *)0xE300000000000000)
          break;
        v33 = _stringCompareWithSmolCheck(_:_:expecting:)();
        v16 = v65;
        if ((v33 & 1) != 0
          || v32._countAndFlagsBits == 1734701162 && v32._object == (void *)0xE400000000000000
          || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
          || v72 == v32._countAndFlagsBits && v73 == v32._object
          || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
          || v74 == v32._countAndFlagsBits && v75 == v32._object)
        {
          swift_bridgeObjectRelease();
          goto LABEL_19;
        }
        v35 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if ((v35 & 1) != 0)
          goto LABEL_19;
        swift_arrayDestroy();
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = v55;
        *(_QWORD *)(inited + 32) = 7761773;
        *(_QWORD *)(inited + 40) = 0xE300000000000000;
        *(_QWORD *)(inited + 48) = 3436653;
        *(_QWORD *)(inited + 56) = 0xE300000000000000;
        URL.pathExtension.getter();
        v37 = String.lowercased()();
        swift_bridgeObjectRelease();
        if (v37._countAndFlagsBits == 7761773 && v37._object == (void *)0xE300000000000000
          || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          swift_release();
          swift_bridgeObjectRelease();
          v16 = v65;
        }
        else
        {
          v16 = v65;
          if (v37._countAndFlagsBits == 3436653 && v37._object == (void *)0xE300000000000000)
          {
            swift_release();
            swift_bridgeObjectRelease();
          }
          else
          {
            v39 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_release();
            swift_bridgeObjectRelease();
            if ((v39 & 1) == 0)
            {
              (*(void (**)(char *, uint64_t))(v2 + 8))(v8, v1);
              v20 = v64;
              goto LABEL_20;
            }
          }
        }
        v38 = (uint64_t)v61;
        outlined destroy of URL?((uint64_t)v61, &demangling cache variable for type metadata for URL?);
        v31((char *)v38, v8, v1);
        v20 = v64;
        ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v64)(v38, 0, 1, v1);
LABEL_20:
        if (v67 == ++v30)
          goto LABEL_33;
      }
      swift_bridgeObjectRelease();
      v16 = v65;
LABEL_19:
      swift_arrayDestroy();
      v34 = v69;
      outlined destroy of URL?(v69, &demangling cache variable for type metadata for URL?);
      v31((char *)v34, v8, v1);
      v20 = v64;
      ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v64)(v34, 0, 1, v1);
      goto LABEL_20;
    }
LABEL_33:
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v20)(v16, 1, 1, v1);
LABEL_34:
    swift_bridgeObjectRelease();
  }
  else
  {
    v40 = v70;
    v41 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
  }
  v42 = v59;
  outlined init with take of URL?((uint64_t)v61, v59);
  v43 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  v44 = v43(v42, 1, v1);
  v45 = v60;
  if (v44 == 1)
  {
    outlined destroy of URL?(v69, &demangling cache variable for type metadata for URL?);
LABEL_40:
    v47 = v58;
    outlined destroy of URL?(v42, &demangling cache variable for type metadata for URL?);
    v48 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (imageURL: URL, videoURL: URL));
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 56))(v47, 1, 1, v48);
  }
  v46 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 32);
  v46(v60, v42, v1);
  v42 = v57;
  outlined init with take of URL?(v69, v57);
  if (v43(v42, 1, v1) == 1)
  {
    (*(void (**)(char *, uint64_t))(v2 + 8))(v45, v1);
    goto LABEL_40;
  }
  v50 = v56;
  v46(v56, v42, v1);
  v51 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (imageURL: URL, videoURL: URL));
  v52 = v45;
  v53 = v58;
  v54 = &v58[*(int *)(v51 + 48)];
  v46(v58, (uint64_t)v50, v1);
  v46(v54, (uint64_t)v52, v1);
  return (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 56))(v53, 0, 1, v51);
}

uint64_t closure #1 in static JournalingSuggestion.LivePhoto.getAssetLoader(for:inside:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;

  v22 = a1;
  v7 = type metadata accessor for URL();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a3, v7);
  v15 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v16 = (v9 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = 0;
  *(_QWORD *)(v17 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v17 + v15, v10, v7);
  v18 = (_QWORD *)(v17 + v16);
  *v18 = v22;
  v18[1] = a2;
  *(_QWORD *)(v17 + ((v16 + 23) & 0xFFFFFFFFFFFFFFF8)) = a4;
  swift_retain();
  v19 = a4;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v13, (uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in static JournalingSuggestion.LivePhoto.getAssetLoader(for:inside:), v17);
  return swift_release();
}

uint64_t closure #1 in closure #1 in static JournalingSuggestion.LivePhoto.getAssetLoader(for:inside:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v7[21] = a6;
  v7[22] = a7;
  v7[19] = a4;
  v7[20] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v7[23] = swift_task_alloc();
  v7[24] = type metadata accessor for JournalingSuggestion.LivePhoto(0);
  v7[25] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (imageURL: URL, videoURL: URL)?);
  v7[26] = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (imageURL: URL, videoURL: URL));
  v7[27] = v9;
  v7[28] = *(_QWORD *)(v9 - 8);
  v7[29] = swift_task_alloc();
  v7[30] = swift_task_alloc();
  v7[31] = swift_task_alloc();
  v10 = type metadata accessor for URL();
  v7[32] = v10;
  v7[33] = *(_QWORD *)(v10 - 8);
  v7[34] = swift_task_alloc();
  v11 = swift_task_alloc();
  v7[35] = v11;
  v12 = (_QWORD *)swift_task_alloc();
  v7[36] = v12;
  *v12 = v7;
  v12[1] = closure #1 in closure #1 in static JournalingSuggestion.LivePhoto.getAssetLoader(for:inside:);
  return prepareUrlAccess(_:)(v11, a4);
}

uint64_t closure #1 in closure #1 in static JournalingSuggestion.LivePhoto.getAssetLoader(for:inside:)()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 296) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  uint64_t *boxed_opaque_existential_1;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, void *);
  void *v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void (*v47)(uint64_t, _QWORD);
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;

  v1 = *(_QWORD *)(v0 + 216);
  v2 = *(_QWORD *)(v0 + 224);
  v3 = *(char **)(v0 + 208);
  static JournalingSuggestion.LivePhoto.getLivePhotoComponentURLs(pvtURL:)(v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    outlined destroy of URL?(*(_QWORD *)(v0 + 208), &demangling cache variable for type metadata for (imageURL: URL, videoURL: URL)?);
    if (one-time initialization token for bridge != -1)
      swift_once();
    v4 = *(_QWORD *)(v0 + 152);
    v6 = *(_QWORD *)(v0 + 264);
    v5 = *(_QWORD *)(v0 + 272);
    v7 = *(_QWORD *)(v0 + 256);
    v8 = type metadata accessor for Logger();
    __swift_project_value_buffer(v8, (uint64_t)static Logger.bridge);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v4, v7);
    v9 = Logger.logObject.getter();
    v10 = static os_log_type_t.error.getter();
    v11 = os_log_type_enabled(v9, v10);
    v12 = *(_QWORD *)(v0 + 272);
    v13 = *(_QWORD *)(v0 + 256);
    if (v11)
    {
      v49 = *(_QWORD *)(v0 + 264);
      v14 = (uint8_t *)swift_slowAlloc();
      v48 = swift_slowAlloc();
      v52 = v48;
      *(_DWORD *)v14 = 136315138;
      lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type URL and conformance URL, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
      v15 = dispatch thunk of CustomStringConvertible.description.getter();
      *(_QWORD *)(v0 + 144) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, &v52);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v50 = *(void (**)(uint64_t, uint64_t))(v49 + 8);
      v50(v12, v13);
      _os_log_impl(&dword_233A5C000, v9, v10, "Can't prepare live photo using url: '%s'", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23493AEA8](v48, -1, -1);
      MEMORY[0x23493AEA8](v14, -1, -1);
    }
    else
    {
      v50 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 264) + 8);
      v50(*(_QWORD *)(v0 + 272), *(_QWORD *)(v0 + 256));
    }

    v33 = *(_QWORD *)(v0 + 280);
    v34 = *(_QWORD *)(v0 + 256);
    v35 = *(void (**)(uint64_t, void *))(v0 + 160);
    type metadata accessor for JournalingSuggestionsError();
    lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError((unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestionsError and conformance JournalingSuggestionsError, (uint64_t (*)(uint64_t))type metadata accessor for JournalingSuggestionsError, (uint64_t)&protocol conformance descriptor for JournalingSuggestionsError);
    *(_OWORD *)(v0 + 56) = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
    *(_QWORD *)(v0 + 88) = 0;
    v36 = (void *)swift_allocError();
    v38 = v37;
    lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type URL and conformance URL, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
    v39 = dispatch thunk of CustomStringConvertible.description.getter();
    *v38 = 0x4C5255747670;
    v38[1] = 0xE600000000000000;
    v38[2] = v39;
    v38[3] = v40;
    swift_storeEnumTagMultiPayload();
    v35(v0 + 56, v36);

    outlined destroy of URL?(v0 + 56, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
    v50(v33, v34);
  }
  else
  {
    v51 = *(_QWORD *)(v0 + 280);
    v17 = *(_QWORD *)(v0 + 256);
    v18 = *(_QWORD **)(v0 + 264);
    v19 = *(_QWORD *)(v0 + 240);
    v20 = *(_QWORD *)(v0 + 248);
    v21 = *(_QWORD *)(v0 + 216);
    v44 = *(_QWORD *)(v0 + 200);
    v42 = *(_QWORD *)(v0 + 232);
    v43 = *(_QWORD *)(v0 + 192);
    v45 = *(_QWORD *)(v0 + 184);
    v46 = *(void **)(v0 + 176);
    v47 = *(void (**)(uint64_t, _QWORD))(v0 + 160);
    v22 = *(int *)(v21 + 48);
    v23 = v20 + v22;
    v24 = *(_QWORD *)(v0 + 208) + v22;
    v25 = (void (*)(uint64_t))v18[4];
    v25(v20);
    ((void (*)(uint64_t, uint64_t, uint64_t))v25)(v23, v24, v17);
    v26 = v19 + *(int *)(v21 + 48);
    v27 = (void (*)(uint64_t, uint64_t, uint64_t))v18[2];
    v27(v19, v20, v17);
    v27(v26, v23, v17);
    v28 = v42 + *(int *)(v21 + 48);
    v27(v42, v20, v17);
    v27(v28, v23, v17);
    v29 = v44 + *(int *)(v43 + 24);
    v30 = type metadata accessor for Date();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v29, 1, 1, v30);
    ((void (*)(uint64_t, uint64_t, uint64_t))v25)(v44, v19, v17);
    ((void (*)(uint64_t, uint64_t, uint64_t))v25)(v44 + *(int *)(v43 + 20), v28, v17);
    v31 = (void (*)(uint64_t, uint64_t))v18[1];
    v31(v42, v17);
    v31(v26, v17);
    specialized getMetadata<A>(_:key:as:)(v46, (void *)*MEMORY[0x24BE68D08], v45);
    outlined assign with take of Date?(v45, v29);
    *(_QWORD *)(v0 + 120) = v43;
    *(_QWORD *)(v0 + 128) = &protocol witness table for JournalingSuggestion.LivePhoto;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 96));
    outlined init with copy of JournalingSuggestion.LivePhoto(v44, (uint64_t)boxed_opaque_existential_1);
    v47(v0 + 96, 0);
    outlined destroy of URL?(v20, &demangling cache variable for type metadata for (imageURL: URL, videoURL: URL));
    v31(v51, v17);
    outlined destroy of URL?(v0 + 96, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
    outlined destroy of JournalingSuggestion.LivePhoto(v44);
  }
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

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  void *v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void (*v14)(uint64_t, void *);
  id v15;

  if (one-time initialization token for bridge != -1)
    swift_once();
  v1 = *(void **)(v0 + 296);
  v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Logger.bridge);
  v3 = v1;
  v4 = v1;
  v5 = Logger.logObject.getter();
  v6 = static os_log_type_t.error.getter();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 296);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    v11 = v8;
    v12 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 136) = v12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *v10 = v12;

    _os_log_impl(&dword_233A5C000, v5, v6, "Can't access live photo urls: %@'", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x23493AEA8](v10, -1, -1);
    MEMORY[0x23493AEA8](v9, -1, -1);
  }
  else
  {

  }
  v13 = *(void **)(v0 + 296);
  v14 = *(void (**)(uint64_t, void *))(v0 + 160);
  *(_OWORD *)(v0 + 32) = 0u;
  *(_QWORD *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  v15 = v13;
  v14(v0 + 16, v13);

  outlined destroy of URL?(v0 + 16, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
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

uint64_t (*specialized static JournalingSuggestion.LivePhoto.getAssetLoader(for:inside:)(void *a1))(uint64_t a1, uint64_t a2)
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
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  int v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  void (*v20)(char *, char *, uint64_t);
  char *v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char *v35;
  id v36;
  id v37;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for URL();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v35 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v34 - v9;
  v11 = objc_msgSend(a1, sel_assetType);
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v14 = v13;
  if (v12 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v14 == v15)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v17 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v17 & 1) == 0)
      return 0;
  }
  v37 = objc_msgSend(a1, sel_content);
  v18 = swift_dynamicCast();
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
  if (v18)
  {
    v19(v4, 0, 1, v5);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
    {
      v20 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
      v20(v10, v4, v5);
      v21 = v35;
      v20(v35, v10, v5);
      v22 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      v23 = swift_allocObject();
      v20((char *)(v23 + v22), v21, v5);
      *(_QWORD *)(v23 + ((v7 + v22 + 7) & 0xFFFFFFFFFFFFFFF8)) = a1;
      v24 = a1;
      return partial apply for closure #1 in static JournalingSuggestion.LivePhoto.getAssetLoader(for:inside:);
    }
  }
  else
  {
    v19(v4, 1, 1, v5);
  }
  outlined destroy of URL?((uint64_t)v4, &demangling cache variable for type metadata for URL?);
  if (one-time initialization token for bridge != -1)
    swift_once();
  v26 = type metadata accessor for Logger();
  __swift_project_value_buffer(v26, (uint64_t)static Logger.bridge);
  v27 = a1;
  v28 = Logger.logObject.getter();
  v29 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = (uint8_t *)swift_slowAlloc();
    v31 = (id)swift_slowAlloc();
    v37 = v31;
    *(_DWORD *)v30 = 136315138;
    v36 = objc_msgSend(v27, sel_content);
    v32 = String.init<A>(describing:)();
    v36 = (id)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v32, v33, (uint64_t *)&v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_233A5C000, v28, v29, "SuggestionLivePhoto.getAssetLoader, Unexpected content: %s", v30, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23493AEA8](v31, -1, -1);
    MEMORY[0x23493AEA8](v30, -1, -1);

  }
  else
  {

  }
  return 0;
}

uint64_t sub_233A7B174()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = type metadata accessor for URL();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.LivePhoto.getAssetLoader(for:inside:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(type metadata accessor for URL() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return closure #1 in static JournalingSuggestion.LivePhoto.getAssetLoader(for:inside:)(a1, a2, v2 + v6, *(void **)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_233A7B248()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = type metadata accessor for URL();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in static JournalingSuggestion.LivePhoto.getAssetLoader(for:inside:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;

  v4 = *(_QWORD *)(type metadata accessor for URL() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 23) & 0xFFFFFFFFFFFFF8;
  v8 = *(_QWORD *)(v1 + 16);
  v9 = *(_QWORD *)(v1 + 24);
  v10 = v1 + v5;
  v11 = (uint64_t *)(v1 + v6);
  v12 = *v11;
  v13 = v11[1];
  v14 = *(_QWORD *)(v1 + v7);
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v15;
  *v15 = v2;
  v15[1] = partial apply for closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:);
  return closure #1 in closure #1 in static JournalingSuggestion.LivePhoto.getAssetLoader(for:inside:)(a1, v8, v9, v10, v12, v13, v14);
}

uint64_t outlined init with copy of JournalingSuggestion.LivePhoto(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for JournalingSuggestion.LivePhoto(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of JournalingSuggestion.LivePhoto(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for JournalingSuggestion.LivePhoto(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t JournalingSuggestion.StateOfMind.init(state:icon:lightBackground:darkBackground:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  int *v9;
  uint64_t result;

  *a5 = a1;
  v9 = (int *)type metadata accessor for JournalingSuggestion.StateOfMind(0);
  result = outlined init with take of JournalingSuggestion.ItemContent?(a2, (uint64_t)a5 + v9[5], &demangling cache variable for type metadata for URL?);
  *(_QWORD *)((char *)a5 + v9[6]) = a3;
  *(_QWORD *)((char *)a5 + v9[7]) = a4;
  return result;
}

uint64_t type metadata accessor for JournalingSuggestion.StateOfMind(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion.StateOfMind);
}

uint64_t JournalingSuggestion.Video.init(url:date:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return JournalingSuggestion.Video.init(url:date:)(a1, a2, type metadata accessor for JournalingSuggestion.Video, a3);
}

uint64_t type metadata accessor for JournalingSuggestion.Video(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion.Video);
}

uint64_t JournalingSuggestion.Song.init()@<X0>(_OWORD *a1@<X8>)
{
  return JournalingSuggestion.Song.init()(type metadata accessor for JournalingSuggestion.Song, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], a1);
}

uint64_t type metadata accessor for JournalingSuggestion.Song(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion.Song);
}

uint64_t JournalingSuggestion.Workout.Details.init(activityType:activeEnergyBurned:distance:averageHeartRate:date:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t v8;

  *a6 = a1;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  v8 = type metadata accessor for JournalingSuggestion.Workout.Details(0);
  return outlined init with take of JournalingSuggestion.ItemContent?(a5, (uint64_t)a6 + *(int *)(v8 + 32), &demangling cache variable for type metadata for DateInterval?);
}

uint64_t type metadata accessor for JournalingSuggestion.Workout.Details(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion.Workout.Details);
}

uint64_t JournalingSuggestion.Workout.init(details:icon:route:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t result;

  outlined init with take of JournalingSuggestion.ItemContent?(a1, a4, &demangling cache variable for type metadata for JournalingSuggestion.Workout.Details?);
  v7 = type metadata accessor for JournalingSuggestion.Workout(0);
  result = outlined init with take of JournalingSuggestion.ItemContent?(a2, a4 + *(int *)(v7 + 20), &demangling cache variable for type metadata for URL?);
  *(_QWORD *)(a4 + *(int *)(v7 + 24)) = a3;
  return result;
}

uint64_t type metadata accessor for JournalingSuggestion.Workout(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion.Workout);
}

uint64_t JournalingSuggestion.WorkoutGroup.init(workouts:icon:activeEnergyBurned:averageHeartRate:duration:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, _QWORD *a7@<X8>)
{
  int *v13;
  uint64_t result;
  char *v15;

  *a7 = a1;
  v13 = (int *)type metadata accessor for JournalingSuggestion.WorkoutGroup(0);
  result = outlined init with take of JournalingSuggestion.ItemContent?(a2, (uint64_t)a7 + v13[5], &demangling cache variable for type metadata for URL?);
  *(_QWORD *)((char *)a7 + v13[6]) = a3;
  *(_QWORD *)((char *)a7 + v13[7]) = a4;
  v15 = (char *)a7 + v13[8];
  *(_QWORD *)v15 = a5;
  v15[8] = a6 & 1;
  return result;
}

uint64_t type metadata accessor for JournalingSuggestion.WorkoutGroup(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion.WorkoutGroup);
}

uint64_t JournalingSuggestion.MotionActivity.init(icon:steps:date:movementType:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  char v8;
  int *v9;
  uint64_t result;

  v8 = *a4;
  outlined init with take of JournalingSuggestion.ItemContent?(a1, a5, &demangling cache variable for type metadata for URL?);
  v9 = (int *)type metadata accessor for JournalingSuggestion.MotionActivity(0);
  *(_QWORD *)(a5 + v9[5]) = a2;
  result = outlined init with take of JournalingSuggestion.ItemContent?(a3, a5 + v9[6], &demangling cache variable for type metadata for DateInterval?);
  *(_BYTE *)(a5 + v9[7]) = v8;
  return result;
}

uint64_t type metadata accessor for JournalingSuggestion.MotionActivity(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion.MotionActivity);
}

uint64_t JournalingSuggestion.Podcast.init()@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v2 = type metadata accessor for JournalingSuggestion.Podcast(0);
  *a1 = 0u;
  a1[1] = 0u;
  v3 = (char *)a1 + *(int *)(v2 + 24);
  v4 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = (char *)a1 + *(int *)(v2 + 28);
  v6 = type metadata accessor for Date();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
}

uint64_t type metadata accessor for JournalingSuggestion.Podcast(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion.Podcast);
}

uint64_t JournalingSuggestion.ItemContent.init(id:representations:content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t result;

  v8 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a4, a1, v8);
  result = type metadata accessor for JournalingSuggestion.ItemContent(0);
  *(_QWORD *)(a4 + *(int *)(result + 20)) = a2;
  *(_QWORD *)(a4 + *(int *)(result + 24)) = a3;
  return result;
}

uint64_t type metadata accessor for JournalingSuggestion.ItemContent(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion.ItemContent);
}

uint64_t JournalingSuggestion.ItemContent.getContentProviderOfType<A>(assetType:for:inside:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21[2];

  if (!(*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(a5 + 16))(a2, a3, a4, a5))
  {
    v7 = _typeName(_:qualified:)();
    v9 = v8;
    v10 = objc_msgSend(a2, sel_assetType);
    v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v13 = v12;

    v21[1] = 0xE000000000000000;
    objc_msgSend(a2, sel_content);
    _print_unlocked<A, B>(_:_:)();
    swift_unknownObjectRelease();
    if (one-time initialization token for bridge != -1)
      swift_once();
    v14 = type metadata accessor for Logger();
    __swift_project_value_buffer(v14, (uint64_t)static Logger.bridge);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15 = Logger.logObject.getter();
    v16 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = swift_slowAlloc();
      v20 = v11;
      v18 = swift_slowAlloc();
      v21[0] = v18;
      *(_DWORD *)v17 = 136315650;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v7, v9, v21);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v17 + 12) = 2080;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v20, v13, v21);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v17 + 22) = 2080;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0, 0xE000000000000000, v21);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_233A5C000, v15, v16, "No asset '%s' loader available for '%s' content class type '%s'", (uint8_t *)v17, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x23493AEA8](v18, -1, -1);
      MEMORY[0x23493AEA8](v17, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  return a1;
}

Swift::Void __swiftcall JournalingSuggestion.ItemContent.appendAssetContent(_:)(Swift::OpaquePointer a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;

  v2 = *((_QWORD *)a1._rawValue + 2);
  if (v2)
  {
    v4 = type metadata accessor for JournalingSuggestion.ItemContent(0);
    v19 = *(int *)(v4 + 20);
    v20 = *(int *)(v4 + 24);
    v5 = *(_QWORD **)(v1 + v20);
    v21 = v1;
    v6 = *(_QWORD **)(v1 + v19);
    swift_bridgeObjectRetain();
    v7 = (uint64_t *)((char *)a1._rawValue + 72);
    do
    {
      v22 = *(_OWORD *)(v7 - 5);
      v8 = *(v7 - 3);
      v9 = *(v7 - 2);
      v10 = *(v7 - 1);
      v11 = *v7;
      swift_retain_n();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v5[2] + 1, 1, v5);
      v13 = v5[2];
      v12 = v5[3];
      if (v13 >= v12 >> 1)
        v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v12 > 1), v13 + 1, 1, v5);
      v5[2] = v13 + 1;
      v14 = &v5[4 * v13];
      *((_OWORD *)v14 + 2) = v22;
      v14[6] = v8;
      v14[7] = v9;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v6 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v6[2] + 1, 1, v6, &demangling cache variable for type metadata for _ContiguousArrayStorage<JournalingSuggestionAsset.Type>);
      v16 = v6[2];
      v15 = v6[3];
      if (v16 >= v15 >> 1)
        v6 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v15 > 1), v16 + 1, 1, v6, &demangling cache variable for type metadata for _ContiguousArrayStorage<JournalingSuggestionAsset.Type>);
      v17 = *(_QWORD *)(v11 + 8);
      v6[2] = v16 + 1;
      v18 = &v6[2 * v16];
      v18[4] = v10;
      v18[5] = v17;
      swift_release();
      v7 += 6;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v21 + v19) = v6;
    *(_QWORD *)(v21 + v20) = v5;
  }
}

uint64_t _sScG7addTask8priority9operationyScPSg_xyYaYAcntF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD v22[4];
  _QWORD v23[4];

  v5 = v4;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of URL?(a1, (uint64_t)v12, &demangling cache variable for type metadata for TaskPriority?);
  v13 = type metadata accessor for TaskPriority();
  v14 = *(_QWORD *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    outlined destroy of TaskPriority?((uint64_t)v12);
    if (*(_QWORD *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v15 = dispatch thunk of Actor.unownedExecutor.getter();
      v17 = v16;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v13);
    if (*(_QWORD *)(a3 + 16))
      goto LABEL_3;
  }
  v15 = 0;
  v17 = 0;
LABEL_6:
  v18 = *v5;
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = *(_QWORD *)(a4 + 16);
  v19[3] = a2;
  v19[4] = a3;
  v20 = (_QWORD *)(v17 | v15);
  if (v17 | v15)
  {
    v23[0] = 0;
    v23[1] = 0;
    v20 = v23;
    v23[2] = v15;
    v23[3] = v17;
  }
  v22[1] = 1;
  v22[2] = v20;
  v22[3] = v18;
  swift_task_create();
  return swift_release();
}

uint64_t JournalingSuggestion.init(items:title:date:suggestionIdentifier:suggestionHashValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  int *v11;
  char *v12;
  uint64_t v13;
  uint64_t result;

  *a7 = a1;
  a7[1] = a2;
  a7[2] = a3;
  v11 = (int *)type metadata accessor for JournalingSuggestion(0);
  outlined init with take of JournalingSuggestion.ItemContent?(a4, (uint64_t)a7 + v11[6], &demangling cache variable for type metadata for DateInterval?);
  v12 = (char *)a7 + v11[7];
  v13 = type metadata accessor for UUID();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v12, a5, v13);
  *(_QWORD *)((char *)a7 + v11[8]) = a6;
  return result;
}

uint64_t JournalingSuggestion.Location.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = type metadata accessor for JournalingSuggestion.Location(0);
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = 0;
  v3 = a1 + *(int *)(v2 + 28);
  v4 = type metadata accessor for Date();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
}

JournalingSuggestions::JournalingSuggestion::LocationGroup __swiftcall JournalingSuggestion.LocationGroup.init(locations:)(JournalingSuggestions::JournalingSuggestion::LocationGroup locations)
{
  JournalingSuggestions::JournalingSuggestion::LocationGroup *v1;

  v1->locations._rawValue = locations.locations._rawValue;
  return locations;
}

uint64_t JournalingSuggestion.GenericMedia.init()@<X0>(_OWORD *a1@<X8>)
{
  return JournalingSuggestion.Song.init()(type metadata accessor for JournalingSuggestion.GenericMedia, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], a1);
}

uint64_t JournalingSuggestion.Song.init()@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t (*a3)(_QWORD)@<X2>, _OWORD *a4@<X8>)
{
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;

  v7 = a1(0);
  *a4 = 0u;
  a4[1] = 0u;
  a4[2] = 0u;
  v8 = (char *)a4 + *(int *)(v7 + 28);
  v9 = a2(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v10 = (char *)a4 + *(int *)(v7 + 32);
  v11 = a3(0);
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
}

uint64_t JournalingSuggestion.Reflection.init(prompt:color:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

uint64_t JournalingSuggestion.Photo.init(photo:date:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return JournalingSuggestion.Video.init(url:date:)(a1, a2, type metadata accessor for JournalingSuggestion.Photo, a3);
}

uint64_t JournalingSuggestion.Video.init(url:date:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(_QWORD)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;

  v8 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a4, a1, v8);
  v9 = a3(0);
  return outlined init with take of JournalingSuggestion.ItemContent?(a2, a4 + *(int *)(v9 + 20), &demangling cache variable for type metadata for Date?);
}

uint64_t JournalingSuggestion.LivePhoto.init(image:video:date:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v8 = type metadata accessor for URL();
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32);
  v9(a4, a1, v8);
  v10 = type metadata accessor for JournalingSuggestion.LivePhoto(0);
  v9(a4 + *(int *)(v10 + 20), a2, v8);
  return outlined init with take of JournalingSuggestion.ItemContent?(a3, a4 + *(int *)(v10 + 24), &demangling cache variable for type metadata for Date?);
}

uint64_t JournalingSuggestion.Workout.Details.activityType.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t JournalingSuggestion.Workout.Details.activityType.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*JournalingSuggestion.Workout.Details.activityType.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

void *JournalingSuggestion.Workout.Details.activeEnergyBurned.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 8);
  v2 = v1;
  return v1;
}

void JournalingSuggestion.Workout.Details.activeEnergyBurned.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = a1;
}

uint64_t (*JournalingSuggestion.Workout.Details.activeEnergyBurned.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

void *JournalingSuggestion.Workout.Details.distance.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 16);
  v2 = v1;
  return v1;
}

void JournalingSuggestion.Workout.Details.distance.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
}

uint64_t (*JournalingSuggestion.Workout.Details.distance.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

void *JournalingSuggestion.Workout.Details.averageHeartRate.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 24);
  v2 = v1;
  return v1;
}

void JournalingSuggestion.Workout.Details.averageHeartRate.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
}

uint64_t (*JournalingSuggestion.Workout.Details.averageHeartRate.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Workout.Details.date.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Workout.Details.date.getter(type metadata accessor for JournalingSuggestion.Workout.Details, &demangling cache variable for type metadata for DateInterval?, a1);
}

uint64_t JournalingSuggestion.Workout.Details.date.setter(uint64_t a1)
{
  return JournalingSuggestion.Workout.Details.date.setter(a1, type metadata accessor for JournalingSuggestion.Workout.Details, &demangling cache variable for type metadata for DateInterval?);
}

uint64_t (*JournalingSuggestion.Workout.Details.date.modify())()
{
  type metadata accessor for JournalingSuggestion.Workout.Details(0);
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Workout.details.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of URL?(v1, a1, &demangling cache variable for type metadata for JournalingSuggestion.Workout.Details?);
}

uint64_t JournalingSuggestion.Workout.details.setter(uint64_t a1)
{
  uint64_t v1;

  return outlined assign with take of URL?(a1, v1, &demangling cache variable for type metadata for JournalingSuggestion.Workout.Details?);
}

uint64_t (*JournalingSuggestion.Workout.details.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Workout.icon.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Workout.icon.getter(type metadata accessor for JournalingSuggestion.Workout, &demangling cache variable for type metadata for URL?, a1);
}

uint64_t JournalingSuggestion.Workout.icon.setter(uint64_t a1)
{
  return JournalingSuggestion.Workout.icon.setter(a1, type metadata accessor for JournalingSuggestion.Workout, &demangling cache variable for type metadata for URL?);
}

uint64_t (*JournalingSuggestion.Workout.icon.modify())()
{
  type metadata accessor for JournalingSuggestion.Workout(0);
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Workout.route.getter()
{
  return JournalingSuggestion.Workout.route.getter((void (*)(_QWORD))type metadata accessor for JournalingSuggestion.Workout);
}

uint64_t JournalingSuggestion.Workout.route.setter(uint64_t a1)
{
  return JournalingSuggestion.Workout.route.setter(a1, type metadata accessor for JournalingSuggestion.Workout);
}

uint64_t (*JournalingSuggestion.Workout.route.modify())()
{
  type metadata accessor for JournalingSuggestion.Workout(0);
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Workout.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v2 = type metadata accessor for JournalingSuggestion.Workout.Details(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 1, 1, v2);
  v3 = type metadata accessor for JournalingSuggestion.Workout(0);
  v4 = a1 + *(int *)(v3 + 20);
  v5 = type metadata accessor for URL();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *(_QWORD *)(a1 + *(int *)(v3 + 24)) = 0;
  return result;
}

uint64_t JournalingSuggestion.WorkoutGroup.workouts.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t JournalingSuggestion.WorkoutGroup.workouts.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*JournalingSuggestion.WorkoutGroup.workouts.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.WorkoutGroup.icon.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Workout.icon.getter(type metadata accessor for JournalingSuggestion.WorkoutGroup, &demangling cache variable for type metadata for URL?, a1);
}

uint64_t JournalingSuggestion.Workout.icon.getter@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;

  v6 = a1(0);
  return outlined init with copy of URL?(v3 + *(int *)(v6 + 20), a3, a2);
}

uint64_t JournalingSuggestion.WorkoutGroup.icon.setter(uint64_t a1)
{
  return JournalingSuggestion.Workout.icon.setter(a1, type metadata accessor for JournalingSuggestion.WorkoutGroup, &demangling cache variable for type metadata for URL?);
}

uint64_t JournalingSuggestion.Workout.icon.setter(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t *a3)
{
  uint64_t v3;
  uint64_t v6;

  v6 = a2(0);
  return outlined assign with take of URL?(a1, v3 + *(int *)(v6 + 20), a3);
}

uint64_t (*JournalingSuggestion.WorkoutGroup.icon.modify())()
{
  type metadata accessor for JournalingSuggestion.WorkoutGroup(0);
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

void *JournalingSuggestion.WorkoutGroup.activeEnergyBurned.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + *(int *)(type metadata accessor for JournalingSuggestion.WorkoutGroup(0) + 24));
  v2 = v1;
  return v1;
}

void JournalingSuggestion.WorkoutGroup.activeEnergyBurned.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(int *)(type metadata accessor for JournalingSuggestion.WorkoutGroup(0) + 24);

  *(_QWORD *)(v1 + v3) = a1;
}

uint64_t (*JournalingSuggestion.WorkoutGroup.activeEnergyBurned.modify())()
{
  type metadata accessor for JournalingSuggestion.WorkoutGroup(0);
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

void *JournalingSuggestion.WorkoutGroup.averageHeartRate.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + *(int *)(type metadata accessor for JournalingSuggestion.WorkoutGroup(0) + 28));
  v2 = v1;
  return v1;
}

void JournalingSuggestion.WorkoutGroup.averageHeartRate.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(int *)(type metadata accessor for JournalingSuggestion.WorkoutGroup(0) + 28);

  *(_QWORD *)(v1 + v3) = a1;
}

uint64_t (*JournalingSuggestion.WorkoutGroup.averageHeartRate.modify())()
{
  type metadata accessor for JournalingSuggestion.WorkoutGroup(0);
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.WorkoutGroup.duration.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for JournalingSuggestion.WorkoutGroup(0) + 32));
}

uint64_t JournalingSuggestion.WorkoutGroup.duration.setter(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v6;

  result = type metadata accessor for JournalingSuggestion.WorkoutGroup(0);
  v6 = v2 + *(int *)(result + 32);
  *(_QWORD *)v6 = a1;
  *(_BYTE *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*JournalingSuggestion.WorkoutGroup.duration.modify())()
{
  type metadata accessor for JournalingSuggestion.WorkoutGroup(0);
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Contact.name.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t JournalingSuggestion.Contact.name.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*JournalingSuggestion.Contact.name.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Contact.photo.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Workout.icon.getter(type metadata accessor for JournalingSuggestion.Contact, &demangling cache variable for type metadata for URL?, a1);
}

uint64_t JournalingSuggestion.Contact.init(name:photo:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v6;

  *a4 = a1;
  a4[1] = a2;
  v6 = type metadata accessor for JournalingSuggestion.Contact(0);
  return outlined init with take of JournalingSuggestion.ItemContent?(a3, (uint64_t)a4 + *(int *)(v6 + 20), &demangling cache variable for type metadata for URL?);
}

uint64_t (*JournalingSuggestion.Location.place.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t (*JournalingSuggestion.Location.city.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

void *JournalingSuggestion.Location.location.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 32);
  v2 = v1;
  return v1;
}

void JournalingSuggestion.Location.location.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = a1;
}

uint64_t (*JournalingSuggestion.Location.location.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Location.date.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Location.date.getter(type metadata accessor for JournalingSuggestion.Location, &demangling cache variable for type metadata for Date?, a1);
}

uint64_t JournalingSuggestion.Location.date.setter(uint64_t a1)
{
  return JournalingSuggestion.Location.date.setter(a1, type metadata accessor for JournalingSuggestion.Location, &demangling cache variable for type metadata for Date?);
}

uint64_t (*JournalingSuggestion.Location.date.modify())()
{
  type metadata accessor for JournalingSuggestion.Location(0);
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Location.init(place:city:location:date:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  uint64_t v9;

  *a7 = a1;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  a7[4] = a5;
  v9 = type metadata accessor for JournalingSuggestion.Location(0);
  return outlined init with take of JournalingSuggestion.ItemContent?(a6, (uint64_t)a7 + *(int *)(v9 + 28), &demangling cache variable for type metadata for Date?);
}

uint64_t JournalingSuggestion.LocationGroup.locations.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t JournalingSuggestion.LocationGroup.locations.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*JournalingSuggestion.LocationGroup.locations.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t (*JournalingSuggestion.Song.song.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t (*JournalingSuggestion.Song.artist.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t (*JournalingSuggestion.Song.album.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Song.artwork.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Location.date.getter(type metadata accessor for JournalingSuggestion.Song, &demangling cache variable for type metadata for URL?, a1);
}

uint64_t JournalingSuggestion.Location.date.getter@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;

  v6 = a1(0);
  return outlined init with copy of URL?(v3 + *(int *)(v6 + 28), a3, a2);
}

uint64_t JournalingSuggestion.Song.artwork.setter(uint64_t a1)
{
  return JournalingSuggestion.Location.date.setter(a1, type metadata accessor for JournalingSuggestion.Song, &demangling cache variable for type metadata for URL?);
}

uint64_t JournalingSuggestion.Location.date.setter(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t *a3)
{
  uint64_t v3;
  uint64_t v6;

  v6 = a2(0);
  return outlined assign with take of URL?(a1, v3 + *(int *)(v6 + 28), a3);
}

uint64_t (*JournalingSuggestion.Song.artwork.modify())()
{
  type metadata accessor for JournalingSuggestion.Song(0);
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Song.date.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Workout.Details.date.getter(type metadata accessor for JournalingSuggestion.Song, &demangling cache variable for type metadata for Date?, a1);
}

uint64_t JournalingSuggestion.Workout.Details.date.getter@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;

  v6 = a1(0);
  return outlined init with copy of URL?(v3 + *(int *)(v6 + 32), a3, a2);
}

uint64_t JournalingSuggestion.Song.date.setter(uint64_t a1)
{
  return JournalingSuggestion.Workout.Details.date.setter(a1, type metadata accessor for JournalingSuggestion.Song, &demangling cache variable for type metadata for Date?);
}

uint64_t JournalingSuggestion.Workout.Details.date.setter(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t *a3)
{
  uint64_t v3;
  uint64_t v6;

  v6 = a2(0);
  return outlined assign with take of URL?(a1, v3 + *(int *)(v6 + 32), a3);
}

uint64_t (*JournalingSuggestion.Song.date.modify())()
{
  type metadata accessor for JournalingSuggestion.Song(0);
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Song.init(song:artist:album:artwork:date:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>)
{
  return JournalingSuggestion.Song.init(song:artist:album:artwork:date:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, type metadata accessor for JournalingSuggestion.Song, &demangling cache variable for type metadata for URL?, &demangling cache variable for type metadata for Date?);
}

uint64_t (*JournalingSuggestion.Podcast.episode.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t (*JournalingSuggestion.Podcast.show.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Podcast.artwork.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Podcast.artwork.getter(type metadata accessor for JournalingSuggestion.Podcast, &demangling cache variable for type metadata for URL?, a1);
}

uint64_t JournalingSuggestion.Podcast.artwork.setter(uint64_t a1)
{
  return JournalingSuggestion.Podcast.artwork.setter(a1, type metadata accessor for JournalingSuggestion.Podcast, &demangling cache variable for type metadata for URL?);
}

uint64_t (*JournalingSuggestion.Podcast.artwork.modify())()
{
  type metadata accessor for JournalingSuggestion.Podcast(0);
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Podcast.date.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Location.date.getter(type metadata accessor for JournalingSuggestion.Podcast, &demangling cache variable for type metadata for Date?, a1);
}

uint64_t JournalingSuggestion.Podcast.date.setter(uint64_t a1)
{
  return JournalingSuggestion.Location.date.setter(a1, type metadata accessor for JournalingSuggestion.Podcast, &demangling cache variable for type metadata for Date?);
}

uint64_t (*JournalingSuggestion.Podcast.date.modify())()
{
  type metadata accessor for JournalingSuggestion.Podcast(0);
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Podcast.init(episode:show:artwork:date:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  uint64_t v10;

  *a7 = a1;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  v10 = type metadata accessor for JournalingSuggestion.Podcast(0);
  outlined init with take of JournalingSuggestion.ItemContent?(a5, (uint64_t)a7 + *(int *)(v10 + 24), &demangling cache variable for type metadata for URL?);
  return outlined init with take of JournalingSuggestion.ItemContent?(a6, (uint64_t)a7 + *(int *)(v10 + 28), &demangling cache variable for type metadata for Date?);
}

uint64_t JournalingSuggestion.GenericMedia.title.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t JournalingSuggestion.GenericMedia.title.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*JournalingSuggestion.GenericMedia.title.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.GenericMedia.artist.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t JournalingSuggestion.Location.city.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*JournalingSuggestion.GenericMedia.artist.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.GenericMedia.album.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t JournalingSuggestion.Song.album.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

uint64_t (*JournalingSuggestion.GenericMedia.album.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.GenericMedia.date.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Location.date.getter(type metadata accessor for JournalingSuggestion.GenericMedia, &demangling cache variable for type metadata for Date?, a1);
}

uint64_t JournalingSuggestion.GenericMedia.date.setter(uint64_t a1)
{
  return JournalingSuggestion.Location.date.setter(a1, type metadata accessor for JournalingSuggestion.GenericMedia, &demangling cache variable for type metadata for Date?);
}

uint64_t (*JournalingSuggestion.GenericMedia.date.modify())()
{
  type metadata accessor for JournalingSuggestion.GenericMedia(0);
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.GenericMedia.appIcon.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Workout.Details.date.getter(type metadata accessor for JournalingSuggestion.GenericMedia, &demangling cache variable for type metadata for URL?, a1);
}

uint64_t JournalingSuggestion.GenericMedia.appIcon.setter(uint64_t a1)
{
  return JournalingSuggestion.Workout.Details.date.setter(a1, type metadata accessor for JournalingSuggestion.GenericMedia, &demangling cache variable for type metadata for URL?);
}

uint64_t (*JournalingSuggestion.GenericMedia.appIcon.modify())()
{
  type metadata accessor for JournalingSuggestion.GenericMedia(0);
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.GenericMedia.init(title:artist:album:date:appIcon:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>)
{
  return JournalingSuggestion.Song.init(song:artist:album:artwork:date:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, type metadata accessor for JournalingSuggestion.GenericMedia, &demangling cache variable for type metadata for Date?, &demangling cache variable for type metadata for URL?);
}

uint64_t JournalingSuggestion.Song.init(song:artist:album:artwork:date:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, uint64_t (*a10)(_QWORD), uint64_t *a11, uint64_t *a12)
{
  uint64_t v15;

  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  v15 = a10(0);
  outlined init with take of JournalingSuggestion.ItemContent?(a7, (uint64_t)a9 + *(int *)(v15 + 28), a11);
  return outlined init with take of JournalingSuggestion.ItemContent?(a8, (uint64_t)a9 + *(int *)(v15 + 32), a12);
}

uint64_t JournalingSuggestion.Photo.photo.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Photo.photo.getter((uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], a1);
}

uint64_t JournalingSuggestion.Photo.photo.setter(uint64_t a1)
{
  return JournalingSuggestion.Photo.photo.setter(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0]);
}

uint64_t (*JournalingSuggestion.Photo.photo.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Photo.date.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Workout.icon.getter(type metadata accessor for JournalingSuggestion.Photo, &demangling cache variable for type metadata for Date?, a1);
}

uint64_t JournalingSuggestion.Photo.date.setter(uint64_t a1)
{
  return JournalingSuggestion.Workout.icon.setter(a1, type metadata accessor for JournalingSuggestion.Photo, &demangling cache variable for type metadata for Date?);
}

uint64_t (*JournalingSuggestion.Photo.date.modify())()
{
  type metadata accessor for JournalingSuggestion.Photo(0);
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Video.url.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Photo.photo.getter((uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], a1);
}

uint64_t JournalingSuggestion.Video.url.setter(uint64_t a1)
{
  return JournalingSuggestion.Photo.photo.setter(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0]);
}

uint64_t (*JournalingSuggestion.Video.url.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Video.date.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Workout.icon.getter(type metadata accessor for JournalingSuggestion.Video, &demangling cache variable for type metadata for Date?, a1);
}

uint64_t JournalingSuggestion.Video.date.setter(uint64_t a1)
{
  return JournalingSuggestion.Workout.icon.setter(a1, type metadata accessor for JournalingSuggestion.Video, &demangling cache variable for type metadata for Date?);
}

uint64_t (*JournalingSuggestion.Video.date.modify())()
{
  type metadata accessor for JournalingSuggestion.Video(0);
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.LivePhoto.image.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Photo.photo.getter((uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], a1);
}

uint64_t JournalingSuggestion.LivePhoto.image.setter(uint64_t a1)
{
  return JournalingSuggestion.Photo.photo.setter(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0]);
}

uint64_t (*JournalingSuggestion.LivePhoto.image.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.LivePhoto.video.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for JournalingSuggestion.LivePhoto(0) + 20);
  v4 = type metadata accessor for URL();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t JournalingSuggestion.LivePhoto.video.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for JournalingSuggestion.LivePhoto(0) + 20);
  v4 = type metadata accessor for URL();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*JournalingSuggestion.LivePhoto.video.modify())()
{
  type metadata accessor for JournalingSuggestion.LivePhoto(0);
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.LivePhoto.date.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Podcast.artwork.getter(type metadata accessor for JournalingSuggestion.LivePhoto, &demangling cache variable for type metadata for Date?, a1);
}

uint64_t JournalingSuggestion.Podcast.artwork.getter@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;

  v6 = a1(0);
  return outlined init with copy of URL?(v3 + *(int *)(v6 + 24), a3, a2);
}

uint64_t JournalingSuggestion.LivePhoto.date.setter(uint64_t a1)
{
  return JournalingSuggestion.Podcast.artwork.setter(a1, type metadata accessor for JournalingSuggestion.LivePhoto, &demangling cache variable for type metadata for Date?);
}

uint64_t JournalingSuggestion.Podcast.artwork.setter(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t *a3)
{
  uint64_t v3;
  uint64_t v6;

  v6 = a2(0);
  return outlined assign with take of URL?(a1, v3 + *(int *)(v6 + 24), a3);
}

uint64_t (*JournalingSuggestion.LivePhoto.date.modify())()
{
  type metadata accessor for JournalingSuggestion.LivePhoto(0);
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.MotionActivity.icon.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of URL?(v1, a1, &demangling cache variable for type metadata for URL?);
}

uint64_t JournalingSuggestion.MotionActivity.icon.setter(uint64_t a1)
{
  uint64_t v1;

  return outlined assign with take of URL?(a1, v1, &demangling cache variable for type metadata for URL?);
}

uint64_t (*JournalingSuggestion.MotionActivity.icon.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.MotionActivity.steps.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for JournalingSuggestion.MotionActivity(0) + 20));
}

uint64_t JournalingSuggestion.MotionActivity.steps.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for JournalingSuggestion.MotionActivity(0);
  *(_QWORD *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*JournalingSuggestion.MotionActivity.steps.modify())()
{
  type metadata accessor for JournalingSuggestion.MotionActivity(0);
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.MotionActivity.date.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Podcast.artwork.getter(type metadata accessor for JournalingSuggestion.MotionActivity, &demangling cache variable for type metadata for DateInterval?, a1);
}

uint64_t JournalingSuggestion.MotionActivity.date.setter(uint64_t a1)
{
  return JournalingSuggestion.Podcast.artwork.setter(a1, type metadata accessor for JournalingSuggestion.MotionActivity, &demangling cache variable for type metadata for DateInterval?);
}

uint64_t (*JournalingSuggestion.MotionActivity.date.modify())()
{
  type metadata accessor for JournalingSuggestion.MotionActivity(0);
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

void static JournalingSuggestion.MotionActivity.MovementType.running.getter(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

void static JournalingSuggestion.MotionActivity.MovementType.walking.getter(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

void static JournalingSuggestion.MotionActivity.MovementType.runningWalking.getter(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys.stringValue.getter(char a1)
{
  return *(_QWORD *)&aRunning_0[8 * a1];
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys()
{
  char *v0;

  return JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys()
{
  lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys()
{
  lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.encode(to:)(_QWORD *a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  char v25;
  char v26;
  char v27;

  v24 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys>);
  v21 = *(_QWORD *)(v3 - 8);
  v22 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v20 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys>);
  v18 = *(_QWORD *)(v5 - 8);
  v19 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys>);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys>);
  v23 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  if ((_BYTE)v24)
  {
    if (v24 == 1)
    {
      v26 = 1;
      lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys();
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      (*(void (**)(char *, uint64_t))(v18 + 8))(v7, v19);
    }
    else
    {
      v27 = 2;
      lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys();
      v15 = v20;
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v15, v22);
    }
  }
  else
  {
    v25 = 0;
    lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v14, v12);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys()
{
  return 0;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys()
{
  lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys()
{
  lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys()
{
  lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys()
{
  lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys()
{
  lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys()
{
  lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys();
  return CodingKey.debugDescription.getter();
}

_QWORD *protocol witness for Decodable.init(from:) in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = specialized JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.init(from:)(a1);
  if (!v2)
    *a2 = (_BYTE)result;
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl(_QWORD *a1)
{
  unsigned __int8 *v1;

  return JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.encode(to:)(a1, *v1);
}

BOOL static JournalingSuggestion.MotionActivity.MovementType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void JournalingSuggestion.MotionActivity.MovementType.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys()
{
  return 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys()
{
  Hasher._combine(_:)(0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized JournalingSuggestion.MotionActivity.MovementType.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys()
{
  lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys()
{
  lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t JournalingSuggestion.MotionActivity.MovementType.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char v7;
  uint64_t v9;
  char v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<JournalingSuggestion.MotionActivity.MovementType.CodingKeys>);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v10 = v7;
  lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

Swift::Int JournalingSuggestion.MotionActivity.MovementType.hashValue.getter()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t JournalingSuggestion.MotionActivity.MovementType.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  char v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<JournalingSuggestion.MotionActivity.MovementType.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v11;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t protocol witness for Decodable.init(from:) in conformance JournalingSuggestion.MotionActivity.MovementType@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return JournalingSuggestion.MotionActivity.MovementType.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance JournalingSuggestion.MotionActivity.MovementType(_QWORD *a1)
{
  return JournalingSuggestion.MotionActivity.MovementType.encode(to:)(a1);
}

uint64_t JournalingSuggestion.MotionActivity.movementType.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for JournalingSuggestion.MotionActivity(0);
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 28));
  return result;
}

uint64_t JournalingSuggestion.MotionActivity.movementType.setter(char *a1)
{
  uint64_t v1;
  char v2;
  uint64_t result;

  v2 = *a1;
  result = type metadata accessor for JournalingSuggestion.MotionActivity(0);
  *(_BYTE *)(v1 + *(int *)(result + 28)) = v2;
  return result;
}

uint64_t (*JournalingSuggestion.MotionActivity.movementType.modify())()
{
  type metadata accessor for JournalingSuggestion.MotionActivity(0);
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

id JournalingSuggestion.StateOfMind.state.getter()
{
  id *v0;

  return *v0;
}

void JournalingSuggestion.StateOfMind.state.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*JournalingSuggestion.StateOfMind.state.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.StateOfMind.icon.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Workout.icon.getter(type metadata accessor for JournalingSuggestion.StateOfMind, &demangling cache variable for type metadata for URL?, a1);
}

uint64_t JournalingSuggestion.StateOfMind.icon.setter(uint64_t a1)
{
  return JournalingSuggestion.Workout.icon.setter(a1, type metadata accessor for JournalingSuggestion.StateOfMind, &demangling cache variable for type metadata for URL?);
}

uint64_t (*JournalingSuggestion.StateOfMind.icon.modify())()
{
  type metadata accessor for JournalingSuggestion.StateOfMind(0);
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.StateOfMind.lightBackground.getter()
{
  return JournalingSuggestion.Workout.route.getter((void (*)(_QWORD))type metadata accessor for JournalingSuggestion.StateOfMind);
}

uint64_t JournalingSuggestion.Workout.route.getter(void (*a1)(_QWORD))
{
  a1(0);
  return swift_bridgeObjectRetain();
}

uint64_t JournalingSuggestion.StateOfMind.lightBackground.setter(uint64_t a1)
{
  return JournalingSuggestion.Workout.route.setter(a1, type metadata accessor for JournalingSuggestion.StateOfMind);
}

uint64_t JournalingSuggestion.Workout.route.setter(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t v4;
  uint64_t result;

  v4 = *(int *)(a2(0) + 24);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + v4) = a1;
  return result;
}

uint64_t (*JournalingSuggestion.StateOfMind.lightBackground.modify())()
{
  type metadata accessor for JournalingSuggestion.StateOfMind(0);
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.StateOfMind.darkBackground.getter()
{
  type metadata accessor for JournalingSuggestion.StateOfMind(0);
  return swift_bridgeObjectRetain();
}

uint64_t JournalingSuggestion.StateOfMind.darkBackground.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for JournalingSuggestion.StateOfMind(0) + 28);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*JournalingSuggestion.StateOfMind.darkBackground.modify())()
{
  type metadata accessor for JournalingSuggestion.StateOfMind(0);
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Reflection.prompt.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t JournalingSuggestion.Reflection.prompt.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*JournalingSuggestion.Reflection.prompt.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Reflection.color.getter()
{
  return swift_retain();
}

uint64_t JournalingSuggestion.Reflection.color.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_release();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*JournalingSuggestion.Reflection.color.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.ItemContent.id.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Photo.photo.getter((uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58], a1);
}

uint64_t JournalingSuggestion.Photo.photo.getter@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = a1(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, v2, v4);
}

uint64_t JournalingSuggestion.ItemContent.id.setter(uint64_t a1)
{
  return JournalingSuggestion.Photo.photo.setter(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58]);
}

uint64_t JournalingSuggestion.Photo.photo.setter(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t v4;

  v4 = a2(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v2, a1, v4);
}

uint64_t (*JournalingSuggestion.ItemContent.id.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.ItemContent.representations.getter()
{
  type metadata accessor for JournalingSuggestion.ItemContent(0);
  return swift_bridgeObjectRetain();
}

uint64_t JournalingSuggestion.ItemContent.representations.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for JournalingSuggestion.ItemContent(0) + 20);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*JournalingSuggestion.ItemContent.representations.modify())()
{
  type metadata accessor for JournalingSuggestion.ItemContent(0);
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

BOOL JournalingSuggestion.ItemContent.hasContent<A>(ofType:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 result;

  v3 = *(_QWORD *)(v1 + *(int *)(type metadata accessor for JournalingSuggestion.ItemContent(0) + 20));
  v4 = *(_QWORD *)(v3 + 16);
  if (!v4)
    return 0;
  v5 = (uint64_t *)(v3 + 32);
  v6 = v4 - 1;
  do
  {
    v7 = *v5;
    v5 += 2;
    result = v7 == a1;
  }
  while (v7 != a1 && v6-- != 0);
  return result;
}

uint64_t JournalingSuggestion.ItemContent.content<A>(forType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v9;

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v9;
  *v9 = v5;
  v9[1] = partial apply for closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:);
  return static JournalingSuggestionAsset.content(forItem:)(a1, v4, a3, a4);
}

uint64_t JournalingSuggestion.ItemContent.content.getter()
{
  type metadata accessor for JournalingSuggestion.ItemContent(0);
  return swift_bridgeObjectRetain();
}

uint64_t JournalingSuggestion.ItemContent.content.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for JournalingSuggestion.ItemContent(0) + 24);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*JournalingSuggestion.ItemContent.content.modify())()
{
  type metadata accessor for JournalingSuggestion.ItemContent(0);
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t protocol witness for Identifiable.id.getter in conformance JournalingSuggestion.ItemContent@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for UUID();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t JournalingSuggestion.content<A>(forType:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return swift_task_switch();
}

uint64_t JournalingSuggestion.content<A>(forType:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  __int128 v6;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 24);
  v6 = *(_OWORD *)(v0 + 32);
  type metadata accessor for Optional();
  type metadata accessor for Array();
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v3;
  *(_OWORD *)(v3 + 16) = v6;
  *(_QWORD *)(v3 + 32) = v1;
  *(_QWORD *)(v3 + 40) = v2;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v4;
  *v4 = v0;
  v4[1] = JournalingSuggestion.content<A>(forType:);
  return withTaskGroup<A, B>(of:returning:isolation:body:)();
}

{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t closure #1 in JournalingSuggestion.content<A>(forType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[8] = a5;
  v6[9] = a6;
  v6[6] = a3;
  v6[7] = a4;
  v6[4] = a1;
  v6[5] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  v6[10] = swift_task_alloc();
  v7 = *(_QWORD *)(type metadata accessor for JournalingSuggestion.ItemContent(0) - 8);
  v6[11] = v7;
  v6[12] = *(_QWORD *)(v7 + 64);
  v6[13] = swift_task_alloc();
  v6[14] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #1 in JournalingSuggestion.content<A>(forType:)()
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 88);
    v4 = *(unsigned __int8 *)(v3 + 80);
    v5 = *(_QWORD *)v1 + ((v4 + 32) & ~v4);
    v6 = *(_QWORD *)(v3 + 72);
    v24 = (v4 + 56) & ~v4;
    swift_bridgeObjectRetain();
    v7 = 0;
    v23 = v6;
    do
    {
      v14 = *(_QWORD *)(v0 + 112);
      outlined init with copy of JournalingSuggestion.ItemContent(v5 + v7 * v6, v14);
      v15 = *(_QWORD *)(v14 + *(int *)(type metadata accessor for JournalingSuggestion.ItemContent(0) + 20));
      v16 = *(_QWORD *)(v15 + 16);
      if (v16)
      {
        v17 = (_QWORD *)(v15 + 32);
        v18 = *(_QWORD *)(v0 + 56);
        while (*v17 != v18)
        {
          v17 += 2;
          if (!--v16)
            goto LABEL_4;
        }
        v9 = *(_QWORD *)(v0 + 104);
        v8 = *(_QWORD *)(v0 + 112);
        v10 = *(_QWORD *)(v0 + 80);
        v11 = type metadata accessor for TaskPriority();
        v25 = *(_OWORD *)(v0 + 64);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
        outlined init with copy of JournalingSuggestion.ItemContent(v8, v9);
        v12 = swift_allocObject();
        *(_QWORD *)(v12 + 16) = 0;
        *(_QWORD *)(v12 + 24) = 0;
        *(_OWORD *)(v12 + 32) = v25;
        *(_QWORD *)(v12 + 48) = v18;
        outlined init with take of JournalingSuggestion.ItemContent(v9, v12 + v24);
        type metadata accessor for Optional();
        v13 = type metadata accessor for TaskGroup();
        v6 = v23;
        _sScG7addTask8priority9operationyScPSg_xyYaYAcntF(v10, (uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in JournalingSuggestion.content<A>(forType:), v12, v13);
        outlined destroy of TaskPriority?(v10);
      }
LABEL_4:
      ++v7;
      outlined destroy of JournalingSuggestionsError(*(_QWORD *)(v0 + 112), type metadata accessor for JournalingSuggestion.ItemContent);
    }
    while (v7 != v2);
    swift_bridgeObjectRelease();
  }
  *(_QWORD *)(v0 + 16) = **(_QWORD **)(v0 + 40);
  v26 = *(_OWORD *)(v0 + 64);
  *(_QWORD *)(v0 + 24) = Array.init()();
  v19 = swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v19;
  *(_OWORD *)(v19 + 16) = v26;
  v20 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v20;
  type metadata accessor for Optional();
  v21 = type metadata accessor for TaskGroup();
  type metadata accessor for Array();
  MEMORY[0x23493AE0C](MEMORY[0x24BEE68C0], v21);
  *v20 = v0;
  v20[1] = closure #1 in JournalingSuggestion.content<A>(forType:);
  return AsyncSequence.reduce<A>(into:_:)();
}

{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t closure #1 in closure #1 in JournalingSuggestion.content<A>(forType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[7] = a6;
  v7[8] = a7;
  v7[5] = a4;
  v7[6] = a5;
  v7[4] = a1;
  v7[9] = type metadata accessor for JournalingSuggestion.ItemContent(0);
  v7[10] = swift_task_alloc();
  v7[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #1 in closure #1 in JournalingSuggestion.content<A>(forType:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v22;

  if (one-time initialization token for assets != -1)
    swift_once();
  v1 = v0[11];
  v2 = v0[6];
  v3 = type metadata accessor for Logger();
  __swift_project_value_buffer(v3, (uint64_t)static Logger.assets);
  outlined init with copy of JournalingSuggestion.ItemContent(v2, v1);
  v4 = Logger.logObject.getter();
  v5 = static os_log_type_t.debug.getter();
  v6 = os_log_type_enabled(v4, v5);
  v7 = v0[11];
  if (v6)
  {
    v8 = v0[10];
    v9 = swift_slowAlloc();
    v10 = swift_slowAlloc();
    v22 = v10;
    *(_DWORD *)v9 = 136315394;
    v11 = _typeName(_:qualified:)();
    v0[2] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v11, v12, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    outlined init with copy of JournalingSuggestion.ItemContent(v7, v8);
    v13 = String.init<A>(describing:)();
    v0[3] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v14, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    outlined destroy of JournalingSuggestionsError(v7, type metadata accessor for JournalingSuggestion.ItemContent);
    _os_log_impl(&dword_233A5C000, v4, v5, "Loading content %s for item %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23493AEA8](v10, -1, -1);
    MEMORY[0x23493AEA8](v9, -1, -1);
  }
  else
  {
    outlined destroy of JournalingSuggestionsError(v0[11], type metadata accessor for JournalingSuggestion.ItemContent);
  }

  v15 = (_QWORD *)swift_task_alloc();
  v0[12] = v15;
  *v15 = v0;
  v15[1] = closure #1 in closure #1 in JournalingSuggestion.content<A>(forType:);
  v17 = v0[7];
  v16 = v0[8];
  v18 = v0[6];
  v19 = v0[4];
  v20 = (_QWORD *)swift_task_alloc();
  v15[2] = v20;
  *v20 = v15;
  v20[1] = partial apply for closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:);
  return static JournalingSuggestionAsset.content(forItem:)(v19, v18, v17, v16);
}

{
  void *v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {

    return swift_task_switch();
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v2 + 8))();
  }
}

{
  uint64_t v0;

  (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 56) - 8) + 56))(*(_QWORD *)(v0 + 32), 1, 1);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t closure #2 in closure #1 in JournalingSuggestion.content<A>(forType:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v5;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v5 = type metadata accessor for Optional();
  v3[5] = v5;
  v3[6] = *(_QWORD *)(v5 - 8);
  v3[7] = swift_task_alloc();
  v3[8] = *(_QWORD *)(a3 - 8);
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #2 in closure #1 in JournalingSuggestion.content<A>(forType:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(v0 + 64);
  v3 = (_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 56);
  v4 = v0 + 48;
  v5 = (_QWORD *)(v0 + 40);
  v6 = *(_QWORD *)(v0 + 32);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 48) + 16))(v2, *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 40));
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v2, 1, v6) != 1)
  {
    v3 = (_QWORD *)(v0 + 80);
    v7 = *(_QWORD *)(v0 + 80);
    v9 = *(_QWORD *)(v0 + 64);
    v8 = *(_QWORD *)(v0 + 72);
    v10 = *(_QWORD *)(v0 + 32);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v9 + 32))(v7, *(_QWORD *)(v0 + 56), v10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v8, v7, v10);
    type metadata accessor for Array();
    Array.append(_:)();
    v4 = v0 + 64;
    v5 = (_QWORD *)(v0 + 32);
  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)v4 + 8))(*v3, *v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t JournalingSuggestion.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t JournalingSuggestion.date.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Podcast.artwork.getter(type metadata accessor for JournalingSuggestion, &demangling cache variable for type metadata for DateInterval?, a1);
}

uint64_t JournalingSuggestion.suggestionIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for JournalingSuggestion(0) + 28);
  v4 = type metadata accessor for UUID();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t JournalingSuggestion.suggestionHashValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for JournalingSuggestion(0) + 32));
}

Swift::Int JournalingSuggestion.hashValue.getter()
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
  uint64_t v10;

  v1 = type metadata accessor for DateInterval();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  Hasher.init(_seed:)();
  v8 = type metadata accessor for JournalingSuggestion(0);
  type metadata accessor for UUID();
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  dispatch thunk of Hashable.hash(into:)();
  Hasher._combine(_:)(*(_QWORD *)(v0 + *(int *)(v8 + 32)));
  outlined init with copy of URL?(v0 + *(int *)(v8 + 24), (uint64_t)v7, &demangling cache variable for type metadata for DateInterval?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1) == 1)
  {
    Hasher._combine(_:)(0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v7, v1);
    Hasher._combine(_:)(1u);
    lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type DateInterval and conformance DateInterval, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], MEMORY[0x24BDCB890]);
    dispatch thunk of Hashable.hash(into:)();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance JournalingSuggestion()
{
  Swift::Int v0;

  v0 = JournalingSuggestion.hashValue.getter();
  return v0 == JournalingSuggestion.hashValue.getter();
}

BOOL static JournalingSuggestion.== infix(_:_:)()
{
  Swift::Int v0;

  v0 = JournalingSuggestion.hashValue.getter();
  return v0 == JournalingSuggestion.hashValue.getter();
}

void JournalingSuggestion.hash(into:)()
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

  v1 = type metadata accessor for DateInterval();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for JournalingSuggestion(0);
  type metadata accessor for UUID();
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  dispatch thunk of Hashable.hash(into:)();
  Hasher._combine(_:)(*(_QWORD *)(v0 + *(int *)(v8 + 32)));
  outlined init with copy of URL?(v0 + *(int *)(v8 + 24), (uint64_t)v7, &demangling cache variable for type metadata for DateInterval?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1) == 1)
  {
    Hasher._combine(_:)(0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v7, v1);
    Hasher._combine(_:)(1u);
    lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type DateInterval and conformance DateInterval, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], MEMORY[0x24BDCB890]);
    dispatch thunk of Hashable.hash(into:)();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance JournalingSuggestion(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;

  v4 = type metadata accessor for DateInterval();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  Hasher.init(_seed:)();
  type metadata accessor for UUID();
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  dispatch thunk of Hashable.hash(into:)();
  Hasher._combine(_:)(*(_QWORD *)(v2 + *(int *)(a2 + 32)));
  outlined init with copy of URL?(v2 + *(int *)(a2 + 24), (uint64_t)v10, &demangling cache variable for type metadata for DateInterval?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1)
  {
    Hasher._combine(_:)(0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v4);
    Hasher._combine(_:)(1u);
    lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type DateInterval and conformance DateInterval, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], MEMORY[0x24BDCB890]);
    dispatch thunk of Hashable.hash(into:)();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return Hasher._finalize()();
}

void JournalingSuggestion.ItemContent.appendContentOfType<A>(assetType:for:inside:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38[2];

  v6 = v5;
  v10 = (*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(a5 + 16))(a2, a3, a4, a5);
  if (v10)
  {
    v12 = v10;
    v13 = v11;
    v14 = type metadata accessor for JournalingSuggestion.ItemContent(0);
    v15 = *(int *)(v14 + 24);
    v16 = *(_QWORD **)(v6 + v15);
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v16 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v16[2] + 1, 1, v16);
    v18 = v16[2];
    v17 = v16[3];
    if (v18 >= v17 >> 1)
      v16 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v17 > 1), v18 + 1, 1, v16);
    v16[2] = v18 + 1;
    v19 = &v16[4 * v18];
    v19[4] = a1;
    v19[5] = a5;
    v19[6] = v12;
    v19[7] = v13;
    *(_QWORD *)(v6 + v15) = v16;
    v20 = *(int *)(v14 + 20);
    v21 = *(_QWORD **)(v6 + v20);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v21 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v21[2] + 1, 1, v21, &demangling cache variable for type metadata for _ContiguousArrayStorage<JournalingSuggestionAsset.Type>);
    v23 = v21[2];
    v22 = v21[3];
    if (v23 >= v22 >> 1)
      v21 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v22 > 1), v23 + 1, 1, v21, &demangling cache variable for type metadata for _ContiguousArrayStorage<JournalingSuggestionAsset.Type>);
    v24 = *(_QWORD *)(a5 + 8);
    v21[2] = v23 + 1;
    v25 = &v21[2 * v23];
    v25[4] = a1;
    v25[5] = v24;
    outlined consume of (@escaping @callee_guaranteed (@guaranteed @escaping @callee_guaranteed (@in_guaranteed JournalingSuggestionAsset?, @guaranteed Error?) -> ()) -> ())?(v12);
    *(_QWORD *)(v6 + v20) = v21;
  }
  else
  {
    v26 = _typeName(_:qualified:)();
    v28 = v27;
    v29 = objc_msgSend(a2, sel_assetType);
    v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v32 = v31;

    v38[1] = 0xE000000000000000;
    objc_msgSend(a2, sel_content);
    _print_unlocked<A, B>(_:_:)();
    swift_unknownObjectRelease();
    if (one-time initialization token for bridge != -1)
      swift_once();
    v33 = type metadata accessor for Logger();
    __swift_project_value_buffer(v33, (uint64_t)static Logger.bridge);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v34 = Logger.logObject.getter();
    v35 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = swift_slowAlloc();
      v37 = swift_slowAlloc();
      v38[0] = v37;
      *(_DWORD *)v36 = 136315650;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v26, v28, v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v36 + 12) = 2080;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v32, v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v36 + 22) = 2080;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0, 0xE000000000000000, v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_233A5C000, v34, v35, "No asset '%s' loader available for '%s' content class type '%s'", (uint8_t *)v36, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x23493AEA8](v37, -1, -1);
      MEMORY[0x23493AEA8](v36, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
  }
}

_QWORD *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, a4, &demangling cache variable for type metadata for _ContiguousArrayStorage<HKStateOfMindAssociation>);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, a4, &demangling cache variable for type metadata for _ContiguousArrayStorage<HKStateOfMindLabel>);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, a4, &demangling cache variable for type metadata for _ContiguousArrayStorage<InternalAssetProvider.Type>);
}

_QWORD *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5)
{
  char v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v6 = (char)result;
  if ((a3 & 1) == 0)
  {
    v8 = a2;
    goto LABEL_8;
  }
  v7 = a4[3];
  v8 = v7 >> 1;
  if ((uint64_t)(v7 >> 1) >= a2)
    goto LABEL_8;
  if (v8 + 0x4000000000000000 >= 0)
  {
    v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v8 = a2;
LABEL_8:
    v9 = a4[2];
    if (v8 <= v9)
      v10 = a4[2];
    else
      v10 = v8;
    if (v10)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      v11 = (_QWORD *)swift_allocObject();
      v12 = _swift_stdlib_malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 25;
      v11[2] = v9;
      v11[3] = 2 * (v13 >> 3);
      v14 = v11 + 4;
      if ((v6 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v14 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[v9 + 4])
          memmove(v14, a4 + 4, 8 * v9);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v9, (char *)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v11;
  }
  __break(1u);
  return result;
}

{
  char v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v6 = (char)result;
  if ((a3 & 1) == 0)
  {
    v8 = a2;
    goto LABEL_8;
  }
  v7 = a4[3];
  v8 = v7 >> 1;
  if ((uint64_t)(v7 >> 1) >= a2)
    goto LABEL_8;
  if (v8 + 0x4000000000000000 >= 0)
  {
    v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v8 = a2;
LABEL_8:
    v9 = a4[2];
    if (v8 <= v9)
      v10 = a4[2];
    else
      v10 = v8;
    if (v10)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      v11 = (_QWORD *)swift_allocObject();
      v12 = _swift_stdlib_malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 17;
      v11[2] = v9;
      v11[3] = 2 * (v13 >> 4);
      v14 = v11 + 4;
      if ((v6 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v14 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[2 * v9 + 4])
          memmove(v14, a4 + 4, 16 * v9);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v9, (char *)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, unint64_t a4)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, a4, &demangling cache variable for type metadata for _ContiguousArrayStorage<JournalingSuggestion.Workout>, type metadata accessor for JournalingSuggestion.Workout);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, a4, &demangling cache variable for type metadata for _ContiguousArrayStorage<JournalingSuggestion.ItemContent>, type metadata accessor for JournalingSuggestion.ItemContent);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, a4, &demangling cache variable for type metadata for _ContiguousArrayStorage<JournalingSuggestion.Location>, type metadata accessor for JournalingSuggestion.Location);
}

_QWORD *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InternalAssetContent.AssetProvider>);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 1;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
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
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4])
          memmove(v13, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

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
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(assetProvider: InternalAssetContent.AssetProvider, assetType: InternalAssetProvider.Type)>);
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
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
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
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_29:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v16 + v20;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v16 < a4 || v21 >= a4 + v20 + *(_QWORD *)(v19 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

uint64_t type metadata accessor for JournalingSuggestion(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion);
}

uint64_t type metadata accessor for JournalingSuggestion.Location(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion.Location);
}

uint64_t type metadata accessor for JournalingSuggestion.GenericMedia(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion.GenericMedia);
}

uint64_t type metadata accessor for JournalingSuggestion.Photo(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion.Photo);
}

uint64_t type metadata accessor for JournalingSuggestion.LivePhoto(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion.LivePhoto);
}

uint64_t type metadata accessor for JournalingSuggestion.Contact(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion.Contact);
}

uint64_t type metadata accessor for JournalingSuggestion.StateOfMind(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys)
  {
    result = MEMORY[0x23493AE0C](&protocol conformance descriptor for JournalingSuggestion.MotionActivity.MovementType.CodingKeys, &unk_2504CF810);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys)
  {
    result = MEMORY[0x23493AE0C](&protocol conformance descriptor for JournalingSuggestion.MotionActivity.MovementType.CodingKeys, &unk_2504CF810);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys)
  {
    result = MEMORY[0x23493AE0C](&protocol conformance descriptor for JournalingSuggestion.MotionActivity.MovementType.CodingKeys, &unk_2504CF810);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys)
  {
    result = MEMORY[0x23493AE0C](&protocol conformance descriptor for JournalingSuggestion.MotionActivity.MovementType.CodingKeys, &unk_2504CF810);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl)
  {
    result = MEMORY[0x23493AE0C](&protocol conformance descriptor for JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl, &unk_2504CF780);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl)
  {
    result = MEMORY[0x23493AE0C](&protocol conformance descriptor for JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl, &unk_2504CF780);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl)
  {
    result = MEMORY[0x23493AE0C](&protocol conformance descriptor for JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl, &unk_2504CF780);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl);
  }
  return result;
}

uint64_t partial apply for closure #1 in JournalingSuggestion.content<A>(forType:)(uint64_t a1, uint64_t a2)
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
  v9 = v2[4];
  v8 = v2[5];
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v10;
  *v10 = v3;
  v10[1] = partial apply for closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:);
  return closure #1 in JournalingSuggestion.content<A>(forType:)(a1, a2, v9, v8, v6, v7);
}

uint64_t outlined consume of (@escaping @callee_guaranteed (@guaranteed @escaping @callee_guaranteed (@in_guaranteed JournalingSuggestionAsset?, @guaranteed Error?) -> ()) -> ())?(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.Workout.Details()
{
  return &protocol witness table for JournalingSuggestion.Workout.Details;
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.Workout()
{
  return &protocol witness table for JournalingSuggestion.Workout;
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.WorkoutGroup()
{
  return &protocol witness table for JournalingSuggestion.WorkoutGroup;
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.Contact()
{
  return &protocol witness table for JournalingSuggestion.Contact;
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.Location()
{
  return &protocol witness table for JournalingSuggestion.Location;
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.LocationGroup()
{
  return &protocol witness table for JournalingSuggestion.LocationGroup;
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.Song()
{
  return &protocol witness table for JournalingSuggestion.Song;
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.Podcast()
{
  return &protocol witness table for JournalingSuggestion.Podcast;
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.GenericMedia()
{
  return &protocol witness table for JournalingSuggestion.GenericMedia;
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.Photo()
{
  return &protocol witness table for JournalingSuggestion.Photo;
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.Video()
{
  return &protocol witness table for JournalingSuggestion.Video;
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.LivePhoto()
{
  return &protocol witness table for JournalingSuggestion.LivePhoto;
}

unint64_t lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType and conformance JournalingSuggestion.MotionActivity.MovementType()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType and conformance JournalingSuggestion.MotionActivity.MovementType;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType and conformance JournalingSuggestion.MotionActivity.MovementType)
  {
    result = MEMORY[0x23493AE0C](&protocol conformance descriptor for JournalingSuggestion.MotionActivity.MovementType, &type metadata for JournalingSuggestion.MotionActivity.MovementType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType and conformance JournalingSuggestion.MotionActivity.MovementType);
  }
  return result;
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.MotionActivity()
{
  return &protocol witness table for JournalingSuggestion.MotionActivity;
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.StateOfMind()
{
  return &protocol witness table for JournalingSuggestion.StateOfMind;
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.Reflection()
{
  return &protocol witness table for JournalingSuggestion.Reflection;
}

uint64_t associated type witness table accessor for Identifiable.ID : Hashable in JournalingSuggestion.ItemContent()
{
  return lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
}

uint64_t base witness table accessor for Equatable in JournalingSuggestion()
{
  return lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type JournalingSuggestion and conformance JournalingSuggestion, type metadata accessor for JournalingSuggestion, (uint64_t)&protocol conformance descriptor for JournalingSuggestion);
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestion(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = a2[2];
    a1[1] = a2[1];
    a1[2] = v8;
    v9 = a3[6];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = type metadata accessor for DateInterval();
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v14(v11, 1, v12))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    v16 = a3[7];
    v17 = (char *)v7 + v16;
    v18 = (char *)a2 + v16;
    v19 = type metadata accessor for UUID();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
    *(uint64_t *)((char *)v7 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
  }
  return v7;
}

uint64_t destroy for JournalingSuggestion(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = type metadata accessor for DateInterval();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v7 = a1 + *(int *)(a2 + 28);
  v8 = type metadata accessor for UUID();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

_QWORD *initializeWithCopy for JournalingSuggestion(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  v7 = a3[6];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for DateInterval();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v14 = a3[7];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  return a1;
}

_QWORD *assignWithCopy for JournalingSuggestion(_QWORD *a1, _QWORD *a2, int *a3)
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
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for DateInterval();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  v15 = a3[7];
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 24))(v16, v17, v18);
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  return a1;
}

uint64_t initializeWithTake for JournalingSuggestion(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v6 = a3[6];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = type metadata accessor for DateInterval();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v12 = a3[7];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  return a1;
}

_QWORD *assignWithTake for JournalingSuggestion(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = a2[2];
  a1[1] = a2[1];
  a1[2] = v6;
  swift_bridgeObjectRelease();
  v7 = a3[6];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for DateInterval();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  v16 = a3[7];
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  v19 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_233A80830(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 24);
    }
    else
    {
      v10 = type metadata accessor for UUID();
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 28);
    }
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(&a1[v11], a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_233A808E0(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 24);
    }
    else
    {
      v10 = type metadata accessor for UUID();
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 28);
    }
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(&v5[v11], a2, a2, v10);
  }
  return result;
}

void type metadata completion function for JournalingSuggestion()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for DateInterval?(319, &lazy cache variable for type metadata for DateInterval?, (void (*)(uint64_t))MEMORY[0x24BDCB878]);
  if (v0 <= 0x3F)
  {
    type metadata accessor for UUID();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestion.Workout(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *__dst;
  unsigned int (*v29)(char *, uint64_t, uint64_t);
  char *v30;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for JournalingSuggestion.Workout.Details(0);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.Workout.Details?);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      v11 = (void *)a2[1];
      *a1 = *a2;
      a1[1] = (uint64_t)v11;
      v12 = (void *)a2[2];
      v13 = (void *)a2[3];
      a1[2] = (uint64_t)v12;
      a1[3] = (uint64_t)v13;
      v14 = *(int *)(v7 + 32);
      __dst = (char *)a1 + v14;
      v30 = (char *)a2 + v14;
      v15 = type metadata accessor for DateInterval();
      v16 = *(_QWORD *)(v15 - 8);
      v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
      v17 = v11;
      v18 = v12;
      v19 = v13;
      if (v29(v30, 1, v15))
      {
        v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
        memcpy(__dst, v30, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v16 + 16))(__dst, v30, v15);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(__dst, 0, 1, v15);
      }
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    v21 = *(int *)(a3 + 20);
    v22 = (char *)a1 + v21;
    v23 = (char *)a2 + v21;
    v24 = type metadata accessor for URL();
    v25 = *(_QWORD *)(v24 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
    {
      v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
      memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v22, v23, v24);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
    }
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for JournalingSuggestion.Workout(id *a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = type metadata accessor for JournalingSuggestion.Workout.Details(0);
  if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, 1, v4))
  {

    v5 = (char *)a1 + *(int *)(v4 + 32);
    v6 = type metadata accessor for DateInterval();
    v7 = *(_QWORD *)(v6 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6))
      (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }
  v8 = (char *)a1 + *(int *)(a2 + 20);
  v9 = type metadata accessor for URL();
  v10 = *(_QWORD *)(v9 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for JournalingSuggestion.Workout(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int (*v27)(char *, uint64_t, uint64_t);
  char *__dst;
  uint64_t v29;

  v6 = type metadata accessor for JournalingSuggestion.Workout.Details(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.Workout.Details?);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    v29 = a3;
    v9 = (void *)a2[1];
    *a1 = *a2;
    a1[1] = v9;
    v11 = (void *)a2[2];
    v10 = (void *)a2[3];
    a1[2] = v11;
    a1[3] = v10;
    v12 = *(int *)(v6 + 32);
    __dst = (char *)a1 + v12;
    v13 = (char *)a2 + v12;
    v14 = type metadata accessor for DateInterval();
    v15 = *(_QWORD *)(v14 - 8);
    v27 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
    v16 = v9;
    v17 = v11;
    v18 = v10;
    if (v27(v13, 1, v14))
    {
      v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
      memcpy(__dst, v13, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(__dst, v13, v14);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(__dst, 0, 1, v14);
    }
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    a3 = v29;
  }
  v20 = *(int *)(a3 + 20);
  v21 = (char *)a1 + v20;
  v22 = (char *)a2 + v20;
  v23 = type metadata accessor for URL();
  v24 = *(_QWORD *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
  {
    v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v21, v22, v23);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  }
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for JournalingSuggestion.Workout(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  size_t v22;
  char *v23;
  char *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(char *, uint64_t, uint64_t);
  int v40;
  int v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(char *, uint64_t, uint64_t);
  int v48;
  int v49;
  uint64_t v50;
  unsigned int (*v52)(char *, uint64_t, uint64_t);
  char *__dst;
  uint64_t v54;

  v6 = type metadata accessor for JournalingSuggestion.Workout.Details(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      v25 = (void *)*((_QWORD *)a1 + 1);
      v26 = (void *)*((_QWORD *)a2 + 1);
      *((_QWORD *)a1 + 1) = v26;
      v27 = v26;

      v28 = (void *)*((_QWORD *)a1 + 2);
      v29 = (void *)*((_QWORD *)a2 + 2);
      *((_QWORD *)a1 + 2) = v29;
      v30 = v29;

      v31 = (void *)*((_QWORD *)a1 + 3);
      v32 = (void *)*((_QWORD *)a2 + 3);
      *((_QWORD *)a1 + 3) = v32;
      v33 = v32;

      v34 = *(int *)(v6 + 32);
      v35 = &a1[v34];
      v36 = &a2[v34];
      v37 = type metadata accessor for DateInterval();
      v38 = *(_QWORD *)(v37 - 8);
      v39 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v38 + 48);
      v40 = v39(v35, 1, v37);
      v41 = v39(v36, 1, v37);
      if (v40)
      {
        if (!v41)
        {
          (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v35, v36, v37);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v35, 0, 1, v37);
          goto LABEL_14;
        }
      }
      else
      {
        if (!v41)
        {
          (*(void (**)(char *, char *, uint64_t))(v38 + 24))(v35, v36, v37);
          goto LABEL_14;
        }
        (*(void (**)(char *, uint64_t))(v38 + 8))(v35, v37);
      }
      v22 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?)
                                  - 8)
                      + 64);
      v23 = v35;
      v24 = v36;
LABEL_8:
      memcpy(v23, v24, v22);
      goto LABEL_14;
    }
    outlined destroy of JournalingSuggestionsError((uint64_t)a1, type metadata accessor for JournalingSuggestion.Workout.Details);
LABEL_7:
    v22 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.Workout.Details?)
                                - 8)
                    + 64);
    v23 = a1;
    v24 = a2;
    goto LABEL_8;
  }
  if (v10)
    goto LABEL_7;
  v54 = a3;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v11 = (void *)*((_QWORD *)a2 + 1);
  *((_QWORD *)a1 + 1) = v11;
  v12 = (void *)*((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 2) = v12;
  v13 = (void *)*((_QWORD *)a2 + 3);
  *((_QWORD *)a1 + 3) = v13;
  v14 = *(int *)(v6 + 32);
  __dst = &a1[v14];
  v15 = &a2[v14];
  v16 = type metadata accessor for DateInterval();
  v17 = *(_QWORD *)(v16 - 8);
  v52 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48);
  v18 = v11;
  v19 = v12;
  v20 = v13;
  if (v52(v15, 1, v16))
  {
    v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(__dst, v15, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(__dst, v15, v16);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(__dst, 0, 1, v16);
  }
  a3 = v54;
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_14:
  v42 = *(int *)(a3 + 20);
  v43 = &a1[v42];
  v44 = &a2[v42];
  v45 = type metadata accessor for URL();
  v46 = *(_QWORD *)(v45 - 8);
  v47 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v46 + 48);
  v48 = v47(v43, 1, v45);
  v49 = v47(v44, 1, v45);
  if (!v48)
  {
    if (!v49)
    {
      (*(void (**)(char *, char *, uint64_t))(v46 + 24))(v43, v44, v45);
      goto LABEL_20;
    }
    (*(void (**)(char *, uint64_t))(v46 + 8))(v43, v45);
    goto LABEL_19;
  }
  if (v49)
  {
LABEL_19:
    v50 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v43, v44, *(_QWORD *)(*(_QWORD *)(v50 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v43, v44, v45);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v46 + 56))(v43, 0, 1, v45);
LABEL_20:
  *(_QWORD *)&a1[*(int *)(a3 + 24)] = *(_QWORD *)&a2[*(int *)(a3 + 24)];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *initializeWithTake for JournalingSuggestion.Workout(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = type metadata accessor for JournalingSuggestion.Workout.Details(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.Workout.Details?);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
    a1[3] = a2[3];
    v9 = *(int *)(v6 + 32);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = type metadata accessor for DateInterval();
    v13 = *(_QWORD *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v15 = *(int *)(a3 + 20);
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = type metadata accessor for URL();
  v19 = *(_QWORD *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v16, v17, v18);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  }
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *assignWithTake for JournalingSuggestion.Workout(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  char *v18;
  char *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(char *, uint64_t, uint64_t);
  int v30;
  int v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(char *, uint64_t, uint64_t);
  int v38;
  int v39;
  uint64_t v40;

  v6 = type metadata accessor for JournalingSuggestion.Workout.Details(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      v20 = (void *)a1[1];
      v21 = a2[1];
      *a1 = *a2;
      a1[1] = v21;

      v22 = (void *)a1[2];
      a1[2] = a2[2];

      v23 = (void *)a1[3];
      a1[3] = a2[3];

      v24 = *(int *)(v6 + 32);
      v25 = (char *)a1 + v24;
      v26 = (char *)a2 + v24;
      v27 = type metadata accessor for DateInterval();
      v28 = *(_QWORD *)(v27 - 8);
      v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48);
      v30 = v29(v25, 1, v27);
      v31 = v29(v26, 1, v27);
      if (v30)
      {
        if (!v31)
        {
          (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v25, v26, v27);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
          goto LABEL_14;
        }
      }
      else
      {
        if (!v31)
        {
          (*(void (**)(char *, char *, uint64_t))(v28 + 40))(v25, v26, v27);
          goto LABEL_14;
        }
        (*(void (**)(char *, uint64_t))(v28 + 8))(v25, v27);
      }
      v17 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?)
                                  - 8)
                      + 64);
      v18 = v25;
      v19 = v26;
LABEL_8:
      memcpy(v18, v19, v17);
      goto LABEL_14;
    }
    outlined destroy of JournalingSuggestionsError((uint64_t)a1, type metadata accessor for JournalingSuggestion.Workout.Details);
LABEL_7:
    v17 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.Workout.Details?)
                                - 8)
                    + 64);
    v18 = (char *)a1;
    v19 = (char *)a2;
    goto LABEL_8;
  }
  if (v10)
    goto LABEL_7;
  *a1 = *a2;
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
  a1[3] = a2[3];
  v11 = *(int *)(v6 + 32);
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = type metadata accessor for DateInterval();
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_14:
  v32 = *(int *)(a3 + 20);
  v33 = (char *)a1 + v32;
  v34 = (char *)a2 + v32;
  v35 = type metadata accessor for URL();
  v36 = *(_QWORD *)(v35 - 8);
  v37 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v36 + 48);
  v38 = v37(v33, 1, v35);
  v39 = v37(v34, 1, v35);
  if (!v38)
  {
    if (!v39)
    {
      (*(void (**)(char *, char *, uint64_t))(v36 + 40))(v33, v34, v35);
      goto LABEL_20;
    }
    (*(void (**)(char *, uint64_t))(v36 + 8))(v33, v35);
    goto LABEL_19;
  }
  if (v39)
  {
LABEL_19:
    v40 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v33, v34, v35);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
LABEL_20:
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.Workout()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_233A81814(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;
  int v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.Workout.Details?);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
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
  v15 = v14 - 1;
  if (v15 < 0)
    v15 = -1;
  return (v15 + 1);
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.Workout()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233A818DC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.Workout.Details?);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = a2;
  return result;
}

void type metadata completion function for JournalingSuggestion.Workout()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for DateInterval?(319, &lazy cache variable for type metadata for JournalingSuggestion.Workout.Details?, (void (*)(uint64_t))type metadata accessor for JournalingSuggestion.Workout.Details);
  if (v0 <= 0x3F)
  {
    type metadata accessor for DateInterval?(319, (unint64_t *)&lazy cache variable for type metadata for URL?, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void type metadata accessor for DateInterval?(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = type metadata accessor for Optional();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestion.Workout.Details(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v18 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v18 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = (void *)a2[1];
    *a1 = *a2;
    a1[1] = (uint64_t)v5;
    v6 = (void *)a2[2];
    v7 = (void *)a2[3];
    a1[2] = (uint64_t)v6;
    a1[3] = (uint64_t)v7;
    v8 = *(int *)(a3 + 32);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for DateInterval();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    v14 = v5;
    v15 = v6;
    v16 = v7;
    if (v13(v10, 1, v11))
    {
      v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
  }
  return v3;
}

uint64_t destroy for JournalingSuggestion.Workout.Details(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v4 = (char *)a1 + *(int *)(a2 + 32);
  v5 = type metadata accessor for DateInterval();
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  return result;
}

_QWORD *initializeWithCopy for JournalingSuggestion.Workout.Details(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v4 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = (void *)a2[2];
  v6 = (void *)a2[3];
  a1[2] = v5;
  a1[3] = v6;
  v7 = *(int *)(a3 + 32);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for DateInterval();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v4;
  v14 = v5;
  v15 = v6;
  if (v12(v9, 1, v10))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

_QWORD *assignWithCopy for JournalingSuggestion.Workout.Details(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(char *, uint64_t, uint64_t);
  int v21;
  int v22;
  uint64_t v23;

  *a1 = *a2;
  v6 = (void *)a1[1];
  v7 = (void *)a2[1];
  a1[1] = v7;
  v8 = v7;

  v9 = (void *)a1[2];
  v10 = (void *)a2[2];
  a1[2] = v10;
  v11 = v10;

  v12 = (void *)a1[3];
  v13 = (void *)a2[3];
  a1[3] = v13;
  v14 = v13;

  v15 = *(int *)(a3 + 32);
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = type metadata accessor for DateInterval();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  v21 = v20(v16, 1, v18);
  v22 = v20(v17, 1, v18);
  if (!v21)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 24))(v16, v17, v18);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v18);
    goto LABEL_6;
  }
  if (v22)
  {
LABEL_6:
    v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  return a1;
}

uint64_t initializeWithTake for JournalingSuggestion.Workout.Details(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v4 = *(int *)(a3 + 32);
  v5 = (void *)(a1 + v4);
  v6 = (const void *)(a2 + v4);
  v7 = type metadata accessor for DateInterval();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

_QWORD *assignWithTake for JournalingSuggestion.Workout.Details(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(char *, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;

  v6 = (void *)a1[1];
  v7 = a2[1];
  *a1 = *a2;
  a1[1] = v7;

  v8 = (void *)a1[2];
  a1[2] = a2[2];

  v9 = (void *)a1[3];
  a1[3] = a2[3];

  v10 = *(int *)(a3 + 32);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = type metadata accessor for DateInterval();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  v16 = v15(v11, 1, v13);
  v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v11, v12, v13);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.Workout.Details()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_233A82054(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(a1 + *(int *)(a3 + 32), a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.Workout.Details()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233A820EC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)(result + 8) = a2;
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 32), a2, a2, v7);
  }
  return result;
}

void type metadata completion function for JournalingSuggestion.Workout.Details()
{
  unint64_t v0;

  type metadata accessor for DateInterval?(319, &lazy cache variable for type metadata for DateInterval?, (void (*)(uint64_t))MEMORY[0x24BDCB878]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestion.WorkoutGroup(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  id v22;
  id v23;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for URL();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    v15 = a3[6];
    v16 = a3[7];
    v17 = *(void **)((char *)a2 + v15);
    *(uint64_t *)((char *)v7 + v15) = (uint64_t)v17;
    v18 = *(void **)((char *)a2 + v16);
    *(uint64_t *)((char *)v7 + v16) = (uint64_t)v18;
    v19 = a3[8];
    v20 = (char *)v7 + v19;
    v21 = (char *)a2 + v19;
    *(_QWORD *)v20 = *(_QWORD *)v21;
    v20[8] = v21[8];
    v22 = v17;
    v23 = v18;
  }
  return v7;
}

void destroy for JournalingSuggestion.WorkoutGroup(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease();
  v4 = a1 + a2[5];
  v5 = type metadata accessor for URL();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);

}

_QWORD *initializeWithCopy for JournalingSuggestion.WorkoutGroup(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  id v20;
  id v21;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for URL();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  swift_bridgeObjectRetain();
  if (v11(v8, 1, v9))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v13 = a3[6];
  v14 = a3[7];
  v15 = *(void **)((char *)a2 + v13);
  *(_QWORD *)((char *)a1 + v13) = v15;
  v16 = *(void **)((char *)a2 + v14);
  *(_QWORD *)((char *)a1 + v14) = v16;
  v17 = a3[8];
  v18 = (char *)a1 + v17;
  v19 = (char *)a2 + v17;
  *(_QWORD *)v18 = *(_QWORD *)v19;
  v18[8] = v19[8];
  v20 = v15;
  v21 = v16;
  return a1;
}

_QWORD *assignWithCopy for JournalingSuggestion.WorkoutGroup(_QWORD *a1, _QWORD *a2, int *a3)
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
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for URL();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  v15 = a3[6];
  v16 = *(void **)((char *)a1 + v15);
  v17 = *(void **)((char *)a2 + v15);
  *(_QWORD *)((char *)a1 + v15) = v17;
  v18 = v17;

  v19 = a3[7];
  v20 = *(void **)((char *)a1 + v19);
  v21 = *(void **)((char *)a2 + v19);
  *(_QWORD *)((char *)a1 + v19) = v21;
  v22 = v21;

  v23 = a3[8];
  v24 = (char *)a1 + v23;
  v25 = (char *)a2 + v23;
  v26 = *(_QWORD *)v25;
  v24[8] = v25[8];
  *(_QWORD *)v24 = v26;
  return a1;
}

_QWORD *initializeWithTake for JournalingSuggestion.WorkoutGroup(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for URL();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v12 = a3[7];
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  *(_QWORD *)((char *)a1 + v12) = *(_QWORD *)((char *)a2 + v12);
  v13 = a3[8];
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  *(_QWORD *)v14 = *(_QWORD *)v15;
  v14[8] = v15[8];
  return a1;
}

_QWORD *assignWithTake for JournalingSuggestion.WorkoutGroup(_QWORD *a1, _QWORD *a2, int *a3)
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
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  char *v20;
  char *v21;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for URL();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  v15 = a3[6];
  v16 = *(void **)((char *)a1 + v15);
  *(_QWORD *)((char *)a1 + v15) = *(_QWORD *)((char *)a2 + v15);

  v17 = a3[7];
  v18 = *(void **)((char *)a1 + v17);
  *(_QWORD *)((char *)a1 + v17) = *(_QWORD *)((char *)a2 + v17);

  v19 = a3[8];
  v20 = (char *)a1 + v19;
  v21 = (char *)a2 + v19;
  *(_QWORD *)v20 = *(_QWORD *)v21;
  v20[8] = v21[8];
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.WorkoutGroup()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.WorkoutGroup()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void type metadata completion function for JournalingSuggestion.WorkoutGroup()
{
  unint64_t v0;

  type metadata accessor for DateInterval?(319, (unint64_t *)&lazy cache variable for type metadata for URL?, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestion.Contact(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v13 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = type metadata accessor for URL();
    v10 = *(_QWORD *)(v9 - 8);
    v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
    swift_bridgeObjectRetain();
    if (v11(v8, 1, v9))
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
    }
  }
  return v3;
}

uint64_t destroy for JournalingSuggestion.Contact(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = type metadata accessor for URL();
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return result;
}

_QWORD *initializeWithCopy for JournalingSuggestion.Contact(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  v8 = type metadata accessor for URL();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  swift_bridgeObjectRetain();
  if (v10(v7, 1, v8))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

_QWORD *assignWithCopy for JournalingSuggestion.Contact(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for URL();
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
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

_OWORD *initializeWithTake for JournalingSuggestion.Contact(_OWORD *a1, _OWORD *a2, uint64_t a3)
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
  v7 = type metadata accessor for URL();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

_QWORD *assignWithTake for JournalingSuggestion.Contact(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for URL();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.Contact()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_233A82EAC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.Contact()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233A82F38(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

void type metadata completion function for JournalingSuggestion.Contact()
{
  unint64_t v0;

  type metadata accessor for DateInterval?(319, (unint64_t *)&lazy cache variable for type metadata for URL?, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestion.Location(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  id v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v16 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v16 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    v7 = (void *)a2[4];
    v8 = *(int *)(a3 + 28);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    a1[4] = (uint64_t)v7;
    v11 = type metadata accessor for Date();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14 = v7;
    if (v13(v10, 1, v11))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
  }
  return v3;
}

uint64_t destroy for JournalingSuggestion.Location(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v4 = a1 + *(int *)(a2 + 28);
  v5 = type metadata accessor for Date();
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return result;
}

_QWORD *initializeWithCopy for JournalingSuggestion.Location(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  id v13;
  uint64_t v14;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = (void *)a2[4];
  a1[4] = v6;
  v7 = *(int *)(a3 + 28);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for Date();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13 = v6;
  if (v12(v9, 1, v10))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

_QWORD *assignWithCopy for JournalingSuggestion.Location(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(char *, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (void *)a1[4];
  v7 = (void *)a2[4];
  a1[4] = v7;
  v8 = v7;

  v9 = *(int *)(a3 + 28);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = type metadata accessor for Date();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 24))(v10, v11, v12);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  return a1;
}

uint64_t initializeWithTake for JournalingSuggestion.Location(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  void *v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v5 = *(int *)(a3 + 28);
  v6 = (void *)(a1 + v5);
  v7 = (const void *)(a2 + v5);
  v8 = type metadata accessor for Date();
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v9 + 32))(v6, v7, v8);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

_QWORD *assignWithTake for JournalingSuggestion.Location(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(char *, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = (void *)a1[4];
  a1[4] = a2[4];

  v9 = *(int *)(a3 + 28);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = type metadata accessor for Date();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v10, v11, v12);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.Location()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_233A83630(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.Location()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233A836C8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)(result + 8) = a2;
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

void type metadata completion function for JournalingSuggestion.Location()
{
  unint64_t v0;

  type metadata accessor for DateInterval?(319, &lazy cache variable for type metadata for Date?, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

ValueMetadata *type metadata accessor for JournalingSuggestion.LocationGroup()
{
  return &type metadata for JournalingSuggestion.LocationGroup;
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestion.Song(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return initializeBufferWithCopyOfBuffer for JournalingSuggestion.Song(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], &demangling cache variable for type metadata for URL?, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], &demangling cache variable for type metadata for Date?);
}

uint64_t destroy for JournalingSuggestion.Song(uint64_t a1, uint64_t a2)
{
  return destroy for JournalingSuggestion.Song(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900]);
}

_QWORD *initializeWithCopy for JournalingSuggestion.Song(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  return initializeWithCopy for JournalingSuggestion.Song(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], &demangling cache variable for type metadata for URL?, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], &demangling cache variable for type metadata for Date?);
}

_QWORD *assignWithCopy for JournalingSuggestion.Song(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  return assignWithCopy for JournalingSuggestion.Song(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], &demangling cache variable for type metadata for URL?, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], &demangling cache variable for type metadata for Date?);
}

_OWORD *initializeWithTake for JournalingSuggestion.Song(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  return initializeWithTake for JournalingSuggestion.Song(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], &demangling cache variable for type metadata for URL?, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], &demangling cache variable for type metadata for Date?);
}

_QWORD *assignWithTake for JournalingSuggestion.Song(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  return assignWithTake for JournalingSuggestion.Song(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], &demangling cache variable for type metadata for URL?, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], &demangling cache variable for type metadata for Date?);
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.Song()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_233A838B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_15Tm(a1, a2, a3, &demangling cache variable for type metadata for URL?, &demangling cache variable for type metadata for Date?);
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.Song()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233A838D4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_16Tm(a1, a2, a3, a4, &demangling cache variable for type metadata for URL?, &demangling cache variable for type metadata for Date?);
}

void type metadata completion function for JournalingSuggestion.Song(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata completion function for JournalingSuggestion.Song(a1, a2, a3, (unint64_t *)&lazy cache variable for type metadata for URL?, (void (*)(uint64_t))MEMORY[0x24BDCDAC0], &lazy cache variable for type metadata for Date?, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestion.Podcast(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
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
    v9 = *(int *)(a3 + 24);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = type metadata accessor for URL();
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v14(v11, 1, v12))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    v17 = *(int *)(a3 + 28);
    v18 = (char *)v4 + v17;
    v19 = (char *)a2 + v17;
    v20 = type metadata accessor for Date();
    v21 = *(_QWORD *)(v20 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
    {
      v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    }
  }
  return v4;
}

uint64_t destroy for JournalingSuggestion.Podcast(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = type metadata accessor for URL();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v7 = a1 + *(int *)(a2 + 28);
  v8 = type metadata accessor for Date();
  v9 = *(_QWORD *)(v8 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  return result;
}

_QWORD *initializeWithCopy for JournalingSuggestion.Podcast(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = *(int *)(a3 + 24);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = type metadata accessor for URL();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v13(v10, 1, v11))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v15 = *(int *)(a3 + 28);
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = type metadata accessor for Date();
  v19 = *(_QWORD *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  }
  return a1;
}

_QWORD *assignWithCopy for JournalingSuggestion.Podcast(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(char *, uint64_t, uint64_t);
  int v21;
  int v22;
  uint64_t v23;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for URL();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  v15 = *(int *)(a3 + 28);
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = type metadata accessor for Date();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  v21 = v20(v16, 1, v18);
  v22 = v20(v17, 1, v18);
  if (!v21)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 24))(v16, v17, v18);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v18);
    goto LABEL_12;
  }
  if (v22)
  {
LABEL_12:
    v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  return a1;
}

_OWORD *initializeWithTake for JournalingSuggestion.Podcast(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 24);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for URL();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v13 = *(int *)(a3 + 28);
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = type metadata accessor for Date();
  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v14, v15, v16);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  return a1;
}

_QWORD *assignWithTake for JournalingSuggestion.Podcast(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(char *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(char *, uint64_t, uint64_t);
  int v23;
  int v24;
  uint64_t v25;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = *(int *)(a3 + 24);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = type metadata accessor for URL();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v15)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
LABEL_6:
    v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v9, v10, v11);
LABEL_7:
  v17 = *(int *)(a3 + 28);
  v18 = (char *)a1 + v17;
  v19 = (char *)a2 + v17;
  v20 = type metadata accessor for Date();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48);
  v23 = v22(v18, 1, v20);
  v24 = v22(v19, 1, v20);
  if (!v23)
  {
    if (!v24)
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 40))(v18, v19, v20);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v21 + 8))(v18, v20);
    goto LABEL_12;
  }
  if (v24)
  {
LABEL_12:
    v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v18, v19, v20);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.Podcast()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_233A84254(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  int v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    v10 = *(_QWORD *)(v9 - 8);
    if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
    {
      v11 = v9;
      v12 = *(int *)(a3 + 24);
    }
    else
    {
      v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
      v10 = *(_QWORD *)(v11 - 8);
      v12 = *(int *)(a3 + 28);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.Podcast()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233A84314(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)(result + 8) = a2;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 24);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 28);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

void type metadata completion function for JournalingSuggestion.Podcast()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for DateInterval?(319, (unint64_t *)&lazy cache variable for type metadata for URL?, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  if (v0 <= 0x3F)
  {
    type metadata accessor for DateInterval?(319, &lazy cache variable for type metadata for Date?, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestion.GenericMedia(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return initializeBufferWithCopyOfBuffer for JournalingSuggestion.Song(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], &demangling cache variable for type metadata for Date?, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], &demangling cache variable for type metadata for URL?);
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestion.Song(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD), uint64_t *a5, uint64_t (*a6)(_QWORD), uint64_t *a7)
{
  uint64_t *v8;
  int v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int (*v18)(char *, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *__dst;

  v8 = a1;
  v9 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v9 & 0x20000) != 0)
  {
    v20 = *a2;
    *v8 = *a2;
    v8 = (uint64_t *)(v20 + ((v9 + 16) & ~(unint64_t)v9));
    swift_retain();
  }
  else
  {
    v11 = a2[1];
    *a1 = *a2;
    a1[1] = v11;
    v12 = a2[3];
    a1[2] = a2[2];
    a1[3] = v12;
    v13 = a2[5];
    v14 = *(int *)(a3 + 28);
    __dst = (char *)a1 + v14;
    v15 = (char *)a2 + v14;
    a1[4] = a2[4];
    a1[5] = v13;
    v16 = a4(0);
    v17 = *(_QWORD *)(v16 - 8);
    v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v18(v15, 1, v16))
    {
      v19 = __swift_instantiateConcreteTypeFromMangledName(a5);
      memcpy(__dst, v15, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(__dst, v15, v16);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(__dst, 0, 1, v16);
    }
    v21 = *(int *)(a3 + 32);
    v22 = (char *)v8 + v21;
    v23 = (char *)a2 + v21;
    v24 = a6(0);
    v25 = *(_QWORD *)(v24 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
    {
      v26 = __swift_instantiateConcreteTypeFromMangledName(a7);
      memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v22, v23, v24);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
    }
  }
  return v8;
}

uint64_t destroy for JournalingSuggestion.GenericMedia(uint64_t a1, uint64_t a2)
{
  return destroy for JournalingSuggestion.Song(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0]);
}

uint64_t destroy for JournalingSuggestion.Song(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD), uint64_t (*a4)(_QWORD))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = a1 + *(int *)(a2 + 28);
  v9 = a3(0);
  v10 = *(_QWORD *)(v9 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  v11 = a1 + *(int *)(a2 + 32);
  v12 = a4(0);
  v13 = *(_QWORD *)(v12 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  return result;
}

_QWORD *initializeWithCopy for JournalingSuggestion.GenericMedia(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  return initializeWithCopy for JournalingSuggestion.Song(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], &demangling cache variable for type metadata for Date?, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], &demangling cache variable for type metadata for URL?);
}

_QWORD *initializeWithCopy for JournalingSuggestion.Song(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t (*a4)(_QWORD), uint64_t *a5, uint64_t (*a6)(_QWORD), uint64_t *a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v9 = a2[1];
  *a1 = *a2;
  a1[1] = v9;
  v10 = a2[3];
  a1[2] = a2[2];
  a1[3] = v10;
  v11 = a2[5];
  v12 = *(int *)(a3 + 28);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  a1[4] = a2[4];
  a1[5] = v11;
  v15 = a4(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v17(v14, 1, v15))
  {
    v18 = __swift_instantiateConcreteTypeFromMangledName(a5);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  v19 = *(int *)(a3 + 32);
  v20 = (char *)a1 + v19;
  v21 = (char *)a2 + v19;
  v22 = a6(0);
  v23 = *(_QWORD *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
  {
    v24 = __swift_instantiateConcreteTypeFromMangledName(a7);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v20, v21, v22);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  }
  return a1;
}

_QWORD *assignWithCopy for JournalingSuggestion.GenericMedia(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  return assignWithCopy for JournalingSuggestion.Song(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], &demangling cache variable for type metadata for Date?, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], &demangling cache variable for type metadata for URL?);
}

_QWORD *assignWithCopy for JournalingSuggestion.Song(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t (*a4)(_QWORD), uint64_t *a5, uint64_t (*a6)(_QWORD), uint64_t *a7)
{
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(char *, uint64_t, uint64_t);
  int v27;
  int v28;
  uint64_t v29;

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
  v12 = *(int *)(a3 + 28);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = a4(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
LABEL_6:
    v20 = __swift_instantiateConcreteTypeFromMangledName(a5);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v13, v14, v15);
LABEL_7:
  v21 = *(int *)(a3 + 32);
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = a6(0);
  v25 = *(_QWORD *)(v24 - 8);
  v26 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 48);
  v27 = v26(v22, 1, v24);
  v28 = v26(v23, 1, v24);
  if (!v27)
  {
    if (!v28)
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 24))(v22, v23, v24);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v25 + 8))(v22, v24);
    goto LABEL_12;
  }
  if (v28)
  {
LABEL_12:
    v29 = __swift_instantiateConcreteTypeFromMangledName(a7);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v22, v23, v24);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  return a1;
}

_OWORD *initializeWithTake for JournalingSuggestion.GenericMedia(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  return initializeWithTake for JournalingSuggestion.Song(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], &demangling cache variable for type metadata for Date?, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], &demangling cache variable for type metadata for URL?);
}

_OWORD *initializeWithTake for JournalingSuggestion.Song(_OWORD *a1, _OWORD *a2, uint64_t a3, uint64_t (*a4)(_QWORD), uint64_t *a5, uint64_t (*a6)(_QWORD), uint64_t *a7)
{
  __int128 v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v13 = a2[1];
  *a1 = *a2;
  a1[1] = v13;
  a1[2] = a2[2];
  v14 = *(int *)(a3 + 28);
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = a4(0);
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(a5);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  v20 = *(int *)(a3 + 32);
  v21 = (char *)a1 + v20;
  v22 = (char *)a2 + v20;
  v23 = a6(0);
  v24 = *(_QWORD *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
  {
    v25 = __swift_instantiateConcreteTypeFromMangledName(a7);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v21, v22, v23);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  }
  return a1;
}

_QWORD *assignWithTake for JournalingSuggestion.GenericMedia(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  return assignWithTake for JournalingSuggestion.Song(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], &demangling cache variable for type metadata for Date?, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], &demangling cache variable for type metadata for URL?);
}

_QWORD *assignWithTake for JournalingSuggestion.Song(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t (*a4)(_QWORD), uint64_t *a5, uint64_t (*a6)(_QWORD), uint64_t *a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(char *, uint64_t, uint64_t);
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(char *, uint64_t, uint64_t);
  int v30;
  int v31;
  uint64_t v32;

  v12 = a2[1];
  *a1 = *a2;
  a1[1] = v12;
  swift_bridgeObjectRelease();
  v13 = a2[3];
  a1[2] = a2[2];
  a1[3] = v13;
  swift_bridgeObjectRelease();
  v14 = a2[5];
  a1[4] = a2[4];
  a1[5] = v14;
  swift_bridgeObjectRelease();
  v15 = *(int *)(a3 + 28);
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = a4(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  v21 = v20(v16, 1, v18);
  v22 = v20(v17, 1, v18);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v16, v17, v18);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v22)
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v18);
LABEL_6:
    v23 = __swift_instantiateConcreteTypeFromMangledName(a5);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 40))(v16, v17, v18);
LABEL_7:
  v24 = *(int *)(a3 + 32);
  v25 = (char *)a1 + v24;
  v26 = (char *)a2 + v24;
  v27 = a6(0);
  v28 = *(_QWORD *)(v27 - 8);
  v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48);
  v30 = v29(v25, 1, v27);
  v31 = v29(v26, 1, v27);
  if (!v30)
  {
    if (!v31)
    {
      (*(void (**)(char *, char *, uint64_t))(v28 + 40))(v25, v26, v27);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v28 + 8))(v25, v27);
    goto LABEL_12;
  }
  if (v31)
  {
LABEL_12:
    v32 = __swift_instantiateConcreteTypeFromMangledName(a7);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v25, v26, v27);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.GenericMedia()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_233A84F28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_15Tm(a1, a2, a3, &demangling cache variable for type metadata for Date?, &demangling cache variable for type metadata for URL?);
}

uint64_t __swift_get_extra_inhabitant_index_15Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  unint64_t v6;
  int v7;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if ((_DWORD)a2 == 2147483646)
  {
    v6 = *(_QWORD *)(a1 + 8);
    if (v6 >= 0xFFFFFFFF)
      LODWORD(v6) = -1;
    v7 = v6 - 1;
    if (v7 < 0)
      v7 = -1;
    return (v7 + 1);
  }
  else
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(a4);
    v13 = *(_QWORD *)(v12 - 8);
    if (*(_DWORD *)(v13 + 84) == (_DWORD)a2)
    {
      v14 = v12;
      v15 = *(int *)(a3 + 28);
    }
    else
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(a5);
      v13 = *(_QWORD *)(v14 - 8);
      v15 = *(int *)(a3 + 32);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(a1 + v15, a2, v14);
  }
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.GenericMedia()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233A84FF8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_16Tm(a1, a2, a3, a4, &demangling cache variable for type metadata for Date?, &demangling cache variable for type metadata for URL?);
}

uint64_t __swift_store_extra_inhabitant_index_16Tm(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t *a5, uint64_t *a6)
{
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v7 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)(result + 8) = a2;
  }
  else
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(a5);
    v12 = *(_QWORD *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) == a3)
    {
      v13 = v11;
      v14 = *(int *)(a4 + 28);
    }
    else
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(a6);
      v12 = *(_QWORD *)(v13 - 8);
      v14 = *(int *)(a4 + 32);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(v7 + v14, a2, a2, v13);
  }
  return result;
}

void type metadata completion function for JournalingSuggestion.GenericMedia(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata completion function for JournalingSuggestion.Song(a1, a2, a3, &lazy cache variable for type metadata for Date?, (void (*)(uint64_t))MEMORY[0x24BDCE900], (unint64_t *)&lazy cache variable for type metadata for URL?, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
}

void type metadata completion function for JournalingSuggestion.Song(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, void (*a5)(uint64_t), unint64_t *a6, void (*a7)(uint64_t))
{
  unint64_t v9;
  unint64_t v10;

  type metadata accessor for DateInterval?(319, a4, a5);
  if (v9 <= 0x3F)
  {
    type metadata accessor for DateInterval?(319, a6, a7);
    if (v10 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.Photo()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.Photo()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestion.Photo(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for URL();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for Date();
    v12 = *(_QWORD *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
  }
  return a1;
}

uint64_t destroy for JournalingSuggestion.Photo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v4 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = type metadata accessor for Date();
  v7 = *(_QWORD *)(v6 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  return result;
}

uint64_t initializeWithCopy for JournalingSuggestion.Photo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = type metadata accessor for Date();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithCopy for JournalingSuggestion.Photo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;

  v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = type metadata accessor for Date();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t initializeWithTake for JournalingSuggestion.Photo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = type metadata accessor for Date();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithTake for JournalingSuggestion.Photo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;

  v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = type metadata accessor for Date();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.Video()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_index_21Tm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = type metadata accessor for URL();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.Video()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_index_22Tm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = type metadata accessor for URL();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void type metadata completion function for JournalingSuggestion.Photo()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for URL();
  if (v0 <= 0x3F)
  {
    type metadata accessor for DateInterval?(319, &lazy cache variable for type metadata for Date?, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestion.LivePhoto(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for URL();
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
    v9 = *(int *)(a3 + 24);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = type metadata accessor for Date();
    v13 = *(_QWORD *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
  }
  return a1;
}

uint64_t destroy for JournalingSuggestion.LivePhoto(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v4 = type metadata accessor for URL();
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + *(int *)(a2 + 20), v4);
  v6 = a1 + *(int *)(a2 + 24);
  v7 = type metadata accessor for Date();
  v8 = *(_QWORD *)(v7 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  return result;
}

uint64_t initializeWithCopy for JournalingSuggestion.LivePhoto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = type metadata accessor for URL();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  v8 = *(int *)(a3 + 24);
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  v11 = type metadata accessor for Date();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  return a1;
}

uint64_t assignWithCopy for JournalingSuggestion.LivePhoto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void *, uint64_t, uint64_t);
  int v14;
  uint64_t v15;

  v6 = type metadata accessor for URL();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  v8 = *(int *)(a3 + 24);
  v9 = (void *)(a1 + v8);
  v10 = (void *)(a2 + v8);
  v11 = type metadata accessor for Date();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  LODWORD(v7) = v13(v9, 1, v11);
  v14 = v13(v10, 1, v11);
  if (!(_DWORD)v7)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 24))(v9, v10, v11);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 16))(v9, v10, v11);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  return a1;
}

uint64_t initializeWithTake for JournalingSuggestion.LivePhoto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = type metadata accessor for URL();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  v8 = *(int *)(a3 + 24);
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  v11 = type metadata accessor for Date();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  return a1;
}

uint64_t assignWithTake for JournalingSuggestion.LivePhoto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void *, uint64_t, uint64_t);
  int v14;
  uint64_t v15;

  v6 = type metadata accessor for URL();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  v8 = *(int *)(a3 + 24);
  v9 = (void *)(a1 + v8);
  v10 = (void *)(a2 + v8);
  v11 = type metadata accessor for Date();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  LODWORD(v7) = v13(v9, 1, v11);
  v14 = v13(v10, 1, v11);
  if (!(_DWORD)v7)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 40))(v9, v10, v11);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.LivePhoto()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_233A85F50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = type metadata accessor for URL();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    v10 = a1 + *(int *)(a3 + 24);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.LivePhoto()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233A85FD4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = type metadata accessor for URL();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    v12 = a1 + *(int *)(a4 + 24);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void type metadata completion function for JournalingSuggestion.LivePhoto()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for URL();
  if (v0 <= 0x3F)
  {
    type metadata accessor for DateInterval?(319, &lazy cache variable for type metadata for Date?, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestion.MotionActivity(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for URL();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    v11 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    v12 = (char *)a1 + v11;
    v13 = (char *)a2 + v11;
    v14 = type metadata accessor for DateInterval();
    v15 = *(_QWORD *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    }
    *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  }
  return a1;
}

uint64_t destroy for JournalingSuggestion.MotionActivity(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v4 = type metadata accessor for URL();
  v5 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  v6 = a1 + *(int *)(a2 + 24);
  v7 = type metadata accessor for DateInterval();
  v8 = *(_QWORD *)(v7 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  return result;
}

char *initializeWithCopy for JournalingSuggestion.MotionActivity(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = type metadata accessor for URL();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = a3[6];
  *(_QWORD *)&a1[a3[5]] = *(_QWORD *)&a2[a3[5]];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = type metadata accessor for DateInterval();
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  a1[a3[7]] = a2[a3[7]];
  return a1;
}

char *assignWithCopy for JournalingSuggestion.MotionActivity(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;

  v6 = type metadata accessor for URL();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
LABEL_7:
  *(_QWORD *)&a1[a3[5]] = *(_QWORD *)&a2[a3[5]];
  v12 = a3[6];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = type metadata accessor for DateInterval();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v13, v14, v15);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
LABEL_13:
  a1[a3[7]] = a2[a3[7]];
  return a1;
}

char *initializeWithTake for JournalingSuggestion.MotionActivity(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = type metadata accessor for URL();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = a3[6];
  *(_QWORD *)&a1[a3[5]] = *(_QWORD *)&a2[a3[5]];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = type metadata accessor for DateInterval();
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  a1[a3[7]] = a2[a3[7]];
  return a1;
}

char *assignWithTake for JournalingSuggestion.MotionActivity(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;

  v6 = type metadata accessor for URL();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
LABEL_7:
  v12 = a3[6];
  *(_QWORD *)&a1[a3[5]] = *(_QWORD *)&a2[a3[5]];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = type metadata accessor for DateInterval();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v13, v14, v15);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
LABEL_13:
  a1[a3[7]] = a2[a3[7]];
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.MotionActivity()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_233A86980(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v14;
  unsigned int v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 24);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  if (*(unsigned __int8 *)(a1 + *(int *)(a3 + 28)) <= 3u)
    v14 = 3;
  else
    v14 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 28));
  v15 = v14 - 3;
  if (*(unsigned __int8 *)(a1 + *(int *)(a3 + 28)) >= 3u)
    return v15;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.MotionActivity()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233A86A44(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 24);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_BYTE *)(a1 + *(int *)(a4 + 28)) = a2 + 3;
  return result;
}

void type metadata completion function for JournalingSuggestion.MotionActivity()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for DateInterval?(319, (unint64_t *)&lazy cache variable for type metadata for URL?, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  if (v0 <= 0x3F)
  {
    type metadata accessor for DateInterval?(319, &lazy cache variable for type metadata for DateInterval?, (void (*)(uint64_t))MEMORY[0x24BDCB878]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for JournalingSuggestion.MotionActivity.MovementType()
{
  return &type metadata for JournalingSuggestion.MotionActivity.MovementType;
}

void **initializeBufferWithCopyOfBuffer for JournalingSuggestion.StateOfMind(void **a1, void **a2, int *a3)
{
  int v3;
  char *v4;
  void **v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  char *v14;
  uint64_t v15;
  uint64_t v16;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for URL();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    v14 = v4;
    if (v13(v10, 1, v11))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    v16 = a3[7];
    *(void **)((char *)v7 + a3[6]) = *(void **)((char *)a2 + a3[6]);
    *(void **)((char *)v7 + v16) = *(void **)((char *)a2 + v16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v7;
}

uint64_t destroy for JournalingSuggestion.StateOfMind(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (char *)a1 + *(int *)(a2 + 20);
  v5 = type metadata accessor for URL();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void **initializeWithCopy for JournalingSuggestion.StateOfMind(void **a1, void **a2, int *a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  id v13;
  uint64_t v14;
  uint64_t v15;

  v6 = *a2;
  *a1 = *a2;
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for URL();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v6;
  if (v12(v9, 1, v10))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v15 = a3[7];
  *(void **)((char *)a1 + a3[6]) = *(void **)((char *)a2 + a3[6]);
  *(void **)((char *)a1 + v15) = *(void **)((char *)a2 + v15);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void **assignWithCopy for JournalingSuggestion.StateOfMind(void **a1, void **a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(char *, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  v8 = v6;

  v9 = a3[5];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = type metadata accessor for URL();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 24))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_7:
  *(void **)((char *)a1 + a3[6]) = *(void **)((char *)a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void **)((char *)a1 + a3[7]) = *(void **)((char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *initializeWithTake for JournalingSuggestion.StateOfMind(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for URL();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v12 = a3[7];
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  *(_QWORD *)((char *)a1 + v12) = *(_QWORD *)((char *)a2 + v12);
  return a1;
}

void **assignWithTake for JournalingSuggestion.StateOfMind(void **a1, void **a2, int *a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;

  v6 = *a1;
  *a1 = *a2;

  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for URL();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  *(void **)((char *)a1 + a3[6]) = *(void **)((char *)a2 + a3[6]);
  swift_bridgeObjectRelease();
  *(void **)((char *)a1 + a3[7]) = *(void **)((char *)a2 + a3[7]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.StateOfMind()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_index_9Tm(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.StateOfMind()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *__swift_store_extra_inhabitant_index_10Tm(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

void type metadata completion function for JournalingSuggestion.StateOfMind()
{
  unint64_t v0;

  type metadata accessor for DateInterval?(319, (unint64_t *)&lazy cache variable for type metadata for URL?, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t destroy for JournalingSuggestion.Reflection()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

_QWORD *initializeBufferWithCopyOfBuffer for JournalingSuggestion.Reflection(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for JournalingSuggestion.Reflection(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for JournalingSuggestion.Reflection(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.Reflection(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.Reflection(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for JournalingSuggestion.Reflection()
{
  return &type metadata for JournalingSuggestion.Reflection;
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestion.ItemContent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for UUID();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    *(uint64_t *)((char *)a1 + v8) = *(uint64_t *)((char *)a2 + v8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for JournalingSuggestion.ItemContent(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for JournalingSuggestion.ItemContent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for JournalingSuggestion.ItemContent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for JournalingSuggestion.ItemContent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for JournalingSuggestion.ItemContent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.ItemContent()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_233A8781C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for UUID();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.ItemContent()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233A878A4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for UUID();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t type metadata completion function for JournalingSuggestion.ItemContent()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *type metadata accessor for JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl()
{
  return &unk_2504CF780;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.MotionActivity.MovementType.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.MotionActivity.MovementType.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_233A87A38 + 4 * byte_233A8E1A0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_233A87A58 + 4 * byte_233A8E1A5[v4]))();
}

_BYTE *sub_233A87A38(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_233A87A58(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_233A87A60(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_233A87A68(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_233A87A70(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_233A87A78(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t getEnumTag for JournalingSuggestion.MotionActivity.MovementType.CodingKeys()
{
  return 0;
}

void *type metadata accessor for JournalingSuggestion.MotionActivity.MovementType.CodingKeys()
{
  return &unk_2504CF810;
}

char *specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 16 * a1 + 32);
    v6 = 16 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v9 = *(_QWORD *)(a5(0) - 8);
    v10 = *(unsigned __int8 *)(v9 + 80);
    v11 = *(_QWORD *)(v9 + 72);
    v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      return v14;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (assetProvider: InternalAssetContent.AssetProvider, assetType: @thick InternalAssetProvider.Type));
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

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
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x676E696E6E7572 && a2 == 0xE700000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E696B6C6177 && a2 == 0xE700000000000000
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x57676E696E6E7572 && a2 == 0xEE00676E696B6C61)
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

_QWORD *specialized JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.init(from:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  _QWORD *v30;
  char v31;
  char v32;
  char v33;

  v27 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys>);
  v25 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v29 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys>);
  v23 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys>);
  v4 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys>);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (uint64_t *)((char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys();
  v11 = (uint64_t)v30;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v11)
    goto LABEL_7;
  v21 = v4;
  v22 = v8;
  v12 = v29;
  v30 = a1;
  v13 = v10;
  v14 = KeyedDecodingContainer.allKeys.getter();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v18 = type metadata accessor for DecodingError();
    swift_allocError();
    v10 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *v10 = &unk_2504CF780;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(v10, *MEMORY[0x24BEE26D0], v18);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(_QWORD *, uint64_t))(v22 + 8))(v13, v7);
    a1 = v30;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    return v10;
  }
  v10 = (_QWORD *)*(unsigned __int8 *)(v14 + 32);
  if (*(_BYTE *)(v14 + 32))
  {
    if ((_DWORD)v10 == 1)
    {
      v32 = 1;
      lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys();
      v16 = v28;
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      v17 = v22;
      (*(void (**)(char *, uint64_t))(v23 + 8))(v16, v26);
    }
    else
    {
      v33 = 2;
      lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys();
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      v17 = v22;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v27);
    }
    swift_bridgeObjectRelease();
    (*(void (**)(_QWORD *, uint64_t))(v17 + 8))(v13, v15);
  }
  else
  {
    v31 = 0;
    lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v24);
    swift_bridgeObjectRelease();
    (*(void (**)(_QWORD *, uint64_t))(v22 + 8))(v13, v7);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v30);
  return v10;
}

uint64_t specialized JournalingSuggestion.MotionActivity.MovementType.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
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

uint64_t specialized JournalingSuggestion.MotionActivity.MovementType.CodingKeys.stringValue.getter()
{
  return 0x65756C6176;
}

unint64_t lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys)
  {
    result = MEMORY[0x23493AE0C](&protocol conformance descriptor for JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys, &unk_2504CF8F0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys)
  {
    result = MEMORY[0x23493AE0C](&protocol conformance descriptor for JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys, &unk_2504CF8F0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys)
  {
    result = MEMORY[0x23493AE0C](&protocol conformance descriptor for JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys, &unk_2504CF8F0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys)
  {
    result = MEMORY[0x23493AE0C](&protocol conformance descriptor for JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys, &unk_2504CF8F0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys)
  {
    result = MEMORY[0x23493AE0C](&protocol conformance descriptor for JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys, &unk_2504CF950);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys)
  {
    result = MEMORY[0x23493AE0C](&protocol conformance descriptor for JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys, &unk_2504CF950);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys)
  {
    result = MEMORY[0x23493AE0C](&protocol conformance descriptor for JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys, &unk_2504CF950);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys)
  {
    result = MEMORY[0x23493AE0C](&protocol conformance descriptor for JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys, &unk_2504CF930);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys)
  {
    result = MEMORY[0x23493AE0C](&protocol conformance descriptor for JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys, &unk_2504CF930);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys)
  {
    result = MEMORY[0x23493AE0C](&protocol conformance descriptor for JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys, &unk_2504CF930);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys)
  {
    result = MEMORY[0x23493AE0C](&protocol conformance descriptor for JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys, &unk_2504CF910);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys)
  {
    result = MEMORY[0x23493AE0C](&protocol conformance descriptor for JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys, &unk_2504CF910);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys)
  {
    result = MEMORY[0x23493AE0C](&protocol conformance descriptor for JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys, &unk_2504CF910);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys);
  }
  return result;
}

uint64_t outlined init with copy of JournalingSuggestion.ItemContent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for JournalingSuggestion.ItemContent(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #2 in closure #1 in JournalingSuggestion.content<A>(forType:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;

  v6 = *(_QWORD *)(v2 + 16);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = partial apply for closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:);
  return closure #2 in closure #1 in JournalingSuggestion.content<A>(forType:)(a1, a2, v6);
}

uint64_t sub_233A88820()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for JournalingSuggestion.ItemContent(0) - 8) + 80);
  v2 = (v1 + 56) & ~v1;
  swift_unknownObjectRelease();
  v3 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v0 + v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t outlined init with take of JournalingSuggestion.ItemContent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for JournalingSuggestion.ItemContent(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in closure #1 in JournalingSuggestion.content<A>(forType:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[4];
  v5 = v1[5];
  v6 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for JournalingSuggestion.ItemContent(0) - 8) + 80);
  v7 = v1[2];
  v8 = v1[3];
  v9 = v1[6];
  v10 = (uint64_t)v1 + ((v6 + 56) & ~v6);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = partial apply for closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:);
  return closure #1 in closure #1 in JournalingSuggestion.content<A>(forType:)(a1, v7, v8, v9, v10, v4, v5);
}

uint64_t outlined destroy of TaskPriority?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_233A889E8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzlTRTA(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 24);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = partial apply for closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:);
  return ((uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzlTRTu
                                                 + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzlTRTu))(a1, v4);
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.MotionActivity.MovementType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.MotionActivity.MovementType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_233A88B68 + 4 * byte_233A8E1AF[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_233A88B9C + 4 * byte_233A8E1AA[v4]))();
}

uint64_t sub_233A88B9C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_233A88BA4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x233A88BACLL);
  return result;
}

uint64_t sub_233A88BB8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x233A88BC0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_233A88BC4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_233A88BCC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *destructiveInjectEnumTag for JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void *type metadata accessor for JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys()
{
  return &unk_2504CF8F0;
}

void *type metadata accessor for JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys()
{
  return &unk_2504CF910;
}

void *type metadata accessor for JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys()
{
  return &unk_2504CF930;
}

void *type metadata accessor for JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys()
{
  return &unk_2504CF950;
}

uint64_t closure #1 in static JournalingSuggestion.Contact.getAssetLoader(for:inside:)(void (*a1)(uint64_t *, _QWORD), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v12[5];

  v9 = type metadata accessor for JournalingSuggestion.Contact(0);
  v12[3] = v9;
  v12[4] = (uint64_t)&protocol witness table for JournalingSuggestion.Contact;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  outlined init with copy of URL?(a5, (uint64_t)boxed_opaque_existential_1 + *(int *)(v9 + 20));
  *boxed_opaque_existential_1 = a3;
  boxed_opaque_existential_1[1] = a4;
  swift_bridgeObjectRetain();
  a1(v12, 0);
  return outlined destroy of JournalingSuggestionAsset?((uint64_t)v12);
}

uint64_t (*specialized static JournalingSuggestion.Contact.getAssetLoader(for:inside:)(void *a1))(void (*a1)(uint64_t *, _QWORD), uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _BYTE v28[16];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v6 = &v28[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v28[-v7];
  v9 = objc_msgSend(a1, sel_assetType);
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = v11;
  if (v10 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v12 == v13)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v15 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
      return 0;
  }
  v16 = specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x24BE68CA8]);
  if (v17)
  {
    v18 = v16;
    v19 = v17;
    assetImageContentToUrl(_:)(a1, v8);
    v24 = type metadata accessor for URL();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v8, 0, 1, v24);
    outlined init with take of URL?((uint64_t)v8, (uint64_t)v6);
    v25 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    v26 = swift_allocObject();
    *(_QWORD *)(v26 + 16) = v18;
    *(_QWORD *)(v26 + 24) = v19;
    outlined init with take of URL?((uint64_t)v6, v26 + v25);
    return partial apply for closure #1 in static JournalingSuggestion.Contact.getAssetLoader(for:inside:);
  }
  if (one-time initialization token for bridge != -1)
    swift_once();
  v20 = type metadata accessor for Logger();
  __swift_project_value_buffer(v20, (uint64_t)static Logger.bridge);
  v21 = Logger.logObject.getter();
  v22 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_233A5C000, v21, v22, "SuggestionContact asset should carry .contactName metadata", v23, 2u);
    MEMORY[0x23493AEA8](v23, -1, -1);
  }

  return 0;
}

uint64_t sub_233A89244()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?)
                                      - 8)
                          + 80);
  v2 = (v1 + 32) & ~v1;
  swift_bridgeObjectRelease();
  v3 = type metadata accessor for URL();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v0 + v2, 1, v3))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v2, v3);
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.Contact.getAssetLoader(for:inside:)(void (*a1)(uint64_t *, _QWORD), uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?)
                                      - 8)
                          + 80);
  return closure #1 in static JournalingSuggestion.Contact.getAssetLoader(for:inside:)(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), v2 + ((v5 + 32) & ~v5));
}

uint64_t outlined init with copy of URL?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t JournalingSuggestionsPicker.init(label:onCompletion:)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  _QWORD *v15;
  char v16;
  uint64_t v17;

  State.init(wrappedValue:)();
  *(_BYTE *)a6 = v16;
  *(_QWORD *)(a6 + 8) = v17;
  v13 = type metadata accessor for JournalingSuggestionsPicker(0, a4, a5, v12);
  result = a1();
  v15 = (_QWORD *)(a6 + *(int *)(v13 + 40));
  *v15 = a2;
  v15[1] = a3;
  return result;
}

uint64_t type metadata accessor for JournalingSuggestionsPicker(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for JournalingSuggestionsPicker);
}

uint64_t JournalingSuggestionsPicker.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
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
  unint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  void (*v30)(char *, char *, uint64_t);
  void (*v31)(char *, uint64_t);
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[2];

  v38 = a2;
  v4 = *(_QWORD *)(a1 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = MEMORY[0x24BDAC7A8](a1);
  v8 = *(_QWORD *)(v6 + 16);
  v7 = *(_QWORD *)(v6 + 24);
  v9 = type metadata accessor for Button();
  v37 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v34 = (char *)&v33 - v10;
  type metadata accessor for SuggestionPickerModifier();
  v11 = type metadata accessor for ModifiedContent();
  v36 = *(_QWORD *)(v11 - 8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v33 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v35 = (char *)&v33 - v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
  v15 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v8;
  *(_QWORD *)(v16 + 24) = v7;
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v16 + v15, (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  v39 = v8;
  v40 = v7;
  v41 = v2;
  v17 = v34;
  Button.init(action:label:)();
  v18 = JournalingSuggestionsPicker.$_isPresented.getter();
  v20 = v19;
  LOBYTE(v7) = v21;
  v22 = (uint64_t *)(v2 + *(int *)(a1 + 40));
  v23 = *v22;
  v24 = v22[1];
  v25 = MEMORY[0x23493AE0C](MEMORY[0x24BDF43B0], v9);
  v26 = v33;
  View.journalingSuggestionsPicker(isPresented:onCompletion:)(v18, v20, v7 & 1, v23, v24, v9, v25);
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v17, v9);
  v27 = lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type SuggestionPickerModifier and conformance SuggestionPickerModifier, (uint64_t (*)(uint64_t))type metadata accessor for SuggestionPickerModifier, (uint64_t)&protocol conformance descriptor for SuggestionPickerModifier);
  v42[0] = v25;
  v42[1] = v27;
  MEMORY[0x23493AE0C](MEMORY[0x24BDED308], v11, v42);
  v29 = v35;
  v28 = v36;
  v30 = *(void (**)(char *, char *, uint64_t))(v36 + 16);
  v30(v35, v26, v11);
  v31 = *(void (**)(char *, uint64_t))(v28 + 8);
  v31(v26, v11);
  v30(v38, v29, v11);
  return ((uint64_t (*)(char *, uint64_t))v31)(v29, v11);
}

uint64_t type metadata accessor for SuggestionPickerModifier()
{
  uint64_t result;

  result = type metadata singleton initialization cache for SuggestionPickerModifier;
  if (!type metadata singleton initialization cache for SuggestionPickerModifier)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t closure #1 in JournalingSuggestionsPicker.body.getter()
{
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for State<Bool>);
  State.wrappedValue.getter();
  State.wrappedValue.setter();
  return swift_release();
}

uint64_t sub_233A897AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = type metadata accessor for JournalingSuggestionsPicker(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80);
  v8 = v4 + ((v7 + 32) & ~v7);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v8 + *(int *)(v6 + 36), v5);
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in JournalingSuggestionsPicker.body.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  type metadata accessor for JournalingSuggestionsPicker(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  return closure #1 in JournalingSuggestionsPicker.body.getter();
}

uint64_t closure #2 in JournalingSuggestionsPicker.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v15;

  v6 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1 + *(int *)(type metadata accessor for JournalingSuggestionsPicker(0, v9, v10, v11) + 36);
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v13(v8, v12, a2);
  v13(a3, (uint64_t)v8, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, a2);
}

uint64_t partial apply for closure #2 in JournalingSuggestionsPicker.body.getter@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return closure #2 in JournalingSuggestionsPicker.body.getter(*(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 16), a1);
}

uint64_t JournalingSuggestionsPicker.$_isPresented.getter()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for State<Bool>);
  State.projectedValue.getter();
  return v1;
}

uint64_t View.journalingSuggestionsPicker(isPresented:onCompletion:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int *v14;
  uint64_t v15;
  uint64_t *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  _QWORD *v20;
  char *v21;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;

  v14 = (int *)type metadata accessor for SuggestionPickerModifier();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (uint64_t *)((char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v16 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ScenePhase>.Content);
  swift_storeEnumTagMultiPayload();
  v17 = (char *)v16 + v14[5];
  *(_QWORD *)v17 = a1;
  *((_QWORD *)v17 + 1) = a2;
  v17[16] = a3;
  v18 = (char *)v16 + v14[6];
  v24 = 2;
  swift_retain();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Bool?);
  State.init(wrappedValue:)();
  v19 = v26;
  *v18 = v25;
  *((_QWORD *)v18 + 1) = v19;
  v20 = (uint64_t *)((char *)v16 + v14[7]);
  *v20 = a4;
  v20[1] = a5;
  v21 = (char *)v16 + v14[8];
  *(_QWORD *)v21 = implicit closure #2 in implicit closure #1 in variable initialization expression of SuggestionPickerModifier._sheetManager;
  *((_QWORD *)v21 + 1) = 0;
  v21[16] = 0;
  UUID.init()();
  MEMORY[0x23493A3EC](v16, a6, v14, a7);
  return outlined destroy of SuggestionPickerModifier((uint64_t)v16);
}

uint64_t protocol witness for static View._viewListCount(inputs:) in conformance JournalingSuggestionsPicker<A>()
{
  return static View._viewListCount(inputs:)();
}

uint64_t JournalingSuggestionsPicker<>.init(_:onCompletion:)@<X0>(uint64_t a1@<X4>, uint64_t a2@<X5>, uint64_t a3@<X8>)
{
  uint64_t result;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  State.init(wrappedValue:)();
  result = Text.init(_:tableName:bundle:comment:)();
  *(_BYTE *)a3 = v10;
  *(_QWORD *)(a3 + 8) = v11;
  *(_QWORD *)(a3 + 16) = result;
  *(_QWORD *)(a3 + 24) = v7;
  *(_BYTE *)(a3 + 32) = v8 & 1;
  *(_QWORD *)(a3 + 40) = v9;
  *(_QWORD *)(a3 + 48) = a1;
  *(_QWORD *)(a3 + 56) = a2;
  return result;
}

__n128 JournalingSuggestionsPicker<>.init<A>(_:onCompletion:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  char v11;
  uint64_t v12;
  __n128 result;
  char v14;
  __n128 v15;
  uint64_t v16;
  char v17;
  uint64_t v18;

  State.init(wrappedValue:)();
  closure #1 in JournalingSuggestionsPicker<>.init<A>(_:onCompletion:)(a1, (uint64_t)&v15.n128_i64[1]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 8))(a1, a4);
  v10 = v16;
  v11 = v17;
  v12 = v18;
  result = v15;
  *(_BYTE *)a5 = v14;
  *(__n128 *)(a5 + 8) = result;
  *(_QWORD *)(a5 + 24) = v10;
  *(_BYTE *)(a5 + 32) = v11;
  *(_QWORD *)(a5 + 40) = v12;
  *(_QWORD *)(a5 + 48) = a2;
  *(_QWORD *)(a5 + 56) = a3;
  return result;
}

uint64_t closure #1 in JournalingSuggestionsPicker<>.init<A>(_:onCompletion:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;

  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *))(v4 + 16))((char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  result = Text.init<A>(_:)();
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v6;
  *(_BYTE *)(a2 + 16) = v7 & 1;
  *(_QWORD *)(a2 + 24) = v8;
  return result;
}

id implicit closure #2 in implicit closure #1 in variable initialization expression of SuggestionPickerModifier._sheetManager()
{
  if (one-time initialization token for shared != -1)
    swift_once();
  return (id)static SuggestionSheetManager.shared;
}

uint64_t SuggestionPickerModifier.body(content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (**v24)();
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
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
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v53;
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
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;

  v3 = v2;
  v68 = a2;
  v64 = type metadata accessor for ScenePhase();
  v66 = *(_QWORD *)(v64 - 8);
  MEMORY[0x24BDAC7A8](v64);
  v63 = (uint64_t)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for SuggestionPickerModifier();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = v6;
  v60 = v6;
  v9 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<SuggestionPickerModifier>, _AppearanceActionModifier>);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.onChange<A>(of:initial:_:)>>.0);
  v61 = *(_QWORD *)(v14 - 8);
  v62 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v57 = (char *)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.onChange<A>(of:initial:_:)>>.0, _AppearanceActionModifier>);
  MEMORY[0x24BDAC7A8](v59);
  v58 = (char *)&v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.onChange<A>(of:initial:_:)>>.0);
  v67 = *(_QWORD *)(v65 - 8);
  MEMORY[0x24BDAC7A8](v65);
  v70 = (char *)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of SuggestionPickerModifier(v3, (uint64_t)v10);
  v18 = *(unsigned __int8 *)(v7 + 80);
  v19 = ((v18 + 16) & ~v18) + v9;
  v20 = (v18 + 16) & ~v18;
  v21 = v18 | 7;
  v69 = v19;
  v22 = swift_allocObject();
  outlined init with take of SuggestionPickerModifier((uint64_t)v10, v22 + v20);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ViewModifier_Content<SuggestionPickerModifier>);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v13, a1, v23);
  v24 = (uint64_t (**)())&v13[*(int *)(v11 + 36)];
  *v24 = partial apply for closure #1 in SuggestionPickerModifier.body(content:);
  v24[1] = (uint64_t (*)())v22;
  v24[2] = 0;
  v24[3] = 0;
  v25 = v3 + *(int *)(v8 + 20);
  v26 = *(_QWORD *)v25;
  v27 = *(_QWORD *)(v25 + 8);
  LOBYTE(v25) = *(_BYTE *)(v25 + 16);
  v71 = v26;
  v72 = v27;
  LOBYTE(v73) = v25;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Binding<Bool>);
  MEMORY[0x23493A464](&v75, v28);
  LOBYTE(v71) = v75;
  outlined init with copy of SuggestionPickerModifier(v3, (uint64_t)v10);
  v29 = swift_allocObject();
  v54 = v20;
  outlined init with take of SuggestionPickerModifier((uint64_t)v10, v29 + v20);
  lazy protocol witness table accessor for type ModifiedContent<_ViewModifier_Content<SuggestionPickerModifier>, _AppearanceActionModifier> and conformance <> ModifiedContent<A, B>();
  v30 = v57;
  View.onChange<A>(of:initial:_:)();
  swift_release();
  outlined destroy of URL?((uint64_t)v13, &demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<SuggestionPickerModifier>, _AppearanceActionModifier>);
  v31 = v3;
  outlined init with copy of SuggestionPickerModifier(v3, (uint64_t)v10);
  v56 = v21;
  v32 = swift_allocObject();
  outlined init with take of SuggestionPickerModifier((uint64_t)v10, v32 + v20);
  v34 = v61;
  v33 = v62;
  v35 = (uint64_t)v58;
  (*(void (**)(char *, char *, uint64_t))(v61 + 16))(v58, v30, v62);
  v36 = v59;
  v37 = (_QWORD *)(v35 + *(int *)(v59 + 36));
  *v37 = 0;
  v37[1] = 0;
  v37[2] = partial apply for closure #3 in SuggestionPickerModifier.body(content:);
  v37[3] = v32;
  (*(void (**)(char *, uint64_t))(v34 + 8))(v30, v33);
  v38 = v63;
  v55 = v31;
  specialized Environment.wrappedValue.getter(v63);
  outlined init with copy of SuggestionPickerModifier(v31, (uint64_t)v10);
  v39 = swift_allocObject();
  v40 = v54;
  outlined init with take of SuggestionPickerModifier((uint64_t)v10, v39 + v54);
  v41 = lazy protocol witness table accessor for type ModifiedContent<<<opaque return type of View.onChange<A>(of:initial:_:)>>.0, _AppearanceActionModifier> and conformance <> ModifiedContent<A, B>();
  v42 = lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type ScenePhase and conformance ScenePhase, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB1F0], MEMORY[0x24BDEB200]);
  v43 = v64;
  View.onChange<A>(of:initial:_:)();
  swift_release();
  v44 = v43;
  (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v38, v43);
  outlined destroy of URL?(v35, &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.onChange<A>(of:initial:_:)>>.0, _AppearanceActionModifier>);
  v45 = v55;
  v46 = v55 + *(int *)(v60 + 24);
  v47 = *(_BYTE *)v46;
  v48 = *(_QWORD *)(v46 + 8);
  LOBYTE(v71) = v47;
  v72 = v48;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for State<Bool?>);
  State.wrappedValue.getter();
  outlined init with copy of SuggestionPickerModifier(v45, (uint64_t)v10);
  v49 = swift_allocObject();
  outlined init with take of SuggestionPickerModifier((uint64_t)v10, v49 + v40);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Bool?);
  v71 = v36;
  v72 = v44;
  v73 = v41;
  v74 = v42;
  swift_getOpaqueTypeConformance2();
  lazy protocol witness table accessor for type Bool? and conformance <A> A?();
  v50 = v65;
  v51 = v70;
  View.onChange<A>(of:initial:_:)();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v67 + 8))(v51, v50);
}

uint64_t closure #1 in SuggestionPickerModifier.body(content:)()
{
  _QWORD *v0;

  type metadata accessor for SuggestionPickerModifier();
  type metadata accessor for SuggestionSheetManager();
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type SuggestionSheetManager and conformance SuggestionSheetManager, (uint64_t (*)(uint64_t))type metadata accessor for SuggestionSheetManager, (uint64_t)&protocol conformance descriptor for SuggestionSheetManager);
  v0 = (_QWORD *)StateObject.wrappedValue.getter();
  (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x140))();

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for State<Bool?>);
  return State.wrappedValue.setter();
}

void SuggestionPickerModifier.updatePresentation()()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
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
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;

  v1 = v0;
  v2 = (int *)type metadata accessor for SuggestionPickerModifier();
  v3 = *((_QWORD *)v2 - 1);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = type metadata accessor for UUID();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v0 + v2[5];
  v10 = *(_QWORD *)v9;
  v11 = *(_QWORD *)(v9 + 8);
  LOBYTE(v9) = *(_BYTE *)(v9 + 16);
  v32 = v10;
  v33 = v11;
  v34 = v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Binding<Bool>);
  MEMORY[0x23493A464](&v35, v12);
  if (v35 == 1)
  {
    v31 = v5;
    if (one-time initialization token for picker != -1)
      swift_once();
    v30 = v3;
    v13 = type metadata accessor for Logger();
    __swift_project_value_buffer(v13, (uint64_t)static Logger.picker);
    v14 = Logger.logObject.getter();
    v15 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_233A5C000, v14, v15, "Presenting picker", v16, 2u);
      MEMORY[0x23493AEA8](v16, -1, -1);
    }

    type metadata accessor for SuggestionSheetManager();
    lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type SuggestionSheetManager and conformance SuggestionSheetManager, (uint64_t (*)(uint64_t))type metadata accessor for SuggestionSheetManager, (uint64_t)&protocol conformance descriptor for SuggestionSheetManager);
    v17 = (_QWORD *)StateObject.wrappedValue.getter();
    v18 = v31;
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v1 + v2[9], v31);
    v19 = (uint64_t *)(v1 + v2[7]);
    v20 = *v19;
    v21 = v19[1];
    outlined init with copy of SuggestionPickerModifier(v1, (uint64_t)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
    v22 = (*(unsigned __int8 *)(v30 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
    v23 = swift_allocObject();
    outlined init with take of SuggestionPickerModifier((uint64_t)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v23 + v22);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t (*)(), uint64_t))((*MEMORY[0x24BEE4EA0] & *v17) + 0x148))(v8, v20, v21, partial apply for closure #1 in SuggestionPickerModifier.updatePresentation(), v23);

    swift_release();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v18);
  }
  else
  {
    if (one-time initialization token for picker != -1)
      swift_once();
    v24 = type metadata accessor for Logger();
    __swift_project_value_buffer(v24, (uint64_t)static Logger.picker);
    v25 = Logger.logObject.getter();
    v26 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_233A5C000, v25, v26, "dismissing picker", v27, 2u);
      MEMORY[0x23493AEA8](v27, -1, -1);
    }

    type metadata accessor for SuggestionSheetManager();
    lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type SuggestionSheetManager and conformance SuggestionSheetManager, (uint64_t (*)(uint64_t))type metadata accessor for SuggestionSheetManager, (uint64_t)&protocol conformance descriptor for SuggestionSheetManager);
    v28 = (_QWORD *)StateObject.wrappedValue.getter();
    (*(void (**)(uint64_t, _QWORD))((*MEMORY[0x24BEE4EA0] & *v28) + 0x150))(v1 + v2[9], 0);

  }
}

void closure #3 in SuggestionPickerModifier.body(content:)(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = type metadata accessor for SuggestionPickerModifier();
  type metadata accessor for SuggestionSheetManager();
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type SuggestionSheetManager and conformance SuggestionSheetManager, (uint64_t (*)(uint64_t))type metadata accessor for SuggestionSheetManager, (uint64_t)&protocol conformance descriptor for SuggestionSheetManager);
  v3 = (_QWORD *)StateObject.wrappedValue.getter();
  (*(void (**)(uint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & *v3) + 0x150))(a1 + *(int *)(v2 + 36), 1);

}

void closure #4 in SuggestionPickerModifier.body(content:)(uint64_t a1)
{
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
  char v12;
  void (*v13)(char *, uint64_t);
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  _QWORD *v19;
  _QWORD v20[3];
  char v21;
  uint64_t v22;

  v2 = type metadata accessor for SuggestionPickerModifier();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for ScenePhase();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v20 - v10;
  specialized Environment.wrappedValue.getter((uint64_t)v20 - v10);
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v9, *MEMORY[0x24BDEB1E0], v5);
  v12 = static ScenePhase.== infix(_:_:)();
  v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v9, v5);
  v13(v11, v5);
  outlined init with copy of SuggestionPickerModifier(a1, (uint64_t)v4);
  if ((v12 & 1) != 0)
  {
    v14 = &v4[*(int *)(v2 + 20)];
    v15 = *(_QWORD *)v14;
    v16 = *((_QWORD *)v14 + 1);
    LOBYTE(v14) = v14[16];
    v20[1] = v15;
    v20[2] = v16;
    v21 = (char)v14;
    v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Binding<Bool>);
    MEMORY[0x23493A464](&v22, v17);
    v18 = v22;
    outlined destroy of SuggestionPickerModifier((uint64_t)v4);
    if ((v18 & 1) != 0)
    {
      type metadata accessor for SuggestionSheetManager();
      lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type SuggestionSheetManager and conformance SuggestionSheetManager, (uint64_t (*)(uint64_t))type metadata accessor for SuggestionSheetManager, (uint64_t)&protocol conformance descriptor for SuggestionSheetManager);
      v19 = (_QWORD *)StateObject.wrappedValue.getter();
      (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v19) + 0x158))();

    }
  }
  else
  {
    outlined destroy of SuggestionPickerModifier((uint64_t)v4);
  }
}

void closure #5 in SuggestionPickerModifier.body(content:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;

  v2 = type metadata accessor for SuggestionPickerModifier();
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = a1 + *(int *)(v3 + 24);
  v7 = *(_BYTE *)v6;
  v8 = *(_QWORD *)(v6 + 8);
  LOBYTE(v20) = v7;
  v21 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for State<Bool?>);
  State.wrappedValue.getter();
  v9 = v23;
  v10 = a1 + *(int *)(v2 + 20);
  v11 = *(_QWORD *)v10;
  v12 = *(_QWORD *)(v10 + 8);
  LOBYTE(v10) = *(_BYTE *)(v10 + 16);
  v20 = v11;
  v21 = v12;
  v22 = v10;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Binding<Bool>);
  MEMORY[0x23493A464](&v23);
  if (v9 == 2)
  {
    outlined init with copy of SuggestionPickerModifier(a1, (uint64_t)v5);
  }
  else
  {
    v14 = v23 ^ v9;
    outlined init with copy of SuggestionPickerModifier(a1, (uint64_t)v5);
    if ((v14 & 1) == 0)
    {
      outlined destroy of SuggestionPickerModifier((uint64_t)v5);
      return;
    }
  }
  v15 = &v5[*(int *)(v2 + 20)];
  v16 = *(_QWORD *)v15;
  v17 = *((_QWORD *)v15 + 1);
  LOBYTE(v15) = v15[16];
  v20 = v16;
  v21 = v17;
  v22 = (char)v15;
  MEMORY[0x23493A464](&v23, v13);
  v18 = v23;
  outlined destroy of SuggestionPickerModifier((uint64_t)v5);
  if ((v18 & 1) != 0)
    SuggestionPickerModifier.updatePresentation()();
}

uint64_t closure #1 in SuggestionPickerModifier.updatePresentation()()
{
  type metadata accessor for SuggestionPickerModifier();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Binding<Bool>);
  return Binding.wrappedValue.setter();
}

uint64_t sub_233A8AC34()
{
  return EnvironmentValues.scenePhase.getter();
}

uint64_t key path setter for EnvironmentValues.scenePhase : EnvironmentValues(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = type metadata accessor for ScenePhase();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return EnvironmentValues.scenePhase.setter();
}

uint64_t outlined destroy of SuggestionPickerModifier(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SuggestionPickerModifier();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t associated type witness table accessor for View.Body : View in JournalingSuggestionsPicker<A>()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata instantiation function for JournalingSuggestionsPicker()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata completion function for JournalingSuggestionsPicker()
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

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestionsPicker(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;

  v3 = a1;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = *(_QWORD *)(v5 + 64) + 7;
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v7 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    v10 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v10 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    a1[1] = a2[1];
    v11 = ((unint64_t)a1 + v6 + 16) & ~v6;
    v12 = ((unint64_t)a2 + v6 + 16) & ~v6;
    v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_retain();
    v13(v11, v12, v4);
    v14 = (_QWORD *)((v7 + v12) & 0xFFFFFFFFFFFFFFF8);
    v15 = v14[1];
    v16 = (_QWORD *)((v7 + v11) & 0xFFFFFFFFFFFFFFF8);
    *v16 = *v14;
    v16[1] = v15;
  }
  swift_retain();
  return v3;
}

uint64_t destroy for JournalingSuggestionsPicker(uint64_t a1, uint64_t a2)
{
  swift_release();
  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((a1
                                                                                            + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80)
                                                                                            + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
  return swift_release();
}

uint64_t initializeWithCopy for JournalingSuggestionsPicker(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (v6 + 16 + a1) & ~v6;
  v8 = (v6 + 16 + a2) & ~v6;
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  swift_retain();
  v9(v7, v8, v4);
  v10 = *(_QWORD *)(v5 + 64) + 7;
  v11 = (_QWORD *)((v10 + v7) & 0xFFFFFFFFFFFFFFF8);
  v12 = (_QWORD *)((v10 + v8) & 0xFFFFFFFFFFFFFFF8);
  v13 = v12[1];
  *v11 = *v12;
  v11[1] = v13;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for JournalingSuggestionsPicker(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = (v7 + 16 + a1) & ~v7;
  v9 = (v7 + 16 + a2) & ~v7;
  (*(void (**)(uint64_t, uint64_t))(v6 + 24))(v8, v9);
  v10 = *(_QWORD *)(v6 + 64) + 7;
  v11 = (_QWORD *)((v10 + v8) & 0xFFFFFFFFFFFFFFF8);
  v12 = (_QWORD *)((v10 + v9) & 0xFFFFFFFFFFFFFFF8);
  v13 = v12[1];
  *v11 = *v12;
  v11[1] = v13;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *initializeWithTake for JournalingSuggestionsPicker(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v6 = ((unint64_t)a1 + v5 + 16) & ~v5;
  v7 = ((unint64_t)a2 + v5 + 16) & ~v5;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v6, v7);
  *(_OWORD *)((*(_QWORD *)(v4 + 64) + 7 + v6) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)((*(_QWORD *)(v4 + 64) + 7 + v7) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t assignWithTake for JournalingSuggestionsPicker(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = (v7 + 16 + a1) & ~v7;
  v9 = (v7 + 16 + a2) & ~v7;
  (*(void (**)(uint64_t, uint64_t))(v6 + 40))(v8, v9);
  *(_OWORD *)((*(_QWORD *)(v6 + 64) + 7 + v8) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(_QWORD *)(v6 + 64) + 7 + v9) & 0xFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestionsPicker(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v13;
  unint64_t v14;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(unsigned __int8 *)(v4 + 80);
  v8 = *(_QWORD *)(v4 + 64) + 7;
  if (v6 >= a2)
  {
    v13 = (a1 + v7 + 16) & ~v7;
    if (v5 < 0x7FFFFFFF)
    {
      v14 = *(_QWORD *)((v8 + v13) & 0xFFFFFFFFFFFFF8);
      if (v14 >= 0xFFFFFFFF)
        LODWORD(v14) = -1;
      return (v14 + 1);
    }
    else
    {
      return (*(uint64_t (**)(uint64_t))(v4 + 48))(v13);
    }
  }
  else
  {
    if (((((v8 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v9 = 2;
    else
      v9 = a2 - v6 + 1;
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
    return ((uint64_t (*)(void))((char *)&loc_233A8B21C + 4 * byte_233A8EC40[v11]))();
  }
}

void storeEnumTagSinglePayload for JournalingSuggestionsPicker(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = *(unsigned __int8 *)(v5 + 80);
  if (v6 >= a3)
  {
    v10 = 0;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((*(_DWORD *)(v5 + 64) + 7 + (((_DWORD)v7 + 16) & ~(_DWORD)v7)) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v8 = a3 - v6 + 1;
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
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X14 }
  }
  if (((*(_DWORD *)(v5 + 64) + 7 + (((_DWORD)v7 + 16) & ~(_DWORD)v7)) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v11 = ~v6 + a2;
    bzero(a1, ((*(_QWORD *)(v5 + 64) + 7 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 16);
    *a1 = v11;
  }
  __asm { BR              X10 }
}

void sub_233A8B3B4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x233A8B430);
}

void sub_233A8B3BC(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x233A8B3C4);
  JUMPOUT(0x233A8B430);
}

void sub_233A8B408()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x233A8B430);
}

void sub_233A8B410()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x233A8B430);
}

uint64_t sub_233A8B418@<X0>(int a1@<W1>, unsigned int a2@<W2>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_WORD *)(v6 + v7) = 0;
  if (!a1)
    JUMPOUT(0x233A8B430);
  if (a2 < 0x7FFFFFFF)
  {
    if ((a1 & 0x80000000) == 0)
      JUMPOUT(0x233A8B42CLL);
    JUMPOUT(0x233A8B424);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))((v6 + v5 + 16) & a3);
}

uint64_t sub_233A8B448()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD v3[2];

  v0 = type metadata accessor for Button();
  type metadata accessor for SuggestionPickerModifier();
  v1 = type metadata accessor for ModifiedContent();
  v3[0] = MEMORY[0x23493AE0C](MEMORY[0x24BDF43B0], v0);
  v3[1] = lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type SuggestionPickerModifier and conformance SuggestionPickerModifier, (uint64_t (*)(uint64_t))type metadata accessor for SuggestionPickerModifier, (uint64_t)&protocol conformance descriptor for SuggestionPickerModifier);
  return MEMORY[0x23493AE0C](MEMORY[0x24BDED308], v1, v3);
}

uint64_t sub_233A8B4E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  type metadata accessor for SuggestionPickerModifier();
  v2 = type metadata accessor for ModifiedContent();
  v4[0] = v1;
  v4[1] = lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type SuggestionPickerModifier and conformance SuggestionPickerModifier, (uint64_t (*)(uint64_t))type metadata accessor for SuggestionPickerModifier, (uint64_t)&protocol conformance descriptor for SuggestionPickerModifier);
  return MEMORY[0x23493AE0C](MEMORY[0x24BDED308], v2, v4);
}

_QWORD *initializeBufferWithCopyOfBuffer for SuggestionPickerModifier(_QWORD *a1, _QWORD *a2, int *a3)
{
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
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  void *v23;
  char v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ScenePhase>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = type metadata accessor for ScenePhase();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = a3[5];
    v10 = a3[6];
    v11 = (char *)a1 + v9;
    v12 = (char *)a2 + v9;
    v13 = *((_QWORD *)v12 + 1);
    *(_QWORD *)v11 = *(_QWORD *)v12;
    *((_QWORD *)v11 + 1) = v13;
    v11[16] = v12[16];
    v14 = (char *)a1 + v10;
    v15 = (char *)a2 + v10;
    *v14 = *v15;
    *((_QWORD *)v14 + 1) = *((_QWORD *)v15 + 1);
    v16 = a3[7];
    v17 = a3[8];
    v18 = (_QWORD *)((char *)a1 + v16);
    v19 = (_QWORD *)((char *)a2 + v16);
    v20 = v19[1];
    *v18 = *v19;
    v18[1] = v20;
    v21 = (char *)a1 + v17;
    v22 = *(_QWORD *)((char *)a2 + v17);
    v23 = *(void **)((char *)a2 + v17 + 8);
    v24 = *((_BYTE *)a2 + v17 + 16);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    outlined copy of StateObject<SuggestionSheetManager>.Storage(v22, v23, v24);
    *(_QWORD *)v21 = v22;
    *((_QWORD *)v21 + 1) = v23;
    v21[16] = v24;
    v25 = a3[9];
    v26 = (char *)a1 + v25;
    v27 = (char *)a2 + v25;
    v28 = type metadata accessor for UUID();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(v26, v27, v28);
  }
  return a1;
}

id outlined copy of StateObject<SuggestionSheetManager>.Storage(uint64_t a1, void *a2, char a3)
{
  if ((a3 & 1) != 0)
    return a2;
  else
    return (id)swift_retain();
}

uint64_t destroy for SuggestionPickerModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ScenePhase>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = type metadata accessor for ScenePhase();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  outlined consume of StateObject<SuggestionSheetManager>.Storage(*(_QWORD *)(a1 + *(int *)(a2 + 32)), *(void **)(a1 + *(int *)(a2 + 32) + 8), *(_BYTE *)(a1 + *(int *)(a2 + 32) + 16));
  v5 = a1 + *(int *)(a2 + 36);
  v6 = type metadata accessor for UUID();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

void outlined consume of StateObject<SuggestionSheetManager>.Storage(uint64_t a1, void *a2, char a3)
{
  if ((a3 & 1) != 0)

  else
    swift_release();
}

_QWORD *initializeWithCopy for SuggestionPickerModifier(_QWORD *a1, _QWORD *a2, int *a3)
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
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void *v21;
  char v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ScenePhase>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = type metadata accessor for ScenePhase();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = a3[5];
  v8 = a3[6];
  v9 = (char *)a1 + v7;
  v10 = (char *)a2 + v7;
  v11 = *((_QWORD *)v10 + 1);
  *(_QWORD *)v9 = *(_QWORD *)v10;
  *((_QWORD *)v9 + 1) = v11;
  v9[16] = v10[16];
  v12 = (char *)a1 + v8;
  v13 = (char *)a2 + v8;
  *v12 = *v13;
  *((_QWORD *)v12 + 1) = *((_QWORD *)v13 + 1);
  v14 = a3[7];
  v15 = a3[8];
  v16 = (_QWORD *)((char *)a1 + v14);
  v17 = (_QWORD *)((char *)a2 + v14);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  v19 = (char *)a1 + v15;
  v20 = *(_QWORD *)((char *)a2 + v15);
  v21 = *(void **)((char *)a2 + v15 + 8);
  v22 = *((_BYTE *)a2 + v15 + 16);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  outlined copy of StateObject<SuggestionSheetManager>.Storage(v20, v21, v22);
  *(_QWORD *)v19 = v20;
  *((_QWORD *)v19 + 1) = v21;
  v19[16] = v22;
  v23 = a3[9];
  v24 = (char *)a1 + v23;
  v25 = (char *)a2 + v23;
  v26 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v24, v25, v26);
  return a1;
}

_QWORD *assignWithCopy for SuggestionPickerModifier(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;

  if (a1 != a2)
  {
    outlined destroy of URL?((uint64_t)a1, &demangling cache variable for type metadata for Environment<ScenePhase>.Content);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ScenePhase>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = type metadata accessor for ScenePhase();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  *(_QWORD *)((char *)a1 + v7) = *(_QWORD *)((char *)a2 + v7);
  swift_retain();
  swift_release();
  *((_QWORD *)v8 + 1) = *((_QWORD *)v9 + 1);
  swift_retain();
  swift_release();
  v8[16] = v9[16];
  v10 = a3[6];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  *v11 = *v12;
  *((_QWORD *)v11 + 1) = *((_QWORD *)v12 + 1);
  swift_retain();
  swift_release();
  v13 = a3[7];
  v14 = (_QWORD *)((char *)a1 + v13);
  v15 = (_QWORD *)((char *)a2 + v13);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  swift_retain();
  swift_release();
  v17 = a3[8];
  v18 = (char *)a1 + v17;
  v19 = (char *)a2 + v17;
  v20 = *(_QWORD *)v19;
  v21 = (void *)*((_QWORD *)v19 + 1);
  LOBYTE(v9) = v19[16];
  outlined copy of StateObject<SuggestionSheetManager>.Storage(*(_QWORD *)v19, v21, (char)v9);
  v22 = *(_QWORD *)v18;
  v23 = (void *)*((_QWORD *)v18 + 1);
  v24 = v18[16];
  *(_QWORD *)v18 = v20;
  *((_QWORD *)v18 + 1) = v21;
  v18[16] = (char)v9;
  outlined consume of StateObject<SuggestionSheetManager>.Storage(v22, v23, v24);
  v25 = a3[9];
  v26 = (char *)a1 + v25;
  v27 = (char *)a2 + v25;
  v28 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 24))(v26, v27, v28);
  return a1;
}

char *initializeWithTake for SuggestionPickerModifier(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ScenePhase>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = type metadata accessor for ScenePhase();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[5];
  v9 = a3[6];
  v10 = &a1[v8];
  v11 = &a2[v8];
  v12 = *(_OWORD *)v11;
  v10[16] = v11[16];
  *(_OWORD *)v10 = v12;
  *(_OWORD *)&a1[v9] = *(_OWORD *)&a2[v9];
  v13 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  v14 = &a1[v13];
  v15 = &a2[v13];
  *(_OWORD *)v14 = *(_OWORD *)v15;
  v14[16] = v15[16];
  v16 = a3[9];
  v17 = &a1[v16];
  v18 = &a2[v16];
  v19 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
  return a1;
}

char *assignWithTake for SuggestionPickerModifier(char *a1, char *a2, int *a3)
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
  char *v15;
  char *v16;
  char v17;
  uint64_t v18;
  void *v19;
  char v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;

  if (a1 != a2)
  {
    outlined destroy of URL?((uint64_t)a1, &demangling cache variable for type metadata for Environment<ScenePhase>.Content);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ScenePhase>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = type metadata accessor for ScenePhase();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  *(_QWORD *)&a1[v8] = *(_QWORD *)&a2[v8];
  swift_release();
  *((_QWORD *)v9 + 1) = *((_QWORD *)v10 + 1);
  swift_release();
  v9[16] = v10[16];
  v11 = a3[6];
  v12 = &a1[v11];
  v13 = &a2[v11];
  *v12 = *v13;
  *((_QWORD *)v12 + 1) = *((_QWORD *)v13 + 1);
  swift_release();
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  swift_release();
  v14 = a3[8];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = v16[16];
  v18 = *(_QWORD *)v15;
  v19 = (void *)*((_QWORD *)v15 + 1);
  v20 = v15[16];
  *(_OWORD *)v15 = *(_OWORD *)v16;
  v15[16] = v17;
  outlined consume of StateObject<SuggestionSheetManager>.Storage(v18, v19, v20);
  v21 = a3[9];
  v22 = &a1[v21];
  v23 = &a2[v21];
  v24 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 40))(v22, v23, v24);
  return a1;
}

uint64_t getEnumTagSinglePayload for SuggestionPickerModifier()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_233A8BDCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ScenePhase>);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v8 = type metadata accessor for UUID();
    v10 = a1 + *(int *)(a3 + 36);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t storeEnumTagSinglePayload for SuggestionPickerModifier()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233A8BE88(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ScenePhase>);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
      return result;
    }
    v10 = type metadata accessor for UUID();
    v12 = a1 + *(int *)(a4 + 36);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void type metadata completion function for SuggestionPickerModifier()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for Environment<ScenePhase>.Content();
  if (v0 <= 0x3F)
  {
    type metadata accessor for UUID();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void type metadata accessor for Environment<ScenePhase>.Content()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for Environment<ScenePhase>.Content)
  {
    type metadata accessor for ScenePhase();
    v0 = type metadata accessor for Environment.Content();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Environment<ScenePhase>.Content);
  }
}

uint64_t associated type witness table accessor for ViewModifier.Body : View in SuggestionPickerModifier()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t protocol witness for static ViewModifier._viewListCount(inputs:body:) in conformance SuggestionPickerModifier()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t outlined init with copy of SuggestionPickerModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SuggestionPickerModifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with take of SuggestionPickerModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SuggestionPickerModifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in SuggestionPickerModifier.body(content:)()
{
  return partial apply for closure #1 in SuggestionPickerModifier.body(content:)((uint64_t (*)(uint64_t))closure #1 in SuggestionPickerModifier.body(content:));
}

void partial apply for closure #2 in SuggestionPickerModifier.body(content:)()
{
  type metadata accessor for SuggestionPickerModifier();
  SuggestionPickerModifier.updatePresentation()();
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<_ViewModifier_Content<SuggestionPickerModifier>, _AppearanceActionModifier> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<_ViewModifier_Content<SuggestionPickerModifier>, _AppearanceActionModifier> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<_ViewModifier_Content<SuggestionPickerModifier>, _AppearanceActionModifier> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<SuggestionPickerModifier>, _AppearanceActionModifier>);
    v2[0] = lazy protocol witness table accessor for type _ViewModifier_Content<SuggestionPickerModifier> and conformance _ViewModifier_Content<A>();
    v2[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x23493AE0C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<_ViewModifier_Content<SuggestionPickerModifier>, _AppearanceActionModifier> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type _ViewModifier_Content<SuggestionPickerModifier> and conformance _ViewModifier_Content<A>()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type _ViewModifier_Content<SuggestionPickerModifier> and conformance _ViewModifier_Content<A>;
  if (!lazy protocol witness table cache variable for type _ViewModifier_Content<SuggestionPickerModifier> and conformance _ViewModifier_Content<A>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for _ViewModifier_Content<SuggestionPickerModifier>);
    result = MEMORY[0x23493AE0C](MEMORY[0x24BDEFB78], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _ViewModifier_Content<SuggestionPickerModifier> and conformance _ViewModifier_Content<A>);
  }
  return result;
}

uint64_t partial apply for closure #3 in SuggestionPickerModifier.body(content:)()
{
  return partial apply for closure #1 in SuggestionPickerModifier.body(content:)((uint64_t (*)(uint64_t))closure #3 in SuggestionPickerModifier.body(content:));
}

uint64_t specialized Environment.wrappedValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  os_log_type_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[3];
  uint64_t v20;

  v2 = v1;
  v4 = type metadata accessor for EnvironmentValues();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ScenePhase>.Content);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of Environment<ScenePhase>.Content(v2, (uint64_t)v10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = type metadata accessor for ScenePhase();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = static os_log_type_t.fault.getter();
    v14 = static Log.runtimeIssuesLog.getter();
    v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v19[1] = a1;
      v18 = v17;
      v20 = v17;
      *(_DWORD *)v16 = 136315138;
      v19[2] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0x616850656E656353, 0xEA00000000006573, &v20);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_233A5C000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23493AEA8](v18, -1, -1);
      MEMORY[0x23493AEA8](v16, -1, -1);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t partial apply for closure #4 in SuggestionPickerModifier.body(content:)()
{
  return partial apply for closure #1 in SuggestionPickerModifier.body(content:)((uint64_t (*)(uint64_t))closure #4 in SuggestionPickerModifier.body(content:));
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<<<opaque return type of View.onChange<A>(of:initial:_:)>>.0, _AppearanceActionModifier> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[6];

  result = lazy protocol witness table cache variable for type ModifiedContent<<<opaque return type of View.onChange<A>(of:initial:_:)>>.0, _AppearanceActionModifier> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<<<opaque return type of View.onChange<A>(of:initial:_:)>>.0, _AppearanceActionModifier> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.onChange<A>(of:initial:_:)>>.0, _AppearanceActionModifier>);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<SuggestionPickerModifier>, _AppearanceActionModifier>);
    v3 = lazy protocol witness table accessor for type ModifiedContent<_ViewModifier_Content<SuggestionPickerModifier>, _AppearanceActionModifier> and conformance <> ModifiedContent<A, B>();
    v4[2] = v2;
    v4[3] = MEMORY[0x24BEE1328];
    v4[4] = v3;
    v4[5] = MEMORY[0x24BEE1340];
    v4[0] = swift_getOpaqueTypeConformance2();
    v4[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x23493AE0C](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<<<opaque return type of View.onChange<A>(of:initial:_:)>>.0, _AppearanceActionModifier> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t partial apply for closure #5 in SuggestionPickerModifier.body(content:)()
{
  return partial apply for closure #1 in SuggestionPickerModifier.body(content:)((uint64_t (*)(uint64_t))closure #5 in SuggestionPickerModifier.body(content:));
}

unint64_t lazy protocol witness table accessor for type Bool? and conformance <A> A?()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = lazy protocol witness table cache variable for type Bool? and conformance <A> A?;
  if (!lazy protocol witness table cache variable for type Bool? and conformance <A> A?)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Bool?);
    v2 = MEMORY[0x24BEE1340];
    result = MEMORY[0x23493AE0C](MEMORY[0x24BEE4AB8], v1, &v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Bool? and conformance <A> A?);
  }
  return result;
}

uint64_t objectdestroy_4Tm()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for SuggestionPickerModifier();
  v2 = (*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ScenePhase>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = type metadata accessor for ScenePhase();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v0 + v2, v4);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  outlined consume of StateObject<SuggestionSheetManager>.Storage(*(_QWORD *)(v3 + *(int *)(v1 + 32)), *(void **)(v3 + *(int *)(v1 + 32) + 8), *(_BYTE *)(v3 + *(int *)(v1 + 32) + 16));
  v5 = v3 + *(int *)(v1 + 36);
  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in SuggestionPickerModifier.updatePresentation()()
{
  return partial apply for closure #1 in SuggestionPickerModifier.body(content:)((uint64_t (*)(uint64_t))closure #1 in SuggestionPickerModifier.updatePresentation());
}

uint64_t partial apply for closure #1 in SuggestionPickerModifier.body(content:)(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SuggestionPickerModifier() - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
}

uint64_t outlined init with copy of Environment<ScenePhase>.Content(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ScenePhase>.Content);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x23493AD94](a1, v6, a5);
}

uint64_t sub_233A8C738()
{
  uint64_t (*v0)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for <<opaque return type of View.onChange<A>(of:initial:_:)>>.0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Bool?);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.onChange<A>(of:initial:_:)>>.0, _AppearanceActionModifier>);
  type metadata accessor for ScenePhase();
  v0 = (uint64_t (*)(uint64_t))MEMORY[0x24BDEB1F0];
  lazy protocol witness table accessor for type ModifiedContent<<<opaque return type of View.onChange<A>(of:initial:_:)>>.0, _AppearanceActionModifier> and conformance <> ModifiedContent<A, B>();
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type ScenePhase and conformance ScenePhase, v0, MEMORY[0x24BDEB200]);
  swift_getOpaqueTypeConformance2();
  lazy protocol witness table accessor for type Bool? and conformance <A> A?();
  return swift_getOpaqueTypeConformance2();
}

uint64_t DateInterval.init(start:end:)()
{
  return MEMORY[0x24BDCB838]();
}

uint64_t type metadata accessor for DateInterval()
{
  return MEMORY[0x24BDCB878]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t URL.pathExtension.getter()
{
  return MEMORY[0x24BDCD810]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
  MEMORY[0x24BDCD8D0](retstr);
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

uint64_t static Date.distantPast.getter()
{
  return MEMORY[0x24BDCE2D8]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x24BDCE5D8]();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x24BDCE9B0]();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)MEMORY[0x24BDCE9D0]();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x24BDCEA58]();
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

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t static ScenePhase.== infix(_:_:)()
{
  return MEMORY[0x24BDEB1D8]();
}

uint64_t type metadata accessor for ScenePhase()
{
  return MEMORY[0x24BDEB1F0]();
}

uint64_t type metadata accessor for Environment.Content()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t StateObject.wrappedValue.getter()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t static ViewModifier._makeView(modifier:inputs:body:)()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t static ViewModifier._makeViewList(modifier:inputs:body:)()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t static ViewModifier._viewListCount(inputs:body:)()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t type metadata accessor for ModifiedContent()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t EnvironmentValues.scenePhase.getter()
{
  return MEMORY[0x24BDEDEC0]();
}

uint64_t EnvironmentValues.scenePhase.setter()
{
  return MEMORY[0x24BDEDEC8]();
}

uint64_t EnvironmentValues.init()()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t Text.init(_:tableName:bundle:comment:)()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t Text.init<A>(_:)()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t static View._makeView(view:inputs:)()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t static View._viewListCount(inputs:)()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t View.modifier<A>(_:)()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t View.onChange<A>(of:initial:_:)()
{
  return MEMORY[0x24BDF3900]();
}

uint64_t Color.init(_:)()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t Image.init(uiImage:)()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t State.init(wrappedValue:)()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t State.wrappedValue.getter()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t State.wrappedValue.setter()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t State.projectedValue.getter()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t Button.init(action:label:)()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t type metadata accessor for Button()
{
  return MEMORY[0x24BDF4398]();
}

uint64_t Binding.wrappedValue.getter()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t Binding.wrappedValue.setter()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t Gradient.init(colors:)()
{
  return MEMORY[0x24BDF4D08]();
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

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x24BEE0980]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x24BEE09F0]();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0;
  void *v1;
  Swift::String result;

  v0 = MEMORY[0x24BEE0A08]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return MEMORY[0x24BEE0AD8]();
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

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t String.UTF8View._foreignDistance(from:to:)()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t String.init<A>(_:)()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x24BEE1120]();
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

uint64_t type metadata accessor for CheckedContinuation()
{
  return MEMORY[0x24BEE6830]();
}

uint64_t TaskGroup.makeAsyncIterator()()
{
  return MEMORY[0x24BEE6860]();
}

uint64_t type metadata accessor for TaskGroup()
{
  return MEMORY[0x24BEE68B8]();
}

uint64_t dispatch thunk of AsyncIteratorProtocol.next()()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t static MainActor.shared.getter()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t type metadata accessor for MainActor()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t static TaskPriority.high.getter()
{
  return MEMORY[0x24BEE6970]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t AsyncSequence.reduce<A>(into:_:)()
{
  return MEMORY[0x24BEE6C40]();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t HKStateOfMind.init(date:kind:valence:labels:associations:metadata:)()
{
  return MEMORY[0x24BDD2508]();
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

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x24BEE57A0]();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x24BEE5BB8](seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t NSObject.hashValue.getter()
{
  return MEMORY[0x24BEE5BD0]();
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

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t __CocoaSet.startIndex.getter()
{
  return MEMORY[0x24BEE22F8]();
}

uint64_t static __CocoaSet.Index.== infix(_:_:)()
{
  return MEMORY[0x24BEE2318]();
}

uint64_t __CocoaSet.Index.age.getter()
{
  return MEMORY[0x24BEE2320]();
}

uint64_t __CocoaSet.Index.element.getter()
{
  return MEMORY[0x24BEE2328]();
}

uint64_t __CocoaSet.element(at:)()
{
  return MEMORY[0x24BEE2348]();
}

uint64_t __CocoaSet.endIndex.getter()
{
  return MEMORY[0x24BEE2368]();
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

uint64_t withTaskGroup<A, B>(of:returning:isolation:body:)()
{
  return MEMORY[0x24BEE6D68]();
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

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t _SwiftNewtypeWrapper<>._toCustomAnyHashable()()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return MEMORY[0x24BEE32C0]();
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

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t withCheckedThrowingContinuation<A>(isolation:function:_:)()
{
  return MEMORY[0x24BEE70E0]();
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

uint64_t type metadata accessor for Result()
{
  return MEMORY[0x24BEE4408]();
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

NSData *__cdecl UIImageHEICRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BEBE2D0](image);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BEBE2E0](image);
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x24BEE4C28]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x24BEE4C68]();
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

