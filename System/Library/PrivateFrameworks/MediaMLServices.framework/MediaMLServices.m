uint64_t thunk for @escaping @callee_guaranteed (@unowned Bool) -> ()(uint64_t a1)
{
  char v1;
  void (*v3)(_QWORD);

  v3 = *(void (**)(_QWORD))(a1 + 32);
  swift_retain();
  v1 = _convertObjCBoolToBool(_:)();
  v3(v1 & 1);
  return swift_release();
}

uint64_t partial apply for closure #2 in _MLServiceS.init(nameOfModel:)(char a1)
{
  return closure #2 in _MLServiceS.init(nameOfModel:)(a1 & 1);
}

uint64_t closure #2 in _MLServiceS.init(nameOfModel:)(unsigned int a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t *v15;
  uint64_t *v16;
  _BYTE **v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t *v29;
  uint32_t v30;
  uint64_t v31;
  int v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE *v38;
  uint64_t v39;
  uint32_t v40;
  char v41;

  v22 = a1;
  v41 = 0;
  v21 = 0;
  v31 = 0;
  v26 = type metadata accessor for Logger();
  v25 = *(_QWORD *)(v26 - 8);
  v23 = (*(_QWORD *)(v25 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1 = (char *)&v8 - v23;
  v24 = (char *)&v8 - v23;
  v41 = MEMORY[0x24BDAC7A8](v22) & 1;
  v2 = _MLServiceS.logger.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v1, v2, v26);
  v33 = Logger.logObject.getter();
  v32 = static os_log_type_t.debug.getter();
  v29 = &v39;
  v39 = 2;
  v27 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  v28 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v30 = v40;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v34 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v33, (os_log_type_t)v32))
  {
    v3 = v21;
    v11 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v10 = 0;
    v12 = createStorage<A>(capacity:type:)(0);
    v13 = createStorage<A>(capacity:type:)(v10);
    v17 = &v38;
    v38 = v11;
    v18 = &v37;
    v37 = v12;
    v15 = &v36;
    v36 = v13;
    v14 = 0;
    serialize(_:at:)(0, &v38);
    serialize(_:at:)(v14, v17);
    v35 = v34;
    v16 = &v8;
    MEMORY[0x24BDAC7A8](&v8);
    v4 = v18;
    v5 = &v8 - 6;
    v19 = &v8 - 6;
    v5[2] = (uint64_t)v17;
    v5[3] = (uint64_t)v4;
    v5[4] = v6;
    v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    if (v3)
    {
      __break(1u);
    }
    else
    {
      _os_log_impl(&dword_241581000, v33, (os_log_type_t)v32, "Server started", v11, v30);
      v8 = 0;
      destroyStorage<A>(_:count:)(v12, 0, v9);
      destroyStorage<A>(_:count:)(v13, v8, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x242696CA8](v11, MEMORY[0x24BEE4260]);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v24, v26);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *a1;
  if (*a1 < 0)
  {
    v2 = MEMORY[0x242696FE4]((char *)a1 + (int)*a1, -(*a1 >> 32), 0);
    *a1 = v2;
    return v2;
  }
  return v4;
}

unint64_t lazy protocol witness table accessor for type UInt32 and conformance UInt32()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type UInt32 and conformance UInt32;
  if (!lazy protocol witness table cache variable for type UInt32 and conformance UInt32)
  {
    v0 = MEMORY[0x242696FFC](MEMORY[0x24BEE4540], MEMORY[0x24BEE44F0]);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type UInt32 and conformance UInt32);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type UInt32 and conformance UInt32;
  if (!lazy protocol witness table cache variable for type UInt32 and conformance UInt32)
  {
    v0 = MEMORY[0x242696FFC](MEMORY[0x24BEE4518], MEMORY[0x24BEE44F0]);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type UInt32 and conformance UInt32);
    return v0;
  }
  return v2;
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    v0 = MEMORY[0x242696FFC](MEMORY[0x24BEE17B0], MEMORY[0x24BEE1768]);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    v0 = MEMORY[0x242696FFC](MEMORY[0x24BEE17C8], MEMORY[0x24BEE1768]);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
    return v0;
  }
  return v2;
}

uint64_t _MLServiceS.logger.unsafeMutableAddressor()
{
  uint64_t v0;

  if (one-time initialization token for logger != -1)
    swift_once();
  v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)static _MLServiceS.logger);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a2;
  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
    return *(_QWORD *)a2;
  return v3;
}

id _MLServiceS.init(nameOfModel:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  char *v10;
  Swift::String v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v27;
  id v28;
  id v29;
  objc_class *ObjectType;
  const void *v31;
  id v32;
  char *v33;
  objc_super v34;
  uint64_t v35;
  int v36;
  int v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  uint64_t (*v40)(char);
  uint64_t v41;
  uint64_t v42;
  uint64_t aBlock;
  int v44;
  int v45;
  uint64_t (*v46)(uint64_t, void *);
  void *v47;
  uint64_t (*v48)(void *);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;

  ObjectType = (objc_class *)swift_getObjectType();
  v50 = a1;
  v51 = a2;
  v3 = v2;
  v4 = v2;
  v5 = v2;
  v6 = v2;
  v7 = v2;
  v8 = v2;
  v9 = v2;
  v52 = v2;
  swift_bridgeObjectRetain();
  v10 = &v33[OBJC_IVAR____MLServiceS_modelName];
  *(_QWORD *)v10 = a1;
  *((_QWORD *)v10 + 1) = a2;

  type metadata accessor for NSXPCConnection();
  v11 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.mediamlxpc", 0x14uLL, 1);
  *(NSXPCConnection *)&v33[OBJC_IVAR____MLServiceS_connection] = NSXPCConnection.__allocating_init(serviceName:)(v11);

  v28 = *(id *)&v33[OBJC_IVAR____MLServiceS_connection];
  v12 = v28;
  type metadata accessor for NSXPCInterface();
  v13 = &unk_257139968;
  v27 = @nonobjc NSXPCInterface.__allocating_init(with:)(&unk_257139968);
  objc_msgSend(v28, sel_setRemoteObjectInterface_);

  v29 = *(id *)&v33[OBJC_IVAR____MLServiceS_connection];
  v14 = v29;
  objc_msgSend(v29, sel_resume);

  v32 = *(id *)&v33[OBJC_IVAR____MLServiceS_connection];
  v15 = v32;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = ObjectType;
  v48 = partial apply for closure #1 in _MLServiceS.init(nameOfModel:);
  v49 = v16;
  aBlock = MEMORY[0x24BDAC760];
  v44 = 1107296256;
  v45 = 0;
  v46 = thunk for @escaping @callee_guaranteed (@guaranteed Error) -> ();
  v47 = &block_descriptor;
  v31 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v32, sel_synchronousRemoteObjectProxyWithErrorHandler_, v31);
  _Block_release(v31);

  _bridgeAnyObjectToAny(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MLServerProtocol);
  if ((swift_dynamicCast() & 1) != 0)
    v24 = v42;
  else
    v24 = 0;
  *(_QWORD *)&v33[OBJC_IVAR____MLServiceS_service] = v24;
  swift_unknownObjectRelease();

  v23 = *(void **)&v33[OBJC_IVAR____MLServiceS_service];
  swift_unknownObjectRetain();
  if (v23)
  {
    v22 = v23;
  }
  else
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  swift_getObjectType();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = ObjectType;
  v40 = partial apply for closure #2 in _MLServiceS.init(nameOfModel:);
  v41 = v17;
  v35 = MEMORY[0x24BDAC760];
  v36 = 1107296256;
  v37 = 0;
  v38 = thunk for @escaping @callee_guaranteed (@unowned Bool) -> ();
  v39 = &block_descriptor_6;
  v20 = _Block_copy(&v35);
  swift_release();
  objc_msgSend(v22, sel_wakeRemoteServiceWith_, v20);
  _Block_release(v20);
  swift_unknownObjectRelease();

  v34.receiver = v52;
  v34.super_class = ObjectType;
  v21 = objc_msgSendSuper2(&v34, sel_init);
  v18 = v21;
  v52 = v21;
  swift_bridgeObjectRelease();

  return v21;
}

unint64_t type metadata accessor for NSXPCConnection()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = lazy cache variable for type metadata for NSXPCConnection;
  if (!lazy cache variable for type metadata for NSXPCConnection)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for NSXPCConnection);
    return ObjCClassMetadata;
  }
  return v2;
}

NSXPCConnection __swiftcall NSXPCConnection.__allocating_init(serviceName:)(Swift::String serviceName)
{
  id v1;

  v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (NSXPCConnection)@nonobjc NSXPCConnection.init(serviceName:)();
}

id @nonobjc NSXPCConnection.init(serviceName:)()
{
  id v1;
  id v2;
  id v3;

  v2 = (id)MEMORY[0x242696BB8]();
  v3 = objc_msgSend(v1, sel_initWithServiceName_);

  swift_bridgeObjectRelease();
  return v3;
}

unint64_t type metadata accessor for NSXPCInterface()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = lazy cache variable for type metadata for NSXPCInterface;
  if (!lazy cache variable for type metadata for NSXPCInterface)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for NSXPCInterface);
    return ObjCClassMetadata;
  }
  return v2;
}

id @nonobjc NSXPCInterface.__allocating_init(with:)(void *a1)
{
  id v3;

  v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_interfaceWithProtocol_, a1);

  return v3;
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t one-time initialization function for logger()
{
  uint64_t v1;

  v1 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v1, logger);
  __swift_project_value_buffer(v1, (uint64_t)logger);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.MediaML", 0x11uLL, 1);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("DataValidation", 0xEuLL, 1);
  return Logger.init(subsystem:category:)();
}

{
  uint64_t v1;

  v1 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v1, static _MLServiceS.logger);
  __swift_project_value_buffer(v1, (uint64_t)static _MLServiceS.logger);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.MediaMLServices", 0x19uLL, 1);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("MLService", 9uLL, 1);
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

Swift::Bool __swiftcall checkValidInterfaceType(data:)(Swift::OpaquePointer data)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  _QWORD v9[4];
  char v10;
  void *rawValue;

  rawValue = data._rawValue;
  v10 = 0;
  kMediaML_interfaceType.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  MEMORY[0x242696BAC](v9);
  outlined destroy of String();
  if (v9[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v6 = v8;
      v7 = 0;
    }
    else
    {
      v6 = 0;
      v7 = 1;
    }
    v4 = v6;
    v5 = v7;
  }
  else
  {
    outlined destroy of Any?((uint64_t)v9);
    v4 = 0;
    v5 = 1;
  }
  if ((v5 & 1) != 0)
    return 0;
  if (v4 != *kMediaML_InterfaceType_WiFi.unsafeMutableAddressor()
    && v4 != *kMediaML_InterfaceType_Cellular.unsafeMutableAddressor())
  {
    return 0;
  }
  v10 = 1;
  return 1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of String()
{
  swift_bridgeObjectRelease();
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 24))
    __swift_destroy_boxed_opaque_existential_0(a1);
  return a1;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  if ((*(_DWORD *)(*(_QWORD *)(v2 - 8) + 80) & 0x20000) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1);
}

Swift::Bool __swiftcall checkValidThroughputTrue(data:)(Swift::OpaquePointer data)
{
  double v3;
  char v4;
  double v5;
  char v6;
  double v7;
  _QWORD v8[4];
  char v9;
  void *rawValue;

  rawValue = data._rawValue;
  v9 = 0;
  kMediaML_throughputTrue.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  MEMORY[0x242696BAC](v8);
  outlined destroy of String();
  if (v8[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v5 = v7;
      v6 = 0;
    }
    else
    {
      v5 = 0.0;
      v6 = 1;
    }
    v3 = v5;
    v4 = v6;
  }
  else
  {
    outlined destroy of Any?((uint64_t)v8);
    v3 = 0.0;
    v4 = 1;
  }
  if ((v4 & 1) != 0)
    return 0;
  if (v3 <= 0.0)
    return 0;
  v9 = 1;
  return 1;
}

Swift::Bool __swiftcall validateAppName(text:)(Swift::String text)
{
  NSRegularExpression *v1;
  void *v2;
  uint64_t v3;
  Swift::Bool result;
  BOOL v5;
  id v6;
  id v7;
  Swift::String pattern;
  void *v10;
  id v11[2];
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSRegularExpressionOptions v20;
  Swift::String v21;

  v19 = 0;
  v17 = 0;
  v18 = 0;
  v13 = 0;
  v21 = text;
  type metadata accessor for NSRegularExpression();
  pattern = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("^[A-Za-z0-9./]{1,155}$", 0x16uLL, 1);
  type metadata accessor for NSRegularExpressionOptions();
  _allocateUninitializedArray<A>(_:)();
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  SetAlgebra<>.init(arrayLiteral:)();
  NSRegularExpression.__allocating_init(pattern:options:)(v1, pattern, v20);
  v10 = v2;
  if (v3)
  {
    result = swift_unexpectedError();
    __break(1u);
  }
  else
  {
    v19 = v2;
    v17 = 0;
    v18 = String.count.getter();
    swift_bridgeObjectRetain();
    v6 = (id)MEMORY[0x242696BB8](text._countAndFlagsBits, text._object);
    swift_bridgeObjectRelease();
    type metadata accessor for NSMatchingOptions();
    _allocateUninitializedArray<A>(_:)();
    lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
    SetAlgebra<>.init(arrayLiteral:)();
    v14 = 0;
    v15 = v18;
    v7 = objc_msgSend(v10, sel_matchesInString_options_range_, v6, v16, 0, v18);

    type metadata accessor for NSTextCheckingResult();
    v13 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();

    swift_bridgeObjectRetain();
    v11[1] = v13;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [NSTextCheckingResult]);
    lazy protocol witness table accessor for type [NSTextCheckingResult] and conformance [A]();
    Collection.first.getter();
    outlined destroy of [NSTextCheckingResult]();
    v11[0] = v12;
    v5 = v12 != 0;
    outlined destroy of NSTextCheckingResult?(v11);
    swift_bridgeObjectRelease();

    return v5;
  }
  return result;
}

unint64_t type metadata accessor for NSRegularExpression()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = lazy cache variable for type metadata for NSRegularExpression;
  if (!lazy cache variable for type metadata for NSRegularExpression)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for NSRegularExpression);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t type metadata accessor for NSRegularExpressionOptions()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  v4 = lazy cache variable for type metadata for NSRegularExpressionOptions;
  if (!lazy cache variable for type metadata for NSRegularExpressionOptions)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    v4 = ForeignTypeMetadata;
    if (!v0)
    {
      v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for NSRegularExpressionOptions);
      return v1;
    }
  }
  return v4;
}

unint64_t lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions;
  if (!lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions)
  {
    v0 = type metadata accessor for NSRegularExpressionOptions();
    v1 = MEMORY[0x242696FFC](&protocol conformance descriptor for NSRegularExpressionOptions, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions;
  if (!lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions)
  {
    v0 = type metadata accessor for NSRegularExpressionOptions();
    v1 = MEMORY[0x242696FFC](&protocol conformance descriptor for NSRegularExpressionOptions, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions;
  if (!lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions)
  {
    v0 = type metadata accessor for NSRegularExpressionOptions();
    v1 = MEMORY[0x242696FFC](&protocol conformance descriptor for NSRegularExpressionOptions, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions;
  if (!lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions)
  {
    v0 = type metadata accessor for NSRegularExpressionOptions();
    v1 = MEMORY[0x242696FFC](&protocol conformance descriptor for NSRegularExpressionOptions, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions;
  if (!lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions)
  {
    v0 = type metadata accessor for NSRegularExpressionOptions();
    v1 = MEMORY[0x242696FFC](&protocol conformance descriptor for NSRegularExpressionOptions, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions);
    return v1;
  }
  return v3;
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> NSRegularExpression.__allocating_init(pattern:options:)(NSRegularExpression *__return_ptr retstr, Swift::String pattern, NSRegularExpressionOptions options)
{
  id v3;
  void *object;
  uint64_t countAndFlagsBits;

  countAndFlagsBits = pattern._countAndFlagsBits;
  object = pattern._object;
  v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  @nonobjc NSRegularExpression.init(pattern:options:)(countAndFlagsBits, (uint64_t)object, options);
}

uint64_t type metadata accessor for NSMatchingOptions()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  v4 = lazy cache variable for type metadata for NSMatchingOptions;
  if (!lazy cache variable for type metadata for NSMatchingOptions)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    v4 = ForeignTypeMetadata;
    if (!v0)
    {
      v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for NSMatchingOptions);
      return v1;
    }
  }
  return v4;
}

unint64_t lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions;
  if (!lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions)
  {
    v0 = type metadata accessor for NSMatchingOptions();
    v1 = MEMORY[0x242696FFC](&protocol conformance descriptor for NSMatchingOptions, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions;
  if (!lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions)
  {
    v0 = type metadata accessor for NSMatchingOptions();
    v1 = MEMORY[0x242696FFC](&protocol conformance descriptor for NSMatchingOptions, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions;
  if (!lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions)
  {
    v0 = type metadata accessor for NSMatchingOptions();
    v1 = MEMORY[0x242696FFC](&protocol conformance descriptor for NSMatchingOptions, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions;
  if (!lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions)
  {
    v0 = type metadata accessor for NSMatchingOptions();
    v1 = MEMORY[0x242696FFC](&protocol conformance descriptor for NSMatchingOptions, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions;
  if (!lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions)
  {
    v0 = type metadata accessor for NSMatchingOptions();
    v1 = MEMORY[0x242696FFC](&protocol conformance descriptor for NSMatchingOptions, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions);
    return v1;
  }
  return v3;
}

unint64_t type metadata accessor for NSTextCheckingResult()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = lazy cache variable for type metadata for NSTextCheckingResult;
  if (!lazy cache variable for type metadata for NSTextCheckingResult)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for NSTextCheckingResult);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t lazy protocol witness table accessor for type [NSTextCheckingResult] and conformance [A]()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [NSTextCheckingResult] and conformance [A];
  if (!lazy protocol witness table cache variable for type [NSTextCheckingResult] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [NSTextCheckingResult]);
    v1 = MEMORY[0x242696FFC](MEMORY[0x24BEE12E0], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [NSTextCheckingResult] and conformance [A]);
    return v1;
  }
  return v3;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *a1;
  if (*a1 < 0)
  {
    v2 = MEMORY[0x242696FF0](255, (char *)a1 + (int)*a1, -(*a1 >> 32), 0);
    *a1 = v2;
    return v2;
  }
  return v4;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of [NSTextCheckingResult]()
{
  swift_bridgeObjectRelease();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of NSTextCheckingResult?(id *a1)
{

}

Swift::Bool __swiftcall validateSessionID(text:)(Swift::String text)
{
  NSRegularExpression *v1;
  void *v2;
  uint64_t v3;
  Swift::Bool result;
  BOOL v5;
  id v6;
  id v7;
  Swift::String pattern;
  void *v10;
  id v11[2];
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSRegularExpressionOptions v20;
  Swift::String v21;

  v19 = 0;
  v17 = 0;
  v18 = 0;
  v13 = 0;
  v21 = text;
  type metadata accessor for NSRegularExpression();
  pattern = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("^[A-Z0-9]{8}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{12}$", 0x3EuLL, 1);
  type metadata accessor for NSRegularExpressionOptions();
  _allocateUninitializedArray<A>(_:)();
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  SetAlgebra<>.init(arrayLiteral:)();
  NSRegularExpression.__allocating_init(pattern:options:)(v1, pattern, v20);
  v10 = v2;
  if (v3)
  {
    result = swift_unexpectedError();
    __break(1u);
  }
  else
  {
    v19 = v2;
    v17 = 0;
    v18 = String.count.getter();
    swift_bridgeObjectRetain();
    v6 = (id)MEMORY[0x242696BB8](text._countAndFlagsBits, text._object);
    swift_bridgeObjectRelease();
    type metadata accessor for NSMatchingOptions();
    _allocateUninitializedArray<A>(_:)();
    lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
    SetAlgebra<>.init(arrayLiteral:)();
    v14 = 0;
    v15 = v18;
    v7 = objc_msgSend(v10, sel_matchesInString_options_range_, v6, v16, 0, v18);

    type metadata accessor for NSTextCheckingResult();
    v13 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();

    swift_bridgeObjectRetain();
    v11[1] = v13;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [NSTextCheckingResult]);
    lazy protocol witness table accessor for type [NSTextCheckingResult] and conformance [A]();
    Collection.first.getter();
    outlined destroy of [NSTextCheckingResult]();
    v11[0] = v12;
    v5 = v12 != 0;
    outlined destroy of NSTextCheckingResult?(v11);
    swift_bridgeObjectRelease();

    return v5;
  }
  return result;
}

Swift::Bool __swiftcall validateSSID(text:)(Swift::String text)
{
  Swift::String *v1;
  Swift::String v2;
  char v3;
  Swift::String v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  Swift::String *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  int v22;
  int v23;
  _BOOL4 v24;
  Swift::Int v25;
  _BOOL4 v26;
  uint64_t countAndFlagsBits;
  uint64_t v28;
  Swift::Int v29;
  void *object;
  _BOOL4 v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  Swift::String v35;

  countAndFlagsBits = text._countAndFlagsBits;
  object = text._object;
  v33 = 0;
  v28 = 0;
  v35 = text;
  v34 = 0;
  v29 = String.count.getter();
  v31 = *maxSSIDLength.unsafeMutableAddressor() >= v29;
  swift_bridgeObjectRetain();
  if (v31)
  {
    v25 = String.count.getter();
    v26 = v25 < *minSSIDLength.unsafeMutableAddressor();
  }
  else
  {
    v26 = 1;
  }
  v24 = v26;
  swift_bridgeObjectRelease();
  if (v26)
  {
    v23 = 0;
  }
  else
  {
    v16 = MEMORY[0x24BEE0D00];
    v15 = _allocateUninitializedArray<A>(_:)();
    v14 = v1;
    v12 = 6;
    v13 = 1;
    *v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("select", 6uLL, 1);
    v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("delete", 6uLL, 1);
    v3 = v13;
    v14[1] = v2;
    v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("drop table", 0xAuLL, v3 & 1);
    v5 = v15;
    v14[2] = v4;
    _finalizeUninitializedArray<A>(_:)();
    v17 = v5;
    v33 = v5;
    v32 = v5;
    swift_bridgeObjectRetain();
    v18 = &v9;
    v19 = 32;
    MEMORY[0x24BDAC7A8](&v9);
    v6 = (char *)&v9 - v19;
    v20 = v6;
    *((_QWORD *)v6 + 2) = countAndFlagsBits;
    *((_QWORD *)v6 + 3) = v7;
    v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    lazy protocol witness table accessor for type [String] and conformance [A]();
    v22 = Sequence.contains(where:)();
    v10 = v22;
    swift_bridgeObjectRelease();
    v11 = v10 ^ 1;
    v34 = (v10 ^ 1) & 1;
    swift_bridgeObjectRelease();
    v23 = v11;
  }
  return v23 & 1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> _finalizeUninitializedArray<A>(_:)()
{
  type metadata accessor for Array();
  Array._endMutation()();
}

uint64_t closure #1 in validateSSID(text:)()
{
  char v1;

  String.lowercased()();
  v1 = Sequence<>.starts<A>(with:)();
  outlined destroy of String();
  return v1 & 1;
}

uint64_t partial apply for closure #1 in validateSSID(text:)()
{
  return closure #1 in validateSSID(text:)() & 1;
}

unint64_t lazy protocol witness table accessor for type [String] and conformance [A]()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [String] and conformance [A];
  if (!lazy protocol witness table cache variable for type [String] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String]);
    v1 = MEMORY[0x242696FFC](MEMORY[0x24BEE12C8], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [String] and conformance [A]);
    return v1;
  }
  return v3;
}

Swift::Bool __swiftcall checkValidTextInputs(data:)(Swift::OpaquePointer data)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::String v6;
  Swift::String v7;
  Swift::Int v8;
  Swift::String v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint8_t *v63;
  uint64_t v64;
  uint64_t v65;
  _BYTE **v66;
  uint64_t *v67;
  uint64_t *v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t *v72;
  uint32_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  uint64_t v84;
  NSObject *v85;
  int v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint8_t *v90;
  uint64_t v91;
  uint64_t v92;
  _BYTE **v93;
  uint64_t *v94;
  uint64_t *v95;
  uint64_t v96;
  unint64_t v97;
  unint64_t v98;
  uint64_t *v99;
  uint32_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  _QWORD *v110;
  uint64_t v111;
  NSObject *v112;
  int v113;
  uint64_t v114;
  void *v115;
  int v116;
  uint64_t v117;
  uint64_t v118;
  uint8_t *v119;
  uint64_t v120;
  uint64_t v121;
  _BYTE **v122;
  uint64_t *v123;
  uint64_t *v124;
  uint64_t v125;
  unint64_t v126;
  unint64_t v127;
  uint64_t *v128;
  uint32_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  _QWORD *v139;
  uint64_t v140;
  NSObject *v141;
  int v142;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  void *v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  void *v152;
  Swift::String v153;
  Swift::String *v154;
  uint64_t v156;
  int v157;
  uint64_t v158;
  int v159;
  uint64_t v160;
  int v161;
  Swift::String v162;
  Swift::String *v163;
  void *v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  void *v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  uint64_t v172;
  void *v173;
  Swift::String v174;
  Swift::String *v175;
  void *v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  void *v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  uint64_t v184;
  void *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  unint64_t v189;
  char *v190;
  unint64_t v191;
  char *v192;
  unint64_t v193;
  char *v194;
  Swift::String v195;
  void *rawValue;
  Swift::String *v197;
  uint64_t v198;
  void *v199;
  uint64_t v200;
  void *v201;
  uint64_t v202;
  _QWORD v203[4];
  uint64_t (*v204)(uint64_t, uint64_t, uint64_t);
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  _BYTE *v208;
  uint64_t v209;
  uint32_t v210;
  uint64_t v211;
  void *v212;
  Swift::String v213;
  _QWORD v214[4];
  uint64_t v215;
  char v216;
  Swift::Int v217;
  char v218;
  Swift::String v219;
  _QWORD v220[4];
  uint64_t (*v221)(uint64_t, uint64_t, uint64_t);
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  _BYTE *v225;
  uint64_t v226;
  uint32_t v227;
  uint64_t v228;
  void *v229;
  Swift::String v230;
  _QWORD v231[4];
  uint64_t (*v232)(uint64_t, uint64_t, uint64_t);
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  _BYTE *v236;
  uint64_t v237;
  uint32_t v238;
  uint64_t v239;
  void *v240;
  Swift::String v241;
  _QWORD v242[4];
  char v243;
  uint64_t v244;

  rawValue = data._rawValue;
  v244 = 0;
  v243 = 0;
  v239 = 0;
  v240 = 0;
  v186 = 0;
  v228 = 0;
  v229 = 0;
  v211 = 0;
  v212 = 0;
  v187 = type metadata accessor for Logger();
  v188 = *(_QWORD *)(v187 - 8);
  v189 = (*(_QWORD *)(v188 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1 = MEMORY[0x24BDAC7A8](rawValue);
  v190 = (char *)&v59 - v189;
  v191 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  v3 = MEMORY[0x24BDAC7A8](v1);
  v192 = (char *)&v59 - v191;
  v193 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v5 = MEMORY[0x24BDAC7A8](v3);
  v194 = (char *)&v59 - v193;
  v244 = v5;
  v243 = 0;
  v195 = *kMediaML_appName.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v197 = &v241;
  v241 = v195;
  MEMORY[0x242696BAC](v242);
  outlined destroy of String();
  if (v242[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v184 = v198;
      v185 = v199;
    }
    else
    {
      v184 = 0;
      v185 = 0;
    }
    v182 = v184;
    v183 = v185;
  }
  else
  {
    v60 = 0;
    outlined destroy of Any?((uint64_t)v242);
    v182 = (uint64_t)v60;
    v183 = v60;
  }
  v180 = v183;
  v181 = v182;
  if (!v183)
  {
    v116 = 0;
    return v116 & 1;
  }
  v178 = v181;
  v179 = v180;
  v6._countAndFlagsBits = v181;
  v6._object = v180;
  v176 = v180;
  v177 = v181;
  v239 = v181;
  v240 = v180;
  if (validateAppName(text:)(v6))
  {
    v174 = *kMediaML_sessionID.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    v175 = &v230;
    v230 = v174;
    MEMORY[0x242696BAC](v231);
    outlined destroy of String();
    if (v231[3])
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v172 = v200;
        v173 = v201;
      }
      else
      {
        v172 = 0;
        v173 = 0;
      }
      v170 = v172;
      v171 = v173;
    }
    else
    {
      v87 = 0;
      outlined destroy of Any?((uint64_t)v231);
      v170 = (uint64_t)v87;
      v171 = v87;
    }
    v168 = v171;
    v169 = v170;
    if (!v171)
    {
      swift_bridgeObjectRelease();
      v116 = 0;
      return v116 & 1;
    }
    v166 = v169;
    v167 = v168;
    v7._countAndFlagsBits = v169;
    v7._object = v168;
    v164 = v168;
    v165 = v169;
    v228 = v169;
    v229 = v168;
    if (validateSessionID(text:)(v7))
    {
      v162 = *kMediaML_interfaceType.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      v163 = &v219;
      v219 = v162;
      MEMORY[0x242696BAC](v220);
      outlined destroy of String();
      if (v220[3])
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          v160 = v202;
          v161 = 0;
        }
        else
        {
          v160 = 0;
          v161 = 1;
        }
        v158 = v160;
        v159 = v161;
      }
      else
      {
        v114 = 0;
        outlined destroy of Any?((uint64_t)v220);
        v158 = v114;
        v159 = 1;
      }
      v157 = v159;
      v156 = v158;
      v8 = *kMediaML_InterfaceType_WiFi.unsafeMutableAddressor();
      v215 = v156;
      v216 = v157 & 1;
      v217 = v8;
      v218 = 0;
      if (!((v157 & 1) == 0
          && (outlined init with copy of Int?((uint64_t)&v215, (uint64_t)v203), (v218 & 1) == 0)
          && v203[0] == v217))
        goto LABEL_45;
      v153 = *kMediaML_ssid.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      v154 = &v213;
      v213 = v153;
      MEMORY[0x242696BAC](v214);
      outlined destroy of String();
      if (v214[3])
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          v151 = v203[2];
          v152 = (void *)v203[3];
        }
        else
        {
          v151 = 0;
          v152 = 0;
        }
        v149 = v151;
        v150 = v152;
      }
      else
      {
        v115 = 0;
        outlined destroy of Any?((uint64_t)v214);
        v149 = (uint64_t)v115;
        v150 = v115;
      }
      v147 = v150;
      v148 = v149;
      if (v150)
      {
        v145 = v148;
        v146 = v147;
        v9._countAndFlagsBits = v148;
        v9._object = v147;
        v143 = v147;
        v144 = v148;
        v211 = v148;
        v212 = v147;
        if (validateSSID(text:)(v9))
        {
          swift_bridgeObjectRelease();
LABEL_45:
          v243 = 1;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v116 = 1;
          return v116 & 1;
        }
        v10 = v194;
        v11 = logger.unsafeMutableAddressor();
        (*(void (**)(char *, uint64_t, uint64_t))(v188 + 16))(v10, v11, v187);
        swift_bridgeObjectRetain();
        v131 = 32;
        v132 = 7;
        v12 = swift_allocObject();
        v13 = v143;
        v133 = v12;
        *(_QWORD *)(v12 + 16) = v144;
        *(_QWORD *)(v12 + 24) = v13;
        v141 = Logger.logObject.getter();
        v142 = static os_log_type_t.error.getter();
        v128 = &v209;
        v209 = 12;
        v126 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        v127 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        lazy protocol witness table accessor for type Int and conformance Int();
        UnsignedInteger<>.init<A>(_:)();
        v129 = v210;
        v130 = 17;
        v135 = swift_allocObject();
        *(_BYTE *)(v135 + 16) = 32;
        v136 = swift_allocObject();
        *(_BYTE *)(v136 + 16) = 8;
        v14 = swift_allocObject();
        v15 = v133;
        v134 = v14;
        *(_QWORD *)(v14 + 16) = partial apply for implicit closure #3 in checkValidTextInputs(data:);
        *(_QWORD *)(v14 + 24) = v15;
        v16 = swift_allocObject();
        v17 = v134;
        v138 = v16;
        *(_QWORD *)(v16 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
        *(_QWORD *)(v16 + 24) = v17;
        v140 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
        v137 = _allocateUninitializedArray<A>(_:)();
        v139 = v18;
        swift_retain();
        v19 = v135;
        v20 = v139;
        *v139 = closure #1 in OSLogArguments.append(_:)partial apply;
        v20[1] = v19;
        swift_retain();
        v21 = v136;
        v22 = v139;
        v139[2] = closure #1 in OSLogArguments.append(_:)partial apply;
        v22[3] = v21;
        swift_retain();
        v23 = v138;
        v24 = v139;
        v139[4] = closure #1 in OSLogArguments.append(_:)partial apply;
        v24[5] = v23;
        _finalizeUninitializedArray<A>(_:)();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v141, (os_log_type_t)v142))
        {
          v25 = v186;
          v119 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
          v118 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          v120 = createStorage<A>(capacity:type:)(0);
          v121 = createStorage<A>(capacity:type:)(1);
          v122 = &v208;
          v208 = v119;
          v123 = &v207;
          v207 = v120;
          v124 = &v206;
          v206 = v121;
          serialize(_:at:)(2, &v208);
          serialize(_:at:)(1, v122);
          v204 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
          v205 = v135;
          closure #1 in osLogInternal(_:log:type:)(&v204, (uint64_t)v122, (uint64_t)v123, (uint64_t)v124);
          v125 = v25;
          if (v25)
          {
            __break(1u);
          }
          else
          {
            v204 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
            v205 = v136;
            closure #1 in osLogInternal(_:log:type:)(&v204, (uint64_t)&v208, (uint64_t)&v207, (uint64_t)&v206);
            v117 = 0;
            v204 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
            v205 = v138;
            closure #1 in osLogInternal(_:log:type:)(&v204, (uint64_t)&v208, (uint64_t)&v207, (uint64_t)&v206);
            _os_log_impl(&dword_241581000, v141, (os_log_type_t)v142, "ssid in data directory failed validation: %s", v119, v129);
            destroyStorage<A>(_:count:)(v120, 0, v118);
            destroyStorage<A>(_:count:)(v121, 1, MEMORY[0x24BEE4AD8] + 8);
            MEMORY[0x242696CA8](v119, MEMORY[0x24BEE4260]);
            swift_release();
            swift_release();
            swift_release();
          }
        }
        else
        {
          swift_release();
          swift_release();
          swift_release();
        }

        (*(void (**)(char *, uint64_t))(v188 + 8))(v194, v187);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v116 = 0;
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v116 = 0;
      }
    }
    else
    {
      v26 = v192;
      v27 = logger.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v188 + 16))(v26, v27, v187);
      swift_bridgeObjectRetain();
      v102 = 32;
      v103 = 7;
      v28 = swift_allocObject();
      v29 = v164;
      v104 = v28;
      *(_QWORD *)(v28 + 16) = v165;
      *(_QWORD *)(v28 + 24) = v29;
      v112 = Logger.logObject.getter();
      v113 = static os_log_type_t.error.getter();
      v99 = &v226;
      v226 = 12;
      v97 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      v98 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      v100 = v227;
      v101 = 17;
      v106 = swift_allocObject();
      *(_BYTE *)(v106 + 16) = 32;
      v107 = swift_allocObject();
      *(_BYTE *)(v107 + 16) = 8;
      v30 = swift_allocObject();
      v31 = v104;
      v105 = v30;
      *(_QWORD *)(v30 + 16) = partial apply for implicit closure #2 in checkValidTextInputs(data:);
      *(_QWORD *)(v30 + 24) = v31;
      v32 = swift_allocObject();
      v33 = v105;
      v109 = v32;
      *(_QWORD *)(v32 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
      *(_QWORD *)(v32 + 24) = v33;
      v111 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      v108 = _allocateUninitializedArray<A>(_:)();
      v110 = v34;
      swift_retain();
      v35 = v106;
      v36 = v110;
      *v110 = closure #1 in OSLogArguments.append(_:)partial apply;
      v36[1] = v35;
      swift_retain();
      v37 = v107;
      v38 = v110;
      v110[2] = closure #1 in OSLogArguments.append(_:)partial apply;
      v38[3] = v37;
      swift_retain();
      v39 = v109;
      v40 = v110;
      v110[4] = closure #1 in OSLogArguments.append(_:)partial apply;
      v40[5] = v39;
      _finalizeUninitializedArray<A>(_:)();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v112, (os_log_type_t)v113))
      {
        v41 = v186;
        v90 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        v89 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        v91 = createStorage<A>(capacity:type:)(0);
        v92 = createStorage<A>(capacity:type:)(1);
        v93 = &v225;
        v225 = v90;
        v94 = &v224;
        v224 = v91;
        v95 = &v223;
        v223 = v92;
        serialize(_:at:)(2, &v225);
        serialize(_:at:)(1, v93);
        v221 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        v222 = v106;
        closure #1 in osLogInternal(_:log:type:)(&v221, (uint64_t)v93, (uint64_t)v94, (uint64_t)v95);
        v96 = v41;
        if (v41)
        {
          __break(1u);
        }
        else
        {
          v221 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
          v222 = v107;
          closure #1 in osLogInternal(_:log:type:)(&v221, (uint64_t)&v225, (uint64_t)&v224, (uint64_t)&v223);
          v88 = 0;
          v221 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
          v222 = v109;
          closure #1 in osLogInternal(_:log:type:)(&v221, (uint64_t)&v225, (uint64_t)&v224, (uint64_t)&v223);
          _os_log_impl(&dword_241581000, v112, (os_log_type_t)v113, "sessionID in data directory failed validation: %s", v90, v100);
          destroyStorage<A>(_:count:)(v91, 0, v89);
          destroyStorage<A>(_:count:)(v92, 1, MEMORY[0x24BEE4AD8] + 8);
          MEMORY[0x242696CA8](v90, MEMORY[0x24BEE4260]);
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v188 + 8))(v192, v187);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v116 = 0;
    }
  }
  else
  {
    v42 = v190;
    v43 = logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v188 + 16))(v42, v43, v187);
    swift_bridgeObjectRetain();
    v75 = 32;
    v76 = 7;
    v44 = swift_allocObject();
    v45 = v176;
    v77 = v44;
    *(_QWORD *)(v44 + 16) = v177;
    *(_QWORD *)(v44 + 24) = v45;
    v85 = Logger.logObject.getter();
    v86 = static os_log_type_t.error.getter();
    v72 = &v237;
    v237 = 12;
    v70 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    v71 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    v73 = v238;
    v74 = 17;
    v79 = swift_allocObject();
    *(_BYTE *)(v79 + 16) = 32;
    v80 = swift_allocObject();
    *(_BYTE *)(v80 + 16) = 8;
    v46 = swift_allocObject();
    v47 = v77;
    v78 = v46;
    *(_QWORD *)(v46 + 16) = partial apply for implicit closure #1 in checkValidTextInputs(data:);
    *(_QWORD *)(v46 + 24) = v47;
    v48 = swift_allocObject();
    v49 = v78;
    v82 = v48;
    *(_QWORD *)(v48 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:);
    *(_QWORD *)(v48 + 24) = v49;
    v84 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v81 = _allocateUninitializedArray<A>(_:)();
    v83 = v50;
    swift_retain();
    v51 = v79;
    v52 = v83;
    *v83 = partial apply for closure #1 in OSLogArguments.append(_:);
    v52[1] = v51;
    swift_retain();
    v53 = v80;
    v54 = v83;
    v83[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v54[3] = v53;
    swift_retain();
    v55 = v82;
    v56 = v83;
    v83[4] = partial apply for closure #1 in OSLogArguments.append(_:);
    v56[5] = v55;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v85, (os_log_type_t)v86))
    {
      v57 = v186;
      v63 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v62 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v64 = createStorage<A>(capacity:type:)(0);
      v65 = createStorage<A>(capacity:type:)(1);
      v66 = &v236;
      v236 = v63;
      v67 = &v235;
      v235 = v64;
      v68 = &v234;
      v234 = v65;
      serialize(_:at:)(2, &v236);
      serialize(_:at:)(1, v66);
      v232 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      v233 = v79;
      closure #1 in osLogInternal(_:log:type:)(&v232, (uint64_t)v66, (uint64_t)v67, (uint64_t)v68);
      v69 = v57;
      if (v57)
      {
        __break(1u);
      }
      else
      {
        v232 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        v233 = v80;
        closure #1 in osLogInternal(_:log:type:)(&v232, (uint64_t)&v236, (uint64_t)&v235, (uint64_t)&v234);
        v61 = 0;
        v232 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v233 = v82;
        closure #1 in osLogInternal(_:log:type:)(&v232, (uint64_t)&v236, (uint64_t)&v235, (uint64_t)&v234);
        _os_log_impl(&dword_241581000, v85, (os_log_type_t)v86, "AppName in data directory failed validation: %s", v63, v73);
        destroyStorage<A>(_:count:)(v64, 0, v62);
        destroyStorage<A>(_:count:)(v65, 1, MEMORY[0x24BEE4AD8] + 8);
        MEMORY[0x242696CA8](v63, MEMORY[0x24BEE4260]);
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }

    (*(void (**)(char *, uint64_t))(v188 + 8))(v190, v187);
    swift_bridgeObjectRelease();
    v116 = 0;
  }
  return v116 & 1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> implicit closure #1 in checkValidTextInputs(data:)()
{
  swift_bridgeObjectRetain();
}

uint64_t sub_2415867A8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in checkValidTextInputs(data:)()
{
  uint64_t v0;
  uint64_t result;

  result = *(_QWORD *)(v0 + 16);
  implicit closure #1 in checkValidTextInputs(data:)();
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> implicit closure #2 in checkValidTextInputs(data:)()
{
  swift_bridgeObjectRetain();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> implicit closure #3 in checkValidTextInputs(data:)()
{
  swift_bridgeObjectRetain();
}

Swift::Bool __swiftcall checkValidNumericInputRange(data:)(Swift::OpaquePointer data)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  uint64_t v81;
  _QWORD *v82;
  uint64_t v83;
  _QWORD *v84;
  uint64_t v85;
  _QWORD *v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD *v94;
  uint64_t v95;
  _QWORD *v96;
  uint64_t v97;
  _QWORD *v98;
  uint64_t v99;
  _QWORD *v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  _QWORD *v108;
  uint64_t v109;
  _QWORD *v110;
  uint64_t v111;
  _QWORD *v112;
  uint64_t v113;
  _QWORD *v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  _QWORD *v122;
  uint64_t v123;
  _QWORD *v124;
  uint64_t v125;
  _QWORD *v126;
  uint64_t v127;
  _QWORD *v128;
  uint64_t v129;
  char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  _QWORD *v136;
  uint64_t v137;
  _QWORD *v138;
  uint64_t v139;
  _QWORD *v140;
  uint64_t v141;
  _QWORD *v142;
  uint64_t v143;
  Swift::Int v145;
  Swift::Int v146;
  Swift::Int v147;
  Swift::Int v148;
  Swift::Int v149;
  Swift::Int v150;
  double v151;
  double v152;
  Swift::Int v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint8_t *v158;
  uint64_t v159;
  uint64_t v160;
  _BYTE **v161;
  uint64_t *v162;
  uint64_t *v163;
  uint64_t v164;
  unint64_t v165;
  unint64_t v166;
  uint64_t *v167;
  uint32_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  _QWORD *v178;
  uint64_t v179;
  NSObject *v180;
  int v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint8_t *v186;
  uint64_t v187;
  uint64_t v188;
  _BYTE **v189;
  uint64_t *v190;
  uint64_t *v191;
  uint64_t v192;
  unint64_t v193;
  unint64_t v194;
  uint64_t *v195;
  uint32_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  _QWORD *v206;
  uint64_t v207;
  NSObject *v208;
  int v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint8_t *v214;
  uint64_t v215;
  uint64_t v216;
  _BYTE **v217;
  uint64_t *v218;
  uint64_t *v219;
  uint64_t v220;
  unint64_t v221;
  unint64_t v222;
  uint64_t *v223;
  uint32_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  _QWORD *v234;
  uint64_t v235;
  NSObject *v236;
  int v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint8_t *v242;
  uint64_t v243;
  uint64_t v244;
  _BYTE **v245;
  uint64_t *v246;
  uint64_t *v247;
  uint64_t v248;
  unint64_t v249;
  unint64_t v250;
  uint64_t *v251;
  uint32_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  _QWORD *v262;
  uint64_t v263;
  NSObject *v264;
  int v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint8_t *v270;
  uint64_t v271;
  uint64_t v272;
  _BYTE **v273;
  uint64_t *v274;
  uint64_t *v275;
  uint64_t v276;
  unint64_t v277;
  unint64_t v278;
  uint64_t *v279;
  uint32_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  _QWORD *v290;
  uint64_t v291;
  NSObject *v292;
  int v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint8_t *v298;
  uint64_t v299;
  uint64_t v300;
  _BYTE **v301;
  uint64_t *v302;
  uint64_t *v303;
  uint64_t v304;
  unint64_t v305;
  unint64_t v306;
  uint64_t *v307;
  uint32_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  _QWORD *v318;
  uint64_t v319;
  NSObject *v320;
  int v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint8_t *v326;
  uint64_t v327;
  uint64_t v328;
  _BYTE **v329;
  uint64_t *v330;
  uint64_t *v331;
  uint64_t v332;
  unint64_t v333;
  unint64_t v334;
  uint64_t *v335;
  uint32_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  _QWORD *v346;
  uint64_t v347;
  NSObject *v348;
  int v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  uint8_t *v354;
  uint64_t v355;
  uint64_t v356;
  _BYTE **v357;
  uint64_t *v358;
  uint64_t *v359;
  uint64_t v360;
  unint64_t v361;
  unint64_t v362;
  uint64_t *v363;
  uint32_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  _QWORD *v374;
  uint64_t v375;
  NSObject *v376;
  int v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  uint8_t *v382;
  uint64_t v383;
  uint64_t v384;
  _BYTE **v385;
  uint64_t *v386;
  uint64_t *v387;
  uint64_t v388;
  unint64_t v389;
  unint64_t v390;
  uint64_t *v391;
  uint32_t v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  _QWORD *v402;
  uint64_t v403;
  NSObject *v404;
  int v405;
  int v406;
  Swift::Int v416;
  Swift::Int v417;
  int v418;
  Swift::Int v419;
  int v420;
  Swift::Double v421;
  Swift::String v422;
  Swift::String *v423;
  double v424;
  int v425;
  double v426;
  int v427;
  Swift::Double v428;
  Swift::String v429;
  Swift::String *v430;
  double v431;
  int v432;
  double v433;
  int v434;
  Swift::Int v435;
  Swift::String v436;
  Swift::String *v437;
  Swift::Int v438;
  int v439;
  Swift::Int v440;
  int v441;
  Swift::Int v442;
  Swift::String v443;
  Swift::String *v444;
  Swift::Int v445;
  int v446;
  Swift::Int v447;
  int v448;
  Swift::Int v449;
  Swift::String v450;
  Swift::String *v451;
  Swift::Int v452;
  int v453;
  Swift::Int v454;
  int v455;
  Swift::Int v456;
  Swift::String v457;
  Swift::String *v458;
  Swift::Int v459;
  int v460;
  Swift::Int v461;
  int v462;
  Swift::Int v463;
  Swift::String v464;
  Swift::String *v465;
  Swift::Int v466;
  int v467;
  Swift::Int v468;
  int v469;
  Swift::Int v470;
  Swift::String v471;
  Swift::String *v472;
  Swift::Int v473;
  int v474;
  Swift::Int v475;
  int v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  uint64_t v480;
  unint64_t v481;
  char *v482;
  unint64_t v483;
  char *v484;
  unint64_t v485;
  char *v486;
  unint64_t v487;
  char *v488;
  unint64_t v489;
  char *v490;
  unint64_t v491;
  char *v492;
  unint64_t v493;
  char *v494;
  unint64_t v495;
  char *v496;
  unint64_t v497;
  char *v498;
  Swift::String v499;
  uint64_t v500;
  Swift::String *v501;
  Swift::Int v502;
  Swift::Int v503;
  Swift::Int v504;
  Swift::Int v505;
  Swift::Int v506;
  Swift::Int v507;
  double v508;
  double v509;
  Swift::Int v510;
  uint64_t (*v511)(uint64_t, uint64_t, uint64_t);
  uint64_t v512;
  uint64_t v513;
  uint64_t v514;
  _BYTE *v515;
  uint64_t v516;
  uint32_t v517;
  uint64_t (*v518)(uint64_t, uint64_t, uint64_t);
  uint64_t v519;
  uint64_t v520;
  uint64_t v521;
  _BYTE *v522;
  uint64_t v523;
  uint32_t v524;
  uint64_t (*v525)(uint64_t, uint64_t, uint64_t);
  uint64_t v526;
  uint64_t v527;
  uint64_t v528;
  _BYTE *v529;
  uint64_t v530;
  uint32_t v531;
  uint64_t (*v532)(uint64_t, uint64_t, uint64_t);
  uint64_t v533;
  uint64_t v534;
  uint64_t v535;
  _BYTE *v536;
  uint64_t v537;
  uint32_t v538;
  uint64_t (*v539)(uint64_t, uint64_t, uint64_t);
  uint64_t v540;
  uint64_t v541;
  uint64_t v542;
  _BYTE *v543;
  uint64_t v544;
  uint32_t v545;
  uint64_t (*v546)(uint64_t, uint64_t, uint64_t);
  uint64_t v547;
  uint64_t v548;
  uint64_t v549;
  _BYTE *v550;
  uint64_t v551;
  uint32_t v552;
  uint64_t (*v553)(uint64_t, uint64_t, uint64_t);
  uint64_t v554;
  uint64_t v555;
  uint64_t v556;
  _BYTE *v557;
  uint64_t v558;
  uint32_t v559;
  uint64_t (*v560)(uint64_t, uint64_t, uint64_t);
  uint64_t v561;
  uint64_t v562;
  uint64_t v563;
  _BYTE *v564;
  uint64_t v565;
  uint32_t v566;
  uint64_t (*v567)(uint64_t, uint64_t, uint64_t);
  uint64_t v568;
  uint64_t v569;
  uint64_t v570;
  _BYTE *v571;
  uint64_t v572;
  uint32_t v573;
  Swift::Int v574;
  Swift::Int v575;
  char v576;
  Swift::String v577;
  _QWORD v578[4];
  Swift::Int v579;
  double v580;
  double v581;
  char v582;
  Swift::String v583;
  _QWORD v584[4];
  double v585;
  double v586;
  double v587;
  char v588;
  Swift::String v589;
  _QWORD v590[4];
  double v591;
  Swift::Int v592;
  Swift::Int v593;
  char v594;
  Swift::String v595;
  _QWORD v596[4];
  Swift::Int v597;
  Swift::Int v598;
  Swift::Int v599;
  char v600;
  Swift::String v601;
  _QWORD v602[4];
  Swift::Int v603;
  Swift::Int v604;
  Swift::Int v605;
  char v606;
  Swift::String v607;
  _QWORD v608[4];
  Swift::Int v609;
  Swift::Int v610;
  Swift::Int v611;
  char v612;
  Swift::String v613;
  _QWORD v614[4];
  Swift::Int v615;
  Swift::Int v616;
  Swift::Int v617;
  char v618;
  Swift::String v619;
  _QWORD v620[4];
  Swift::Int v621;
  Swift::Int v622;
  Swift::Int v623;
  char v624;
  Swift::String v625;
  _QWORD v626[4];
  Swift::Int v627;
  char v628;
  uint64_t v629;

  v500 = MEMORY[0x24BDAC7A8](data._rawValue);
  v629 = 0;
  v628 = 0;
  v622 = 0;
  v616 = 0;
  v610 = 0;
  v604 = 0;
  v598 = 0;
  v592 = 0;
  v586 = 0.0;
  v580 = 0.0;
  v574 = 0;
  v477 = 0;
  v478 = type metadata accessor for Logger();
  v479 = *(_QWORD *)(v478 - 8);
  v480 = *(_QWORD *)(v479 + 64);
  v481 = (v480 + 15) & 0xFFFFFFFFFFFFFFF0;
  v1 = MEMORY[0x24BDAC7A8](v500);
  v482 = (char *)&v145 - v481;
  v483 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  v3 = MEMORY[0x24BDAC7A8](v1);
  v484 = (char *)&v145 - v483;
  v485 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v5 = MEMORY[0x24BDAC7A8](v3);
  v486 = (char *)&v145 - v485;
  v487 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = MEMORY[0x24BDAC7A8](v5);
  v488 = (char *)&v145 - v487;
  v489 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v490 = (char *)&v145 - v489;
  v491 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v492 = (char *)&v145 - v491;
  v493 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v494 = (char *)&v145 - v493;
  v495 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v496 = (char *)&v145 - v495;
  v497 = (v16 + 15) & 0xFFFFFFFFFFFFFFF0;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v498 = (char *)&v145 - v497;
  v629 = v17;
  v628 = 0;
  v499 = *kMediaML_rssi.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v501 = &v625;
  v625 = v499;
  MEMORY[0x242696BAC](v626);
  outlined destroy of String();
  if (v626[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v475 = v502;
      v476 = 0;
    }
    else
    {
      v475 = 0;
      v476 = 1;
    }
    v473 = v475;
    v474 = v476;
  }
  else
  {
    v145 = 0;
    outlined destroy of Any?((uint64_t)v626);
    v473 = v145;
    v474 = 1;
  }
  v623 = v473;
  v624 = v474 & 1;
  if ((v474 & 1) != 0)
    v627 = 0;
  else
    v627 = v623;
  v470 = v627;
  v622 = v627;
  v471 = *kMediaML_rsrp.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v472 = &v619;
  v619 = v471;
  MEMORY[0x242696BAC](v620);
  outlined destroy of String();
  if (v620[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v468 = v503;
      v469 = 0;
    }
    else
    {
      v468 = 0;
      v469 = 1;
    }
    v466 = v468;
    v467 = v469;
  }
  else
  {
    v146 = 0;
    outlined destroy of Any?((uint64_t)v620);
    v466 = v146;
    v467 = 1;
  }
  v617 = v466;
  v618 = v467 & 1;
  if ((v467 & 1) != 0)
    v621 = 0;
  else
    v621 = v617;
  v463 = v621;
  v616 = v621;
  v464 = *kMediaML_rsrq.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v465 = &v613;
  v613 = v464;
  MEMORY[0x242696BAC](v614);
  outlined destroy of String();
  if (v614[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v461 = v504;
      v462 = 0;
    }
    else
    {
      v461 = 0;
      v462 = 1;
    }
    v459 = v461;
    v460 = v462;
  }
  else
  {
    v147 = 0;
    outlined destroy of Any?((uint64_t)v614);
    v459 = v147;
    v460 = 1;
  }
  v611 = v459;
  v612 = v460 & 1;
  if ((v460 & 1) != 0)
    v615 = 0;
  else
    v615 = v611;
  v456 = v615;
  v610 = v615;
  v457 = *kMediaML_rscp.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v458 = &v607;
  v607 = v457;
  MEMORY[0x242696BAC](v608);
  outlined destroy of String();
  if (v608[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v454 = v505;
      v455 = 0;
    }
    else
    {
      v454 = 0;
      v455 = 1;
    }
    v452 = v454;
    v453 = v455;
  }
  else
  {
    v148 = 0;
    outlined destroy of Any?((uint64_t)v608);
    v452 = v148;
    v453 = 1;
  }
  v605 = v452;
  v606 = v453 & 1;
  if ((v453 & 1) != 0)
    v609 = 0;
  else
    v609 = v605;
  v449 = v609;
  v604 = v609;
  v450 = *kMediaML_noise.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v451 = &v601;
  v601 = v450;
  MEMORY[0x242696BAC](v602);
  outlined destroy of String();
  if (v602[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v447 = v506;
      v448 = 0;
    }
    else
    {
      v447 = 0;
      v448 = 1;
    }
    v445 = v447;
    v446 = v448;
  }
  else
  {
    v149 = 0;
    outlined destroy of Any?((uint64_t)v602);
    v445 = v149;
    v446 = 1;
  }
  v599 = v445;
  v600 = v446 & 1;
  if ((v446 & 1) != 0)
    v603 = 0;
  else
    v603 = v599;
  v442 = v603;
  v598 = v603;
  v443 = *kMediaML_bars.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v444 = &v595;
  v595 = v443;
  MEMORY[0x242696BAC](v596);
  outlined destroy of String();
  if (v596[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v440 = v507;
      v441 = 0;
    }
    else
    {
      v440 = 0;
      v441 = 1;
    }
    v438 = v440;
    v439 = v441;
  }
  else
  {
    v150 = 0;
    outlined destroy of Any?((uint64_t)v596);
    v438 = v150;
    v439 = 1;
  }
  v593 = v438;
  v594 = v439 & 1;
  if ((v439 & 1) != 0)
    v597 = 0;
  else
    v597 = v593;
  v435 = v597;
  v592 = v597;
  v436 = *kMediaML_rxRate.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v437 = &v589;
  v589 = v436;
  MEMORY[0x242696BAC](v590);
  outlined destroy of String();
  if (v590[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v433 = v508;
      v434 = 0;
    }
    else
    {
      v433 = 0.0;
      v434 = 1;
    }
    v431 = v433;
    v432 = v434;
  }
  else
  {
    v151 = 0.0;
    outlined destroy of Any?((uint64_t)v590);
    v431 = v151;
    v432 = 1;
  }
  v587 = v431;
  v588 = v432 & 1;
  if ((v432 & 1) != 0)
    v591 = 0.0;
  else
    v591 = v587;
  v428 = v591;
  v586 = v591;
  v429 = *kMediaML_txRate.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v430 = &v583;
  v583 = v429;
  MEMORY[0x242696BAC](v584);
  outlined destroy of String();
  if (v584[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v426 = v509;
      v427 = 0;
    }
    else
    {
      v426 = 0.0;
      v427 = 1;
    }
    v424 = v426;
    v425 = v427;
  }
  else
  {
    v152 = 0.0;
    outlined destroy of Any?((uint64_t)v584);
    v424 = v152;
    v425 = 1;
  }
  v581 = v424;
  v582 = v425 & 1;
  if ((v425 & 1) != 0)
    v585 = 0.0;
  else
    v585 = v581;
  v421 = v585;
  v580 = v585;
  v422 = *kMediaML_throughputTrue.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v423 = &v577;
  v577 = v422;
  MEMORY[0x242696BAC](v578);
  outlined destroy of String();
  if (v578[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v419 = v510;
      v420 = 0;
    }
    else
    {
      v419 = 0;
      v420 = 1;
    }
    v417 = v419;
    v418 = v420;
  }
  else
  {
    v153 = 0;
    outlined destroy of Any?((uint64_t)v578);
    v417 = v153;
    v418 = 1;
  }
  v575 = v417;
  v576 = v418 & 1;
  if ((v418 & 1) != 0)
    v579 = 0;
  else
    v579 = v575;
  v416 = v579;
  v574 = v579;
  if (v470 <= 0 && v470 >= *minSignalStrength.unsafeMutableAddressor())
  {
    if (v463 <= 0 && v463 >= *minSignalStrength.unsafeMutableAddressor())
    {
      if (v456 <= 0 && v456 >= *minSignalStrength.unsafeMutableAddressor())
      {
        if (v449 <= 0 && v449 >= *minSignalStrength.unsafeMutableAddressor())
        {
          if (v442 <= 0 && v442 >= *minNoise.unsafeMutableAddressor())
          {
            if (v435 >= 0 && *maxBars.unsafeMutableAddressor() >= v435)
            {
              if (v428 >= 0.0 && v428 <= *maxRxRate.unsafeMutableAddressor())
              {
                if (v421 >= 0.0 && v421 <= *maxTxRate.unsafeMutableAddressor())
                {
                  if (v416 > 0 && *maxThroughput.unsafeMutableAddressor() >= v416)
                  {
                    v628 = 1;
                    v406 = 1;
                  }
                  else
                  {
                    v18 = v498;
                    v19 = logger.unsafeMutableAddressor();
                    (*(void (**)(char *, uint64_t, uint64_t))(v479 + 16))(v18, v19, v478);
                    v395 = 7;
                    v396 = swift_allocObject();
                    *(_QWORD *)(v396 + 16) = v416;
                    v404 = Logger.logObject.getter();
                    v405 = static os_log_type_t.error.getter();
                    v391 = &v516;
                    v516 = 12;
                    v389 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
                    v390 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
                    lazy protocol witness table accessor for type Int and conformance Int();
                    UnsignedInteger<>.init<A>(_:)();
                    v392 = v517;
                    v393 = 17;
                    v398 = swift_allocObject();
                    *(_BYTE *)(v398 + 16) = 0;
                    v399 = swift_allocObject();
                    *(_BYTE *)(v399 + 16) = 8;
                    v394 = 32;
                    v20 = swift_allocObject();
                    v21 = v396;
                    v397 = v20;
                    *(_QWORD *)(v20 + 16) = partial apply for implicit closure #27 in checkValidNumericInputRange(data:);
                    *(_QWORD *)(v20 + 24) = v21;
                    v22 = swift_allocObject();
                    v23 = v397;
                    v401 = v22;
                    *(_QWORD *)(v22 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
                    *(_QWORD *)(v22 + 24) = v23;
                    v403 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
                    v400 = _allocateUninitializedArray<A>(_:)();
                    v402 = v24;
                    swift_retain();
                    v25 = v398;
                    v26 = v402;
                    *v402 = closure #1 in OSLogArguments.append(_:)partial apply;
                    v26[1] = v25;
                    swift_retain();
                    v27 = v399;
                    v28 = v402;
                    v402[2] = closure #1 in OSLogArguments.append(_:)partial apply;
                    v28[3] = v27;
                    swift_retain();
                    v29 = v401;
                    v30 = v402;
                    v402[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
                    v30[5] = v29;
                    _finalizeUninitializedArray<A>(_:)();
                    swift_bridgeObjectRelease();
                    if (os_log_type_enabled(v404, (os_log_type_t)v405))
                    {
                      v31 = v477;
                      v382 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
                      v380 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
                      v381 = 0;
                      v383 = createStorage<A>(capacity:type:)(0);
                      v384 = createStorage<A>(capacity:type:)(v381);
                      v385 = &v515;
                      v515 = v382;
                      v386 = &v514;
                      v514 = v383;
                      v387 = &v513;
                      v513 = v384;
                      serialize(_:at:)(0, &v515);
                      serialize(_:at:)(1, v385);
                      v511 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
                      v512 = v398;
                      closure #1 in osLogInternal(_:log:type:)(&v511, (uint64_t)v385, (uint64_t)v386, (uint64_t)v387);
                      v388 = v31;
                      if (v31)
                      {
                        __break(1u);
                      }
                      else
                      {
                        v511 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
                        v512 = v399;
                        closure #1 in osLogInternal(_:log:type:)(&v511, (uint64_t)&v515, (uint64_t)&v514, (uint64_t)&v513);
                        v379 = 0;
                        v511 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
                        v512 = v401;
                        closure #1 in osLogInternal(_:log:type:)(&v511, (uint64_t)&v515, (uint64_t)&v514, (uint64_t)&v513);
                        _os_log_impl(&dword_241581000, v404, (os_log_type_t)v405, "throughput_true in data directory failed validation: %ld", v382, v392);
                        v378 = 0;
                        destroyStorage<A>(_:count:)(v383, 0, v380);
                        destroyStorage<A>(_:count:)(v384, v378, MEMORY[0x24BEE4AD8] + 8);
                        MEMORY[0x242696CA8](v382, MEMORY[0x24BEE4260]);
                        swift_release();
                        swift_release();
                        swift_release();
                      }
                    }
                    else
                    {
                      swift_release();
                      swift_release();
                      swift_release();
                    }

                    (*(void (**)(char *, uint64_t))(v479 + 8))(v498, v478);
                    v406 = 0;
                  }
                }
                else
                {
                  v32 = v496;
                  v33 = logger.unsafeMutableAddressor();
                  (*(void (**)(char *, uint64_t, uint64_t))(v479 + 16))(v32, v33, v478);
                  v367 = 7;
                  v368 = swift_allocObject();
                  *(Swift::Double *)(v368 + 16) = v421;
                  v376 = Logger.logObject.getter();
                  v377 = static os_log_type_t.error.getter();
                  v363 = &v523;
                  v523 = 12;
                  v361 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
                  v362 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
                  lazy protocol witness table accessor for type Int and conformance Int();
                  UnsignedInteger<>.init<A>(_:)();
                  v364 = v524;
                  v365 = 17;
                  v370 = swift_allocObject();
                  *(_BYTE *)(v370 + 16) = 0;
                  v371 = swift_allocObject();
                  *(_BYTE *)(v371 + 16) = 8;
                  v366 = 32;
                  v34 = swift_allocObject();
                  v35 = v368;
                  v369 = v34;
                  *(_QWORD *)(v34 + 16) = partial apply for implicit closure #25 in checkValidNumericInputRange(data:);
                  *(_QWORD *)(v34 + 24) = v35;
                  v36 = swift_allocObject();
                  v37 = v369;
                  v373 = v36;
                  *(_QWORD *)(v36 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
                  *(_QWORD *)(v36 + 24) = v37;
                  v375 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
                  v372 = _allocateUninitializedArray<A>(_:)();
                  v374 = v38;
                  swift_retain();
                  v39 = v370;
                  v40 = v374;
                  *v374 = closure #1 in OSLogArguments.append(_:)partial apply;
                  v40[1] = v39;
                  swift_retain();
                  v41 = v371;
                  v42 = v374;
                  v374[2] = closure #1 in OSLogArguments.append(_:)partial apply;
                  v42[3] = v41;
                  swift_retain();
                  v43 = v373;
                  v44 = v374;
                  v374[4] = closure #1 in OSLogArguments.append(_:)partial apply;
                  v44[5] = v43;
                  _finalizeUninitializedArray<A>(_:)();
                  swift_bridgeObjectRelease();
                  if (os_log_type_enabled(v376, (os_log_type_t)v377))
                  {
                    v45 = v477;
                    v354 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
                    v352 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
                    v353 = 0;
                    v355 = createStorage<A>(capacity:type:)(0);
                    v356 = createStorage<A>(capacity:type:)(v353);
                    v357 = &v522;
                    v522 = v354;
                    v358 = &v521;
                    v521 = v355;
                    v359 = &v520;
                    v520 = v356;
                    serialize(_:at:)(0, &v522);
                    serialize(_:at:)(1, v357);
                    v518 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
                    v519 = v370;
                    closure #1 in osLogInternal(_:log:type:)(&v518, (uint64_t)v357, (uint64_t)v358, (uint64_t)v359);
                    v360 = v45;
                    if (v45)
                    {
                      __break(1u);
                    }
                    else
                    {
                      v518 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
                      v519 = v371;
                      closure #1 in osLogInternal(_:log:type:)(&v518, (uint64_t)&v522, (uint64_t)&v521, (uint64_t)&v520);
                      v351 = 0;
                      v518 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
                      v519 = v373;
                      closure #1 in osLogInternal(_:log:type:)(&v518, (uint64_t)&v522, (uint64_t)&v521, (uint64_t)&v520);
                      _os_log_impl(&dword_241581000, v376, (os_log_type_t)v377, "txRate in data directory failed validation: %f", v354, v364);
                      v350 = 0;
                      destroyStorage<A>(_:count:)(v355, 0, v352);
                      destroyStorage<A>(_:count:)(v356, v350, MEMORY[0x24BEE4AD8] + 8);
                      MEMORY[0x242696CA8](v354, MEMORY[0x24BEE4260]);
                      swift_release();
                      swift_release();
                      swift_release();
                    }
                  }
                  else
                  {
                    swift_release();
                    swift_release();
                    swift_release();
                  }

                  (*(void (**)(char *, uint64_t))(v479 + 8))(v496, v478);
                  v406 = 0;
                }
              }
              else
              {
                v46 = v494;
                v47 = logger.unsafeMutableAddressor();
                (*(void (**)(char *, uint64_t, uint64_t))(v479 + 16))(v46, v47, v478);
                v339 = 7;
                v340 = swift_allocObject();
                *(Swift::Double *)(v340 + 16) = v428;
                v348 = Logger.logObject.getter();
                v349 = static os_log_type_t.error.getter();
                v335 = &v530;
                v530 = 12;
                v333 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
                v334 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
                lazy protocol witness table accessor for type Int and conformance Int();
                UnsignedInteger<>.init<A>(_:)();
                v336 = v531;
                v337 = 17;
                v342 = swift_allocObject();
                *(_BYTE *)(v342 + 16) = 0;
                v343 = swift_allocObject();
                *(_BYTE *)(v343 + 16) = 8;
                v338 = 32;
                v48 = swift_allocObject();
                v49 = v340;
                v341 = v48;
                *(_QWORD *)(v48 + 16) = partial apply for implicit closure #23 in checkValidNumericInputRange(data:);
                *(_QWORD *)(v48 + 24) = v49;
                v50 = swift_allocObject();
                v51 = v341;
                v345 = v50;
                *(_QWORD *)(v50 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:);
                *(_QWORD *)(v50 + 24) = v51;
                v347 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
                v344 = _allocateUninitializedArray<A>(_:)();
                v346 = v52;
                swift_retain();
                v53 = v342;
                v54 = v346;
                *v346 = closure #1 in OSLogArguments.append(_:)partial apply;
                v54[1] = v53;
                swift_retain();
                v55 = v343;
                v56 = v346;
                v346[2] = closure #1 in OSLogArguments.append(_:)partial apply;
                v56[3] = v55;
                swift_retain();
                v57 = v345;
                v58 = v346;
                v346[4] = partial apply for closure #1 in OSLogArguments.append(_:);
                v58[5] = v57;
                _finalizeUninitializedArray<A>(_:)();
                swift_bridgeObjectRelease();
                if (os_log_type_enabled(v348, (os_log_type_t)v349))
                {
                  v59 = v477;
                  v326 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
                  v324 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
                  v325 = 0;
                  v327 = createStorage<A>(capacity:type:)(0);
                  v328 = createStorage<A>(capacity:type:)(v325);
                  v329 = &v529;
                  v529 = v326;
                  v330 = &v528;
                  v528 = v327;
                  v331 = &v527;
                  v527 = v328;
                  serialize(_:at:)(0, &v529);
                  serialize(_:at:)(1, v329);
                  v525 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
                  v526 = v342;
                  closure #1 in osLogInternal(_:log:type:)(&v525, (uint64_t)v329, (uint64_t)v330, (uint64_t)v331);
                  v332 = v59;
                  if (v59)
                  {
                    __break(1u);
                  }
                  else
                  {
                    v525 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
                    v526 = v343;
                    closure #1 in osLogInternal(_:log:type:)(&v525, (uint64_t)&v529, (uint64_t)&v528, (uint64_t)&v527);
                    v323 = 0;
                    v525 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
                    v526 = v345;
                    closure #1 in osLogInternal(_:log:type:)(&v525, (uint64_t)&v529, (uint64_t)&v528, (uint64_t)&v527);
                    _os_log_impl(&dword_241581000, v348, (os_log_type_t)v349, "rxRate in data directory failed validation: %f", v326, v336);
                    v322 = 0;
                    destroyStorage<A>(_:count:)(v327, 0, v324);
                    destroyStorage<A>(_:count:)(v328, v322, MEMORY[0x24BEE4AD8] + 8);
                    MEMORY[0x242696CA8](v326, MEMORY[0x24BEE4260]);
                    swift_release();
                    swift_release();
                    swift_release();
                  }
                }
                else
                {
                  swift_release();
                  swift_release();
                  swift_release();
                }

                (*(void (**)(char *, uint64_t))(v479 + 8))(v494, v478);
                v406 = 0;
              }
            }
            else
            {
              v60 = v492;
              v61 = logger.unsafeMutableAddressor();
              (*(void (**)(char *, uint64_t, uint64_t))(v479 + 16))(v60, v61, v478);
              v311 = 7;
              v312 = swift_allocObject();
              *(_QWORD *)(v312 + 16) = v435;
              v320 = Logger.logObject.getter();
              v321 = static os_log_type_t.error.getter();
              v307 = &v537;
              v537 = 12;
              v305 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
              v306 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
              lazy protocol witness table accessor for type Int and conformance Int();
              UnsignedInteger<>.init<A>(_:)();
              v308 = v538;
              v309 = 17;
              v314 = swift_allocObject();
              *(_BYTE *)(v314 + 16) = 0;
              v315 = swift_allocObject();
              *(_BYTE *)(v315 + 16) = 8;
              v310 = 32;
              v62 = swift_allocObject();
              v63 = v312;
              v313 = v62;
              *(_QWORD *)(v62 + 16) = partial apply for implicit closure #21 in checkValidNumericInputRange(data:);
              *(_QWORD *)(v62 + 24) = v63;
              v64 = swift_allocObject();
              v65 = v313;
              v317 = v64;
              *(_QWORD *)(v64 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
              *(_QWORD *)(v64 + 24) = v65;
              v319 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
              v316 = _allocateUninitializedArray<A>(_:)();
              v318 = v66;
              swift_retain();
              v67 = v314;
              v68 = v318;
              *v318 = closure #1 in OSLogArguments.append(_:)partial apply;
              v68[1] = v67;
              swift_retain();
              v69 = v315;
              v70 = v318;
              v318[2] = closure #1 in OSLogArguments.append(_:)partial apply;
              v70[3] = v69;
              swift_retain();
              v71 = v317;
              v72 = v318;
              v318[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
              v72[5] = v71;
              _finalizeUninitializedArray<A>(_:)();
              swift_bridgeObjectRelease();
              if (os_log_type_enabled(v320, (os_log_type_t)v321))
              {
                v73 = v477;
                v298 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
                v296 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
                v297 = 0;
                v299 = createStorage<A>(capacity:type:)(0);
                v300 = createStorage<A>(capacity:type:)(v297);
                v301 = &v536;
                v536 = v298;
                v302 = &v535;
                v535 = v299;
                v303 = &v534;
                v534 = v300;
                serialize(_:at:)(0, &v536);
                serialize(_:at:)(1, v301);
                v532 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
                v533 = v314;
                closure #1 in osLogInternal(_:log:type:)(&v532, (uint64_t)v301, (uint64_t)v302, (uint64_t)v303);
                v304 = v73;
                if (v73)
                {
                  __break(1u);
                }
                else
                {
                  v532 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
                  v533 = v315;
                  closure #1 in osLogInternal(_:log:type:)(&v532, (uint64_t)&v536, (uint64_t)&v535, (uint64_t)&v534);
                  v295 = 0;
                  v532 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
                  v533 = v317;
                  closure #1 in osLogInternal(_:log:type:)(&v532, (uint64_t)&v536, (uint64_t)&v535, (uint64_t)&v534);
                  _os_log_impl(&dword_241581000, v320, (os_log_type_t)v321, "bars in data directory failed validation: %ld", v298, v308);
                  v294 = 0;
                  destroyStorage<A>(_:count:)(v299, 0, v296);
                  destroyStorage<A>(_:count:)(v300, v294, MEMORY[0x24BEE4AD8] + 8);
                  MEMORY[0x242696CA8](v298, MEMORY[0x24BEE4260]);
                  swift_release();
                  swift_release();
                  swift_release();
                }
              }
              else
              {
                swift_release();
                swift_release();
                swift_release();
              }

              (*(void (**)(char *, uint64_t))(v479 + 8))(v492, v478);
              v406 = 0;
            }
          }
          else
          {
            v74 = v490;
            v75 = logger.unsafeMutableAddressor();
            (*(void (**)(char *, uint64_t, uint64_t))(v479 + 16))(v74, v75, v478);
            v283 = 7;
            v284 = swift_allocObject();
            *(_QWORD *)(v284 + 16) = v442;
            v292 = Logger.logObject.getter();
            v293 = static os_log_type_t.error.getter();
            v279 = &v544;
            v544 = 12;
            v277 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
            v278 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
            lazy protocol witness table accessor for type Int and conformance Int();
            UnsignedInteger<>.init<A>(_:)();
            v280 = v545;
            v281 = 17;
            v286 = swift_allocObject();
            *(_BYTE *)(v286 + 16) = 0;
            v287 = swift_allocObject();
            *(_BYTE *)(v287 + 16) = 8;
            v282 = 32;
            v76 = swift_allocObject();
            v77 = v284;
            v285 = v76;
            *(_QWORD *)(v76 + 16) = partial apply for implicit closure #19 in checkValidNumericInputRange(data:);
            *(_QWORD *)(v76 + 24) = v77;
            v78 = swift_allocObject();
            v79 = v285;
            v289 = v78;
            *(_QWORD *)(v78 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
            *(_QWORD *)(v78 + 24) = v79;
            v291 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
            v288 = _allocateUninitializedArray<A>(_:)();
            v290 = v80;
            swift_retain();
            v81 = v286;
            v82 = v290;
            *v290 = closure #1 in OSLogArguments.append(_:)partial apply;
            v82[1] = v81;
            swift_retain();
            v83 = v287;
            v84 = v290;
            v290[2] = closure #1 in OSLogArguments.append(_:)partial apply;
            v84[3] = v83;
            swift_retain();
            v85 = v289;
            v86 = v290;
            v290[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
            v86[5] = v85;
            _finalizeUninitializedArray<A>(_:)();
            swift_bridgeObjectRelease();
            if (os_log_type_enabled(v292, (os_log_type_t)v293))
            {
              v87 = v477;
              v270 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
              v268 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
              v269 = 0;
              v271 = createStorage<A>(capacity:type:)(0);
              v272 = createStorage<A>(capacity:type:)(v269);
              v273 = &v543;
              v543 = v270;
              v274 = &v542;
              v542 = v271;
              v275 = &v541;
              v541 = v272;
              serialize(_:at:)(0, &v543);
              serialize(_:at:)(1, v273);
              v539 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
              v540 = v286;
              closure #1 in osLogInternal(_:log:type:)(&v539, (uint64_t)v273, (uint64_t)v274, (uint64_t)v275);
              v276 = v87;
              if (v87)
              {
                __break(1u);
              }
              else
              {
                v539 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
                v540 = v287;
                closure #1 in osLogInternal(_:log:type:)(&v539, (uint64_t)&v543, (uint64_t)&v542, (uint64_t)&v541);
                v267 = 0;
                v539 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
                v540 = v289;
                closure #1 in osLogInternal(_:log:type:)(&v539, (uint64_t)&v543, (uint64_t)&v542, (uint64_t)&v541);
                _os_log_impl(&dword_241581000, v292, (os_log_type_t)v293, "noise in data directory failed validation: %ld", v270, v280);
                v266 = 0;
                destroyStorage<A>(_:count:)(v271, 0, v268);
                destroyStorage<A>(_:count:)(v272, v266, MEMORY[0x24BEE4AD8] + 8);
                MEMORY[0x242696CA8](v270, MEMORY[0x24BEE4260]);
                swift_release();
                swift_release();
                swift_release();
              }
            }
            else
            {
              swift_release();
              swift_release();
              swift_release();
            }

            (*(void (**)(char *, uint64_t))(v479 + 8))(v490, v478);
            v406 = 0;
          }
        }
        else
        {
          v88 = v488;
          v89 = logger.unsafeMutableAddressor();
          (*(void (**)(char *, uint64_t, uint64_t))(v479 + 16))(v88, v89, v478);
          v255 = 7;
          v256 = swift_allocObject();
          *(_QWORD *)(v256 + 16) = v449;
          v264 = Logger.logObject.getter();
          v265 = static os_log_type_t.error.getter();
          v251 = &v551;
          v551 = 12;
          v249 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
          v250 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
          lazy protocol witness table accessor for type Int and conformance Int();
          UnsignedInteger<>.init<A>(_:)();
          v252 = v552;
          v253 = 17;
          v258 = swift_allocObject();
          *(_BYTE *)(v258 + 16) = 0;
          v259 = swift_allocObject();
          *(_BYTE *)(v259 + 16) = 8;
          v254 = 32;
          v90 = swift_allocObject();
          v91 = v256;
          v257 = v90;
          *(_QWORD *)(v90 + 16) = partial apply for implicit closure #17 in checkValidNumericInputRange(data:);
          *(_QWORD *)(v90 + 24) = v91;
          v92 = swift_allocObject();
          v93 = v257;
          v261 = v92;
          *(_QWORD *)(v92 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
          *(_QWORD *)(v92 + 24) = v93;
          v263 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
          v260 = _allocateUninitializedArray<A>(_:)();
          v262 = v94;
          swift_retain();
          v95 = v258;
          v96 = v262;
          *v262 = closure #1 in OSLogArguments.append(_:)partial apply;
          v96[1] = v95;
          swift_retain();
          v97 = v259;
          v98 = v262;
          v262[2] = closure #1 in OSLogArguments.append(_:)partial apply;
          v98[3] = v97;
          swift_retain();
          v99 = v261;
          v100 = v262;
          v262[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
          v100[5] = v99;
          _finalizeUninitializedArray<A>(_:)();
          swift_bridgeObjectRelease();
          if (os_log_type_enabled(v264, (os_log_type_t)v265))
          {
            v101 = v477;
            v242 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
            v240 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
            v241 = 0;
            v243 = createStorage<A>(capacity:type:)(0);
            v244 = createStorage<A>(capacity:type:)(v241);
            v245 = &v550;
            v550 = v242;
            v246 = &v549;
            v549 = v243;
            v247 = &v548;
            v548 = v244;
            serialize(_:at:)(0, &v550);
            serialize(_:at:)(1, v245);
            v546 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
            v547 = v258;
            closure #1 in osLogInternal(_:log:type:)(&v546, (uint64_t)v245, (uint64_t)v246, (uint64_t)v247);
            v248 = v101;
            if (v101)
            {
              __break(1u);
            }
            else
            {
              v546 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
              v547 = v259;
              closure #1 in osLogInternal(_:log:type:)(&v546, (uint64_t)&v550, (uint64_t)&v549, (uint64_t)&v548);
              v239 = 0;
              v546 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
              v547 = v261;
              closure #1 in osLogInternal(_:log:type:)(&v546, (uint64_t)&v550, (uint64_t)&v549, (uint64_t)&v548);
              _os_log_impl(&dword_241581000, v264, (os_log_type_t)v265, "rscp in data directory failed validation: %ld", v242, v252);
              v238 = 0;
              destroyStorage<A>(_:count:)(v243, 0, v240);
              destroyStorage<A>(_:count:)(v244, v238, MEMORY[0x24BEE4AD8] + 8);
              MEMORY[0x242696CA8](v242, MEMORY[0x24BEE4260]);
              swift_release();
              swift_release();
              swift_release();
            }
          }
          else
          {
            swift_release();
            swift_release();
            swift_release();
          }

          (*(void (**)(char *, uint64_t))(v479 + 8))(v488, v478);
          v406 = 0;
        }
      }
      else
      {
        v102 = v486;
        v103 = logger.unsafeMutableAddressor();
        (*(void (**)(char *, uint64_t, uint64_t))(v479 + 16))(v102, v103, v478);
        v227 = 7;
        v228 = swift_allocObject();
        *(_QWORD *)(v228 + 16) = v456;
        v236 = Logger.logObject.getter();
        v237 = static os_log_type_t.error.getter();
        v223 = &v558;
        v558 = 12;
        v221 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        v222 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        lazy protocol witness table accessor for type Int and conformance Int();
        UnsignedInteger<>.init<A>(_:)();
        v224 = v559;
        v225 = 17;
        v230 = swift_allocObject();
        *(_BYTE *)(v230 + 16) = 0;
        v231 = swift_allocObject();
        *(_BYTE *)(v231 + 16) = 8;
        v226 = 32;
        v104 = swift_allocObject();
        v105 = v228;
        v229 = v104;
        *(_QWORD *)(v104 + 16) = partial apply for implicit closure #15 in checkValidNumericInputRange(data:);
        *(_QWORD *)(v104 + 24) = v105;
        v106 = swift_allocObject();
        v107 = v229;
        v233 = v106;
        *(_QWORD *)(v106 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
        *(_QWORD *)(v106 + 24) = v107;
        v235 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
        v232 = _allocateUninitializedArray<A>(_:)();
        v234 = v108;
        swift_retain();
        v109 = v230;
        v110 = v234;
        *v234 = closure #1 in OSLogArguments.append(_:)partial apply;
        v110[1] = v109;
        swift_retain();
        v111 = v231;
        v112 = v234;
        v234[2] = closure #1 in OSLogArguments.append(_:)partial apply;
        v112[3] = v111;
        swift_retain();
        v113 = v233;
        v114 = v234;
        v234[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
        v114[5] = v113;
        _finalizeUninitializedArray<A>(_:)();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v236, (os_log_type_t)v237))
        {
          v115 = v477;
          v214 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
          v212 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          v213 = 0;
          v215 = createStorage<A>(capacity:type:)(0);
          v216 = createStorage<A>(capacity:type:)(v213);
          v217 = &v557;
          v557 = v214;
          v218 = &v556;
          v556 = v215;
          v219 = &v555;
          v555 = v216;
          serialize(_:at:)(0, &v557);
          serialize(_:at:)(1, v217);
          v553 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
          v554 = v230;
          closure #1 in osLogInternal(_:log:type:)(&v553, (uint64_t)v217, (uint64_t)v218, (uint64_t)v219);
          v220 = v115;
          if (v115)
          {
            __break(1u);
          }
          else
          {
            v553 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
            v554 = v231;
            closure #1 in osLogInternal(_:log:type:)(&v553, (uint64_t)&v557, (uint64_t)&v556, (uint64_t)&v555);
            v211 = 0;
            v553 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
            v554 = v233;
            closure #1 in osLogInternal(_:log:type:)(&v553, (uint64_t)&v557, (uint64_t)&v556, (uint64_t)&v555);
            _os_log_impl(&dword_241581000, v236, (os_log_type_t)v237, "rsrq in data directory failed validation: %ld", v214, v224);
            v210 = 0;
            destroyStorage<A>(_:count:)(v215, 0, v212);
            destroyStorage<A>(_:count:)(v216, v210, MEMORY[0x24BEE4AD8] + 8);
            MEMORY[0x242696CA8](v214, MEMORY[0x24BEE4260]);
            swift_release();
            swift_release();
            swift_release();
          }
        }
        else
        {
          swift_release();
          swift_release();
          swift_release();
        }

        (*(void (**)(char *, uint64_t))(v479 + 8))(v486, v478);
        v406 = 0;
      }
    }
    else
    {
      v116 = v484;
      v117 = logger.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v479 + 16))(v116, v117, v478);
      v199 = 7;
      v200 = swift_allocObject();
      *(_QWORD *)(v200 + 16) = v463;
      v208 = Logger.logObject.getter();
      v209 = static os_log_type_t.error.getter();
      v195 = &v565;
      v565 = 12;
      v193 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      v194 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      v196 = v566;
      v197 = 17;
      v202 = swift_allocObject();
      *(_BYTE *)(v202 + 16) = 0;
      v203 = swift_allocObject();
      *(_BYTE *)(v203 + 16) = 8;
      v198 = 32;
      v118 = swift_allocObject();
      v119 = v200;
      v201 = v118;
      *(_QWORD *)(v118 + 16) = partial apply for implicit closure #13 in checkValidNumericInputRange(data:);
      *(_QWORD *)(v118 + 24) = v119;
      v120 = swift_allocObject();
      v121 = v201;
      v205 = v120;
      *(_QWORD *)(v120 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
      *(_QWORD *)(v120 + 24) = v121;
      v207 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      v204 = _allocateUninitializedArray<A>(_:)();
      v206 = v122;
      swift_retain();
      v123 = v202;
      v124 = v206;
      *v206 = closure #1 in OSLogArguments.append(_:)partial apply;
      v124[1] = v123;
      swift_retain();
      v125 = v203;
      v126 = v206;
      v206[2] = closure #1 in OSLogArguments.append(_:)partial apply;
      v126[3] = v125;
      swift_retain();
      v127 = v205;
      v128 = v206;
      v206[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
      v128[5] = v127;
      _finalizeUninitializedArray<A>(_:)();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v208, (os_log_type_t)v209))
      {
        v129 = v477;
        v186 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        v184 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        v185 = 0;
        v187 = createStorage<A>(capacity:type:)(0);
        v188 = createStorage<A>(capacity:type:)(v185);
        v189 = &v564;
        v564 = v186;
        v190 = &v563;
        v563 = v187;
        v191 = &v562;
        v562 = v188;
        serialize(_:at:)(0, &v564);
        serialize(_:at:)(1, v189);
        v560 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        v561 = v202;
        closure #1 in osLogInternal(_:log:type:)(&v560, (uint64_t)v189, (uint64_t)v190, (uint64_t)v191);
        v192 = v129;
        if (v129)
        {
          __break(1u);
        }
        else
        {
          v560 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
          v561 = v203;
          closure #1 in osLogInternal(_:log:type:)(&v560, (uint64_t)&v564, (uint64_t)&v563, (uint64_t)&v562);
          v183 = 0;
          v560 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
          v561 = v205;
          closure #1 in osLogInternal(_:log:type:)(&v560, (uint64_t)&v564, (uint64_t)&v563, (uint64_t)&v562);
          _os_log_impl(&dword_241581000, v208, (os_log_type_t)v209, "rsrp in data directory failed validation: %ld", v186, v196);
          v182 = 0;
          destroyStorage<A>(_:count:)(v187, 0, v184);
          destroyStorage<A>(_:count:)(v188, v182, MEMORY[0x24BEE4AD8] + 8);
          MEMORY[0x242696CA8](v186, MEMORY[0x24BEE4260]);
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v479 + 8))(v484, v478);
      v406 = 0;
    }
  }
  else
  {
    v130 = v482;
    v131 = logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v479 + 16))(v130, v131, v478);
    v171 = 7;
    v172 = swift_allocObject();
    *(_QWORD *)(v172 + 16) = v470;
    v180 = Logger.logObject.getter();
    v181 = static os_log_type_t.error.getter();
    v167 = &v572;
    v572 = 12;
    v165 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    v166 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    v168 = v573;
    v169 = 17;
    v174 = swift_allocObject();
    *(_BYTE *)(v174 + 16) = 0;
    v175 = swift_allocObject();
    *(_BYTE *)(v175 + 16) = 8;
    v170 = 32;
    v132 = swift_allocObject();
    v133 = v172;
    v173 = v132;
    *(_QWORD *)(v132 + 16) = partial apply for implicit closure #11 in checkValidNumericInputRange(data:);
    *(_QWORD *)(v132 + 24) = v133;
    v134 = swift_allocObject();
    v135 = v173;
    v177 = v134;
    *(_QWORD *)(v134 + 16) = partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int);
    *(_QWORD *)(v134 + 24) = v135;
    v179 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v176 = _allocateUninitializedArray<A>(_:)();
    v178 = v136;
    swift_retain();
    v137 = v174;
    v138 = v178;
    *v178 = closure #1 in OSLogArguments.append(_:)partial apply;
    v138[1] = v137;
    swift_retain();
    v139 = v175;
    v140 = v178;
    v178[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v140[3] = v139;
    swift_retain();
    v141 = v177;
    v142 = v178;
    v178[4] = partial apply for closure #1 in OSLogArguments.append<A>(_:);
    v142[5] = v141;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v180, (os_log_type_t)v181))
    {
      v143 = v477;
      v158 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v156 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v157 = 0;
      v159 = createStorage<A>(capacity:type:)(0);
      v160 = createStorage<A>(capacity:type:)(v157);
      v161 = &v571;
      v571 = v158;
      v162 = &v570;
      v570 = v159;
      v163 = &v569;
      v569 = v160;
      serialize(_:at:)(0, &v571);
      serialize(_:at:)(1, v161);
      v567 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v568 = v174;
      closure #1 in osLogInternal(_:log:type:)(&v567, (uint64_t)v161, (uint64_t)v162, (uint64_t)v163);
      v164 = v143;
      if (v143)
      {
        __break(1u);
      }
      else
      {
        v567 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        v568 = v175;
        closure #1 in osLogInternal(_:log:type:)(&v567, (uint64_t)&v571, (uint64_t)&v570, (uint64_t)&v569);
        v155 = 0;
        v567 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append<A>(_:);
        v568 = v177;
        closure #1 in osLogInternal(_:log:type:)(&v567, (uint64_t)&v571, (uint64_t)&v570, (uint64_t)&v569);
        _os_log_impl(&dword_241581000, v180, (os_log_type_t)v181, "rssi in data directory failed validation: %ld", v158, v168);
        v154 = 0;
        destroyStorage<A>(_:count:)(v159, 0, v156);
        destroyStorage<A>(_:count:)(v160, v154, MEMORY[0x24BEE4AD8] + 8);
        MEMORY[0x242696CA8](v158, MEMORY[0x24BEE4260]);
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }

    (*(void (**)(char *, uint64_t))(v479 + 8))(v482, v478);
    v406 = 0;
  }
  return v406 & 1;
}

id @nonobjc NSRegularExpression.init(pattern:options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3;
  uint64_t v5;
  id v6;
  id v7;
  id v9;
  uint64_t v10;

  v7 = (id)MEMORY[0x242696BB8]();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AutoreleasingUnsafeMutablePointer<NSError?>);
  lazy protocol witness table accessor for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>();
  _convertInOutToPointerArgument<A>(_:)();
  v9 = objc_msgSend(v6, sel_initWithPattern_options_error_, v7, a3, v10);
  v3 = 0;

  if (v9)
  {

    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_bridgeObjectRelease();
    return (id)v5;
  }
}

uint64_t protocol witness for SetAlgebra.init() in conformance NSRegularExpressionOptions()
{
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  lazy protocol witness table accessor for type UInt and conformance UInt();
  return OptionSet<>.init()();
}

uint64_t protocol witness for SetAlgebra.contains(_:) in conformance NSRegularExpressionOptions()
{
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  return OptionSet<>.contains(_:)() & 1;
}

uint64_t protocol witness for SetAlgebra.union(_:) in conformance NSRegularExpressionOptions()
{
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  return OptionSet.union(_:)();
}

uint64_t protocol witness for SetAlgebra.intersection(_:) in conformance NSRegularExpressionOptions()
{
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  return OptionSet.intersection(_:)();
}

uint64_t protocol witness for SetAlgebra.symmetricDifference(_:) in conformance NSRegularExpressionOptions()
{
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  return OptionSet.symmetricDifference(_:)();
}

uint64_t protocol witness for SetAlgebra.insert(_:) in conformance NSRegularExpressionOptions()
{
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  return OptionSet<>.insert(_:)() & 1;
}

uint64_t protocol witness for SetAlgebra.remove(_:) in conformance NSRegularExpressionOptions()
{
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  return OptionSet<>.remove(_:)();
}

uint64_t protocol witness for SetAlgebra.update(with:) in conformance NSRegularExpressionOptions()
{
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  return OptionSet<>.update(with:)();
}

uint64_t protocol witness for SetAlgebra.formUnion(_:) in conformance NSRegularExpressionOptions()
{
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  lazy protocol witness table accessor for type UInt and conformance UInt();
  return OptionSet<>.formUnion(_:)();
}

uint64_t protocol witness for SetAlgebra.formIntersection(_:) in conformance NSRegularExpressionOptions()
{
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  lazy protocol witness table accessor for type UInt and conformance UInt();
  return OptionSet<>.formIntersection(_:)();
}

uint64_t protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance NSRegularExpressionOptions()
{
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  lazy protocol witness table accessor for type UInt and conformance UInt();
  return OptionSet<>.formSymmetricDifference(_:)();
}

uint64_t protocol witness for SetAlgebra.subtracting(_:) in conformance NSRegularExpressionOptions()
{
  return SetAlgebra.subtracting(_:)();
}

uint64_t protocol witness for SetAlgebra.isSubset(of:) in conformance NSRegularExpressionOptions()
{
  return SetAlgebra.isSubset(of:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isDisjoint(with:) in conformance NSRegularExpressionOptions()
{
  return SetAlgebra.isDisjoint(with:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isSuperset(of:) in conformance NSRegularExpressionOptions()
{
  return SetAlgebra.isSuperset(of:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isEmpty.getter in conformance NSRegularExpressionOptions()
{
  return SetAlgebra.isEmpty.getter() & 1;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance NSRegularExpressionOptions()
{
  return SetAlgebra.init<A>(_:)();
}

uint64_t protocol witness for SetAlgebra.subtract(_:) in conformance NSRegularExpressionOptions()
{
  return SetAlgebra.subtract(_:)();
}

uint64_t protocol witness for SetAlgebra.init() in conformance NSMatchingOptions()
{
  lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
  lazy protocol witness table accessor for type UInt and conformance UInt();
  return OptionSet<>.init()();
}

uint64_t protocol witness for SetAlgebra.contains(_:) in conformance NSMatchingOptions()
{
  lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
  return OptionSet<>.contains(_:)() & 1;
}

uint64_t protocol witness for SetAlgebra.union(_:) in conformance NSMatchingOptions()
{
  lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
  return OptionSet.union(_:)();
}

uint64_t protocol witness for SetAlgebra.intersection(_:) in conformance NSMatchingOptions()
{
  lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
  return OptionSet.intersection(_:)();
}

uint64_t protocol witness for SetAlgebra.symmetricDifference(_:) in conformance NSMatchingOptions()
{
  lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
  return OptionSet.symmetricDifference(_:)();
}

uint64_t protocol witness for SetAlgebra.insert(_:) in conformance NSMatchingOptions()
{
  lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
  return OptionSet<>.insert(_:)() & 1;
}

uint64_t protocol witness for SetAlgebra.remove(_:) in conformance NSMatchingOptions()
{
  lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
  return OptionSet<>.remove(_:)();
}

uint64_t protocol witness for SetAlgebra.update(with:) in conformance NSMatchingOptions()
{
  lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
  return OptionSet<>.update(with:)();
}

uint64_t protocol witness for SetAlgebra.formUnion(_:) in conformance NSMatchingOptions()
{
  lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
  lazy protocol witness table accessor for type UInt and conformance UInt();
  return OptionSet<>.formUnion(_:)();
}

uint64_t protocol witness for SetAlgebra.formIntersection(_:) in conformance NSMatchingOptions()
{
  lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
  lazy protocol witness table accessor for type UInt and conformance UInt();
  return OptionSet<>.formIntersection(_:)();
}

uint64_t protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance NSMatchingOptions()
{
  lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
  lazy protocol witness table accessor for type UInt and conformance UInt();
  return OptionSet<>.formSymmetricDifference(_:)();
}

uint64_t protocol witness for SetAlgebra.subtracting(_:) in conformance NSMatchingOptions()
{
  return SetAlgebra.subtracting(_:)();
}

uint64_t protocol witness for SetAlgebra.isSubset(of:) in conformance NSMatchingOptions()
{
  return SetAlgebra.isSubset(of:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isDisjoint(with:) in conformance NSMatchingOptions()
{
  return SetAlgebra.isDisjoint(with:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isSuperset(of:) in conformance NSMatchingOptions()
{
  return SetAlgebra.isSuperset(of:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isEmpty.getter in conformance NSMatchingOptions()
{
  return SetAlgebra.isEmpty.getter() & 1;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance NSMatchingOptions()
{
  return SetAlgebra.init<A>(_:)();
}

uint64_t protocol witness for SetAlgebra.subtract(_:) in conformance NSMatchingOptions()
{
  return SetAlgebra.subtract(_:)();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance NSRegularExpressionOptions()
{
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance NSRegularExpressionOptions()
{
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  return SetAlgebra<>.init(arrayLiteral:)();
}

NSRegularExpressionOptions protocol witness for OptionSet.init(rawValue:) in conformance NSRegularExpressionOptions@<X0>(Swift::UInt *a1@<X0>, NSRegularExpressionOptions *a2@<X8>)
{
  NSRegularExpressionOptions result;

  result = NSRegularExpressionOptions.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance NSMatchingOptions()
{
  lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance NSMatchingOptions()
{
  lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
  return SetAlgebra<>.init(arrayLiteral:)();
}

NSMatchingOptions protocol witness for OptionSet.init(rawValue:) in conformance NSMatchingOptions@<X0>(Swift::UInt *a1@<X0>, NSMatchingOptions *a2@<X8>)
{
  NSMatchingOptions result;

  result = NSMatchingOptions.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

NSRegularExpressionOptions protocol witness for RawRepresentable.init(rawValue:) in conformance NSRegularExpressionOptions@<X0>(Swift::UInt *a1@<X0>, uint64_t a2@<X8>)
{
  NSRegularExpressionOptions result;

  result = NSRegularExpressionOptions.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance NSRegularExpressionOptions@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  result = NSRegularExpressionOptions.rawValue.getter(*v1);
  *a1 = result;
  return result;
}

NSMatchingOptions protocol witness for RawRepresentable.init(rawValue:) in conformance NSMatchingOptions@<X0>(Swift::UInt *a1@<X0>, uint64_t a2@<X8>)
{
  NSMatchingOptions result;

  result = NSMatchingOptions.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance NSMatchingOptions@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  result = NSMatchingOptions.rawValue.getter(*v1);
  *a1 = result;
  return result;
}

uint64_t createStorage<A>(capacity:type:)(uint64_t a1)
{
  if (a1)
    return static UnsafeMutablePointer.allocate(capacity:)();
  else
    return 0;
}

uint64_t serialize(_:at:)(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t closure #1 in osLogInternal(_:log:type:)(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t destroyStorage<A>(_:count:)(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = result;
  if (result)
  {
    UnsafeMutablePointer.deinitialize(count:)();
    return MEMORY[0x242696CA8](v3, a3);
  }
  return result;
}

Swift::Void __swiftcall Array._endMutation()()
{
  _QWORD *v0;

  *v0 = *v0;
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

_QWORD *closure #1 in OSLogArguments.append(_:)(_QWORD *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  uint64_t v8;

  v4 = a4();
  getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v5, a3);
  v8 = *a1;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease();
  result = a1;
  *a1 = v8 + 8;
  return result;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  __int16 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD v13[4];
  uint64_t v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;

  v14 = specialized _StringGuts._deconstructUTF8<A>(scratch:)((uint64_t)&v17, 0, 0, 1, a1, a2);
  v15 = v3;
  v16 = v4;
  v11 = v17;
  if (v14)
  {
    v12[3] = swift_getObjectType();
    v12[0] = v14;
    v6 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, v6);
      *a3 = v6 + 32;
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  }
  else
  {
    v13[3] = MEMORY[0x24BEE2520];
    v13[0] = a1;
    v13[1] = a2;
    v7 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v13, v7);
      *a3 = v7 + 32;
    }
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  }
  return v11;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t result, void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  char v13;
  char v14;
  int64_t v15;
  int64_t v16;
  _QWORD *v17;
  _QWORD v21[4];
  char v22;
  char v23;
  uint64_t v24;

  v17 = (_QWORD *)result;
  v24 = a6;
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (a2)
      {
        if (!a3)
          __break(1u);
        v16 = a3 - (_QWORD)a2;
      }
      else
      {
        v16 = 0;
      }
      v15 = (a6 & 0xF00000000000000uLL) >> 56;
      if (v15 < v16)
      {
        if (a2)
        {
          v21[0] = a5;
          v21[1] = a6 & (-(uint64_t)bswap64(0xFFuLL) - 1);
          specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)(v21, v15, a2);
          UnsafeMutableRawBufferPointer.subscript.setter();
          *v17 = a2;
          v11 = 0;
          v12 = v15;
          v13 = 1;
          v14 = 0;
LABEL_26:
          v21[2] = v11;
          v21[3] = v12;
          v22 = v13 & 1;
          v23 = v14 & 1;
          return (uint64_t)v11;
        }
        goto LABEL_28;
      }
    }
LABEL_13:
    v6 = _StringGuts._allocateForDeconstruct()(a5, a6);
    *v17 = v7;
    v11 = v6;
    v12 = v8;
    v13 = 0;
    v14 = 1;
    goto LABEL_26;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0xFFFFFFFFFFFFFFE0)
    {
      v10 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
      goto LABEL_21;
    }
    __break(1u);
  }
  result = _StringObject.sharedUTF8.getter();
  if (!result)
    goto LABEL_29;
  v10 = result;
LABEL_21:
  *v17 = v10;
  if (a6 < 0)
  {
    v9 = 0;
LABEL_25:
    v11 = (_QWORD *)v9;
    v12 = a5 & 0xFFFFFFFFFFFFLL;
    v13 = 0;
    v14 = 0;
    goto LABEL_26;
  }
  if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0)
  {
    swift_unknownObjectRetain();
    v9 = a6 & 0xFFFFFFFFFFFFFFFLL;
    goto LABEL_25;
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

void *specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)(const void *a1, size_t a2, void *__dst)
{
  memcpy(__dst, a1, a2);
  return __dst;
}

_QWORD *_StringGuts._allocateForDeconstruct()(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v6 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  v4 = v6[2];
  specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(v4);
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v4, 0);
  specialized Array._endMutation()();
  swift_retain();
  v5 = specialized Array.count.getter((uint64_t)v6);
  swift_bridgeObjectRelease();
  result = (_QWORD *)v5;
  if (!__OFSUB__(v5, 1))
    return v6;
  __break(1u);
  return result;
}

_QWORD *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  char v3;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD v8[3];

  v8[2] = a2;
  if ((a2 & 0x1000000000000000) != 0)
  {
    v7 = String.UTF8View._foreignCount()();
  }
  else if ((a2 & 0x2000000000000000) != 0)
  {
    v7 = (a2 & 0xF00000000000000uLL) >> 56;
  }
  else
  {
    v7 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v7)
    return (_QWORD *)specialized ContiguousArray.init()();
  v5 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v7, 0);
  swift_retain();
  swift_release();
  result = (_QWORD *)_StringGuts.copyUTF8(into:)();
  v6 = result;
  if ((v3 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    result = v8;
    v8[0] = 0;
    v8[1] = 0xE000000000000000;
    outlined destroy of String.UTF8View();
    if (v6 == (_QWORD *)v7)
      return v5;
  }
  __break(1u);
  return result;
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  uint64_t *v0;
  uint64_t result;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v4 = *v0;
  result = swift_isUniquelyReferenced_nonNull_native();
  *v0 = v4;
  if ((result & 1) == 0)
  {
    v2 = specialized Array.count.getter(*v3);
    result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2 + 1, 1, *v3);
    *v3 = result;
  }
  return result;
}

uint64_t specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(uint64_t result)
{
  uint64_t v1;
  uint64_t *v2;

  if (*(_QWORD *)(*(_QWORD *)v1 + 24) >> 1 < result + 1)
  {
    result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(*(_QWORD *)(*(_QWORD *)v1 + 24) >> 1 != 0, result + 1, 1, *v2);
    *v2 = result;
  }
  return result;
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = a1 + 1;
  v4 = *v2;
  swift_bridgeObjectRetain();
  *(_QWORD *)(v4 + 16) = v5;
  swift_release();
  v6 = *v2;
  swift_retain();
  *(_BYTE *)(v6 + 32 + a1) = a2;
  return swift_release();
}

void specialized Array._endMutation()()
{
  _QWORD *v0;

  *v0 = *v0;
}

uint64_t specialized Array.count.getter(uint64_t a1)
{
  return specialized Array._getCount()(a1);
}

_QWORD *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  size_t v4;
  _QWORD *v6;
  uint64_t v7;

  if (a2 < a1)
    v7 = a1;
  else
    v7 = a2;
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    v6 = (_QWORD *)swift_allocObject();
    if ((_swift_stdlib_has_malloc_size() & 1) != 0)
    {
      v4 = (size_t)v6 + _swift_stdlib_malloc_size(v6);
      swift_retain();
      v6[2] = a1;
      v6[3] = 2 * (v4 - (_QWORD)(v6 + 4));
    }
    else
    {
      swift_retain();
      v6[2] = a1;
      v6[3] = 2 * v7;
    }
    swift_release();
    return v6;
  }
  else
  {
    v3 = MEMORY[0x24BEE4AF8];
    swift_retain();
    return (_QWORD *)v3;
  }
}

uint64_t specialized ContiguousArray.init()()
{
  uint64_t v1;

  v1 = MEMORY[0x24BEE4AF8];
  swift_retain();
  return v1;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t result;
  char *v5;
  size_t v6;
  char *v7;
  _QWORD *v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v16;

  swift_retain();
  result = swift_retain();
  v16 = *(_QWORD *)(a4 + 24) >> 1;
  if ((a3 & 1) != 0)
  {
    if (v16 < a2)
    {
      if ((unsigned __int128)(v16 * (__int128)2) >> 64 != (2 * v16) >> 63)
      {
        __break(1u);
        return result;
      }
      if (2 * v16 < a2)
        v11 = a2;
      else
        v11 = 2 * v16;
    }
    else
    {
      v11 = *(_QWORD *)(a4 + 24) >> 1;
    }
  }
  else
  {
    v11 = a2;
  }
  v10 = *(_QWORD *)(a4 + 16);
  if (v11 < v10)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v11;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    v8 = (_QWORD *)swift_allocObject();
    if ((_swift_stdlib_has_malloc_size() & 1) != 0)
    {
      v6 = (size_t)v8 + _swift_stdlib_malloc_size(v8);
      swift_retain();
      v8[2] = v10;
      v8[3] = 2 * (v6 - (_QWORD)(v8 + 4));
    }
    else
    {
      swift_retain();
      v8[2] = v10;
      v8[3] = 2 * v9;
    }
    swift_release();
    v7 = (char *)v8;
  }
  else
  {
    v5 = (char *)MEMORY[0x24BEE4AF8];
    swift_retain();
    v7 = v5;
  }
  if ((a1 & 1) != 0)
  {
    swift_release();
    swift_bridgeObjectRelease();
    specialized UnsafeMutablePointer.moveInitialize(from:count:)((char *)(a4 + 32), v10, v7 + 32);
    *(_QWORD *)(a4 + 16) = 0;
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_retain();
    swift_release();
    specialized UnsafeMutablePointer.initialize(from:count:)((const void *)(a4 + 32), v10, v7 + 32);
    swift_unknownObjectRelease();
  }
  return (uint64_t)v7;
}

uint64_t specialized Array._getCount()(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

void *specialized UnsafeMutablePointer.initialize(from:count:)(const void *a1, size_t a2, void *__dst)
{
  return memcpy(__dst, a1, a2);
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *result, size_t a2, char *a3)
{
  if (a3 < result || a3 >= &result[a2] || a3 != result)
    return (char *)memmove(a3, result, a2);
  return result;
}

_BYTE **closure #1 in OSLogArguments.append(_:)(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_24158BB60()
{
  return swift_deallocObject();
}

_BYTE **partial apply for closure #1 in OSLogArguments.append(_:)(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_24158BB90()
{
  return swift_deallocObject();
}

_BYTE **closure #1 in OSLogArguments.append(_:)partial apply(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_24158BBC0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)()
{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_24158BC08()
{
  swift_release();
  return swift_deallocObject();
}

_QWORD *partial apply for closure #1 in OSLogArguments.append(_:)(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_24158BC50()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in checkValidTextInputs(data:)()
{
  uint64_t v0;
  uint64_t result;

  result = *(_QWORD *)(v0 + 16);
  implicit closure #2 in checkValidTextInputs(data:)();
  return result;
}

uint64_t sub_24158BC98()
{
  return swift_deallocObject();
}

uint64_t sub_24158BCC8()
{
  return swift_deallocObject();
}

uint64_t sub_24158BCF8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply()
{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_24158BD40()
{
  swift_release();
  return swift_deallocObject();
}

_QWORD *closure #1 in OSLogArguments.append(_:)partial apply(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_24158BD88()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #3 in checkValidTextInputs(data:)()
{
  uint64_t v0;
  uint64_t result;

  result = *(_QWORD *)(v0 + 16);
  implicit closure #3 in checkValidTextInputs(data:)();
  return result;
}

uint64_t sub_24158BDD0()
{
  return swift_deallocObject();
}

uint64_t sub_24158BE00()
{
  return swift_deallocObject();
}

uint64_t sub_24158BE30()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24158BE78()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t outlined init with copy of Int?(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = a2;
  *(_QWORD *)a2 = *(_QWORD *)a1;
  *(_BYTE *)(a2 + 8) = *(_BYTE *)(a1 + 8);
  return result;
}

uint64_t sub_24158BEDC()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #11 in checkValidNumericInputRange(data:)()
{
  uint64_t v0;

  return implicit closure #11 in checkValidNumericInputRange(data:)(*(_QWORD *)(v0 + 16));
}

uint64_t sub_24158BF0C()
{
  return swift_deallocObject();
}

uint64_t sub_24158BF3C()
{
  return swift_deallocObject();
}

uint64_t closure #1 in OSLogArguments.append<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  void (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[3];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[16];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v15 = a1;
  v18 = a6;
  v13[1] = a7;
  v22 = a6;
  v16 = *(_QWORD *)(a6 - 8);
  v13[0] = (*(_QWORD *)(v16 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = MEMORY[0x24BDAC7A8](a1);
  v17 = (uint64_t)v13 - v13[0];
  v8(v7);
  v14 = dispatch thunk of static FixedWidthInteger.bitWidth.getter() >> 3;
  v20 = *v15;
  v21 = v20 + v14;
  _ss27_withUnprotectedUnsafeBytes2of_q0_x_q0_SWq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF(v17, partial apply for closure #1 in serialize<A>(_:at:), (uint64_t)v19, v18, MEMORY[0x24BEE4078], MEMORY[0x24BEE4AE0] + 8, MEMORY[0x24BEE40A8], v13[2]);
  v9 = v16;
  v10 = v17;
  v11 = v18;
  *v15 += v14;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
}

uint64_t closure #1 in serialize<A>(_:at:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t _ss27_withUnprotectedUnsafeBytes2of_q0_x_q0_SWq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t (*v17)(void);
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v17 = a2;
  v13 = a5;
  v14 = a8;
  v23 = a4;
  v22 = a5;
  v21 = a6;
  v15 = *(_QWORD *)(a5 - 8);
  v16 = (*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v9 = MEMORY[0x24BDAC7A8]();
  v18 = (char *)&v12 - v16;
  v20 = v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64);
  result = v17();
  v19 = v8;
  if (v8)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v15 + 32))(v14, v18, v13);
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed () -> (@unowned Int)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_24158C1C4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_24158C20C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in OSLogArguments.append<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = lazy protocol witness table accessor for type Int and conformance Int();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, MEMORY[0x24BEE1768], v4);
}

uint64_t sub_24158C310()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #13 in checkValidNumericInputRange(data:)()
{
  uint64_t v0;

  return implicit closure #13 in checkValidNumericInputRange(data:)(*(_QWORD *)(v0 + 16));
}

uint64_t sub_24158C340()
{
  return swift_deallocObject();
}

uint64_t sub_24158C370()
{
  return swift_deallocObject();
}

uint64_t sub_24158C3A0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_24158C3E8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t closure #1 in OSLogArguments.append<A>(_:)partial apply(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = lazy protocol witness table accessor for type Int and conformance Int();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, MEMORY[0x24BEE1768], v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = lazy protocol witness table accessor for type Int and conformance Int();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, MEMORY[0x24BEE1768], v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = lazy protocol witness table accessor for type Int and conformance Int();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, MEMORY[0x24BEE1768], v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = lazy protocol witness table accessor for type Int and conformance Int();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, MEMORY[0x24BEE1768], v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = lazy protocol witness table accessor for type Int and conformance Int();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, MEMORY[0x24BEE1768], v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = lazy protocol witness table accessor for type Int and conformance Int();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, MEMORY[0x24BEE1768], v4);
}

uint64_t sub_24158C484()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #15 in checkValidNumericInputRange(data:)()
{
  uint64_t v0;

  return implicit closure #15 in checkValidNumericInputRange(data:)(*(_QWORD *)(v0 + 16));
}

uint64_t sub_24158C4B4()
{
  return swift_deallocObject();
}

uint64_t sub_24158C4E4()
{
  return swift_deallocObject();
}

uint64_t sub_24158C514()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24158C55C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24158C5F8()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #17 in checkValidNumericInputRange(data:)()
{
  uint64_t v0;

  return implicit closure #17 in checkValidNumericInputRange(data:)(*(_QWORD *)(v0 + 16));
}

uint64_t sub_24158C628()
{
  return swift_deallocObject();
}

uint64_t sub_24158C658()
{
  return swift_deallocObject();
}

uint64_t sub_24158C688()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24158C6D0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24158C76C()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #19 in checkValidNumericInputRange(data:)()
{
  uint64_t v0;

  return implicit closure #19 in checkValidNumericInputRange(data:)(*(_QWORD *)(v0 + 16));
}

uint64_t sub_24158C79C()
{
  return swift_deallocObject();
}

uint64_t sub_24158C7CC()
{
  return swift_deallocObject();
}

uint64_t sub_24158C7FC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24158C844()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24158C8E0()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #21 in checkValidNumericInputRange(data:)()
{
  uint64_t v0;

  return implicit closure #21 in checkValidNumericInputRange(data:)(*(_QWORD *)(v0 + 16));
}

uint64_t sub_24158C910()
{
  return swift_deallocObject();
}

uint64_t sub_24158C940()
{
  return swift_deallocObject();
}

uint64_t sub_24158C970()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24158C9B8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24158CA54()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #23 in checkValidNumericInputRange(data:)()
{
  uint64_t v0;

  return implicit closure #23 in checkValidNumericInputRange(data:)(*(double *)(v0 + 16));
}

uint64_t sub_24158CA84()
{
  return swift_deallocObject();
}

uint64_t sub_24158CAB4()
{
  return swift_deallocObject();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_24158CB04()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)()
{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

_QWORD *closure #1 in OSLogArguments.append(_:)(_QWORD *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  _QWORD *result;
  uint64_t v5;

  a4();
  v5 = *a1;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  result = a1;
  *a1 = v5 + 8;
  return result;
}

uint64_t sub_24158CBB0()
{
  swift_release();
  return swift_deallocObject();
}

_QWORD *partial apply for closure #1 in OSLogArguments.append(_:)(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

uint64_t sub_24158CBF8()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #25 in checkValidNumericInputRange(data:)()
{
  uint64_t v0;

  return implicit closure #25 in checkValidNumericInputRange(data:)(*(double *)(v0 + 16));
}

uint64_t sub_24158CC28()
{
  return swift_deallocObject();
}

uint64_t sub_24158CC58()
{
  return swift_deallocObject();
}

uint64_t sub_24158CC88()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply()
{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_24158CCD0()
{
  swift_release();
  return swift_deallocObject();
}

_QWORD *closure #1 in OSLogArguments.append(_:)partial apply(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

uint64_t sub_24158CD18()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #27 in checkValidNumericInputRange(data:)()
{
  uint64_t v0;

  return implicit closure #27 in checkValidNumericInputRange(data:)(*(_QWORD *)(v0 + 16));
}

uint64_t sub_24158CD48()
{
  return swift_deallocObject();
}

uint64_t sub_24158CD78()
{
  return swift_deallocObject();
}

uint64_t sub_24158CDA8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24158CDF0()
{
  swift_release();
  return swift_deallocObject();
}

unint64_t base witness table accessor for RawRepresentable in NSRegularExpressionOptions()
{
  return lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
}

unint64_t base witness table accessor for SetAlgebra in NSRegularExpressionOptions()
{
  return lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
}

unint64_t base witness table accessor for RawRepresentable in NSMatchingOptions()
{
  return lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
}

unint64_t base witness table accessor for SetAlgebra in NSMatchingOptions()
{
  return lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
}

unint64_t base witness table accessor for Equatable in NSMatchingOptions()
{
  return lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
}

unint64_t base witness table accessor for ExpressibleByArrayLiteral in NSMatchingOptions()
{
  return lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
}

unint64_t base witness table accessor for Equatable in NSRegularExpressionOptions()
{
  return lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
}

unint64_t base witness table accessor for ExpressibleByArrayLiteral in NSRegularExpressionOptions()
{
  return lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
}

unint64_t lazy protocol witness table accessor for type UInt and conformance UInt()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type UInt and conformance UInt;
  if (!lazy protocol witness table cache variable for type UInt and conformance UInt)
  {
    v0 = MEMORY[0x242696FFC](MEMORY[0x24BEE1EC8], MEMORY[0x24BEE1E88]);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type UInt and conformance UInt);
    return v0;
  }
  return v2;
}

uint64_t partial apply for closure #1 in serialize<A>(_:at:)()
{
  return closure #1 in serialize<A>(_:at:)();
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

uint64_t _swift_stdlib_has_malloc_size()
{
  return 1;
}

size_t _swift_stdlib_malloc_size(const void *a1)
{
  return malloc_size(a1);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of String.UTF8View()
{
  swift_bridgeObjectRelease();
}

unint64_t lazy protocol witness table accessor for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>;
  if (!lazy protocol witness table cache variable for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for AutoreleasingUnsafeMutablePointer<NSError?>);
    v1 = MEMORY[0x242696FFC](MEMORY[0x24BEE01C8], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>);
    return v1;
  }
  return v3;
}

uint64_t __swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v5;

  v5 = a2;
  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v2 = swift_slowAlloc();
    *a2 = v2;
    return v2;
  }
  return (uint64_t)v5;
}

uint64_t _MLServiceS.modelName.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + OBJC_IVAR____MLServiceS_modelName);
  swift_bridgeObjectRetain();
  return v2;
}

void *_MLServiceS.connection.getter()
{
  uint64_t v0;
  id v1;
  void *v3;

  v3 = *(void **)(v0 + OBJC_IVAR____MLServiceS_connection);
  v1 = v3;
  return v3;
}

uint64_t _MLServiceS.service.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + OBJC_IVAR____MLServiceS_service);
  swift_unknownObjectRetain();
  return v2;
}

uint64_t static _MLServiceS.logger.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = _MLServiceS.logger.unsafeMutableAddressor();
  v1 = type metadata accessor for Logger();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

id _MLServiceS.__allocating_init(nameOfModel:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v3;

  v3 = objc_allocWithZone(v2);
  return _MLServiceS.init(nameOfModel:)(a1, a2);
}

uint64_t closure #1 in _MLServiceS.init(nameOfModel:)(void *a1)
{
  char *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD v19[2];
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE **v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t *v36;
  uint32_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  NSObject *v50;
  int v51;
  uint64_t (*v52)(uint64_t, uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _BYTE *v56;
  uint64_t v57;
  uint32_t v58;
  uint64_t v59;

  v33 = a1;
  v59 = 0;
  v28 = 0;
  v32 = type metadata accessor for Logger();
  v31 = *(_QWORD *)(v32 - 8);
  v29 = (*(_QWORD *)(v31 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1 = (char *)v19 - v29;
  v30 = (char *)v19 - v29;
  v59 = MEMORY[0x24BDAC7A8](v33);
  v2 = _MLServiceS.logger.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v1, v2, v32);
  v3 = v33;
  v41 = 7;
  v39 = swift_allocObject();
  *(_QWORD *)(v39 + 16) = v33;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  v50 = Logger.logObject.getter();
  v51 = static os_log_type_t.error.getter();
  v36 = &v57;
  v57 = 12;
  v34 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  v35 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v37 = v58;
  v38 = 17;
  v44 = swift_allocObject();
  *(_BYTE *)(v44 + 16) = 64;
  v45 = swift_allocObject();
  *(_BYTE *)(v45 + 16) = 8;
  v40 = 32;
  v4 = swift_allocObject();
  v5 = v39;
  v42 = v4;
  *(_QWORD *)(v4 + 16) = partial apply for implicit closure #1 in closure #1 in _MLServiceS.init(nameOfModel:);
  *(_QWORD *)(v4 + 24) = v5;
  v6 = swift_allocObject();
  v7 = v42;
  v43 = v6;
  *(_QWORD *)(v6 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:);
  *(_QWORD *)(v6 + 24) = v7;
  v8 = swift_allocObject();
  v9 = v43;
  v47 = v8;
  *(_QWORD *)(v8 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:);
  *(_QWORD *)(v8 + 24) = v9;
  v49 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v46 = _allocateUninitializedArray<A>(_:)();
  v48 = v10;
  swift_retain();
  v11 = v44;
  v12 = v48;
  *v48 = closure #1 in OSLogArguments.append(_:)partial apply;
  v12[1] = v11;
  swift_retain();
  v13 = v45;
  v14 = v48;
  v48[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v14[3] = v13;
  swift_retain();
  v15 = v47;
  v16 = v48;
  v48[4] = partial apply for closure #1 in OSLogArguments.append(_:);
  v16[5] = v15;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v50, (os_log_type_t)v51))
  {
    v17 = v28;
    v21 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v22 = createStorage<A>(capacity:type:)(1);
    v23 = createStorage<A>(capacity:type:)(0);
    v24 = &v56;
    v56 = v21;
    v25 = &v55;
    v55 = v22;
    v26 = &v54;
    v54 = v23;
    serialize(_:at:)(2, &v56);
    serialize(_:at:)(1, v24);
    v52 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v53 = v44;
    closure #1 in osLogInternal(_:log:type:)(&v52, (uint64_t)v24, (uint64_t)v25, (uint64_t)v26);
    v27 = v17;
    if (v17)
    {
      __break(1u);
    }
    else
    {
      v52 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v53 = v45;
      closure #1 in osLogInternal(_:log:type:)(&v52, (uint64_t)&v56, (uint64_t)&v55, (uint64_t)&v54);
      v19[0] = 0;
      v52 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      v53 = v47;
      closure #1 in osLogInternal(_:log:type:)(&v52, (uint64_t)&v56, (uint64_t)&v55, (uint64_t)&v54);
      _os_log_impl(&dword_241581000, v50, (os_log_type_t)v51, "Received error: %@", v21, v37);
      destroyStorage<A>(_:count:)(v22, 1, v20);
      destroyStorage<A>(_:count:)(v23, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x242696CA8](v21, MEMORY[0x24BEE4260]);
      swift_release();
      swift_release();
      swift_release();
    }
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v30, v32);
}

uint64_t sub_24158DC5C()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in _MLServiceS.init(nameOfModel:)(void *a1)
{
  return closure #1 in _MLServiceS.init(nameOfModel:)(a1);
}

void *implicit closure #1 in closure #1 in _MLServiceS.init(nameOfModel:)(void *a1)
{
  id v1;

  v1 = a1;
  return a1;
}

uint64_t default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1)._countAndFlagsBits;
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed Error) -> ()(uint64_t a1, void *a2)
{
  id v2;
  void (*v4)(void *);

  v4 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v2 = a2;
  v4(a2);

  return swift_release();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_24158DD50()
{
  return swift_deallocObject();
}

uint64_t _MLServiceS.getModelStats(completionHandler:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t ObjectType;
  char *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;

  v14 = a1;
  v15 = a2;
  ObjectType = swift_getObjectType();
  v19 = 0;
  v20 = 0;
  v18 = 0;
  v13 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  v17 = (char *)&v13 - v13;
  v19 = MEMORY[0x24BDAC7A8](v14);
  v20 = v3;
  v18 = v2;
  v4 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v17, 1);
  v5 = v2;
  outlined copy of (@escaping @callee_guaranteed @Sendable (@guaranteed [String : Any]?) -> ())?(v14);
  v6 = swift_allocObject();
  v7 = v14;
  v8 = v15;
  v9 = ObjectType;
  v10 = (_QWORD *)v6;
  v11 = (uint64_t)v17;
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = v2;
  v10[5] = v7;
  v10[6] = v8;
  v10[7] = v9;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfC(v11, (uint64_t)&async function pointer to partial apply for closure #1 in _MLServiceS.getModelStats(completionHandler:), (uint64_t)v10, MEMORY[0x24BEE4AE0] + 8);
  return swift_release();
}

uint64_t closure #1 in _MLServiceS.getModelStats(completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[15] = a7;
  v7[14] = a6;
  v7[13] = a5;
  v7[12] = a4;
  v7[10] = v7;
  v7[11] = 0;
  v7[8] = 0;
  v7[9] = 0;
  v7[11] = a4;
  v7[8] = a5;
  v7[9] = a6;
  return swift_task_switch();
}

uint64_t closure #1 in _MLServiceS.getModelStats(completionHandler:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const void *aBlock;
  uint64_t v8;
  void *v9;

  v1 = *(_QWORD *)(v0 + 96);
  *(_QWORD *)(v0 + 80) = v0;
  v9 = *(void **)(v1 + OBJC_IVAR____MLServiceS_service);
  swift_unknownObjectRetain();
  if (!v9)
    return _assertionFailure(_:_:file:line:flags:)();
  v6 = *(_QWORD *)(v8 + 120);
  v5 = *(_QWORD *)(v8 + 112);
  v4 = *(_QWORD *)(v8 + 104);
  swift_getObjectType();
  outlined copy of (@escaping @callee_guaranteed @Sendable (@guaranteed [String : Any]?) -> ())?(v4);
  v2 = (_QWORD *)swift_allocObject();
  v2[2] = v4;
  v2[3] = v5;
  v2[4] = v6;
  *(_QWORD *)(v8 + 48) = partial apply for closure #1 in closure #1 in _MLServiceS.getModelStats(completionHandler:);
  *(_QWORD *)(v8 + 56) = v2;
  *(_QWORD *)(v8 + 16) = MEMORY[0x24BDAC760];
  *(_DWORD *)(v8 + 24) = 1107296256;
  *(_DWORD *)(v8 + 28) = 0;
  *(_QWORD *)(v8 + 32) = thunk for @escaping @callee_guaranteed (@guaranteed [String : Any]?) -> ();
  *(_QWORD *)(v8 + 40) = &block_descriptor_146;
  aBlock = _Block_copy((const void *)(v8 + 16));
  swift_release();
  objc_msgSend(v9, sel_getModelStatsWith_, aBlock);
  _Block_release(aBlock);
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v8 + 80) + 8))();
}

uint64_t sub_24158E12C()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  if (*(_QWORD *)(v0 + 40))
    swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in _MLServiceS.getModelStats(completionHandler:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = v1[5];
  v9 = v1[6];
  v10 = v1[7];
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = partial apply for closure #1 in _MLServiceS.getModelStats(completionHandler:);
  return closure #1 in _MLServiceS.getModelStats(completionHandler:)(a1, v5, v6, v7, v8, v9, v10);
}

uint64_t partial apply for closure #1 in _MLServiceS.getModelStats(completionHandler:)()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t closure #1 in closure #1 in _MLServiceS.getModelStats(completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  void (*v21)(uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE **v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t);
  unint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t *v49;
  uint32_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  NSObject *v62;
  int v63;
  uint64_t (*v64)(uint64_t, uint64_t, uint64_t);
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _BYTE *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint32_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;

  v46 = a1;
  v41 = (void (*)(uint64_t))a2;
  v40 = a3;
  v78 = 0;
  v76 = 0;
  v77 = 0;
  v71 = 0;
  v72 = 0;
  v69 = 0;
  v70 = 0;
  v39 = 0;
  v45 = type metadata accessor for Logger();
  v44 = *(_QWORD *)(v45 - 8);
  v42 = (*(_QWORD *)(v44 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3 = (char *)&v20 - v42;
  v43 = (char *)&v20 - v42;
  v78 = MEMORY[0x24BDAC7A8](v46);
  v76 = v4;
  v77 = v5;
  v6 = _MLServiceS.logger.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v3, v6, v45);
  swift_bridgeObjectRetain();
  v53 = 7;
  v54 = swift_allocObject();
  *(_QWORD *)(v54 + 16) = v46;
  v62 = Logger.logObject.getter();
  v63 = static os_log_type_t.debug.getter();
  v49 = &v74;
  v74 = 12;
  v47 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  v48 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v50 = v75;
  v51 = 17;
  v56 = swift_allocObject();
  *(_BYTE *)(v56 + 16) = 32;
  v57 = swift_allocObject();
  *(_BYTE *)(v57 + 16) = 8;
  v52 = 32;
  v7 = swift_allocObject();
  v8 = v54;
  v55 = v7;
  *(_QWORD *)(v7 + 16) = partial apply for implicit closure #1 in closure #1 in closure #1 in _MLServiceS.getModelStats(completionHandler:);
  *(_QWORD *)(v7 + 24) = v8;
  v9 = swift_allocObject();
  v10 = v55;
  v59 = v9;
  *(_QWORD *)(v9 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  *(_QWORD *)(v9 + 24) = v10;
  v61 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v58 = _allocateUninitializedArray<A>(_:)();
  v60 = v11;
  swift_retain();
  v12 = v56;
  v13 = v60;
  *v60 = closure #1 in OSLogArguments.append(_:)partial apply;
  v13[1] = v12;
  swift_retain();
  v14 = v57;
  v15 = v60;
  v60[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v15[3] = v14;
  swift_retain();
  v16 = v59;
  v17 = v60;
  v60[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v17[5] = v16;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v62, (os_log_type_t)v63))
  {
    v18 = v39;
    v32 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v31 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v33 = createStorage<A>(capacity:type:)(0);
    v34 = createStorage<A>(capacity:type:)(1);
    v35 = &v68;
    v68 = v32;
    v36 = &v67;
    v67 = v33;
    v37 = &v66;
    v66 = v34;
    serialize(_:at:)(2, &v68);
    serialize(_:at:)(1, v35);
    v64 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v65 = v56;
    closure #1 in osLogInternal(_:log:type:)(&v64, (uint64_t)v35, (uint64_t)v36, (uint64_t)v37);
    v38 = v18;
    if (v18)
    {
      __break(1u);
    }
    else
    {
      v64 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v65 = v57;
      closure #1 in osLogInternal(_:log:type:)(&v64, (uint64_t)&v68, (uint64_t)&v67, (uint64_t)&v66);
      v30 = 0;
      v64 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v65 = v59;
      closure #1 in osLogInternal(_:log:type:)(&v64, (uint64_t)&v68, (uint64_t)&v67, (uint64_t)&v66);
      _os_log_impl(&dword_241581000, v62, (os_log_type_t)v63, "Response from XPC service: %s", v32, v50);
      destroyStorage<A>(_:count:)(v33, 0, v31);
      destroyStorage<A>(_:count:)(v34, 1, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x242696CA8](v32, MEMORY[0x24BEE4260]);
      swift_release();
      swift_release();
      swift_release();
    }
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }

  (*(void (**)(char *, uint64_t))(v44 + 8))(v43, v45);
  v73 = v46;
  v29 = v46 != 0;
  if (v46)
  {
    result = outlined copy of (@escaping @callee_guaranteed @Sendable (@guaranteed [String : Any]?) -> ())?((uint64_t)v41);
    if (v41)
    {
      v27 = (uint64_t)v41;
      v28 = v40;
      v26 = v40;
      v25 = v41;
      v69 = (uint64_t)v41;
      v70 = v40;
      swift_retain();
      v25(v46);
      swift_release();
      return swift_release();
    }
  }
  else
  {
    result = outlined copy of (@escaping @callee_guaranteed @Sendable (@guaranteed [String : Any]?) -> ())?((uint64_t)v41);
    if (v41)
    {
      v23 = (uint64_t)v41;
      v24 = v40;
      v22 = v40;
      v21 = v41;
      v71 = (uint64_t)v41;
      v72 = v40;
      swift_retain();
      v21(0);
      swift_release();
      return swift_release();
    }
  }
  return result;
}

uint64_t implicit closure #1 in closure #1 in closure #1 in _MLServiceS.getModelStats(completionHandler:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t countAndFlagsBits;

  swift_bridgeObjectRetain();
  if (a1)
  {
    v3 = Dictionary.description.getter();
    v4 = v1;
    swift_bridgeObjectRelease();
    v5 = v3;
    v6 = v4;
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  if (v6)
    return v5;
  countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("No model stats provided", 0x17uLL, 1)._countAndFlagsBits;
  outlined destroy of String?();
  return countAndFlagsBits;
}

uint64_t _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;

  v11 = type metadata accessor for TaskPriority();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v12 + 48))(a1, 1) == 1)
  {
    outlined destroy of TaskPriority?(a1);
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
  }
  v6 = *(_QWORD *)(a3 + 16);
  swift_unknownObjectRetain();
  if (v6)
  {
    swift_getObjectType();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  v5 = (_QWORD *)swift_allocObject();
  v5[2] = a4;
  v5[3] = a2;
  v5[4] = a3;
  return swift_task_create();
}

void thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSDictionary?) -> ()(uint64_t a1, uint64_t a2)
{
  Class isa;
  Class v3;

  swift_bridgeObjectRetain();
  if (a1)
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v3 = isa;
  }
  else
  {
    v3 = 0;
  }
  (*(void (**)(void))(a2 + 16))();

}

uint64_t sub_24158F040()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSDictionary?) -> ()(uint64_t a1)
{
  uint64_t v1;

  thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSDictionary?) -> ()(a1, *(_QWORD *)(v1 + 16));
}

Swift::Double __swiftcall _MLServiceS.getPrediction(inputFeatures:)(Swift::OpaquePointer inputFeatures)
{
  uint64_t v1;
  uint64_t v2;
  double v4;
  double v5;
  const void *v7;
  Class isa;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t ObjectType;
  uint64_t v15;
  uint64_t aBlock;
  int v17;
  int v18;
  uint64_t (*v19)(uint64_t, double);
  void *v20;
  uint64_t (*v21)(double);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *rawValue;

  ObjectType = swift_getObjectType();
  rawValue = inputFeatures._rawValue;
  v24 = v1;
  v15 = swift_allocObject();
  v23 = v15 + 16;
  *(_QWORD *)(v15 + 16) = 0;
  if (checkValidInterfaceType(data:)(inputFeatures))
  {
    v11 = *(void **)(v12 + OBJC_IVAR____MLServiceS_service);
    swift_unknownObjectRetain();
    if (v11)
    {
      v10 = v11;
    }
    else
    {
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    swift_getObjectType();
    swift_bridgeObjectRetain();
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    swift_retain();
    v2 = swift_allocObject();
    *(_QWORD *)(v2 + 16) = v15;
    *(_QWORD *)(v2 + 24) = ObjectType;
    v21 = partial apply for closure #1 in _MLServiceS.getPrediction(inputFeatures:);
    v22 = v2;
    aBlock = MEMORY[0x24BDAC760];
    v17 = 1107296256;
    v18 = 0;
    v19 = thunk for @escaping @callee_guaranteed (@unowned Double) -> ();
    v20 = &block_descriptor_22;
    v7 = _Block_copy(&aBlock);
    swift_release();
    objc_msgSend(v10, sel_getPredictionWithInputFeatures_with_, isa, v7);
    _Block_release(v7);

    swift_unknownObjectRelease();
    swift_beginAccess();
    v9 = *(double *)(v15 + 16);
    swift_endAccess();
    if (v9 < 0.0)
    {
      swift_beginAccess();
      *(_QWORD *)(v15 + 16) = 0;
      swift_endAccess();
    }
    swift_beginAccess();
    v5 = *(double *)(v15 + 16);
    swift_endAccess();
    swift_release();
    return v5;
  }
  else
  {
    v4 = *(double *)(v15 + 16);
    swift_release();
    return v4;
  }
}

uint64_t sub_24158F3B8()
{
  return swift_deallocObject();
}

uint64_t closure #1 in _MLServiceS.getPrediction(inputFeatures:)(uint64_t a1, double a2)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE **v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t *v40;
  uint32_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  NSObject *v53;
  int v54;
  uint64_t (*v55)(uint64_t, uint64_t, uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _BYTE *v59;
  char v60;
  uint64_t v61;
  uint32_t v62;
  uint64_t v63;
  uint64_t v64;

  v37 = a2;
  v32 = a1;
  v64 = 0;
  v63 = 0;
  v31 = 0;
  v36 = type metadata accessor for Logger();
  v35 = *(_QWORD *)(v36 - 8);
  v33 = (*(_QWORD *)(v35 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x24BDAC7A8](v32);
  v3 = (char *)v19 - v33;
  v34 = (char *)v19 - v33;
  v64 = v4;
  v63 = v2 + 16;
  v5 = _MLServiceS.logger.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v3, v5, v36);
  v44 = 7;
  v45 = swift_allocObject();
  *(double *)(v45 + 16) = v37;
  v53 = Logger.logObject.getter();
  v54 = static os_log_type_t.debug.getter();
  v40 = &v61;
  v61 = 12;
  v38 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  v39 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v41 = v62;
  v42 = 17;
  v47 = swift_allocObject();
  *(_BYTE *)(v47 + 16) = 0;
  v48 = swift_allocObject();
  *(_BYTE *)(v48 + 16) = 8;
  v43 = 32;
  v6 = swift_allocObject();
  v7 = v45;
  v46 = v6;
  *(_QWORD *)(v6 + 16) = partial apply for implicit closure #1 in closure #1 in _MLServiceS.getPrediction(inputFeatures:);
  *(_QWORD *)(v6 + 24) = v7;
  v8 = swift_allocObject();
  v9 = v46;
  v50 = v8;
  *(_QWORD *)(v8 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
  *(_QWORD *)(v8 + 24) = v9;
  v52 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v49 = _allocateUninitializedArray<A>(_:)();
  v51 = v10;
  swift_retain();
  v11 = v47;
  v12 = v51;
  *v51 = closure #1 in OSLogArguments.append(_:)partial apply;
  v12[1] = v11;
  swift_retain();
  v13 = v48;
  v14 = v51;
  v51[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v14[3] = v13;
  swift_retain();
  v15 = v50;
  v16 = v51;
  v51[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v16[5] = v15;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v53, (os_log_type_t)v54))
  {
    v17 = v31;
    v24 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v23 = 0;
    v25 = createStorage<A>(capacity:type:)(0);
    v26 = createStorage<A>(capacity:type:)(v23);
    v27 = &v59;
    v59 = v24;
    v28 = &v58;
    v58 = v25;
    v29 = &v57;
    v57 = v26;
    serialize(_:at:)(0, &v59);
    serialize(_:at:)(1, v27);
    v55 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v56 = v47;
    closure #1 in osLogInternal(_:log:type:)(&v55, (uint64_t)v27, (uint64_t)v28, (uint64_t)v29);
    v30 = v17;
    if (v17)
    {
      __break(1u);
    }
    else
    {
      v55 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v56 = v48;
      closure #1 in osLogInternal(_:log:type:)(&v55, (uint64_t)&v59, (uint64_t)&v58, (uint64_t)&v57);
      v21 = 0;
      v55 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v56 = v50;
      closure #1 in osLogInternal(_:log:type:)(&v55, (uint64_t)&v59, (uint64_t)&v58, (uint64_t)&v57);
      _os_log_impl(&dword_241581000, v53, (os_log_type_t)v54, "Response from XPC service: %f", v24, v41);
      v20 = 0;
      destroyStorage<A>(_:count:)(v25, 0, v22);
      destroyStorage<A>(_:count:)(v26, v20, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x242696CA8](v24, MEMORY[0x24BEE4260]);
      swift_release();
      swift_release();
      swift_release();
    }
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }

  (*(void (**)(char *, uint64_t))(v35 + 8))(v34, v36);
  v19[1] = &v60;
  swift_beginAccess();
  *(double *)(v32 + 16) = v37;
  return swift_endAccess();
}

uint64_t sub_24158F9DC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in _MLServiceS.getPrediction(inputFeatures:)(double a1)
{
  uint64_t v1;

  return closure #1 in _MLServiceS.getPrediction(inputFeatures:)(*(_QWORD *)(v1 + 16), a1);
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned Double) -> ()(uint64_t a1, double a2)
{
  uint64_t v2;
  void (*v5)(uint64_t, double);

  v5 = *(void (**)(uint64_t, double))(a1 + 32);
  v2 = swift_retain();
  v5(v2, a2);
  return swift_release();
}

uint64_t block_copy_helper_20(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_21()
{
  return swift_release();
}

Swift::OpaquePointer_optional __swiftcall _MLServiceS.getPredictionDictionary(withInputFeatures:)(Swift::OpaquePointer withInputFeatures)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Bool v3;
  void *v4;
  void *v5;
  const void *v6;
  Class isa;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t ObjectType;
  uint64_t v15;
  uint64_t aBlock;
  int v17;
  int v18;
  uint64_t (*v19)(uint64_t, void *);
  void *v20;
  uint64_t (*v21)(uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *rawValue;
  Swift::OpaquePointer_optional result;

  ObjectType = swift_getObjectType();
  rawValue = withInputFeatures._rawValue;
  v24 = v1;
  v15 = swift_allocObject();
  v23 = v15 + 16;
  *(_QWORD *)(v15 + 16) = 0;
  if (checkValidInterfaceType(data:)(withInputFeatures))
  {
    v11 = *(void **)(v12 + OBJC_IVAR____MLServiceS_service);
    swift_unknownObjectRetain();
    if (v11)
    {
      v10 = v11;
    }
    else
    {
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    swift_getObjectType();
    swift_bridgeObjectRetain();
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    swift_retain();
    v2 = swift_allocObject();
    *(_QWORD *)(v2 + 16) = v15;
    *(_QWORD *)(v2 + 24) = ObjectType;
    v21 = partial apply for closure #1 in _MLServiceS.getPredictionDictionary(withInputFeatures:);
    v22 = v2;
    aBlock = MEMORY[0x24BDAC760];
    v17 = 1107296256;
    v18 = 0;
    v19 = thunk for @escaping @callee_guaranteed (@guaranteed [String : Any]) -> ();
    v20 = &block_descriptor_31;
    v6 = _Block_copy(&aBlock);
    swift_release();
    objc_msgSend(v10, sel_getPredictionDictionaryWithInputFeatures_with_, isa, v6);
    _Block_release(v6);

    swift_unknownObjectRelease();
    swift_beginAccess();
    v8 = *(void **)(v15 + 16);
    swift_bridgeObjectRetain();
    swift_endAccess();
    swift_release();
    v9 = v8;
  }
  else
  {
    v5 = *(void **)(v15 + 16);
    swift_bridgeObjectRetain();
    swift_release();
    v9 = v5;
  }
  v4 = v9;
  result.value._rawValue = v4;
  result.is_nil = v3;
  return result;
}

uint64_t sub_24158FE14()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t closure #1 in _MLServiceS.getPredictionDictionary(withInputFeatures:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD v20[3];
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE **v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t *v39;
  uint32_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  NSObject *v52;
  int v53;
  uint64_t (*v54)(uint64_t, uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE *v58;
  char v59;
  uint64_t v60;
  uint32_t v61;
  uint64_t v62;
  uint64_t v63;

  v35 = a1;
  v30 = a2;
  v63 = 0;
  v62 = 0;
  v29 = 0;
  v34 = type metadata accessor for Logger();
  v33 = *(_QWORD *)(v34 - 8);
  v31 = (*(_QWORD *)(v33 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = (char *)v20 - v31;
  v32 = (char *)v20 - v31;
  v63 = MEMORY[0x24BDAC7A8](v35);
  v62 = v3 + 16;
  v4 = _MLServiceS.logger.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v2, v4, v34);
  swift_bridgeObjectRetain();
  v43 = 7;
  v36 = swift_allocObject();
  *(_QWORD *)(v36 + 16) = v35;
  swift_retain();
  v42 = 32;
  v5 = swift_allocObject();
  v6 = v36;
  v44 = v5;
  *(_QWORD *)(v5 + 16) = partial apply for implicit closure #1 in closure #1 in _MLServiceS.getPredictionDictionary(withInputFeatures:);
  *(_QWORD *)(v5 + 24) = v6;
  swift_release();
  v52 = Logger.logObject.getter();
  v53 = static os_log_type_t.debug.getter();
  v39 = &v60;
  v60 = 12;
  v37 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  v38 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v40 = v61;
  v41 = 17;
  v46 = swift_allocObject();
  *(_BYTE *)(v46 + 16) = 32;
  v47 = swift_allocObject();
  *(_BYTE *)(v47 + 16) = 8;
  v7 = swift_allocObject();
  v8 = v44;
  v45 = v7;
  *(_QWORD *)(v7 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)partial apply;
  *(_QWORD *)(v7 + 24) = v8;
  v9 = swift_allocObject();
  v10 = v45;
  v49 = v9;
  *(_QWORD *)(v9 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  *(_QWORD *)(v9 + 24) = v10;
  v51 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v48 = _allocateUninitializedArray<A>(_:)();
  v50 = v11;
  swift_retain();
  v12 = v46;
  v13 = v50;
  *v50 = closure #1 in OSLogArguments.append(_:)partial apply;
  v13[1] = v12;
  swift_retain();
  v14 = v47;
  v15 = v50;
  v50[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v15[3] = v14;
  swift_retain();
  v16 = v49;
  v17 = v50;
  v50[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v17[5] = v16;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v52, (os_log_type_t)v53))
  {
    v18 = v29;
    v22 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v23 = createStorage<A>(capacity:type:)(0);
    v24 = createStorage<A>(capacity:type:)(1);
    v25 = &v58;
    v58 = v22;
    v26 = &v57;
    v57 = v23;
    v27 = &v56;
    v56 = v24;
    serialize(_:at:)(2, &v58);
    serialize(_:at:)(1, v25);
    v54 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v55 = v46;
    closure #1 in osLogInternal(_:log:type:)(&v54, (uint64_t)v25, (uint64_t)v26, (uint64_t)v27);
    v28 = v18;
    if (v18)
    {
      __break(1u);
    }
    else
    {
      v54 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v55 = v47;
      closure #1 in osLogInternal(_:log:type:)(&v54, (uint64_t)&v58, (uint64_t)&v57, (uint64_t)&v56);
      v20[1] = 0;
      v54 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v55 = v49;
      closure #1 in osLogInternal(_:log:type:)(&v54, (uint64_t)&v58, (uint64_t)&v57, (uint64_t)&v56);
      _os_log_impl(&dword_241581000, v52, (os_log_type_t)v53, "Response from XPC service: %s", v22, v40);
      destroyStorage<A>(_:count:)(v23, 0, v21);
      destroyStorage<A>(_:count:)(v24, 1, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x242696CA8](v22, MEMORY[0x24BEE4260]);
      swift_release();
      swift_release();
      swift_release();
    }
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }

  (*(void (**)(char *, uint64_t))(v33 + 8))(v32, v34);
  swift_bridgeObjectRetain();
  v20[0] = &v59;
  swift_beginAccess();
  *(_QWORD *)(v30 + 16) = v35;
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_2415904A4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in _MLServiceS.getPredictionDictionary(withInputFeatures:)(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in _MLServiceS.getPredictionDictionary(withInputFeatures:)(a1, *(_QWORD *)(v1 + 16));
}

uint64_t implicit closure #1 in closure #1 in _MLServiceS.getPredictionDictionary(withInputFeatures:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;

  swift_bridgeObjectRetain();
  result = a1;
  *a2 = a1;
  return result;
}

uint64_t block_copy_helper_29(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_30()
{
  return swift_release();
}

Swift::Void __swiftcall _MLServiceS.write(data:)(Swift::OpaquePointer data)
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  Swift::OpaquePointer *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  Class isa;
  id v47;
  void (*v48)(char *, uint64_t);
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE **v58;
  uint64_t *v59;
  uint64_t *v60;
  uint64_t v61;
  void (*v62)(char *, char *, uint64_t);
  uint64_t v63;
  uint64_t v64;
  void (*v65)(uint64_t, char *, uint64_t);
  uint32_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  NSObject *v77;
  int v78;
  _BOOL4 v79;
  _BOOL4 v80;
  uint64_t v81;
  void (*v82)(char *, uint64_t);
  _BOOL4 v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint8_t *v88;
  uint64_t v89;
  uint64_t v90;
  _BYTE **v91;
  uint64_t *v92;
  uint64_t *v93;
  uint64_t v94;
  const char *v95;
  const char *v96;
  const char *v97;
  uint64_t ObjectType;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  char *v105;
  unint64_t v106;
  char *v107;
  unint64_t v108;
  char *v109;
  unint64_t v110;
  char *v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  char *v115;
  unint64_t v116;
  char *v117;
  _QWORD *v118;
  uint64_t v119;
  void (*v120)(char *, uint64_t, uint64_t);
  Swift::OpaquePointer v121;
  Swift::OpaquePointer *v122;
  unint64_t v123;
  unint64_t v124;
  uint64_t *v125;
  unint64_t v126;
  uint32_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  _QWORD *v137;
  uint64_t v138;
  NSObject *v139;
  int v140;
  uint64_t (*v141)(uint64_t, uint64_t, uint64_t);
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  _BYTE *v145;
  uint64_t (*v146)(uint64_t, uint64_t, uint64_t);
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  _BYTE *v150;
  uint64_t aBlock;
  int v152;
  int v153;
  uint64_t (*v154)(uint64_t, void *);
  void *v155;
  uint64_t (*v156)(uint64_t, uint64_t);
  uint64_t v157;
  uint64_t v158;
  uint32_t v159;
  uint64_t v160;
  uint32_t v161;
  uint64_t v162;
  uint64_t v163;
  char *v164;
  char *v165;

  v121._rawValue = data._rawValue;
  v112 = v1;
  v95 = "Fatal error";
  v96 = "Unexpectedly found nil while implicitly unwrapping an Optional value";
  v97 = "MediaMLServices/MLService.swift";
  ObjectType = swift_getObjectType();
  v165 = 0;
  v164 = 0;
  v163 = 0;
  v162 = 0;
  v99 = 0;
  v100 = 0;
  v101 = type metadata accessor for DispatchTime();
  v102 = *(_QWORD *)(v101 - 8);
  v103 = *(_QWORD *)(v102 + 64);
  v104 = (v103 + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x24BDAC7A8](0);
  v105 = (char *)&v45 - v104;
  v106 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = MEMORY[0x24BDAC7A8](v2);
  v107 = (char *)&v45 - v106;
  v108 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  v6 = MEMORY[0x24BDAC7A8](v4);
  v109 = (char *)&v45 - v108;
  v165 = (char *)&v45 - v108;
  v110 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v6);
  v111 = (char *)&v45 - v110;
  v164 = (char *)&v45 - v110;
  v119 = type metadata accessor for Logger();
  v118 = *(_QWORD **)(v119 - 8);
  v114 = v118[8];
  v113 = (v114 + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = MEMORY[0x24BDAC7A8](v121._rawValue);
  v115 = (char *)&v45 - v113;
  v116 = (v114 + 15) & 0xFFFFFFFFFFFFFFF0;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v45 - v116;
  v117 = (char *)&v45 - v116;
  v163 = v9;
  v162 = v11;
  v12 = _MLServiceS.logger.unsafeMutableAddressor();
  v120 = (void (*)(char *, uint64_t, uint64_t))v118[2];
  v120(v10, v12, v119);
  swift_bridgeObjectRetain();
  v130 = 7;
  v122 = (Swift::OpaquePointer *)swift_allocObject();
  v122[2]._rawValue = v121._rawValue;
  swift_retain();
  v129 = 32;
  v13 = swift_allocObject();
  v14 = v122;
  v131 = v13;
  *(_QWORD *)(v13 + 16) = partial apply for implicit closure #1 in _MLServiceS.write(data:);
  *(_QWORD *)(v13 + 24) = v14;
  swift_release();
  v139 = Logger.logObject.getter();
  v140 = static os_log_type_t.debug.getter();
  v125 = &v160;
  v160 = 12;
  v123 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  v124 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  v126 = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v127 = v161;
  v128 = 17;
  v133 = swift_allocObject();
  *(_BYTE *)(v133 + 16) = 32;
  v134 = swift_allocObject();
  *(_BYTE *)(v134 + 16) = 8;
  v15 = swift_allocObject();
  v16 = v131;
  v132 = v15;
  *(_QWORD *)(v15 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:);
  *(_QWORD *)(v15 + 24) = v16;
  v17 = swift_allocObject();
  v18 = v132;
  v136 = v17;
  *(_QWORD *)(v17 + 16) = _s2os18OSLogInterpolationV06appendC0_5align7privacyySSyXA_AA0B15StringAlignmentVAA0B7PrivacyVtFSSycfu_TA_0;
  *(_QWORD *)(v17 + 24) = v18;
  v138 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v135 = _allocateUninitializedArray<A>(_:)();
  v137 = v19;
  swift_retain();
  v20 = v133;
  v21 = v137;
  *v137 = _s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
  v21[1] = v20;
  swift_retain();
  v22 = v134;
  v23 = v137;
  v137[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v23[3] = v22;
  swift_retain();
  v24 = v136;
  v25 = v137;
  v137[4] = _s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
  v25[5] = v24;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v139, (os_log_type_t)v140))
  {
    v26 = v99;
    v88 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v87 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v89 = createStorage<A>(capacity:type:)(0);
    v90 = createStorage<A>(capacity:type:)(1);
    v91 = &v145;
    v145 = v88;
    v92 = &v144;
    v144 = v89;
    v93 = &v143;
    v143 = v90;
    serialize(_:at:)(2, &v145);
    serialize(_:at:)(1, v91);
    v141 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
    v142 = v133;
    closure #1 in osLogInternal(_:log:type:)(&v141, (uint64_t)v91, (uint64_t)v92, (uint64_t)v93);
    v94 = v26;
    if (v26)
    {
      __break(1u);
    }
    else
    {
      v141 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v142 = v134;
      closure #1 in osLogInternal(_:log:type:)(&v141, (uint64_t)&v145, (uint64_t)&v144, (uint64_t)&v143);
      v85 = 0;
      v28 = v85;
      v141 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
      v142 = v136;
      closure #1 in osLogInternal(_:log:type:)(&v141, (uint64_t)&v145, (uint64_t)&v144, (uint64_t)&v143);
      v84 = v28;
      _os_log_impl(&dword_241581000, v139, (os_log_type_t)v140, "Calling write function with data dictionary: %s", v88, v127);
      destroyStorage<A>(_:count:)(v89, 0, v87);
      destroyStorage<A>(_:count:)(v90, 1, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x242696CA8](v88, MEMORY[0x24BEE4260]);
      swift_release();
      swift_release();
      swift_release();
      v86 = v84;
    }
  }
  else
  {
    v27 = v99;
    swift_release();
    swift_release();
    swift_release();
    v86 = v27;
  }
  v81 = v86;

  v82 = (void (*)(char *, uint64_t))v118[1];
  v82(v117, v119);
  static DispatchTime.now()();
  v83 = checkValidThroughputTrue(data:)(v121);
  swift_bridgeObjectRetain();
  v80 = v83 && checkValidInterfaceType(data:)(v121);
  v79 = v80;
  swift_bridgeObjectRelease();
  if (v79)
  {
    v29 = v115;
    static DispatchTime.now()();
    v30 = _MLServiceS.logger.unsafeMutableAddressor();
    v120(v29, v30, v119);
    v62 = *(void (**)(char *, char *, uint64_t))(v102 + 16);
    v62(v107, v109, v101);
    v62(v105, v111, v101);
    v31 = *(_DWORD *)(v102 + 80);
    v63 = (v31 + 16) & ~v31;
    v69 = 7;
    v64 = (v63 + v103 + v31) & ~v31;
    v70 = swift_allocObject();
    v65 = *(void (**)(uint64_t, char *, uint64_t))(v102 + 32);
    v65(v70 + v63, v107, v101);
    v65(v70 + v64, v105, v101);
    v77 = Logger.logObject.getter();
    v78 = static os_log_type_t.info.getter();
    v158 = 12;
    UnsignedInteger<>.init<A>(_:)();
    v66 = v159;
    v67 = 17;
    v72 = swift_allocObject();
    *(_BYTE *)(v72 + 16) = 0;
    v73 = swift_allocObject();
    *(_BYTE *)(v73 + 16) = 8;
    v68 = 32;
    v32 = swift_allocObject();
    v33 = v70;
    v71 = v32;
    *(_QWORD *)(v32 + 16) = partial apply for implicit closure #3 in _MLServiceS.write(data:);
    *(_QWORD *)(v32 + 24) = v33;
    v34 = swift_allocObject();
    v35 = v71;
    v75 = v34;
    *(_QWORD *)(v34 + 16) = _s2os18OSLogInterpolationV06appendC0_6format5align7privacyySdyXA_AA0B15FloatFormattingVAA0B15StringAlignmentVAA0B7PrivacyVtFSdycfu_TA_0;
    *(_QWORD *)(v34 + 24) = v35;
    v74 = _allocateUninitializedArray<A>(_:)();
    v76 = v36;
    swift_retain();
    v37 = v72;
    v38 = v76;
    *v76 = closure #1 in OSLogArguments.append(_:)partial apply;
    v38[1] = v37;
    swift_retain();
    v39 = v73;
    v40 = v76;
    v76[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v40[3] = v39;
    swift_retain();
    v41 = v75;
    v42 = v76;
    v76[4] = _s2os14OSLogArgumentsV6appendyySdycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
    v42[5] = v41;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v77, (os_log_type_t)v78))
    {
      v43 = v81;
      v55 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v53 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v54 = 0;
      v56 = createStorage<A>(capacity:type:)(0);
      v57 = createStorage<A>(capacity:type:)(v54);
      v58 = &v150;
      v150 = v55;
      v59 = &v149;
      v149 = v56;
      v60 = &v148;
      v148 = v57;
      serialize(_:at:)(0, &v150);
      serialize(_:at:)(1, v58);
      v146 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v147 = v72;
      closure #1 in osLogInternal(_:log:type:)(&v146, (uint64_t)v58, (uint64_t)v59, (uint64_t)v60);
      v61 = v43;
      if (v43)
      {
        __break(1u);
      }
      else
      {
        v146 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        v147 = v73;
        closure #1 in osLogInternal(_:log:type:)(&v146, (uint64_t)&v150, (uint64_t)&v149, (uint64_t)&v148);
        v52 = 0;
        v146 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyySdycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
        v147 = v75;
        closure #1 in osLogInternal(_:log:type:)(&v146, (uint64_t)&v150, (uint64_t)&v149, (uint64_t)&v148);
        _os_log_impl(&dword_241581000, v77, (os_log_type_t)v78, "Validity check in MLService Time taken = %f [ns]", v55, v66);
        v51 = 0;
        destroyStorage<A>(_:count:)(v56, 0, v53);
        destroyStorage<A>(_:count:)(v57, v51, MEMORY[0x24BEE4AD8] + 8);
        MEMORY[0x242696CA8](v55, MEMORY[0x24BEE4260]);
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }

    v82(v115, v119);
    v50 = *(void **)(v112 + OBJC_IVAR____MLServiceS_service);
    swift_unknownObjectRetain();
    if (v50)
    {
      v49 = v50;
    }
    else
    {
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    v47 = v49;
    swift_getObjectType();
    swift_bridgeObjectRetain();
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v44 = swift_allocObject();
    *(_QWORD *)(v44 + 16) = ObjectType;
    v156 = partial apply for closure #1 in _MLServiceS.write(data:);
    v157 = v44;
    aBlock = MEMORY[0x24BDAC760];
    v152 = 1107296256;
    v153 = 0;
    v154 = thunk for @escaping @callee_guaranteed (@guaranteed String) -> ();
    v155 = &block_descriptor_73;
    v45 = _Block_copy(&aBlock);
    swift_release();
    objc_msgSend(v47, sel_writeWithData_with_, isa, v45);
    _Block_release(v45);

    swift_unknownObjectRelease();
    v48 = *(void (**)(char *, uint64_t))(v102 + 8);
    v48(v109, v101);
    v48(v111, v101);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v102 + 8))(v111, v101);
  }
}

uint64_t implicit closure #1 in _MLServiceS.write(data:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;

  swift_bridgeObjectRetain();
  result = a1;
  *a2 = a1;
  return result;
}

uint64_t sub_241591930()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in _MLServiceS.write(data:)@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return implicit closure #1 in _MLServiceS.write(data:)(*(_QWORD *)(v1 + 16), a1);
}

uint64_t implicit closure #3 in _MLServiceS.write(data:)()
{
  unint64_t v0;
  uint64_t result;
  unint64_t v2;

  v2 = DispatchTime.uptimeNanoseconds.getter();
  v0 = DispatchTime.uptimeNanoseconds.getter();
  result = v2;
  if (v2 < v0)
  {
    __break(1u);
  }
  else
  {
    lazy protocol witness table accessor for type UInt64 and conformance UInt64();
    return Double.init<A>(_:)();
  }
  return result;
}

uint64_t closure #1 in _MLServiceS.write(data:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD v20[3];
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE **v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t *v38;
  uint32_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  NSObject *v51;
  int v52;
  uint64_t (*v53)(uint64_t, uint64_t, uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _BYTE *v57;
  uint64_t v58;
  uint32_t v59;
  uint64_t v60;
  uint64_t v61;

  v34 = a1;
  v35 = a2;
  v60 = 0;
  v61 = 0;
  v29 = 0;
  v33 = type metadata accessor for Logger();
  v32 = *(_QWORD *)(v33 - 8);
  v30 = (*(_QWORD *)(v32 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = (char *)v20 - v30;
  v31 = (char *)v20 - v30;
  v60 = MEMORY[0x24BDAC7A8](v34);
  v61 = v3;
  v4 = _MLServiceS.logger.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v2, v4, v33);
  swift_bridgeObjectRetain();
  v41 = 32;
  v42 = 7;
  v5 = swift_allocObject();
  v6 = v35;
  v43 = v5;
  *(_QWORD *)(v5 + 16) = v34;
  *(_QWORD *)(v5 + 24) = v6;
  v51 = Logger.logObject.getter();
  v52 = static os_log_type_t.debug.getter();
  v38 = &v58;
  v58 = 12;
  v36 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  v37 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v39 = v59;
  v40 = 17;
  v45 = swift_allocObject();
  *(_BYTE *)(v45 + 16) = 32;
  v46 = swift_allocObject();
  *(_BYTE *)(v46 + 16) = 8;
  v7 = swift_allocObject();
  v8 = v43;
  v44 = v7;
  *(_QWORD *)(v7 + 16) = partial apply for implicit closure #1 in closure #1 in _MLServiceS.write(data:);
  *(_QWORD *)(v7 + 24) = v8;
  v9 = swift_allocObject();
  v10 = v44;
  v48 = v9;
  *(_QWORD *)(v9 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  *(_QWORD *)(v9 + 24) = v10;
  v50 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v47 = _allocateUninitializedArray<A>(_:)();
  v49 = v11;
  swift_retain();
  v12 = v45;
  v13 = v49;
  *v49 = closure #1 in OSLogArguments.append(_:)partial apply;
  v13[1] = v12;
  swift_retain();
  v14 = v46;
  v15 = v49;
  v49[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v15[3] = v14;
  swift_retain();
  v16 = v48;
  v17 = v49;
  v49[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v17[5] = v16;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v51, (os_log_type_t)v52))
  {
    v18 = v29;
    v22 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v23 = createStorage<A>(capacity:type:)(0);
    v24 = createStorage<A>(capacity:type:)(1);
    v25 = &v57;
    v57 = v22;
    v26 = &v56;
    v56 = v23;
    v27 = &v55;
    v55 = v24;
    serialize(_:at:)(2, &v57);
    serialize(_:at:)(1, v25);
    v53 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v54 = v45;
    closure #1 in osLogInternal(_:log:type:)(&v53, (uint64_t)v25, (uint64_t)v26, (uint64_t)v27);
    v28 = v18;
    if (v18)
    {
      __break(1u);
    }
    else
    {
      v53 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v54 = v46;
      closure #1 in osLogInternal(_:log:type:)(&v53, (uint64_t)&v57, (uint64_t)&v56, (uint64_t)&v55);
      v20[1] = 0;
      v53 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v54 = v48;
      closure #1 in osLogInternal(_:log:type:)(&v53, (uint64_t)&v57, (uint64_t)&v56, (uint64_t)&v55);
      _os_log_impl(&dword_241581000, v51, (os_log_type_t)v52, "Response from XPC service: %s", v22, v39);
      destroyStorage<A>(_:count:)(v23, 0, v21);
      destroyStorage<A>(_:count:)(v24, 1, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x242696CA8](v22, MEMORY[0x24BEE4260]);
      swift_release();
      swift_release();
      swift_release();
    }
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v31, v33);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> implicit closure #1 in closure #1 in _MLServiceS.write(data:)()
{
  swift_bridgeObjectRetain();
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed String) -> ()(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void (*v5)(uint64_t);

  v5 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = a2;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5(v3);
  swift_bridgeObjectRelease();

  return swift_release();
}

id _MLServiceS.__deallocating_deinit()
{
  void *v0;
  char *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t *v17;
  uint64_t *v18;
  _BYTE **v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  objc_class *ObjectType;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  char *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t *v33;
  uint32_t v34;
  uint64_t v35;
  int v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE *v42;
  objc_super v43;
  uint64_t v44;
  uint32_t v45;
  uint64_t v46;

  v25 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  v46 = 0;
  v24 = 0;
  v35 = 0;
  v30 = type metadata accessor for Logger();
  v29 = *(_QWORD *)(v30 - 8);
  v26 = (*(_QWORD *)(v29 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v30);
  v1 = (char *)&v10 - v26;
  v27 = (char *)&v10 - v26;
  v46 = v2;
  v28 = *(id *)(v2 + OBJC_IVAR____MLServiceS_connection);
  v3 = v28;
  objc_msgSend(v28, sel_invalidate);

  v4 = _MLServiceS.logger.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v1, v4, v30);
  v37 = Logger.logObject.getter();
  v36 = static os_log_type_t.info.getter();
  v33 = &v44;
  v44 = 2;
  v31 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  v32 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v34 = v45;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v38 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v37, (os_log_type_t)v36))
  {
    v5 = v24;
    v13 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v12 = 0;
    v14 = createStorage<A>(capacity:type:)(0);
    v15 = createStorage<A>(capacity:type:)(v12);
    v19 = &v42;
    v42 = v13;
    v20 = &v41;
    v41 = v14;
    v17 = &v40;
    v40 = v15;
    v16 = 0;
    serialize(_:at:)(0, &v42);
    serialize(_:at:)(v16, v19);
    v39 = v38;
    v18 = &v10;
    MEMORY[0x24BDAC7A8](&v10);
    v6 = v20;
    v7 = &v10 - 6;
    v21 = &v10 - 6;
    v7[2] = (uint64_t)v19;
    v7[3] = (uint64_t)v6;
    v7[4] = v8;
    v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    if (v5)
    {
      __break(1u);
    }
    else
    {
      _os_log_impl(&dword_241581000, v37, (os_log_type_t)v36, "Called into deinit", v13, v34);
      v10 = 0;
      destroyStorage<A>(_:count:)(v14, 0, v11);
      destroyStorage<A>(_:count:)(v15, v10, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x242696CA8](v13, MEMORY[0x24BEE4260]);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  (*(void (**)(char *, uint64_t))(v29 + 8))(v27, v30);
  v43.receiver = v25;
  v43.super_class = ObjectType;
  return objc_msgSendSuper2(&v43, sel_dealloc);
}

id _MLServiceS.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t _MLServiceS.init()()
{
  uint64_t result;
  uint64_t v1;

  if (!"MediaMLServices._MLServiceS")
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  result = closure #1 in _unimplementedInitializer(className:initName:file:line:column:)((uint64_t)"MediaMLServices._MLServiceS", 27, (unint64_t)"init()", 6, 2, (unint64_t)"MediaMLServices/MLService.swift", 31, 2, v1, 0xBuLL, 0x27uLL);
  __break(1u);
  return result;
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (*v4)(void);
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v12 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a3 - 8);
  v8 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = (void (*)(void))MEMORY[0x24BDAC7A8](a1);
  v11 = (char *)&v7 - v8;
  v4();
  v13 = dispatch thunk of CustomStringConvertible.description.getter();
  v14 = v5;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v11, v12);
  return v13;
}

uint64_t sub_241592700()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
  v1 = lazy protocol witness table accessor for type [String : Any] and conformance [A : B]();
  return implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(v5, v3, v4, v1);
}

uint64_t specialized closure #1 in StaticString.withUTF8Buffer<A>(_:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t specialized Unicode.Scalar.withUTF8CodeUnits<A>(_:)(uint64_t (*a1)(uint64_t *, uint64_t), uint64_t a2, unsigned int a3)
{
  uint64_t result;
  uint64_t v4;
  unsigned int v5;
  int v6;
  int v7;
  uint64_t v8;

  if (a3 < 0x80uLL)
  {
    if (a3 > 0xFF)
      goto LABEL_12;
    v5 = (a3 + 1);
  }
  else
  {
    v7 = (a3 & 0x3F) << 8;
    if (a3 >> 6 < 0x20uLL)
    {
      v5 = (v7 | (a3 >> 6)) + 33217;
    }
    else
    {
      v6 = (v7 | (a3 >> 6) & 0x3F) << 8;
      if (a3 >> 12 < 0x10uLL)
        v5 = (v6 | (a3 >> 12)) + 8487393;
      else
        v5 = ((a3 >> 18) | ((v6 | (a3 >> 12) & 0x3F) << 8)) - 2122219023;
    }
  }
  v4 = 4 - ((uint64_t)__clz(v5) >> 3);
  v8 = (v5 - 0x101010101010101) & ((1 << ((8 * v4) & 0x3F)) - 1);
  if (v4 >= 0)
    return a1(&v8, v4);
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
LABEL_12:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t closure #1 in _unimplementedInitializer(className:initName:file:line:column:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, unint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>, unint64_t a10, unint64_t a11)
{
  unsigned int v11;
  uint64_t result;
  char v13[8];
  uint64_t v14;
  uint64_t (*v15)@<X0>(uint64_t@<X0>, uint64_t@<X1>, uint64_t@<X8>);
  char *v16;
  uint64_t v17[2];
  uint64_t *v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  int v27;
  unint64_t v28;
  unint64_t v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  char v38;
  unint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;

  v20 = a9;
  v21 = a1;
  v22 = a2;
  v23 = a3;
  v24 = a4;
  v25 = a6;
  v26 = a7;
  v27 = a8;
  v28 = a10;
  v29 = a11;
  v30 = "Fatal error";
  v31 = "Unexpectedly found nil while unwrapping an Optional value";
  v32 = "Swift/StaticString.swift";
  v33 = "Not enough bits to represent the passed value";
  v34 = "Swift/Integers.swift";
  v35 = "UnsafeBufferPointer with negative count";
  v36 = "Swift/UnsafeBufferPointer.swift";
  v37 = 0;
  v39 = a6;
  v40 = a7;
  v41 = a8;
  v42 = a1;
  v43 = a2;
  v44 = a10;
  v45 = a11;
  if ((a5 & 1) != 0)
  {
    if (v23 <= 0xFFFFFFFF)
    {
      v19 = v23;
      if ((v23 < 0xD800 || v19 > 0xDFFF) && v19 <= 0x10FFFF)
      {
        v18 = v17;
        MEMORY[0x24BDAC7A8](v17);
        v15 = partial apply for closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:);
        v16 = &v38;
        specialized Unicode.Scalar.withUTF8CodeUnits<A>(_:)((uint64_t (*)(uint64_t *, uint64_t))partial apply for specialized closure #1 in StaticString.withUTF8Buffer<A>(_:), (uint64_t)v13, v11);
        return (uint64_t)v18;
      }
      v13[0] = 2;
      v14 = 148;
      LODWORD(v15) = 0;
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    v13[0] = 2;
    v14 = 3455;
    LODWORD(v15) = 0;
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (v23)
    v46 = v23;
  else
    v46 = 0;
  v17[0] = v46;
  if (!v46)
  {
    v13[0] = 2;
    v14 = 136;
    LODWORD(v15) = 0;
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (v24 >= 0)
    return closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:)(v17[0], v24, v25, v26, v27, v21, v22, v28, v20, v29);
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, unint64_t a8@<X7>, uint64_t a9@<X8>, unint64_t a10)
{
  unsigned int v10;
  uint64_t result;
  char v12[8];
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;

  v20 = a9;
  v21 = a1;
  v22 = a2;
  v23 = a3;
  v24 = a4;
  v25 = a6;
  v26 = a7;
  v27 = a8;
  v28 = a10;
  v29 = "Fatal error";
  v30 = "Unexpectedly found nil while unwrapping an Optional value";
  v31 = "Swift/StaticString.swift";
  v32 = "Not enough bits to represent the passed value";
  v33 = "Swift/Integers.swift";
  v34 = "UnsafeBufferPointer with negative count";
  v35 = "Swift/UnsafeBufferPointer.swift";
  v36 = 0;
  v38 = a6;
  v39 = a7;
  v40 = a1;
  v41 = a2;
  v42 = a8;
  v43 = a10;
  if ((a5 & 1) != 0)
  {
    if (v23 <= 0xFFFFFFFF)
    {
      v19 = v23;
      if ((v23 < 0xD800 || v19 > 0xDFFF) && v19 <= 0x10FFFF)
      {
        v18 = &v16;
        MEMORY[0x24BDAC7A8](&v16);
        v14 = partial apply for closure #1 in closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:);
        v15 = &v37;
        specialized Unicode.Scalar.withUTF8CodeUnits<A>(_:)((uint64_t (*)(uint64_t *, uint64_t))closure #1 in StaticString.withUTF8Buffer<A>(_:)specialized partial apply, (uint64_t)v12, v10);
        return (uint64_t)v18;
      }
      v12[0] = 2;
      v13 = 148;
      LODWORD(v14) = 0;
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    v12[0] = 2;
    v13 = 3455;
    LODWORD(v14) = 0;
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (v23)
    v44 = v23;
  else
    v44 = 0;
  v17 = v44;
  if (!v44)
  {
    v12[0] = 2;
    v13 = 136;
    LODWORD(v14) = 0;
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (v24 >= 0)
    return closure #1 in closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:)(v17, v24, v25, v26, v21, v22, v27, v28);
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t closure #1 in closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, unint64_t a8)
{
  uint64_t result;

  if (!a3)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (a4 >= (uint64_t)0xFFFFFFFF80000000)
  {
    if (a4 <= 0x7FFFFFFF)
    {
      if (!a5)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      if (a6 >= (uint64_t)0xFFFFFFFF80000000)
      {
        if (a6 <= 0x7FFFFFFF)
        {
          if (!a1)
          {
            _assertionFailure(_:_:file:line:flags:)();
            __break(1u);
          }
          if (a2 >= (uint64_t)0xFFFFFFFF80000000)
          {
            if (a2 <= 0x7FFFFFFF)
            {
              if (a7 <= 0xFFFFFFFF)
              {
                if (a8 <= 0xFFFFFFFF)
                  return _swift_stdlib_reportUnimplementedInitializerInFile();
                _assertionFailure(_:_:file:line:flags:)();
                __break(1u);
              }
              _assertionFailure(_:_:file:line:flags:)();
              __break(1u);
            }
            _assertionFailure(_:_:file:line:flags:)();
            __break(1u);
          }
          _assertionFailure(_:_:file:line:flags:)();
          __break(1u);
        }
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(void (*a1)(void))
{
  id v1;
  void *v3;

  a1();
  v3 = (void *)_swift_stdlib_bridgeErrorToNSError();
  v1 = v3;
  swift_unknownObjectRelease();
  return v3;
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTR(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = v2;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTQ0_;
  return v5(a1);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTQ0_()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t sub_241593954()
{
  return swift_deallocObject();
}

_BYTE **_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_241593984()
{
  return swift_deallocObject();
}

void closure #1 in OSLogArguments.append(_:)(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  _QWORD *v4;
  id v7;
  uint64_t v8;

  v7 = (id)a4();
  v8 = *a1;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *a1 = v8 + 8;
  v4 = *a2;
  if (*a2)
  {
    *v4 = v7;
    *a2 = v4 + 1;
  }
  else
  {

  }
}

uint64_t sub_241593AF0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t _s2os18OSLogInterpolationV06appendC0_5align7privacyySSyXA_AA0B15StringAlignmentVAA0B7PrivacyVtFSSycfu_TA_0()
{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_241593B38()
{
  swift_release();
  return swift_deallocObject();
}

_QWORD *_s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_241593B80()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v4;
  uint64_t v5;
  void (*v6)(unint64_t);

  v5 = type metadata accessor for DispatchTime();
  v1 = *(_QWORD *)(v5 - 8);
  v2 = (*(_DWORD *)(v1 + 80) + 16) & ~(unint64_t)*(_DWORD *)(v1 + 80);
  v4 = (v2 + *(_QWORD *)(v1 + 64) + *(_DWORD *)(v1 + 80)) & ~(unint64_t)*(_DWORD *)(v1 + 80);
  v6 = *(void (**)(unint64_t))(v1 + 8);
  v6(v0 + v2);
  ((void (*)(unint64_t, uint64_t))v6)(v0 + v4, v5);
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #3 in _MLServiceS.write(data:)()
{
  type metadata accessor for DispatchTime();
  return implicit closure #3 in _MLServiceS.write(data:)();
}

uint64_t sub_241593C74()
{
  return swift_deallocObject();
}

uint64_t sub_241593CA4()
{
  return swift_deallocObject();
}

uint64_t sub_241593CD4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t _s2os18OSLogInterpolationV06appendC0_6format5align7privacyySdyXA_AA0B15FloatFormattingVAA0B15StringAlignmentVAA0B7PrivacyVtFSdycfu_TA_0()
{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_241593D1C()
{
  swift_release();
  return swift_deallocObject();
}

_QWORD *_s2os14OSLogArgumentsV6appendyySdycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

uint64_t sub_241593D64()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in _MLServiceS.write(data:)(uint64_t a1, uint64_t a2)
{
  return closure #1 in _MLServiceS.write(data:)(a1, a2);
}

uint64_t block_copy_helper_71(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_72()
{
  return swift_release();
}

uint64_t partial apply for closure #1 in osLogInternal(_:log:type:)(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

unint64_t lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A];
  if (!lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [(_:_:_:)]);
    v1 = MEMORY[0x242696FFC](MEMORY[0x24BEE12C8], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A]);
    return v1;
  }
  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of MLServerProtocol?()
{
  swift_unknownObjectRelease();
}

uint64_t type metadata accessor for _MLServiceS()
{
  return objc_opt_self();
}

uint64_t partial apply for closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:)(a1, a2, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_BYTE *)(v3 + 32), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 48), *(_QWORD *)(v3 + 56), a3, *(_QWORD *)(v3 + 64));
}

uint64_t partial apply for specialized closure #1 in StaticString.withUTF8Buffer<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return specialized closure #1 in StaticString.withUTF8Buffer<A>(_:)(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t partial apply for closure #1 in closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return closure #1 in closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:)(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56));
}

uint64_t closure #1 in StaticString.withUTF8Buffer<A>(_:)specialized partial apply(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return specialized closure #1 in StaticString.withUTF8Buffer<A>(_:)(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_241593F84()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in closure #1 in _MLServiceS.write(data:)()
{
  uint64_t v0;
  uint64_t result;

  result = *(_QWORD *)(v0 + 16);
  implicit closure #1 in closure #1 in _MLServiceS.write(data:)();
  return result;
}

uint64_t sub_241593FCC()
{
  return swift_deallocObject();
}

uint64_t sub_241593FFC()
{
  return swift_deallocObject();
}

uint64_t sub_24159402C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241594074()
{
  swift_release();
  return swift_deallocObject();
}

unint64_t lazy protocol witness table accessor for type UInt64 and conformance UInt64()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type UInt64 and conformance UInt64;
  if (!lazy protocol witness table cache variable for type UInt64 and conformance UInt64)
  {
    v0 = MEMORY[0x242696FFC](MEMORY[0x24BEE45A0], MEMORY[0x24BEE4568]);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type UInt64 and conformance UInt64);
    return v0;
  }
  return v2;
}

uint64_t sub_241594124()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in closure #1 in _MLServiceS.getPredictionDictionary(withInputFeatures:)@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return implicit closure #1 in closure #1 in _MLServiceS.getPredictionDictionary(withInputFeatures:)(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_241594168()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)partial apply()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
  v1 = lazy protocol witness table accessor for type [String : Any] and conformance [A : B]();
  return implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(v5, v3, v4, v1);
}

uint64_t sub_2415941F0()
{
  return swift_deallocObject();
}

uint64_t sub_241594220()
{
  return swift_deallocObject();
}

uint64_t sub_241594250()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241594298()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2415942E0()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in closure #1 in _MLServiceS.getPrediction(inputFeatures:)()
{
  uint64_t v0;

  return implicit closure #1 in closure #1 in _MLServiceS.getPrediction(inputFeatures:)(*(double *)(v0 + 16));
}

uint64_t sub_241594310()
{
  return swift_deallocObject();
}

uint64_t sub_241594340()
{
  return swift_deallocObject();
}

uint64_t sub_241594370()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2415943B8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t outlined destroy of TaskPriority?(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  v3 = type metadata accessor for TaskPriority();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return a1;
}

uint64_t sub_241594470()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTA(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int *v5;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = *(int **)(v1 + 24);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTATQ0_;
  return ((uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTu
                                                 + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTu))(a1, v5);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTATQ0_()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t sub_2415945C8()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in _MLServiceS.getModelStats(completionHandler:)(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in closure #1 in _MLServiceS.getModelStats(completionHandler:)(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t block_copy_helper_144(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_145()
{
  return swift_release();
}

uint64_t sub_24159468C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in closure #1 in closure #1 in _MLServiceS.getModelStats(completionHandler:)()
{
  uint64_t v0;

  return implicit closure #1 in closure #1 in closure #1 in _MLServiceS.getModelStats(completionHandler:)(*(_QWORD *)(v0 + 16));
}

uint64_t sub_2415946D0()
{
  return swift_deallocObject();
}

uint64_t sub_241594700()
{
  return swift_deallocObject();
}

uint64_t sub_241594730()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241594778()
{
  swift_release();
  return swift_deallocObject();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of String?()
{
  swift_bridgeObjectRelease();
}

uint64_t closure #1 in osLogInternal(_:log:type:)partial apply(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_241594814()
{
  uint64_t v0;

  return swift_deallocObject();
}

void *partial apply for implicit closure #1 in closure #1 in _MLServiceS.init(nameOfModel:)()
{
  uint64_t v0;

  return implicit closure #1 in closure #1 in _MLServiceS.init(nameOfModel:)(*(void **)(v0 + 16));
}

uint64_t sub_241594858()
{
  return swift_deallocObject();
}

uint64_t sub_241594888()
{
  return swift_deallocObject();
}

uint64_t sub_2415948B8()
{
  swift_release();
  return swift_deallocObject();
}

void *partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)()
{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(void (**)(void))(v0 + 16));
}

uint64_t sub_241594900()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)()
{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_241594948()
{
  swift_release();
  return swift_deallocObject();
}

void partial apply for closure #1 in OSLogArguments.append(_:)(uint64_t *a1, _QWORD **a2, uint64_t a3)
{
  uint64_t v3;

  closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

Swift::Double *kSecondsFromNanoseconds.unsafeMutableAddressor()
{
  return &kSecondsFromNanoseconds;
}

uint64_t one-time initialization function for kMediaML_rssi()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rssi", 4uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_rssi = v1;
  return result;
}

Swift::String *kMediaML_rssi.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_rssi != -1)
    swift_once();
  return &kMediaML_rssi;
}

uint64_t one-time initialization function for kMediaML_cca()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("cca", 3uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_cca = v1;
  return result;
}

Swift::String *kMediaML_cca.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_cca != -1)
    swift_once();
  return &kMediaML_cca;
}

uint64_t one-time initialization function for kMediaML_snr()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("snr", 3uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_snr = v1;
  return result;
}

Swift::String *kMediaML_snr.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_snr != -1)
    swift_once();
  return &kMediaML_snr;
}

uint64_t one-time initialization function for kMediaML_noise()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("noise", 5uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_noise = v1;
  return result;
}

Swift::String *kMediaML_noise.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_noise != -1)
    swift_once();
  return &kMediaML_noise;
}

uint64_t one-time initialization function for kMediaML_throughputTrue()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("throughput_true", 0xFuLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_throughputTrue = v1;
  return result;
}

Swift::String *kMediaML_throughputTrue.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_throughputTrue != -1)
    swift_once();
  return &kMediaML_throughputTrue;
}

uint64_t one-time initialization function for kMediaML_txRate()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("tx_rate", 7uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_txRate = v1;
  return result;
}

Swift::String *kMediaML_txRate.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_txRate != -1)
    swift_once();
  return &kMediaML_txRate;
}

uint64_t one-time initialization function for kMediaML_rxRate()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rx_rate", 7uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_rxRate = v1;
  return result;
}

Swift::String *kMediaML_rxRate.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_rxRate != -1)
    swift_once();
  return &kMediaML_rxRate;
}

uint64_t one-time initialization function for kMediaML_dayOfWeek()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("dow", 3uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_dayOfWeek = v1;
  return result;
}

Swift::String *kMediaML_dayOfWeek.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_dayOfWeek != -1)
    swift_once();
  return &kMediaML_dayOfWeek;
}

uint64_t one-time initialization function for kMediaML_hourOfDay()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("hour", 4uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_hourOfDay = v1;
  return result;
}

Swift::String *kMediaML_hourOfDay.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_hourOfDay != -1)
    swift_once();
  return &kMediaML_hourOfDay;
}

uint64_t one-time initialization function for kMediaML_ssid()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ssid", 4uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_ssid = v1;
  return result;
}

Swift::String *kMediaML_ssid.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_ssid != -1)
    swift_once();
  return &kMediaML_ssid;
}

uint64_t one-time initialization function for kMediaML_interfaceType()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ifty", 4uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_interfaceType = v1;
  return result;
}

Swift::String *kMediaML_interfaceType.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_interfaceType != -1)
    swift_once();
  return &kMediaML_interfaceType;
}

uint64_t one-time initialization function for kMediaML_nData()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ndata", 5uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_nData = v1;
  return result;
}

Swift::String *kMediaML_nData.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_nData != -1)
    swift_once();
  return &kMediaML_nData;
}

uint64_t one-time initialization function for kMediaML_appName()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("app_name", 8uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_appName = v1;
  return result;
}

Swift::String *kMediaML_appName.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_appName != -1)
    swift_once();
  return &kMediaML_appName;
}

uint64_t one-time initialization function for kMediaML_sessionID()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("session_id", 0xAuLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_sessionID = v1;
  return result;
}

Swift::String *kMediaML_sessionID.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_sessionID != -1)
    swift_once();
  return &kMediaML_sessionID;
}

uint64_t one-time initialization function for kMediaML_carrier()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("carrier", 7uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_carrier = v1;
  return result;
}

Swift::String *kMediaML_carrier.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_carrier != -1)
    swift_once();
  return &kMediaML_carrier;
}

uint64_t one-time initialization function for kMediaML_rsrp()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rsrp", 4uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_rsrp = v1;
  return result;
}

Swift::String *kMediaML_rsrp.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_rsrp != -1)
    swift_once();
  return &kMediaML_rsrp;
}

uint64_t one-time initialization function for kMediaML_rscp()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rscp", 4uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_rscp = v1;
  return result;
}

Swift::String *kMediaML_rscp.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_rscp != -1)
    swift_once();
  return &kMediaML_rscp;
}

uint64_t one-time initialization function for kMediaML_rsrq()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rsrq", 4uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_rsrq = v1;
  return result;
}

Swift::String *kMediaML_rsrq.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_rsrq != -1)
    swift_once();
  return &kMediaML_rsrq;
}

uint64_t one-time initialization function for kMediaML_bars()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("bars", 4uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_bars = v1;
  return result;
}

Swift::String *kMediaML_bars.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_bars != -1)
    swift_once();
  return &kMediaML_bars;
}

uint64_t one-time initialization function for kMediaML_count()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("count", 5uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_count = v1;
  return result;
}

Swift::String *kMediaML_count.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_count != -1)
    swift_once();
  return &kMediaML_count;
}

uint64_t one-time initialization function for kMediaML_medianThroughputTrue()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("quantile(throughput_true)", 0x19uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_medianThroughputTrue = v1;
  return result;
}

Swift::String *kMediaML_medianThroughputTrue.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_medianThroughputTrue != -1)
    swift_once();
  return &kMediaML_medianThroughputTrue;
}

uint64_t one-time initialization function for kMediaML_binnedRssi()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("binned_rssi", 0xBuLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_binnedRssi = v1;
  return result;
}

Swift::String *kMediaML_binnedRssi.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_binnedRssi != -1)
    swift_once();
  return &kMediaML_binnedRssi;
}

uint64_t one-time initialization function for kMediaML_binnedRsrp()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("binned_rsrp", 0xBuLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_binnedRsrp = v1;
  return result;
}

Swift::String *kMediaML_binnedRsrp.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_binnedRsrp != -1)
    swift_once();
  return &kMediaML_binnedRsrp;
}

uint64_t one-time initialization function for kMediaML_binnedRsrq()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("binned_rsrq", 0xBuLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_binnedRsrq = v1;
  return result;
}

Swift::String *kMediaML_binnedRsrq.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_binnedRsrq != -1)
    swift_once();
  return &kMediaML_binnedRsrq;
}

uint64_t one-time initialization function for kMediaML_binnedRscp()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("binned_rscp", 0xBuLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_binnedRscp = v1;
  return result;
}

Swift::String *kMediaML_binnedRscp.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_binnedRscp != -1)
    swift_once();
  return &kMediaML_binnedRscp;
}

uint64_t one-time initialization function for kMediaML_binnedSnr()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("binned_snr", 0xAuLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_binnedSnr = v1;
  return result;
}

Swift::String *kMediaML_binnedSnr.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_binnedSnr != -1)
    swift_once();
  return &kMediaML_binnedSnr;
}

uint64_t one-time initialization function for kMediaML_throughputStdDev()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("predStdDev", 0xAuLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_throughputStdDev = v1;
  return result;
}

Swift::String *kMediaML_throughputStdDev.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_throughputStdDev != -1)
    swift_once();
  return &kMediaML_throughputStdDev;
}

uint64_t one-time initialization function for kMediaML_throughputPrediction()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("predVal", 7uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_throughputPrediction = v1;
  return result;
}

Swift::String *kMediaML_throughputPrediction.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_throughputPrediction != -1)
    swift_once();
  return &kMediaML_throughputPrediction;
}

Swift::Int *cell_signal_binsize.unsafeMutableAddressor()
{
  return &cell_signal_binsize;
}

Swift::Int *cell_snr_binsize.unsafeMutableAddressor()
{
  return &cell_snr_binsize;
}

Swift::Int *rssiBucket_low_medium_boundary.unsafeMutableAddressor()
{
  return &rssiBucket_low_medium_boundary;
}

Swift::Int *rssiBucket_medium_high_boundary.unsafeMutableAddressor()
{
  return &rssiBucket_medium_high_boundary;
}

uint64_t one-time initialization function for rssiBucket_low()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("low", 3uLL, 1);
  result = v1._countAndFlagsBits;
  rssiBucket_low = v1;
  return result;
}

Swift::String *rssiBucket_low.unsafeMutableAddressor()
{
  if (one-time initialization token for rssiBucket_low != -1)
    swift_once();
  return &rssiBucket_low;
}

uint64_t one-time initialization function for rssiBucket_medium()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("medium", 6uLL, 1);
  result = v1._countAndFlagsBits;
  rssiBucket_medium = v1;
  return result;
}

Swift::String *rssiBucket_medium.unsafeMutableAddressor()
{
  if (one-time initialization token for rssiBucket_medium != -1)
    swift_once();
  return &rssiBucket_medium;
}

uint64_t one-time initialization function for rssiBucket_high()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("high", 4uLL, 1);
  result = v1._countAndFlagsBits;
  rssiBucket_high = v1;
  return result;
}

Swift::String *rssiBucket_high.unsafeMutableAddressor()
{
  if (one-time initialization token for rssiBucket_high != -1)
    swift_once();
  return &rssiBucket_high;
}

uint64_t one-time initialization function for kMediaML_trainingRowCount()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("trainingRowCount", 0x10uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_trainingRowCount = v1;
  return result;
}

Swift::String *kMediaML_trainingRowCount.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_trainingRowCount != -1)
    swift_once();
  return &kMediaML_trainingRowCount;
}

uint64_t one-time initialization function for kMediaML_validationRowCount()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("validationRowCount", 0x12uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_validationRowCount = v1;
  return result;
}

Swift::String *kMediaML_validationRowCount.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_validationRowCount != -1)
    swift_once();
  return &kMediaML_validationRowCount;
}

uint64_t one-time initialization function for kMediaML_ssidCount()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ssidCount", 9uLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_ssidCount = v1;
  return result;
}

Swift::String *kMediaML_ssidCount.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_ssidCount != -1)
    swift_once();
  return &kMediaML_ssidCount;
}

uint64_t one-time initialization function for kMediaML_appNameCount()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("appNameCount", 0xCuLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_appNameCount = v1;
  return result;
}

Swift::String *kMediaML_appNameCount.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_appNameCount != -1)
    swift_once();
  return &kMediaML_appNameCount;
}

uint64_t one-time initialization function for kMediaML_sessionIDCount()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("sessionIDCount", 0xEuLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_sessionIDCount = v1;
  return result;
}

Swift::String *kMediaML_sessionIDCount.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_sessionIDCount != -1)
    swift_once();
  return &kMediaML_sessionIDCount;
}

uint64_t one-time initialization function for kMediaML_trainingMAPE()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("trainingMAPE", 0xCuLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_trainingMAPE = v1;
  return result;
}

Swift::String *kMediaML_trainingMAPE.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_trainingMAPE != -1)
    swift_once();
  return &kMediaML_trainingMAPE;
}

uint64_t one-time initialization function for kMediaML_validationMAPE()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("validationMAPE", 0xEuLL, 1);
  result = v1._countAndFlagsBits;
  kMediaML_validationMAPE = v1;
  return result;
}

Swift::String *kMediaML_validationMAPE.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_validationMAPE != -1)
    swift_once();
  return &kMediaML_validationMAPE;
}

uint64_t one-time initialization function for mediaMLBaseDirectory()
{
  uint64_t v1;

  v1 = type metadata accessor for URL();
  __swift_allocate_value_buffer(v1, mediaMLBaseDirectory);
  __swift_project_value_buffer(v1, (uint64_t)mediaMLBaseDirectory);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("/private/var/mobile/Library/MediaML/", 0x24uLL, 1);
  URL.init(fileURLWithPath:)();
  return swift_bridgeObjectRelease();
}

uint64_t mediaMLBaseDirectory.unsafeMutableAddressor()
{
  uint64_t v0;

  if (one-time initialization token for mediaMLBaseDirectory != -1)
    swift_once();
  v0 = type metadata accessor for URL();
  return __swift_project_value_buffer(v0, (uint64_t)mediaMLBaseDirectory);
}

uint64_t one-time initialization function for mediaMLModelDirectory()
{
  uint64_t v1;

  v1 = type metadata accessor for URL();
  __swift_allocate_value_buffer(v1, mediaMLModelDirectory);
  __swift_project_value_buffer(v1, (uint64_t)mediaMLModelDirectory);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("/private/var/mobile/Library/MediaML/model/", 0x2AuLL, 1);
  URL.init(fileURLWithPath:)();
  return swift_bridgeObjectRelease();
}

uint64_t mediaMLModelDirectory.unsafeMutableAddressor()
{
  uint64_t v0;

  if (one-time initialization token for mediaMLModelDirectory != -1)
    swift_once();
  v0 = type metadata accessor for URL();
  return __swift_project_value_buffer(v0, (uint64_t)mediaMLModelDirectory);
}

uint64_t one-time initialization function for mediaMLDataDirectory()
{
  uint64_t v1;

  v1 = type metadata accessor for URL();
  __swift_allocate_value_buffer(v1, mediaMLDataDirectory);
  __swift_project_value_buffer(v1, (uint64_t)mediaMLDataDirectory);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("/private/var/mobile/Library/MediaML/data/", 0x29uLL, 1);
  URL.init(fileURLWithPath:)();
  return swift_bridgeObjectRelease();
}

uint64_t mediaMLDataDirectory.unsafeMutableAddressor()
{
  uint64_t v0;

  if (one-time initialization token for mediaMLDataDirectory != -1)
    swift_once();
  v0 = type metadata accessor for URL();
  return __swift_project_value_buffer(v0, (uint64_t)mediaMLDataDirectory);
}

Swift::Int *MAX_ALLOWED_RAW_DATASIZE.unsafeMutableAddressor()
{
  return &MAX_ALLOWED_RAW_DATASIZE;
}

Swift::Int *MAX_ALLOWED_PROCESSED_DATASIZE.unsafeMutableAddressor()
{
  return &MAX_ALLOWED_PROCESSED_DATASIZE;
}

Swift::Int *MAX_ALLOWED_PROCESSED_DATASIZE_PRUNE.unsafeMutableAddressor()
{
  return &MAX_ALLOWED_PROCESSED_DATASIZE_PRUNE;
}

Swift::Int *MAX_ALLOWED_PROCESSED_DATASIZE_WRITE.unsafeMutableAddressor()
{
  return &MAX_ALLOWED_PROCESSED_DATASIZE_WRITE;
}

Swift::Int *DB_DELETION_BUCKET_SIZE.unsafeMutableAddressor()
{
  return &DB_DELETION_BUCKET_SIZE;
}

Swift::Int *kMediaML_InterfaceType_WiFi.unsafeMutableAddressor()
{
  return &kMediaML_InterfaceType_WiFi;
}

Swift::Int *kMediaML_InterfaceType_Cellular.unsafeMutableAddressor()
{
  return &kMediaML_InterfaceType_Cellular;
}

Swift::Int *maxThroughput.unsafeMutableAddressor()
{
  return &maxThroughput;
}

Swift::Int *minSignalStrength.unsafeMutableAddressor()
{
  return &minSignalStrength;
}

Swift::Int *minNoise.unsafeMutableAddressor()
{
  return &minNoise;
}

Swift::Double *maxTxRate.unsafeMutableAddressor()
{
  return &maxTxRate;
}

Swift::Double *maxRxRate.unsafeMutableAddressor()
{
  return &maxRxRate;
}

Swift::Int *minSSIDLength.unsafeMutableAddressor()
{
  return &minSSIDLength;
}

Swift::Int *maxSSIDLength.unsafeMutableAddressor()
{
  return &maxSSIDLength;
}

Swift::Int *maxBars.unsafeMutableAddressor()
{
  return &maxBars;
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t _convertObjCBoolToBool(_:)()
{
  return MEMORY[0x24BEE5B80]();
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

uint64_t DispatchTime.uptimeNanoseconds.getter()
{
  return MEMORY[0x24BEE5558]();
}

uint64_t static DispatchTime.now()()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t type metadata accessor for DispatchTime()
{
  return MEMORY[0x24BEE5590]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x24BDCF808]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t Dictionary.description.getter()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t Dictionary.subscript.getter()
{
  return MEMORY[0x24BEE04A8]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
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

Swift::String __swiftcall String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(Builtin::RawPointer _builtinStringLiteral, Builtin::Word utf8CodeUnitCount, Builtin::Int1 isASCII)
{
  uint64_t v3;
  void *v4;
  Swift::String result;

  v3 = MEMORY[0x24BEE0AF8](_builtinStringLiteral, utf8CodeUnitCount, isASCII);
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

uint64_t String.count.getter()
{
  return MEMORY[0x24BEE0B68]();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t Sequence.forEach(_:)()
{
  return MEMORY[0x24BEE0EE0]();
}

uint64_t Sequence.contains(where:)()
{
  return MEMORY[0x24BEE0EE8]();
}

uint64_t Sequence<>.starts<A>(with:)()
{
  return MEMORY[0x24BEE0F28]();
}

uint64_t UnsignedInteger<>.init<A>(_:)()
{
  return MEMORY[0x24BEE0F48]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t Double.init<A>(_:)()
{
  return MEMORY[0x24BEE1470]();
}

uint64_t Collection.first.getter()
{
  return MEMORY[0x24BEE1980]();
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

Swift::Void __swiftcall UnsafeMutablePointer.deallocate()()
{
  MEMORY[0x24BEE1BE0]();
}

uint64_t UnsafeMutablePointer.deinitialize(count:)()
{
  return MEMORY[0x24BEE1C00]();
}

uint64_t static UnsafeMutablePointer.allocate(capacity:)()
{
  return MEMORY[0x24BEE1C20]();
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

uint64_t SetAlgebra<>.init(arrayLiteral:)()
{
  return MEMORY[0x24BEE2278]();
}

uint64_t SetAlgebra.isDisjoint(with:)()
{
  return MEMORY[0x24BEE2280]();
}

uint64_t SetAlgebra.isSuperset(of:)()
{
  return MEMORY[0x24BEE2288]();
}

uint64_t SetAlgebra.subtracting(_:)()
{
  return MEMORY[0x24BEE2290]();
}

uint64_t SetAlgebra.isEmpty.getter()
{
  return MEMORY[0x24BEE2298]();
}

uint64_t SetAlgebra.isSubset(of:)()
{
  return MEMORY[0x24BEE22A0]();
}

uint64_t SetAlgebra.subtract(_:)()
{
  return MEMORY[0x24BEE22A8]();
}

uint64_t SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t dispatch thunk of static FixedWidthInteger.bitWidth.getter()
{
  return MEMORY[0x24BEE2D18]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t _allocateUninitializedArray<A>(_:)()
{
  return MEMORY[0x24BEE3A18]();
}

uint64_t == infix<A>(_:_:)()
{
  return MEMORY[0x24BEE3BB8]();
}

uint64_t _convertInOutToPointerArgument<A>(_:)()
{
  return MEMORY[0x24BEE3D30]();
}

uint64_t OptionSet<>.insert(_:)()
{
  return MEMORY[0x24BEE4A20]();
}

uint64_t OptionSet<>.remove(_:)()
{
  return MEMORY[0x24BEE4A28]();
}

uint64_t OptionSet<>.update(with:)()
{
  return MEMORY[0x24BEE4A30]();
}

uint64_t OptionSet<>.contains(_:)()
{
  return MEMORY[0x24BEE4A38]();
}

uint64_t OptionSet.intersection(_:)()
{
  return MEMORY[0x24BEE4A40]();
}

uint64_t OptionSet.symmetricDifference(_:)()
{
  return MEMORY[0x24BEE4A48]();
}

uint64_t OptionSet.union(_:)()
{
  return MEMORY[0x24BEE4A50]();
}

uint64_t OptionSet<>.formIntersection(_:)()
{
  return MEMORY[0x24BEE4A58]();
}

uint64_t OptionSet<>.formSymmetricDifference(_:)()
{
  return MEMORY[0x24BEE4A60]();
}

uint64_t OptionSet<>.formUnion(_:)()
{
  return MEMORY[0x24BEE4A68]();
}

uint64_t OptionSet<>.init()()
{
  return MEMORY[0x24BEE4A70]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializerInFile()
{
  return MEMORY[0x24BEE4B40]();
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

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
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

