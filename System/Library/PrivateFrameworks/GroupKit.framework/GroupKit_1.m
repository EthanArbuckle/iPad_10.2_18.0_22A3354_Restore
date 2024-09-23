uint64_t sub_23D2A2D94()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  outlined consume of Data._Representation(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64));
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in DaemonConnection.send(_:completion:)(uint64_t a1)
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
  uint64_t v11;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = v1[5];
  v9 = v1[6];
  v10 = v1[7];
  v11 = v1[8];
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = partial apply for closure #1 in DaemonConnection.send(_:completion:);
  return closure #1 in DaemonConnection.send(_:completion:)(a1, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t partial apply for closure #1 in DaemonConnection.send(_:completion:)()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t closure #1 in closure #1 in DaemonConnection.send(_:completion:)(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD), uint64_t a3)
{
  Swift::String *v3;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v5;
  Swift::String *v7;
  id v9;
  void *v10;
  char v11;
  void (*v12)(_QWORD, _QWORD, _QWORD);
  uint64_t v13;
  uint64_t v14;

  v14 = a1;
  v12 = a2;
  v13 = a3;
  swift_retain();
  type metadata accessor for GPKError();
  v11 = 12;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any));
  _allocateUninitializedArray<A>(_:)();
  v7 = v3;
  *v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("underlyingError", 0xFuLL, 1);
  swift_getErrorValue();
  v7[2]._object = v10;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(&v7[1]._countAndFlagsBits);
  (*(void (**)(uint64_t *))(*((_QWORD *)v10 - 1) + 16))(boxed_opaque_existential_0);
  _finalizeUninitializedArray<A>(_:)();
  v5 = Dictionary.init(dictionaryLiteral:)();
  v9 = GPKError.__allocating_init(code:userInfo:)(&v11, v5);
  a2(v9, 0, 1);
  outlined consume of Result<Data, Error>(v9, 0, 1);
  return swift_release();
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

void @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSData?, @unowned NSError?) -> () with result type Data(uint64_t a1, id a2, void *a3)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v11;
  _QWORD v12[2];

  v3 = a2;
  v4 = a3;
  v11 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    v7 = a3;
    _resumeUnsafeThrowingContinuationWithError<A>(_:_:)(v11, (uint64_t)a3, MEMORY[0x24BDCDDE8]);
  }
  else
  {
    v5 = a2;
    v12[0] = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v12[1] = v6;
    _resumeUnsafeThrowingContinuation<A>(_:_:)(v11, (uint64_t)v12, MEMORY[0x24BDCDDE8]);

  }
}

uint64_t _resumeUnsafeThrowingContinuationWithError<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD v7[2];

  v7[1] = a3;
  v7[0] = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  return UnsafeContinuation.resume(throwing:)((uint64_t)v7, a1, a3, v3);
}

uint64_t _resumeUnsafeThrowingContinuation<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  return UnsafeContinuation.resume(returning:)(a2, a1, a3);
}

uint64_t _sScTss5Error_pRs_rlE8priority9operationScTyxsAA_pGScPSg_xyYaKYAcntcfC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;

  v7 = type metadata accessor for TaskPriority();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v8 + 48))(a1, 1) == 1)
  {
    outlined destroy of TaskPriority?(a1);
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
  }
  v4 = *(_QWORD *)(a3 + 16);
  swift_unknownObjectRetain();
  if (v4)
  {
    swift_getObjectType();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t protocol witness for MessageTransport.send(_:completion:) in conformance DaemonConnection(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v7 = *a1;
  v6 = a1[1];
  swift_retain();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  DaemonConnection.send(_:completion:)(v7, v6, (void (*)(_QWORD, _QWORD))partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Result<Data, Error>) -> (), v8);
  return swift_release();
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed Result<Data, Error>) -> ()(uint64_t a1, uint64_t a2, char a3, uint64_t (*a4)(_QWORD *))
{
  _QWORD v5[2];
  char v6;

  v5[0] = a1;
  v5[1] = a2;
  v6 = a3 & 1;
  return a4(v5);
}

uint64_t sub_23D2A3524()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Result<Data, Error>) -> ()(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;

  return thunk for @escaping @callee_guaranteed (@in_guaranteed Result<Data, Error>) -> ()(a1, a2, a3 & 1, *(uint64_t (**)(_QWORD *))(v3 + 16));
}

uint64_t DaemonConnection.send(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  id v3;
  id v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  const void *v12;
  Class isa;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  const void *v18;
  Class v19;
  uint64_t v22;
  id v23;
  char v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t (*v28)(uint64_t, void *, void *);
  void *v29;
  uint64_t (*v30)(uint64_t, unint64_t, void *);
  uint64_t v31;
  void *v32;
  id v33;
  char v34;
  void *v35;
  _BYTE v36[32];
  uint64_t aBlock;
  int v38;
  int v39;
  uint64_t (*v40)(uint64_t, void *);
  void *v41;
  uint64_t (*v42)(void *);
  uint64_t v43;
  _BYTE v44[32];
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;

  v48 = 0;
  v46 = 0;
  v45 = 0;
  v33 = 0;
  v32 = 0;
  v49 = a1;
  v50 = a2;
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.groupkit", 0x12uLL, 1);
  String.utf8CString.getter();
  swift_retain();
  swift_release();
  swift_retain();
  swift_bridgeObjectRelease();
  v22 = os_variant_allows_internal_security_policies();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  if ((v22 & 1) != 0)
  {
    v16 = swift_allocObject();
    v46 = v16 + 16;
    *(_QWORD *)(v16 + 16) = 0;
    *(_QWORD *)(v16 + 24) = 0xF000000000000000;
    v17 = swift_allocObject();
    v45 = v17 + 16;
    *(_QWORD *)(v17 + 16) = 0;
    v19 = DaemonConnection.getConnection()();
    swift_retain();
    v42 = partial apply for closure #1 in DaemonConnection.send(_:);
    v43 = v17;
    aBlock = MEMORY[0x24BDAC760];
    v38 = 1107296256;
    v39 = 0;
    v40 = thunk for @escaping @callee_guaranteed (@guaranteed Error) -> ();
    v41 = &block_descriptor_26;
    v18 = _Block_copy(&aBlock);
    swift_release();
    -[objc_class synchronousRemoteObjectProxyWithErrorHandler:](v19, sel_synchronousRemoteObjectProxyWithErrorHandler_, v18);
    _Block_release(v18);

    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    outlined init with copy of Any((uint64_t)v44, (uint64_t)v36);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DaemonServiceProviding);
    if ((swift_dynamicCast() & 1) != 0)
      v15 = v35;
    else
      v15 = 0;
    if (v15)
    {
      v32 = v15;
      swift_getObjectType();
      outlined copy of Data._Representation(a1, a2);
      isa = Data._bridgeToObjectiveC()().super.isa;
      outlined consume of Data._Representation(a1, a2);
      swift_retain();
      swift_retain();
      v2 = swift_allocObject();
      *(_QWORD *)(v2 + 16) = v16;
      *(_QWORD *)(v2 + 24) = v17;
      v30 = partial apply for closure #2 in DaemonConnection.send(_:);
      v31 = v2;
      v25 = MEMORY[0x24BDAC760];
      v26 = 1107296256;
      v27 = 0;
      v28 = thunk for @escaping @callee_guaranteed (@guaranteed Data?, @guaranteed Error?) -> ();
      v29 = &block_descriptor_32;
      v12 = _Block_copy(&v25);
      swift_release();
      objc_msgSend(v15, sel_sendMessageAndWaitForReplyWith_completion_, isa, v12);
      _Block_release(v12);

      swift_beginAccess();
      v14 = *(void **)(v17 + 16);
      v3 = v14;
      swift_endAccess();
      if (v14)
      {
        type metadata accessor for GPKError();
        v4 = v14;
        GPKError.__allocating_init(internalError:)(v14);
        swift_willThrow();

        swift_unknownObjectRelease();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v44);
        swift_release();
        swift_release();
      }
      else
      {
        swift_beginAccess();
        v10 = *(_QWORD *)(v16 + 16);
        v11 = *(_QWORD *)(v16 + 24);
        outlined copy of Data?(v10, v11);
        swift_endAccess();
        if ((v11 & 0xF000000000000000) != 0xF000000000000000)
        {
          swift_unknownObjectRelease();
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v44);
          swift_release();
          swift_release();
          return v10;
        }
        type metadata accessor for InternalError();
        v24 = 0;
        v23 = InternalError.__allocating_init(_:internalInfo:)(&v24, 0);
        type metadata accessor for GPKError();
        v6 = v23;
        GPKError.__allocating_init(internalError:)(v23);
        swift_willThrow();

        swift_unknownObjectRelease();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v44);
        swift_release();
        swift_release();
      }
    }
    else
    {
      type metadata accessor for InternalError();
      v34 = 1;
      v33 = InternalError.__allocating_init(_:internalInfo:)(&v34, 0);
      type metadata accessor for GPKError();
      v7 = v33;
      GPKError.__allocating_init(internalError:)(v33);
      swift_willThrow();

      __swift_destroy_boxed_opaque_existential_0((uint64_t)v44);
      swift_release();
      swift_release();
    }
  }
  else
  {
    type metadata accessor for GPKError();
    v47 = 12;
    v8 = default argument 1 of GPKError.init(code:userInfo:)();
    GPKError.__allocating_init(code:userInfo:)(&v47, v8);
    swift_willThrow();
  }
  return v9;
}

uint64_t sub_23D2A3BE0()
{
  uint64_t v0;
  uint64_t v2;

  if ((*(_QWORD *)(v0 + 24) & 0xF000000000000000) != 0xF000000000000000)
    outlined consume of Data._Representation(*(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
  return swift_deallocObject();
}

uint64_t sub_23D2A3C44()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t closure #1 in DaemonConnection.send(_:)(void *a1, uint64_t a2)
{
  id v2;
  void *v3;

  v2 = a1;
  swift_beginAccess();
  v3 = *(void **)(a2 + 16);
  *(_QWORD *)(a2 + 16) = a1;

  return swift_endAccess();
}

uint64_t partial apply for closure #1 in DaemonConnection.send(_:)(void *a1)
{
  uint64_t v1;

  return closure #1 in DaemonConnection.send(_:)(a1, v1);
}

uint64_t block_copy_helper_24(uint64_t a1, uint64_t a2)
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

uint64_t block_destroy_helper_25()
{
  return swift_release();
}

uint64_t closure #2 in DaemonConnection.send(_:)(uint64_t a1, unint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;

  outlined copy of Data?(a1, a2);
  swift_beginAccess();
  v5 = *(_QWORD *)(a4 + 16);
  v6 = *(_QWORD *)(a4 + 24);
  *(_QWORD *)(a4 + 16) = a1;
  *(_QWORD *)(a4 + 24) = a2;
  outlined consume of Data?(v5, v6);
  swift_endAccess();
  v7 = a3;
  swift_beginAccess();
  v8 = *(void **)(a5 + 16);
  *(_QWORD *)(a5 + 16) = a3;

  return swift_endAccess();
}

uint64_t sub_23D2A3E48()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #2 in DaemonConnection.send(_:)(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v3;

  return closure #2 in DaemonConnection.send(_:)(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24));
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed Data?, @guaranteed Error?) -> ()(uint64_t a1, void *a2, void *a3)
{
  id v3;
  unint64_t v4;
  id v5;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void (*v13)(uint64_t, unint64_t);

  v13 = *(void (**)(uint64_t, unint64_t))(a1 + 32);
  swift_retain();
  v3 = a2;
  if (a2)
  {
    v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v9 = v4;

    v10 = v8;
    v11 = v9;
  }
  else
  {
    v10 = 0;
    v11 = 0xF000000000000000;
  }
  v5 = a3;
  if (a3)
    v7 = a3;
  else
    v7 = 0;
  v13(v10, v11);

  outlined consume of Data?(v10, v11);
  return swift_release();
}

uint64_t block_copy_helper_30(uint64_t a1, uint64_t a2)
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

uint64_t block_destroy_helper_31()
{
  return swift_release();
}

uint64_t protocol witness for SyncMessageTransport.send(_:) in conformance DaemonConnection@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  result = DaemonConnection.send(_:)(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  if (!v2)
  {
    *a2 = result;
    a2[1] = v4;
  }
  return result;
}

uint64_t DaemonConnection.broadcast(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v3;
  Swift::String v4;
  Swift::String v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Swift::String v9;
  void *v10;
  Swift::String v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t ObjectType;
  uint64_t v15;
  os_log_type_t v16;
  Swift::String fileID;
  void *_;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
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

  v35 = 0;
  v36 = a1;
  v37 = a2;
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.groupkit", 0x12uLL, 1);
  String.utf8CString.getter();
  swift_retain();
  swift_release();
  swift_retain();
  swift_bridgeObjectRelease();
  v22 = os_variant_allows_internal_security_policies();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  result = v22;
  if ((v22 & 1) != 0)
  {
    v33 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
    v34 = v3;
    v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("received broadcast from daemon: ", 0x20uLL, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v4);
    swift_bridgeObjectRelease();
    v31 = a1;
    v32 = a2;
    lazy protocol witness table accessor for type Data and conformance Data();
    DefaultStringInterpolation.appendInterpolation<A>(_:)();
    v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(". sending to handler: ", 0x16uLL, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v5);
    v6 = swift_bridgeObjectRelease();
    v29 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v21 + 112))(v6);
    v30 = v7;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DaemonBroadcastHandler?);
    v27 = String.init<A>(describing:)();
    v28 = v8;
    DefaultStringInterpolation.appendInterpolation<A>(_:)();
    outlined destroy of String();
    v9 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    outlined destroy of DefaultStringInterpolation();
    v15 = String.init(stringInterpolation:)();
    _ = v10;
    fileID = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GroupKit/DaemonConnection.swift", 0x1FuLL, 1);
    v16 = default argument 1 of gpklog(_:type:fileID:line:subsystem:)();
    default argument 4 of gpklog(_:type:fileID:line:subsystem:)(&v26);
    v11._countAndFlagsBits = v15;
    v11._object = _;
    v25 = v26 & 1;
    gpklog(_:type:fileID:line:subsystem:)(v11, v16, fileID, 184, (GroupKit::LogSubsystem)&v25);
    swift_bridgeObjectRelease();
    v12 = swift_bridgeObjectRelease();
    v23 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v21 + 112))(v12);
    v24 = v13;
    if (v23)
    {
      swift_unknownObjectRetain();
      outlined destroy of DaemonBroadcastHandler?();
      ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 8))(a1, a2, ObjectType);
      return swift_unknownObjectRelease();
    }
    else
    {
      result = (uint64_t)&v23;
      outlined destroy of DaemonBroadcastHandler?();
    }
  }
  return result;
}

unint64_t base witness table accessor for MessageTransport in DaemonConnection()
{
  return lazy protocol witness table accessor for type DaemonConnection and conformance DaemonConnection();
}

unint64_t lazy protocol witness table accessor for type DaemonConnection and conformance DaemonConnection()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type DaemonConnection and conformance DaemonConnection;
  if (!lazy protocol witness table cache variable for type DaemonConnection and conformance DaemonConnection)
  {
    v0 = type metadata accessor for DaemonConnection();
    v1 = MEMORY[0x2426331CC](&protocol conformance descriptor for DaemonConnection, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type DaemonConnection and conformance DaemonConnection);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type DaemonConnection and conformance DaemonConnection;
  if (!lazy protocol witness table cache variable for type DaemonConnection and conformance DaemonConnection)
  {
    v0 = type metadata accessor for DaemonConnection();
    v1 = MEMORY[0x2426331CC](&protocol conformance descriptor for DaemonConnection, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type DaemonConnection and conformance DaemonConnection);
    return v1;
  }
  return v3;
}

uint64_t method lookup function for DaemonConnection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DaemonConnection.broadcastHandler.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of DaemonConnection.broadcastHandler.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of DaemonConnection.broadcastHandler.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of DaemonConnection.connection.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of DaemonConnection.connection.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of DaemonConnection.connection.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of DaemonConnection.__allocating_init(endpoint:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of DaemonConnection.invalidateConnection()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

id @nonobjc NSLock.init()()
{
  void *v0;

  return objc_msgSend(v0, sel_init);
}

id @nonobjc NSXPCConnection.init(listenerEndpoint:)(void *a1)
{
  void *v1;
  id v4;

  v4 = objc_msgSend(v1, sel_initWithListenerEndpoint_);

  return v4;
}

id @nonobjc NSXPCConnection.init(machServiceName:options:)()
{
  id v1;
  id v2;
  id v3;

  v2 = (id)MEMORY[0x242632560]();
  v3 = objc_msgSend(v1, sel_initWithMachServiceName_options_);

  swift_bridgeObjectRelease();
  return v3;
}

uint64_t protocol witness for SetAlgebra.init() in conformance NSXPCConnectionOptions()
{
  lazy protocol witness table accessor for type NSXPCConnectionOptions and conformance NSXPCConnectionOptions();
  lazy protocol witness table accessor for type UInt and conformance UInt();
  return OptionSet<>.init()();
}

uint64_t protocol witness for SetAlgebra.contains(_:) in conformance NSXPCConnectionOptions()
{
  lazy protocol witness table accessor for type NSXPCConnectionOptions and conformance NSXPCConnectionOptions();
  return OptionSet<>.contains(_:)() & 1;
}

uint64_t protocol witness for SetAlgebra.union(_:) in conformance NSXPCConnectionOptions()
{
  lazy protocol witness table accessor for type NSXPCConnectionOptions and conformance NSXPCConnectionOptions();
  return OptionSet.union(_:)();
}

uint64_t protocol witness for SetAlgebra.intersection(_:) in conformance NSXPCConnectionOptions()
{
  lazy protocol witness table accessor for type NSXPCConnectionOptions and conformance NSXPCConnectionOptions();
  return OptionSet.intersection(_:)();
}

uint64_t protocol witness for SetAlgebra.symmetricDifference(_:) in conformance NSXPCConnectionOptions()
{
  lazy protocol witness table accessor for type NSXPCConnectionOptions and conformance NSXPCConnectionOptions();
  return OptionSet.symmetricDifference(_:)();
}

uint64_t protocol witness for SetAlgebra.insert(_:) in conformance NSXPCConnectionOptions()
{
  lazy protocol witness table accessor for type NSXPCConnectionOptions and conformance NSXPCConnectionOptions();
  return OptionSet<>.insert(_:)() & 1;
}

uint64_t protocol witness for SetAlgebra.remove(_:) in conformance NSXPCConnectionOptions()
{
  lazy protocol witness table accessor for type NSXPCConnectionOptions and conformance NSXPCConnectionOptions();
  return OptionSet<>.remove(_:)();
}

uint64_t protocol witness for SetAlgebra.update(with:) in conformance NSXPCConnectionOptions()
{
  lazy protocol witness table accessor for type NSXPCConnectionOptions and conformance NSXPCConnectionOptions();
  return OptionSet<>.update(with:)();
}

uint64_t protocol witness for SetAlgebra.formUnion(_:) in conformance NSXPCConnectionOptions()
{
  lazy protocol witness table accessor for type NSXPCConnectionOptions and conformance NSXPCConnectionOptions();
  lazy protocol witness table accessor for type UInt and conformance UInt();
  return OptionSet<>.formUnion(_:)();
}

uint64_t protocol witness for SetAlgebra.formIntersection(_:) in conformance NSXPCConnectionOptions()
{
  lazy protocol witness table accessor for type NSXPCConnectionOptions and conformance NSXPCConnectionOptions();
  lazy protocol witness table accessor for type UInt and conformance UInt();
  return OptionSet<>.formIntersection(_:)();
}

uint64_t protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance NSXPCConnectionOptions()
{
  lazy protocol witness table accessor for type NSXPCConnectionOptions and conformance NSXPCConnectionOptions();
  lazy protocol witness table accessor for type UInt and conformance UInt();
  return OptionSet<>.formSymmetricDifference(_:)();
}

uint64_t protocol witness for SetAlgebra.subtracting(_:) in conformance NSXPCConnectionOptions()
{
  return SetAlgebra.subtracting(_:)();
}

uint64_t protocol witness for SetAlgebra.isSubset(of:) in conformance NSXPCConnectionOptions()
{
  return SetAlgebra.isSubset(of:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isDisjoint(with:) in conformance NSXPCConnectionOptions()
{
  return SetAlgebra.isDisjoint(with:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isSuperset(of:) in conformance NSXPCConnectionOptions()
{
  return SetAlgebra.isSuperset(of:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isEmpty.getter in conformance NSXPCConnectionOptions()
{
  return SetAlgebra.isEmpty.getter() & 1;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance NSXPCConnectionOptions()
{
  return SetAlgebra.init<A>(_:)();
}

uint64_t protocol witness for SetAlgebra.subtract(_:) in conformance NSXPCConnectionOptions()
{
  return SetAlgebra.subtract(_:)();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance NSXPCConnectionOptions()
{
  lazy protocol witness table accessor for type NSXPCConnectionOptions and conformance NSXPCConnectionOptions();
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance NSXPCConnectionOptions()
{
  lazy protocol witness table accessor for type NSXPCConnectionOptions and conformance NSXPCConnectionOptions();
  return SetAlgebra<>.init(arrayLiteral:)();
}

NSXPCConnectionOptions protocol witness for OptionSet.init(rawValue:) in conformance NSXPCConnectionOptions@<X0>(Swift::UInt *a1@<X0>, NSXPCConnectionOptions *a2@<X8>)
{
  NSXPCConnectionOptions result;

  result = NSXPCConnectionOptions.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

NSXPCConnectionOptions protocol witness for RawRepresentable.init(rawValue:) in conformance NSXPCConnectionOptions@<X0>(Swift::UInt *a1@<X0>, uint64_t a2@<X8>)
{
  NSXPCConnectionOptions result;

  result = NSXPCConnectionOptions.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance NSXPCConnectionOptions@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  result = NSXPCConnectionOptions.rawValue.getter(*v1);
  *a1 = result;
  return result;
}

unint64_t base witness table accessor for RawRepresentable in NSXPCConnectionOptions()
{
  return lazy protocol witness table accessor for type NSXPCConnectionOptions and conformance NSXPCConnectionOptions();
}

unint64_t base witness table accessor for SetAlgebra in NSXPCConnectionOptions()
{
  return lazy protocol witness table accessor for type NSXPCConnectionOptions and conformance NSXPCConnectionOptions();
}

unint64_t base witness table accessor for Equatable in NSXPCConnectionOptions()
{
  return lazy protocol witness table accessor for type NSXPCConnectionOptions and conformance NSXPCConnectionOptions();
}

unint64_t base witness table accessor for ExpressibleByArrayLiteral in NSXPCConnectionOptions()
{
  return lazy protocol witness table accessor for type NSXPCConnectionOptions and conformance NSXPCConnectionOptions();
}

unint64_t lazy protocol witness table accessor for type UInt and conformance UInt()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type UInt and conformance UInt;
  if (!lazy protocol witness table cache variable for type UInt and conformance UInt)
  {
    v0 = MEMORY[0x2426331CC](MEMORY[0x24BEE1EC8], MEMORY[0x24BEE1E88]);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type UInt and conformance UInt);
    return v0;
  }
  return v2;
}

_QWORD *outlined init with copy of NSXPCConnection?(id *a1, _QWORD *a2)
{
  id v2;
  _QWORD *result;
  id v4;

  v4 = *a1;
  v2 = *a1;
  result = a2;
  *a2 = v4;
  return result;
}

_QWORD *outlined init with copy of DaemonBroadcastHandler?(uint64_t *a1, _QWORD *a2)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v6;

  v6 = *a1;
  swift_unknownObjectRetain();
  result = a2;
  v3 = a1[1];
  *a2 = v6;
  a2[1] = v3;
  return result;
}

uint64_t sub_23D2A4E80()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in DaemonConnection.send(_:completion:)(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in closure #1 in DaemonConnection.send(_:completion:)(a1, *(void (**)(_QWORD, _QWORD, _QWORD))(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t block_copy_helper_36(uint64_t a1, uint64_t a2)
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

uint64_t block_destroy_helper_37()
{
  return swift_release();
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

uint64_t UnsafeContinuation.resume(returning:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(*(_QWORD *)(*(_QWORD *)(a2 + 64) + 40), a1);
  return swift_continuation_throwingResume();
}

uint64_t UnsafeContinuation.resume(throwing:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  swift_allocError();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(v4, a1);
  return swift_continuation_throwingResumeWithError();
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *result)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t *v3;

  v3 = result;
  if ((*(_DWORD *)(*(_QWORD *)(result[3] - 8) + 80) & 0x20000) != 0)
  {
    v1 = swift_allocBox();
    result = v2;
    *v3 = v1;
  }
  return result;
}

uint64_t sub_23D2A5134()
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

char **StaticString.checkRegistration.unsafeMutableAddressor()
{
  return &static StaticString.checkRegistration;
}

const char *static StaticString.checkRegistration.getter()
{
  return "GroupKit/checkRegistration";
}

char **StaticString.keyRegistration.unsafeMutableAddressor()
{
  return &static StaticString.keyRegistration;
}

const char *static StaticString.keyRegistration.getter()
{
  return "GroupKit/keyRegistration";
}

char **StaticString.acceptInvitation.unsafeMutableAddressor()
{
  return &static StaticString.acceptInvitation;
}

const char *static StaticString.acceptInvitation.getter()
{
  return "GroupKit/acceptInvitation";
}

char **StaticString.declineInvitation.unsafeMutableAddressor()
{
  return &static StaticString.declineInvitation;
}

const char *static StaticString.declineInvitation.getter()
{
  return "GroupKit/declineInvitation";
}

char **StaticString.deleteInvitation.unsafeMutableAddressor()
{
  return &static StaticString.deleteInvitation;
}

const char *static StaticString.deleteInvitation.getter()
{
  return "GroupKit/deleteInvitation";
}

char **StaticString.fetchGroupByID.unsafeMutableAddressor()
{
  return &static StaticString.fetchGroupByID;
}

const char *static StaticString.fetchGroupByID.getter()
{
  return "GroupKit/fetchGroupByID";
}

char **StaticString.fetchGroups.unsafeMutableAddressor()
{
  return &static StaticString.fetchGroups;
}

const char *static StaticString.fetchGroups.getter()
{
  return "GroupKit/fetchGroups";
}

char **StaticString.createGroup.unsafeMutableAddressor()
{
  return &static StaticString.createGroup;
}

const char *static StaticString.createGroup.getter()
{
  return "GroupKit/createGroup";
}

char **StaticString.updateGroup.unsafeMutableAddressor()
{
  return &static StaticString.updateGroup;
}

const char *static StaticString.updateGroup.getter()
{
  return "GroupKit/updateGroup";
}

char **StaticString.demoteGroup.unsafeMutableAddressor()
{
  return &static StaticString.demoteGroup;
}

const char *static StaticString.demoteGroup.getter()
{
  return "GroupKit/demoteGroup";
}

char **StaticString.leaveGroup.unsafeMutableAddressor()
{
  return &static StaticString.leaveGroup;
}

const char *static StaticString.leaveGroup.getter()
{
  return "GroupKit/leaveGroup";
}

char **StaticString.destroyGroup.unsafeMutableAddressor()
{
  return &static StaticString.destroyGroup;
}

const char *static StaticString.destroyGroup.getter()
{
  return "GroupKit/destroyGroup";
}

char **StaticString.deleteGroup.unsafeMutableAddressor()
{
  return &static StaticString.deleteGroup;
}

const char *static StaticString.deleteGroup.getter()
{
  return "GroupKit/deleteGroup";
}

char **StaticString.refreshGroup.unsafeMutableAddressor()
{
  return &static StaticString.refreshGroup;
}

const char *static StaticString.refreshGroup.getter()
{
  return "GroupKit/refreshGroup";
}

char **StaticString.encrypt.unsafeMutableAddressor()
{
  return &static StaticString.encrypt;
}

const char *static StaticString.encrypt.getter()
{
  return "GroupKit/encrypt";
}

char **StaticString.decrypt.unsafeMutableAddressor()
{
  return &static StaticString.decrypt;
}

const char *static StaticString.decrypt.getter()
{
  return "GroupKit/decrypt";
}

char **StaticString.fetchProfile.unsafeMutableAddressor()
{
  return &static StaticString.fetchProfile;
}

const char *static StaticString.fetchProfile.getter()
{
  return "GroupKit/fetchProfile";
}

char **StaticString.fetchUsers.unsafeMutableAddressor()
{
  return &static StaticString.fetchUsers;
}

const char *static StaticString.fetchUsers.getter()
{
  return "GroupKit/fetchUsers";
}

char **StaticString.signout.unsafeMutableAddressor()
{
  return &static StaticString.signout;
}

const char *static StaticString.signout.getter()
{
  return "GroupKit/signout";
}

char **StaticString.deleteContent.unsafeMutableAddressor()
{
  return &static StaticString.deleteContent;
}

const char *static StaticString.deleteContent.getter()
{
  return "GroupKit/deleteContent";
}

char **StaticString.fetchGroupKey.unsafeMutableAddressor()
{
  return &static StaticString.fetchGroupKey;
}

const char *static StaticString.fetchGroupKey.getter()
{
  return "GroupKit/fetchGroupKey";
}

char **StaticString.fetchMemberStableKey.unsafeMutableAddressor()
{
  return &static StaticString.fetchMemberStableKey;
}

const char *static StaticString.fetchMemberStableKey.getter()
{
  return "GroupKit/fetchMemberStableKey";
}

char **StaticString.distributedNotification.unsafeMutableAddressor()
{
  return &static StaticString.distributedNotification;
}

const char *static StaticString.distributedNotification.getter()
{
  return "GroupKit/distributedNotification";
}

char **StaticString.healthCheck.unsafeMutableAddressor()
{
  return &static StaticString.healthCheck;
}

const char *static StaticString.healthCheck.getter()
{
  return "GroupKit/healthCheck";
}

char **StaticString.logMetrics.unsafeMutableAddressor()
{
  return &static StaticString.logMetrics;
}

const char *static StaticString.logMetrics.getter()
{
  return "GroupKit/logMetrics";
}

char **StaticString.begin.unsafeMutableAddressor()
{
  return &static StaticString.begin;
}

const char *static StaticString.begin.getter()
{
  return " 🏁 [BEGIN]";
}

char **StaticString.endWithError.unsafeMutableAddressor()
{
  return &static StaticString.endWithError;
}

const char *static StaticString.endWithError.getter()
{
  return "❌ [END] - %@";
}

char **StaticString.endWithSuccess.unsafeMutableAddressor()
{
  return &static StaticString.endWithSuccess;
}

const char *static StaticString.endWithSuccess.getter()
{
  return "✅ [END]";
}

uint64_t signpost<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v7 + 160) = a7;
  *(_QWORD *)(v7 + 152) = a6;
  *(_QWORD *)(v7 + 144) = a5;
  *(_BYTE *)(v7 + 57) = a4;
  *(_QWORD *)(v7 + 136) = a3;
  *(_QWORD *)(v7 + 128) = a2;
  *(_QWORD *)(v7 + 120) = a1;
  *(_QWORD *)(v7 + 80) = v7;
  *(_QWORD *)(v7 + 40) = 0;
  *(_QWORD *)(v7 + 48) = 0;
  *(_BYTE *)(v7 + 56) = 0;
  *(_QWORD *)(v7 + 64) = 0;
  *(_QWORD *)(v7 + 72) = 0;
  *(_QWORD *)(v7 + 88) = 0;
  *(_QWORD *)(v7 + 96) = 0;
  *(_QWORD *)(v7 + 104) = 0;
  *(_QWORD *)(v7 + 168) = *(_QWORD *)(a7 - 8);
  *(_QWORD *)(v7 + 176) = swift_task_alloc();
  v8 = type metadata accessor for OSSignpostID();
  *(_QWORD *)(v7 + 184) = v8;
  *(_QWORD *)(v7 + 192) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v7 + 200) = swift_task_alloc();
  *(_QWORD *)(v7 + 40) = a2;
  *(_QWORD *)(v7 + 48) = a3;
  *(_BYTE *)(v7 + 56) = a4;
  *(_QWORD *)(v7 + 64) = a5;
  *(_QWORD *)(v7 + 72) = a6;
  return swift_task_switch();
}

uint64_t signpost<A>(_:_:)()
{
  _QWORD *v0;
  uint64_t v1;
  id v2;
  _QWORD *v3;
  void *v5;
  int *v6;
  _QWORD *v7;
  uint64_t (*v8)(_QWORD);

  v6 = (int *)v0[18];
  v0[10] = v0;
  type metadata accessor for OSTransaction();
  v1 = OSTransaction.__allocating_init(name:)();
  v0[26] = v1;
  v0[11] = v1;
  type metadata accessor for OS_os_log();
  LogSubsystem.rawValue.getter();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SignPost", 8uLL, 1);
  v5 = (void *)OS_os_log.init(subsystem:category:)();
  v0[27] = v5;
  v0[12] = v5;
  v2 = v5;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  v0[28] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CVarArg);
  _allocateUninitializedArray<A>(_:)();
  os_signpost(_:dso:log:name:signpostID:_:_:)();
  swift_bridgeObjectRelease();
  v8 = (uint64_t (*)(_QWORD))((char *)v6 + *v6);
  v3 = (_QWORD *)swift_task_alloc();
  v7[29] = v3;
  *v3 = v7[10];
  v3[1] = signpost<A>(_:_:);
  return v8(v7[22]);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 80) = *v1;
  *(_QWORD *)(v2 + 240) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  _QWORD *v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v7 = (void *)v0[27];
  v8 = v0[25];
  v5 = v0[24];
  v6 = v0[23];
  v9 = v0[22];
  v3 = v0[21];
  v4 = v0[20];
  v2 = v0[15];
  v0[10] = v0;
  static os_signpost_type_t.end.getter();
  _allocateUninitializedArray<A>(_:)();
  os_signpost(_:dso:log:name:signpostID:_:_:)();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v9, v4);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v9, v4);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v8, v6);

  $defer #1 <A>() in signpost<A>(_:_:)();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[10] + 8))();
}

{
  _QWORD *v0;
  id v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v8 = (void *)v0[30];
  v11 = (void *)v0[27];
  v12 = v0[25];
  v9 = v0[24];
  v10 = v0[23];
  v0[10] = v0;
  v1 = v8;
  v0[13] = v8;
  static os_signpost_type_t.end.getter();
  _allocateUninitializedArray<A>(_:)();
  v7 = v2;
  swift_getErrorValue();
  v5 = Error.localizedDescription.getter();
  v6 = v3;
  v7[3] = MEMORY[0x24BEE0D00];
  v7[4] = lazy protocol witness table accessor for type String and conformance String();
  *v7 = v5;
  v7[1] = v6;
  _finalizeUninitializedArray<A>(_:)();
  os_signpost(_:dso:log:name:signpostID:_:_:)();
  swift_bridgeObjectRelease();
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v12, v10);
  $defer #1 <A>() in signpost<A>(_:_:)();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v13 + 80) + 8))();
}

unint64_t type metadata accessor for OS_os_log()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = lazy cache variable for type metadata for OS_os_log;
  if (!lazy cache variable for type metadata for OS_os_log)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for OS_os_log);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t $defer #1 <A>() in signpost<A>(_:_:)()
{
  return MEMORY[0x24263226C]();
}

BOOL static GPKRSVPRequest.RSVP.== infix(_:_:)(_BYTE *a1, _BYTE *a2)
{
  return ((*a1 & 1) != 0) == (unint64_t)((*a2 & 1) != 0);
}

uint64_t GPKRSVPRequest.RSVP.hash(into:)()
{
  return Hasher.combine<A>(_:)();
}

uint64_t GPKRSVPRequest.RSVP.AcceptCodingKeys.init(stringValue:)()
{
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t GPKRSVPRequest.RSVP.AcceptCodingKeys.init(intValue:)()
{
  return 1;
}

uint64_t GPKRSVPRequest.RSVP.AcceptCodingKeys.intValue.getter()
{
  return 0;
}

uint64_t GPKRSVPRequest.RSVP.AcceptCodingKeys.stringValue.getter()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1)._countAndFlagsBits;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GPKRSVPRequest.RSVP.AcceptCodingKeys()
{
  return GPKRSVPRequest.RSVP.AcceptCodingKeys.stringValue.getter();
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GPKRSVPRequest.RSVP.AcceptCodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = GPKRSVPRequest.RSVP.AcceptCodingKeys.init(stringValue:)();
  *a1 = result & 1;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance GPKRSVPRequest.RSVP.AcceptCodingKeys()
{
  return GPKRSVPRequest.RSVP.AcceptCodingKeys.intValue.getter();
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance GPKRSVPRequest.RSVP.AcceptCodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = GPKRSVPRequest.RSVP.AcceptCodingKeys.init(intValue:)();
  *a1 = result & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GPKRSVPRequest.RSVP.AcceptCodingKeys()
{
  lazy protocol witness table accessor for type GPKRSVPRequest.RSVP.AcceptCodingKeys and conformance GPKRSVPRequest.RSVP.AcceptCodingKeys();
  return CodingKey.description.getter();
}

unint64_t lazy protocol witness table accessor for type GPKRSVPRequest.RSVP.AcceptCodingKeys and conformance GPKRSVPRequest.RSVP.AcceptCodingKeys()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.AcceptCodingKeys and conformance GPKRSVPRequest.RSVP.AcceptCodingKeys;
  if (!lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.AcceptCodingKeys and conformance GPKRSVPRequest.RSVP.AcceptCodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKRSVPRequest.RSVP.AcceptCodingKeys, &type metadata for GPKRSVPRequest.RSVP.AcceptCodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.AcceptCodingKeys and conformance GPKRSVPRequest.RSVP.AcceptCodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.AcceptCodingKeys and conformance GPKRSVPRequest.RSVP.AcceptCodingKeys;
  if (!lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.AcceptCodingKeys and conformance GPKRSVPRequest.RSVP.AcceptCodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKRSVPRequest.RSVP.AcceptCodingKeys, &type metadata for GPKRSVPRequest.RSVP.AcceptCodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.AcceptCodingKeys and conformance GPKRSVPRequest.RSVP.AcceptCodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.AcceptCodingKeys and conformance GPKRSVPRequest.RSVP.AcceptCodingKeys;
  if (!lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.AcceptCodingKeys and conformance GPKRSVPRequest.RSVP.AcceptCodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKRSVPRequest.RSVP.AcceptCodingKeys, &type metadata for GPKRSVPRequest.RSVP.AcceptCodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.AcceptCodingKeys and conformance GPKRSVPRequest.RSVP.AcceptCodingKeys);
    return v0;
  }
  return v2;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GPKRSVPRequest.RSVP.AcceptCodingKeys()
{
  lazy protocol witness table accessor for type GPKRSVPRequest.RSVP.AcceptCodingKeys and conformance GPKRSVPRequest.RSVP.AcceptCodingKeys();
  return CodingKey.debugDescription.getter();
}

BOOL static GPKRSVPRequest.RSVP.CodingKeys.== infix(_:_:)(char a1, char a2)
{
  return ((a1 & 1) != 0) == (unint64_t)((a2 & 1) != 0);
}

uint64_t GPKRSVPRequest.RSVP.CodingKeys.hash(into:)()
{
  return Hasher.combine<A>(_:)();
}

uint64_t GPKRSVPRequest.RSVP.CodingKeys.init(stringValue:)()
{
  char v2;
  char v3;
  char v4;

  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("accept", 6uLL, 1);
  swift_bridgeObjectRetain();
  v3 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v3 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
LABEL_6:
    swift_bridgeObjectRelease();
    return v4 & 1;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("decline", 7uLL, 1);
  swift_bridgeObjectRetain();
  v2 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v4 = 1;
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 2;
}

uint64_t GPKRSVPRequest.RSVP.CodingKeys.init(intValue:)()
{
  return 2;
}

uint64_t GPKRSVPRequest.RSVP.CodingKeys.hashValue.getter()
{
  lazy protocol witness table accessor for type GPKRSVPRequest.RSVP.CodingKeys and conformance GPKRSVPRequest.RSVP.CodingKeys();
  return _hashValue<A>(for:)();
}

unint64_t lazy protocol witness table accessor for type GPKRSVPRequest.RSVP.CodingKeys and conformance GPKRSVPRequest.RSVP.CodingKeys()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.CodingKeys and conformance GPKRSVPRequest.RSVP.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.CodingKeys and conformance GPKRSVPRequest.RSVP.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKRSVPRequest.RSVP.CodingKeys, &type metadata for GPKRSVPRequest.RSVP.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.CodingKeys and conformance GPKRSVPRequest.RSVP.CodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.CodingKeys and conformance GPKRSVPRequest.RSVP.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.CodingKeys and conformance GPKRSVPRequest.RSVP.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKRSVPRequest.RSVP.CodingKeys, &type metadata for GPKRSVPRequest.RSVP.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.CodingKeys and conformance GPKRSVPRequest.RSVP.CodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.CodingKeys and conformance GPKRSVPRequest.RSVP.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.CodingKeys and conformance GPKRSVPRequest.RSVP.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKRSVPRequest.RSVP.CodingKeys, &type metadata for GPKRSVPRequest.RSVP.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.CodingKeys and conformance GPKRSVPRequest.RSVP.CodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.CodingKeys and conformance GPKRSVPRequest.RSVP.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.CodingKeys and conformance GPKRSVPRequest.RSVP.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKRSVPRequest.RSVP.CodingKeys, &type metadata for GPKRSVPRequest.RSVP.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.CodingKeys and conformance GPKRSVPRequest.RSVP.CodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.CodingKeys and conformance GPKRSVPRequest.RSVP.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.CodingKeys and conformance GPKRSVPRequest.RSVP.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKRSVPRequest.RSVP.CodingKeys, &type metadata for GPKRSVPRequest.RSVP.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.CodingKeys and conformance GPKRSVPRequest.RSVP.CodingKeys);
    return v0;
  }
  return v2;
}

uint64_t GPKRSVPRequest.RSVP.CodingKeys.intValue.getter()
{
  return 0;
}

uint64_t GPKRSVPRequest.RSVP.CodingKeys.stringValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("decline", 7uLL, 1)._countAndFlagsBits;
  else
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("accept", 6uLL, 1)._countAndFlagsBits;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance GPKRSVPRequest.RSVP.CodingKeys(_BYTE *a1, _BYTE *a2)
{
  return static GPKRSVPRequest.RSVP.CodingKeys.== infix(_:_:)(*a1 & 1, *a2 & 1);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance GPKRSVPRequest.RSVP.CodingKeys()
{
  return GPKRSVPRequest.RSVP.CodingKeys.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GPKRSVPRequest.RSVP.CodingKeys()
{
  return GPKRSVPRequest.RSVP.CodingKeys.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GPKRSVPRequest.RSVP.CodingKeys(Swift::Int a1)
{
  return Hashable._rawHashValue(seed:)(a1);
}

uint64_t GPKRSVPRequest.RSVP.DeclineCodingKeys.init(stringValue:)()
{
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t GPKRSVPRequest.RSVP.DeclineCodingKeys.init(intValue:)()
{
  return 1;
}

uint64_t GPKRSVPRequest.RSVP.DeclineCodingKeys.intValue.getter()
{
  return 0;
}

uint64_t GPKRSVPRequest.RSVP.DeclineCodingKeys.stringValue.getter()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1)._countAndFlagsBits;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GPKRSVPRequest.RSVP.CodingKeys()
{
  _BYTE *v0;

  return GPKRSVPRequest.RSVP.CodingKeys.stringValue.getter(*v0 & 1);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GPKRSVPRequest.RSVP.CodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = GPKRSVPRequest.RSVP.CodingKeys.init(stringValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance GPKRSVPRequest.RSVP.CodingKeys()
{
  return GPKRSVPRequest.RSVP.CodingKeys.intValue.getter();
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance GPKRSVPRequest.RSVP.CodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = GPKRSVPRequest.RSVP.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GPKRSVPRequest.RSVP.CodingKeys()
{
  lazy protocol witness table accessor for type GPKRSVPRequest.RSVP.CodingKeys and conformance GPKRSVPRequest.RSVP.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GPKRSVPRequest.RSVP.CodingKeys()
{
  lazy protocol witness table accessor for type GPKRSVPRequest.RSVP.CodingKeys and conformance GPKRSVPRequest.RSVP.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GPKRSVPRequest.RSVP.DeclineCodingKeys()
{
  return GPKRSVPRequest.RSVP.DeclineCodingKeys.stringValue.getter();
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GPKRSVPRequest.RSVP.DeclineCodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = GPKRSVPRequest.RSVP.DeclineCodingKeys.init(stringValue:)();
  *a1 = result & 1;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance GPKRSVPRequest.RSVP.DeclineCodingKeys()
{
  return GPKRSVPRequest.RSVP.DeclineCodingKeys.intValue.getter();
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance GPKRSVPRequest.RSVP.DeclineCodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = GPKRSVPRequest.RSVP.DeclineCodingKeys.init(intValue:)();
  *a1 = result & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GPKRSVPRequest.RSVP.DeclineCodingKeys()
{
  lazy protocol witness table accessor for type GPKRSVPRequest.RSVP.DeclineCodingKeys and conformance GPKRSVPRequest.RSVP.DeclineCodingKeys();
  return CodingKey.description.getter();
}

unint64_t lazy protocol witness table accessor for type GPKRSVPRequest.RSVP.DeclineCodingKeys and conformance GPKRSVPRequest.RSVP.DeclineCodingKeys()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.DeclineCodingKeys and conformance GPKRSVPRequest.RSVP.DeclineCodingKeys;
  if (!lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.DeclineCodingKeys and conformance GPKRSVPRequest.RSVP.DeclineCodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKRSVPRequest.RSVP.DeclineCodingKeys, &type metadata for GPKRSVPRequest.RSVP.DeclineCodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.DeclineCodingKeys and conformance GPKRSVPRequest.RSVP.DeclineCodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.DeclineCodingKeys and conformance GPKRSVPRequest.RSVP.DeclineCodingKeys;
  if (!lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.DeclineCodingKeys and conformance GPKRSVPRequest.RSVP.DeclineCodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKRSVPRequest.RSVP.DeclineCodingKeys, &type metadata for GPKRSVPRequest.RSVP.DeclineCodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.DeclineCodingKeys and conformance GPKRSVPRequest.RSVP.DeclineCodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.DeclineCodingKeys and conformance GPKRSVPRequest.RSVP.DeclineCodingKeys;
  if (!lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.DeclineCodingKeys and conformance GPKRSVPRequest.RSVP.DeclineCodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKRSVPRequest.RSVP.DeclineCodingKeys, &type metadata for GPKRSVPRequest.RSVP.DeclineCodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP.DeclineCodingKeys and conformance GPKRSVPRequest.RSVP.DeclineCodingKeys);
    return v0;
  }
  return v2;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GPKRSVPRequest.RSVP.DeclineCodingKeys()
{
  lazy protocol witness table accessor for type GPKRSVPRequest.RSVP.DeclineCodingKeys and conformance GPKRSVPRequest.RSVP.DeclineCodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t GPKRSVPRequest.RSVP.encode(to:)(uint64_t a1)
{
  unsigned __int8 *v1;
  _QWORD *v2;
  _QWORD v4[3];
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  char v21;
  char v22;
  char v23;
  _QWORD *v24;

  v13 = a1;
  v24 = 0;
  v23 = 0;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GPKRSVPRequest.RSVP.DeclineCodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v4 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GPKRSVPRequest.RSVP.AcceptCodingKeys>);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v4 - v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GPKRSVPRequest.RSVP.CodingKeys>);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = (*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = (_QWORD *)MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v4 - v16;
  v24 = v2;
  v20 = *v1;
  v23 = v20 & 1;
  v18 = v2[3];
  v19 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v18);
  lazy protocol witness table accessor for type GPKRSVPRequest.RSVP.CodingKeys and conformance GPKRSVPRequest.RSVP.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  if ((v20 & 1) != 0)
  {
    v4[1] = &v22;
    v22 = 1;
    lazy protocol witness table accessor for type GPKRSVPRequest.RSVP.DeclineCodingKeys and conformance GPKRSVPRequest.RSVP.DeclineCodingKeys();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  else
  {
    v4[2] = &v21;
    v21 = 0;
    lazy protocol witness table accessor for type GPKRSVPRequest.RSVP.AcceptCodingKeys and conformance GPKRSVPRequest.RSVP.AcceptCodingKeys();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

uint64_t GPKRSVPRequest.RSVP.hashValue.getter()
{
  lazy protocol witness table accessor for type GPKRSVPRequest.RSVP and conformance GPKRSVPRequest.RSVP();
  return _hashValue<A>(for:)();
}

unint64_t lazy protocol witness table accessor for type GPKRSVPRequest.RSVP and conformance GPKRSVPRequest.RSVP()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP and conformance GPKRSVPRequest.RSVP;
  if (!lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP and conformance GPKRSVPRequest.RSVP)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKRSVPRequest.RSVP, &type metadata for GPKRSVPRequest.RSVP);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP and conformance GPKRSVPRequest.RSVP);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP and conformance GPKRSVPRequest.RSVP;
  if (!lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP and conformance GPKRSVPRequest.RSVP)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKRSVPRequest.RSVP, &type metadata for GPKRSVPRequest.RSVP);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP and conformance GPKRSVPRequest.RSVP);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP and conformance GPKRSVPRequest.RSVP;
  if (!lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP and conformance GPKRSVPRequest.RSVP)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKRSVPRequest.RSVP, &type metadata for GPKRSVPRequest.RSVP);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP and conformance GPKRSVPRequest.RSVP);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP and conformance GPKRSVPRequest.RSVP;
  if (!lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP and conformance GPKRSVPRequest.RSVP)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKRSVPRequest.RSVP, &type metadata for GPKRSVPRequest.RSVP);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKRSVPRequest.RSVP and conformance GPKRSVPRequest.RSVP);
    return v0;
  }
  return v2;
}

uint64_t GPKRSVPRequest.RSVP.init(from:)@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v12;
  uint64_t v13;
  _QWORD v14[2];
  uint64_t v15;
  uint64_t v16;
  int v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t countAndFlagsBits;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  int v40;
  int v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  unint64_t v45;
  int v46;
  _BYTE *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  char v67;
  _QWORD v68[4];
  unsigned __int8 v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  char v76;

  v47 = a2;
  v56 = a1;
  v75 = 0;
  v48 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GPKRSVPRequest.RSVP.DeclineCodingKeys>);
  v49 = *(_QWORD *)(v48 - 8);
  v50 = (*(_QWORD *)(v49 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v48);
  v51 = (char *)v14 - v50;
  v52 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GPKRSVPRequest.RSVP.AcceptCodingKeys>);
  v53 = *(_QWORD *)(v52 - 8);
  v54 = (*(_QWORD *)(v53 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v52);
  v55 = (char *)v14 - v54;
  v57 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GPKRSVPRequest.RSVP.CodingKeys>);
  v58 = *(_QWORD *)(v57 - 8);
  v59 = (*(_QWORD *)(v58 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = (_QWORD *)MEMORY[0x24BDAC7A8](v56);
  v60 = (char *)v14 - v59;
  v75 = v2;
  v62 = v2[3];
  v63 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v62);
  lazy protocol witness table accessor for type GPKRSVPRequest.RSVP.CodingKeys and conformance GPKRSVPRequest.RSVP.CodingKeys();
  v3 = v61;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  v64 = v3;
  v65 = v3;
  if (v3)
  {
    v25 = v65;
  }
  else
  {
    v4 = KeyedDecodingContainer.allKeys.getter();
    v43 = &v70;
    v70 = v4;
    v42 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GPKRSVPRequest.RSVP.CodingKeys]);
    lazy protocol witness table accessor for type [GPKRSVPRequest.RSVP.CodingKeys] and conformance [A]();
    v71 = ArraySlice.init<A>(_:)();
    v72 = v5;
    v73 = v6;
    v74 = v7;
    v44 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArraySlice<GPKRSVPRequest.RSVP.CodingKeys>);
    v45 = lazy protocol witness table accessor for type ArraySlice<GPKRSVPRequest.RSVP.CodingKeys> and conformance ArraySlice<A>();
    Collection<>.popFirst()();
    v46 = v69;
    if (v69 == 2)
      goto LABEL_12;
    v41 = v46;
    v34 = v46;
    v39 = v71;
    v35 = v72;
    v36 = v73;
    v37 = v74;
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    v38 = v68;
    v68[0] = v39;
    v68[1] = v35;
    v68[2] = v36;
    v68[3] = v37;
    v40 = Collection.isEmpty.getter();
    outlined destroy of ArraySlice<GPKRSVPRequest.RSVP.CodingKeys>();
    swift_unknownObjectRelease();
    if ((v40 & 1) == 0)
    {
LABEL_12:
      v19 = 0;
      v23 = type metadata accessor for DecodingError();
      v17 = 1;
      v24 = swift_allocError();
      v22 = v12;
      v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
      v18 = (char *)v22 + *(int *)(v13 + 48);
      *v22 = &type metadata for GPKRSVPRequest.RSVP;
      v20 = KeyedDecodingContainer.codingPath.getter();
      countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Invalid number of keys found, expected one.", 0x2BuLL, v17 & 1)._countAndFlagsBits;
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(_QWORD *, _QWORD))(*(_QWORD *)(v23 - 8) + 104))(v22, *MEMORY[0x24BEE26D0]);
      swift_willThrow();
      outlined destroy of ArraySlice<GPKRSVPRequest.RSVP.CodingKeys>();
      (*(void (**)(char *, uint64_t))(v58 + 8))(v60, v57);
      v25 = v24;
    }
    else if ((v34 & 1) != 0)
    {
      v27 = &v67;
      v67 = v34 & 1;
      lazy protocol witness table accessor for type GPKRSVPRequest.RSVP.DeclineCodingKeys and conformance GPKRSVPRequest.RSVP.DeclineCodingKeys();
      v9 = v64;
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      v28 = v9;
      v29 = v9;
      if (!v9)
      {
        v76 = 1;
        (*(void (**)(char *, uint64_t))(v49 + 8))(v51, v48);
        v30 = v28;
        goto LABEL_11;
      }
      v15 = v29;
      outlined destroy of ArraySlice<GPKRSVPRequest.RSVP.CodingKeys>();
      (*(void (**)(char *, uint64_t))(v58 + 8))(v60, v57);
      v25 = v15;
    }
    else
    {
      v31 = &v66;
      v66 = v34 & 1;
      lazy protocol witness table accessor for type GPKRSVPRequest.RSVP.AcceptCodingKeys and conformance GPKRSVPRequest.RSVP.AcceptCodingKeys();
      v8 = v64;
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      v32 = v8;
      v33 = v8;
      if (!v8)
      {
        v76 = 0;
        (*(void (**)(char *, uint64_t))(v53 + 8))(v55, v52);
        v30 = v32;
LABEL_11:
        v26 = v30;
        outlined destroy of ArraySlice<GPKRSVPRequest.RSVP.CodingKeys>();
        (*(void (**)(char *, uint64_t))(v58 + 8))(v60, v57);
        v10 = v56;
        *v47 = v76 & 1;
        return __swift_destroy_boxed_opaque_existential_1(v10);
      }
      v16 = v33;
      outlined destroy of ArraySlice<GPKRSVPRequest.RSVP.CodingKeys>();
      (*(void (**)(char *, uint64_t))(v58 + 8))(v60, v57);
      v25 = v16;
    }
  }
  v14[1] = v25;
  return __swift_destroy_boxed_opaque_existential_1(v56);
}

unint64_t lazy protocol witness table accessor for type [GPKRSVPRequest.RSVP.CodingKeys] and conformance [A]()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [GPKRSVPRequest.RSVP.CodingKeys] and conformance [A];
  if (!lazy protocol witness table cache variable for type [GPKRSVPRequest.RSVP.CodingKeys] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [GPKRSVPRequest.RSVP.CodingKeys]);
    v1 = MEMORY[0x2426331CC](MEMORY[0x24BEE12C8], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [GPKRSVPRequest.RSVP.CodingKeys] and conformance [A]);
    return v1;
  }
  return v3;
}

unint64_t lazy protocol witness table accessor for type ArraySlice<GPKRSVPRequest.RSVP.CodingKeys> and conformance ArraySlice<A>()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type ArraySlice<GPKRSVPRequest.RSVP.CodingKeys> and conformance ArraySlice<A>;
  if (!lazy protocol witness table cache variable for type ArraySlice<GPKRSVPRequest.RSVP.CodingKeys> and conformance ArraySlice<A>)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ArraySlice<GPKRSVPRequest.RSVP.CodingKeys>);
    v1 = MEMORY[0x2426331CC](MEMORY[0x24BEE2190], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type ArraySlice<GPKRSVPRequest.RSVP.CodingKeys> and conformance ArraySlice<A>);
    return v1;
  }
  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of ArraySlice<GPKRSVPRequest.RSVP.CodingKeys>()
{
  swift_unknownObjectRelease();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance GPKRSVPRequest.RSVP(_BYTE *a1, _BYTE *a2)
{
  return static GPKRSVPRequest.RSVP.== infix(_:_:)(a1, a2);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance GPKRSVPRequest.RSVP()
{
  return GPKRSVPRequest.RSVP.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GPKRSVPRequest.RSVP()
{
  return GPKRSVPRequest.RSVP.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GPKRSVPRequest.RSVP(Swift::Int a1)
{
  return Hashable._rawHashValue(seed:)(a1);
}

uint64_t protocol witness for Decodable.init(from:) in conformance GPKRSVPRequest.RSVP@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  return GPKRSVPRequest.RSVP.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GPKRSVPRequest.RSVP(uint64_t a1)
{
  return GPKRSVPRequest.RSVP.encode(to:)(a1);
}

uint64_t GPKRSVPRequest.groupID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of GPKGroupID(v1 + OBJC_IVAR____TtC8GroupKit14GPKRSVPRequest_groupID, a1);
}

void GPKRSVPRequest.rsvp.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + OBJC_IVAR____TtC8GroupKit14GPKRSVPRequest_rsvp) & 1;
}

uint64_t key path getter for GPKRSVPRequest.serviceName : GPKRSVPRequest@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v5 = *a1;
  v2 = swift_retain();
  *a2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 104))(v2);
  a2[1] = v3;
  return swift_release();
}

uint64_t key path setter for GPKRSVPRequest.serviceName : GPKRSVPRequest(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[2];

  outlined init with copy of String?(a1, v7);
  v4 = v7[0];
  v6 = v7[1];
  v5 = *a2;
  swift_retain();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v5 + 112))(v4, v6);
  return swift_release();
}

uint64_t GPKRSVPRequest.serviceName.getter()
{
  uint64_t v0;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC8GroupKit14GPKRSVPRequest_serviceName);
  swift_beginAccess();
  v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t GPKRSVPRequest.serviceName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  swift_bridgeObjectRetain();
  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC8GroupKit14GPKRSVPRequest_serviceName);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*GPKRSVPRequest.serviceName.modify())()
{
  swift_beginAccess();
  return GPKRSVPRequest.serviceName.modify;
}

uint64_t GPKRSVPRequest.serviceName.modify()
{
  return swift_endAccess();
}

uint64_t GPKRSVPRequest.__allocating_init(groupID:rsvp:)(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  return GPKRSVPRequest.init(groupID:rsvp:)(a1, a2);
}

uint64_t GPKRSVPRequest.init(groupID:rsvp:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  unsigned __int8 *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD v9[2];
  unint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;

  v14 = a1;
  v9[1] = a2;
  v18 = 0;
  v17 = 0;
  v16 = 0;
  v10 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for GPKGroupID() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3 = MEMORY[0x24BDAC7A8](v14);
  v4 = (char *)v9 - v10;
  v11 = (uint64_t)v9 - v10;
  v18 = v3;
  v13 = *v5;
  v12 = 1;
  v17 = v13 & 1;
  v16 = v2;
  v6 = (_QWORD *)(v2 + OBJC_IVAR____TtC8GroupKit14GPKRSVPRequest_serviceName);
  *v6 = 0;
  v6[1] = 0;
  outlined init with copy of GPKGroupID(v3, (uint64_t)v4);
  outlined init with take of GPKGroupID(v11, v2 + OBJC_IVAR____TtC8GroupKit14GPKRSVPRequest_groupID);
  v7 = v14;
  *(_BYTE *)(v2 + OBJC_IVAR____TtC8GroupKit14GPKRSVPRequest_rsvp) = v13 & v12;
  outlined destroy of GPKGroupID(v7);
  return v15;
}

BOOL static GPKRSVPRequest.CodingKeys.== infix(_:_:)(char a1, char a2)
{
  uint64_t v3;
  uint64_t v4;

  if (a1)
  {
    if (a1 == 1)
      v4 = 1;
    else
      v4 = 2;
  }
  else
  {
    v4 = 0;
  }
  if (a2)
  {
    if (a2 == 1)
      v3 = 1;
    else
      v3 = 2;
  }
  else
  {
    v3 = 0;
  }
  return v4 == v3;
}

uint64_t GPKRSVPRequest.CodingKeys.hash(into:)()
{
  return Hasher.combine<A>(_:)();
}

uint64_t GPKRSVPRequest.CodingKeys.init(stringValue:)()
{
  char v2;
  char v3;
  char v4;
  unsigned __int8 v5;

  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("groupID", 7uLL, 1);
  swift_bridgeObjectRetain();
  v4 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v4 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = 0;
LABEL_8:
    swift_bridgeObjectRelease();
    return v5;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rsvp", 4uLL, 1);
  swift_bridgeObjectRetain();
  v3 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v3 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = 1;
    goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("serviceName", 0xBuLL, 1);
  swift_bridgeObjectRetain();
  v2 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = 2;
    goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 3;
}

uint64_t GPKRSVPRequest.CodingKeys.init(intValue:)()
{
  return 3;
}

uint64_t GPKRSVPRequest.CodingKeys.hashValue.getter()
{
  lazy protocol witness table accessor for type GPKRSVPRequest.CodingKeys and conformance GPKRSVPRequest.CodingKeys();
  return _hashValue<A>(for:)();
}

unint64_t lazy protocol witness table accessor for type GPKRSVPRequest.CodingKeys and conformance GPKRSVPRequest.CodingKeys()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKRSVPRequest.CodingKeys and conformance GPKRSVPRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKRSVPRequest.CodingKeys and conformance GPKRSVPRequest.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKRSVPRequest.CodingKeys, &type metadata for GPKRSVPRequest.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKRSVPRequest.CodingKeys and conformance GPKRSVPRequest.CodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKRSVPRequest.CodingKeys and conformance GPKRSVPRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKRSVPRequest.CodingKeys and conformance GPKRSVPRequest.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKRSVPRequest.CodingKeys, &type metadata for GPKRSVPRequest.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKRSVPRequest.CodingKeys and conformance GPKRSVPRequest.CodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKRSVPRequest.CodingKeys and conformance GPKRSVPRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKRSVPRequest.CodingKeys and conformance GPKRSVPRequest.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKRSVPRequest.CodingKeys, &type metadata for GPKRSVPRequest.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKRSVPRequest.CodingKeys and conformance GPKRSVPRequest.CodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKRSVPRequest.CodingKeys and conformance GPKRSVPRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKRSVPRequest.CodingKeys and conformance GPKRSVPRequest.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKRSVPRequest.CodingKeys, &type metadata for GPKRSVPRequest.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKRSVPRequest.CodingKeys and conformance GPKRSVPRequest.CodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKRSVPRequest.CodingKeys and conformance GPKRSVPRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKRSVPRequest.CodingKeys and conformance GPKRSVPRequest.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKRSVPRequest.CodingKeys, &type metadata for GPKRSVPRequest.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKRSVPRequest.CodingKeys and conformance GPKRSVPRequest.CodingKeys);
    return v0;
  }
  return v2;
}

uint64_t GPKRSVPRequest.CodingKeys.intValue.getter()
{
  return 0;
}

uint64_t GPKRSVPRequest.CodingKeys.stringValue.getter(char a1)
{
  if (!a1)
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("groupID", 7uLL, 1)._countAndFlagsBits;
  if (a1 == 1)
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rsvp", 4uLL, 1)._countAndFlagsBits;
  else
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("serviceName", 0xBuLL, 1)._countAndFlagsBits;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance GPKRSVPRequest.CodingKeys(char *a1, char *a2)
{
  return static GPKRSVPRequest.CodingKeys.== infix(_:_:)(*a1, *a2);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance GPKRSVPRequest.CodingKeys()
{
  return GPKRSVPRequest.CodingKeys.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GPKRSVPRequest.CodingKeys()
{
  return GPKRSVPRequest.CodingKeys.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GPKRSVPRequest.CodingKeys(Swift::Int a1)
{
  return Hashable._rawHashValue(seed:)(a1);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GPKRSVPRequest.CodingKeys()
{
  char *v0;

  return GPKRSVPRequest.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GPKRSVPRequest.CodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = GPKRSVPRequest.CodingKeys.init(stringValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance GPKRSVPRequest.CodingKeys()
{
  return GPKRSVPRequest.CodingKeys.intValue.getter();
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance GPKRSVPRequest.CodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = GPKRSVPRequest.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GPKRSVPRequest.CodingKeys()
{
  lazy protocol witness table accessor for type GPKRSVPRequest.CodingKeys and conformance GPKRSVPRequest.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GPKRSVPRequest.CodingKeys()
{
  lazy protocol witness table accessor for type GPKRSVPRequest.CodingKeys and conformance GPKRSVPRequest.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t GPKRSVPRequest.deinit()
{
  uint64_t v0;
  uint64_t v2;

  outlined destroy of GPKGroupID(v0 + OBJC_IVAR____TtC8GroupKit14GPKRSVPRequest_groupID);
  outlined destroy of String?();
  return v2;
}

uint64_t GPKRSVPRequest.__deallocating_deinit()
{
  GPKRSVPRequest.deinit();
  return swift_deallocClassInstance();
}

uint64_t GPKRSVPRequest.encode(to:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  char v37;
  char v38;
  uint64_t v39;
  _QWORD *v40;

  v21 = a1;
  v40 = 0;
  v39 = 0;
  v30 = type metadata accessor for GPKGroupID();
  v20 = (*(_QWORD *)(*(_QWORD *)(v30 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v30);
  v32 = (uint64_t)v10 - v20;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GPKRSVPRequest.CodingKeys>);
  v22 = *(_QWORD *)(v29 - 8);
  v23 = (*(_QWORD *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = (_QWORD *)MEMORY[0x24BDAC7A8](v21);
  v26 = (char *)v10 - v23;
  v40 = v2;
  v39 = v1;
  v24 = v2[3];
  v25 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v24);
  lazy protocol witness table accessor for type GPKRSVPRequest.CodingKeys and conformance GPKRSVPRequest.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  outlined init with copy of GPKGroupID(v27 + OBJC_IVAR____TtC8GroupKit14GPKRSVPRequest_groupID, v32);
  v28 = &v38;
  v38 = 0;
  lazy protocol witness table accessor for type GPKGroupID and conformance GPKGroupID();
  v3 = v31;
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  v33 = v3;
  v34 = v3;
  if (v3)
  {
    v11 = v34;
    outlined destroy of GPKGroupID(v32);
    result = (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v26, v29);
    v12 = v11;
  }
  else
  {
    outlined destroy of GPKGroupID(v32);
    v4 = *(_BYTE *)(v27 + OBJC_IVAR____TtC8GroupKit14GPKRSVPRequest_rsvp) & 1;
    v17 = &v37;
    v37 = v4;
    v16 = &v36;
    v36 = 1;
    lazy protocol witness table accessor for type GPKRSVPRequest.RSVP and conformance GPKRSVPRequest.RSVP();
    v5 = v33;
    v6 = KeyedEncodingContainer.encode<A>(_:forKey:)();
    v18 = v5;
    v19 = v5;
    if (v5)
    {
      v10[2] = v19;
      return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v26, v29);
    }
    else
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v27 + 104))(v6);
      v7 = v18;
      v13 = v8;
      v35 = 2;
      KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
      v14 = v7;
      v15 = v7;
      if (v7)
        v10[1] = v15;
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v26, v29);
    }
  }
  return result;
}

uint64_t GPKRSVPRequest.__allocating_init(from:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  swift_allocObject();
  v5 = GPKRSVPRequest.init(from:)(a1);
  if (v3)
    return v2;
  else
    return v5;
}

uint64_t GPKRSVPRequest.init(from:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _BYTE v44[29];
  _BYTE v45[2];
  char v46;
  uint64_t v47;
  _QWORD *v48;
  char v49;

  v34 = a1;
  v48 = 0;
  v47 = 0;
  v31 = type metadata accessor for GPKGroupID();
  v32 = (*(_QWORD *)(*(_QWORD *)(v31 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v31);
  v33 = (uint64_t)v12 - v32;
  v35 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GPKRSVPRequest.CodingKeys>);
  v36 = *(_QWORD *)(v35 - 8);
  v37 = (*(_QWORD *)(v36 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = (_QWORD *)MEMORY[0x24BDAC7A8](v34);
  v38 = (char *)v12 - v37;
  v48 = v2;
  v47 = v1;
  v49 = 4;
  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC8GroupKit14GPKRSVPRequest_serviceName);
  *v3 = 0;
  v3[1] = 0;
  v40 = v2[3];
  v41 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v40);
  lazy protocol witness table accessor for type GPKRSVPRequest.CodingKeys and conformance GPKRSVPRequest.CodingKeys();
  v4 = v39;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  v42 = v4;
  v43 = v4;
  if (v4)
  {
    v15 = v43;
  }
  else
  {
    v27 = &v46;
    v46 = 0;
    lazy protocol witness table accessor for type GPKGroupID and conformance GPKGroupID();
    v5 = v42;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    v28 = v5;
    v29 = v5;
    if (v5)
    {
      v14 = v29;
      (*(void (**)(char *, uint64_t))(v36 + 8))(v38, v35);
      v15 = v14;
    }
    else
    {
      v49 = 5;
      outlined init with take of GPKGroupID(v33, v30 + OBJC_IVAR____TtC8GroupKit14GPKRSVPRequest_groupID);
      v24 = v45;
      v45[0] = 1;
      lazy protocol witness table accessor for type GPKRSVPRequest.RSVP and conformance GPKRSVPRequest.RSVP();
      v6 = v28;
      KeyedDecodingContainer.decode<A>(_:forKey:)();
      v25 = v6;
      v26 = v6;
      if (!v6)
      {
        v49 = 7;
        *(_BYTE *)(v30 + OBJC_IVAR____TtC8GroupKit14GPKRSVPRequest_rsvp) = v45[1] & 1;
        v44[28] = 2;
        v7 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
        v20 = 0;
        v21 = v7;
        v22 = v8;
        v23 = 0;
        v18 = v8;
        v16 = v7;
        v17 = (uint64_t *)(v30 + OBJC_IVAR____TtC8GroupKit14GPKRSVPRequest_serviceName);
        v19 = v44;
        swift_beginAccess();
        v9 = v17;
        v10 = v18;
        *v17 = v16;
        v9[1] = v10;
        swift_bridgeObjectRelease();
        swift_endAccess();
        (*(void (**)(char *, uint64_t))(v36 + 8))(v38, v35);
        __swift_destroy_boxed_opaque_existential_1(v34);
        return v30;
      }
      v13 = v26;
      (*(void (**)(char *, uint64_t))(v36 + 8))(v38, v35);
      v15 = v13;
    }
  }
  v12[4] = v15;
  if ((v49 & 7) == 7)
  {
    swift_release();
  }
  else
  {
    if ((v49 & 1) != 0)
      outlined destroy of GPKGroupID(v30 + OBJC_IVAR____TtC8GroupKit14GPKRSVPRequest_groupID);
    v12[3] = v30;
    v12[2] = v30;
    outlined destroy of String?();
    type metadata accessor for GPKRSVPRequest();
    swift_deallocPartialClassInstance();
  }
  __swift_destroy_boxed_opaque_existential_1(v34);
  return v12[1];
}

uint64_t type metadata accessor for GPKRSVPRequest()
{
  uint64_t v1;

  v1 = type metadata singleton initialization cache for GPKRSVPRequest;
  if (!type metadata singleton initialization cache for GPKRSVPRequest)
    return swift_getSingletonMetadata();
  return v1;
}

unint64_t base witness table accessor for Equatable in GPKRSVPRequest.RSVP()
{
  return lazy protocol witness table accessor for type GPKRSVPRequest.RSVP and conformance GPKRSVPRequest.RSVP();
}

uint64_t protocol witness for Decodable.init(from:) in conformance GPKRSVPRequest@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 144))();
  if (!v2)
    *a1 = result;
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GPKRSVPRequest()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 136))();
}

uint64_t ObjC metadata update function for GPKRSVPRequest()
{
  return type metadata accessor for GPKRSVPRequest();
}

uint64_t type metadata completion function for GPKRSVPRequest()
{
  unint64_t v0;
  uint64_t updated;

  updated = type metadata accessor for UUID();
  if (v0 <= 0x3F)
  {
    updated = swift_updateClassMetadata2();
    if (!updated)
      return 0;
  }
  return updated;
}

uint64_t method lookup function for GPKRSVPRequest()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of GPKRSVPRequest.serviceName.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of GPKRSVPRequest.serviceName.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of GPKRSVPRequest.serviceName.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of GPKRSVPRequest.__allocating_init(groupID:rsvp:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of GPKRSVPRequest.encode(to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of GPKRSVPRequest.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t getEnumTagSinglePayload for GPKRSVPRequest.RSVP(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v5;
  int v6;
  unsigned int v7;
  int v8;

  if (a2)
  {
    if (a2 <= 0xFE)
      goto LABEL_15;
    v7 = ((a2 + 1) >> 8) + 1;
    v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000)
        v2 = 4;
      else
        v2 = 2;
      v8 = v2;
    }
    if (v8 == 1)
      v6 = a1[1];
    else
      v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    if (v6)
    {
      v5 = (*a1 | ((v6 - 1) << 8)) + 254;
    }
    else
    {
LABEL_15:
      v3 = *a1 - 2;
      if (v3 < 0)
        v3 = -1;
      v5 = v3;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

_BYTE *storeEnumTagSinglePayload for GPKRSVPRequest.RSVP(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  v7 = 0;
  if (a3 > 0xFE)
  {
    v5 = ((a3 + 1) >> 8) + 1;
    v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000)
        v3 = 4;
      else
        v3 = 2;
      v6 = v3;
    }
    v7 = v6;
  }
  if (a2 > 0xFE)
  {
    v4 = ((a2 - 255) >> 8) + 1;
    *result = a2 + 1;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2)
      *result = a2 + 1;
  }
  return result;
}

uint64_t getEnumTag for GPKRSVPRequest.RSVP(_BYTE *a1)
{
  return *a1 & 1;
}

_BYTE *destructiveInjectEnumTag for GPKRSVPRequest.RSVP(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for GPKRSVPRequest.RSVP()
{
  return &type metadata for GPKRSVPRequest.RSVP;
}

uint64_t getEnumTagSinglePayload for GPKRSVPRequest.RSVP.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v5;
  int v6;
  unsigned int v7;
  int v8;

  if (a2)
  {
    if (a2 <= 0xFE)
      goto LABEL_15;
    v7 = ((a2 + 1) >> 8) + 1;
    v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000)
        v2 = 4;
      else
        v2 = 2;
      v8 = v2;
    }
    if (v8 == 1)
      v6 = a1[1];
    else
      v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    if (v6)
    {
      v5 = (*a1 | ((v6 - 1) << 8)) + 254;
    }
    else
    {
LABEL_15:
      v3 = *a1 - 2;
      if (v3 < 0)
        v3 = -1;
      v5 = v3;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

_BYTE *storeEnumTagSinglePayload for GPKRSVPRequest.RSVP.CodingKeys(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  v7 = 0;
  if (a3 > 0xFE)
  {
    v5 = ((a3 + 1) >> 8) + 1;
    v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000)
        v3 = 4;
      else
        v3 = 2;
      v6 = v3;
    }
    v7 = v6;
  }
  if (a2 > 0xFE)
  {
    v4 = ((a2 - 255) >> 8) + 1;
    *result = a2 + 1;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2)
      *result = a2 + 1;
  }
  return result;
}

uint64_t getEnumTag for GPKRSVPRequest.RSVP.CodingKeys(_BYTE *a1)
{
  return *a1 & 1;
}

_BYTE *destructiveInjectEnumTag for GPKRSVPRequest.RSVP.CodingKeys(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for GPKRSVPRequest.RSVP.CodingKeys()
{
  return &type metadata for GPKRSVPRequest.RSVP.CodingKeys;
}

ValueMetadata *type metadata accessor for GPKRSVPRequest.RSVP.AcceptCodingKeys()
{
  return &type metadata for GPKRSVPRequest.RSVP.AcceptCodingKeys;
}

ValueMetadata *type metadata accessor for GPKRSVPRequest.RSVP.DeclineCodingKeys()
{
  return &type metadata for GPKRSVPRequest.RSVP.DeclineCodingKeys;
}

uint64_t getEnumTagSinglePayload for GPKRSVPRequest.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v5;
  int v6;
  unsigned int v7;
  int v8;

  if (a2)
  {
    if (a2 <= 0xFD)
      goto LABEL_15;
    v7 = ((a2 + 2) >> 8) + 1;
    v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000)
        v2 = 4;
      else
        v2 = 2;
      v8 = v2;
    }
    if (v8 == 1)
      v6 = a1[1];
    else
      v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    if (v6)
    {
      v5 = (*a1 | ((v6 - 1) << 8)) + 253;
    }
    else
    {
LABEL_15:
      v3 = *a1 - 3;
      if (v3 < 0)
        v3 = -1;
      v5 = v3;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

_BYTE *storeEnumTagSinglePayload for GPKRSVPRequest.CodingKeys(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  v7 = 0;
  if (a3 > 0xFD)
  {
    v5 = ((a3 + 2) >> 8) + 1;
    v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000)
        v3 = 4;
      else
        v3 = 2;
      v6 = v3;
    }
    v7 = v6;
  }
  if (a2 > 0xFD)
  {
    v4 = ((a2 - 254) >> 8) + 1;
    *result = a2 + 2;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2)
      *result = a2 + 2;
  }
  return result;
}

uint64_t getEnumTag for GPKRSVPRequest.CodingKeys(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for GPKRSVPRequest.CodingKeys(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for GPKRSVPRequest.CodingKeys()
{
  return &type metadata for GPKRSVPRequest.CodingKeys;
}

unint64_t base witness table accessor for CustomDebugStringConvertible in GPKRSVPRequest.CodingKeys()
{
  return lazy protocol witness table accessor for type GPKRSVPRequest.CodingKeys and conformance GPKRSVPRequest.CodingKeys();
}

unint64_t base witness table accessor for CustomStringConvertible in GPKRSVPRequest.CodingKeys()
{
  return lazy protocol witness table accessor for type GPKRSVPRequest.CodingKeys and conformance GPKRSVPRequest.CodingKeys();
}

unint64_t base witness table accessor for Equatable in GPKRSVPRequest.CodingKeys()
{
  return lazy protocol witness table accessor for type GPKRSVPRequest.CodingKeys and conformance GPKRSVPRequest.CodingKeys();
}

unint64_t base witness table accessor for CustomDebugStringConvertible in GPKRSVPRequest.RSVP.DeclineCodingKeys()
{
  return lazy protocol witness table accessor for type GPKRSVPRequest.RSVP.DeclineCodingKeys and conformance GPKRSVPRequest.RSVP.DeclineCodingKeys();
}

unint64_t base witness table accessor for CustomStringConvertible in GPKRSVPRequest.RSVP.DeclineCodingKeys()
{
  return lazy protocol witness table accessor for type GPKRSVPRequest.RSVP.DeclineCodingKeys and conformance GPKRSVPRequest.RSVP.DeclineCodingKeys();
}

unint64_t base witness table accessor for CustomDebugStringConvertible in GPKRSVPRequest.RSVP.CodingKeys()
{
  return lazy protocol witness table accessor for type GPKRSVPRequest.RSVP.CodingKeys and conformance GPKRSVPRequest.RSVP.CodingKeys();
}

unint64_t base witness table accessor for CustomStringConvertible in GPKRSVPRequest.RSVP.CodingKeys()
{
  return lazy protocol witness table accessor for type GPKRSVPRequest.RSVP.CodingKeys and conformance GPKRSVPRequest.RSVP.CodingKeys();
}

unint64_t base witness table accessor for Equatable in GPKRSVPRequest.RSVP.CodingKeys()
{
  return lazy protocol witness table accessor for type GPKRSVPRequest.RSVP.CodingKeys and conformance GPKRSVPRequest.RSVP.CodingKeys();
}

unint64_t base witness table accessor for CustomDebugStringConvertible in GPKRSVPRequest.RSVP.AcceptCodingKeys()
{
  return lazy protocol witness table accessor for type GPKRSVPRequest.RSVP.AcceptCodingKeys and conformance GPKRSVPRequest.RSVP.AcceptCodingKeys();
}

unint64_t base witness table accessor for CustomStringConvertible in GPKRSVPRequest.RSVP.AcceptCodingKeys()
{
  return lazy protocol witness table accessor for type GPKRSVPRequest.RSVP.AcceptCodingKeys and conformance GPKRSVPRequest.RSVP.AcceptCodingKeys();
}

uint64_t type metadata accessor for GPKGroupManager()
{
  return objc_opt_self();
}

uint64_t GPKGroupManager.__allocating_init(daemonMessageSender:daemonBroadcaster:)(uint64_t a1, _QWORD *a2)
{
  swift_allocObject();
  return GPKGroupManager.init(daemonMessageSender:daemonBroadcaster:)(a1, a2);
}

uint64_t *GPKGroupManager.shared.unsafeMutableAddressor()
{
  if (one-time initialization token for shared != -1)
    swift_once();
  return &static GPKGroupManager.shared;
}

uint64_t static GPKGroupManager.shared.getter()
{
  uint64_t v1;

  v1 = *GPKGroupManager.shared.unsafeMutableAddressor();
  swift_retain();
  return v1;
}

uint64_t GPKGroupManager.daemonMessageSender.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of MessageSenderProtocol(v1 + 16, a1);
}

uint64_t GPKGroupManager.broadcastDispatcher.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 56);
  swift_retain();
  return v2;
}

uint64_t key path getter for GPKGroupManager.keyConverter : GPKGroupManager@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  _BYTE v6[40];
  uint64_t v7;

  v4 = *a1;
  v2 = swift_retain();
  v7 = v4;
  (*(void (**)(uint64_t))(*(_QWORD *)v4 + 112))(v2);
  outlined init with take of KeyConverting(v6, a2);
  return swift_release();
}

uint64_t key path setter for GPKGroupManager.keyConverter : GPKGroupManager(uint64_t a1)
{
  _BYTE v2[40];

  outlined init with copy of KeyConverting(a1, (uint64_t)v2);
  swift_retain();
  GPKGroupManager.keyConverter.setter((uint64_t)v2);
  return swift_release();
}

uint64_t GPKGroupManager.keyConverter.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v4;
  _BYTE v5[40];
  _BYTE v6[24];
  ValueMetadata *v7;
  _UNKNOWN **v8;
  _QWORD v9[5];
  _BYTE __dst[40];
  uint64_t v11;

  v11 = 0;
  swift_beginAccess();
  outlined init with copy of KeyConverting?((_QWORD *)(v1 + 64), v9);
  swift_endAccess();
  if (v9[3])
  {
    outlined init with take of KeyConverting(v9, __dst);
    outlined init with copy of KeyConverting((uint64_t)__dst, a1);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)__dst);
  }
  else
  {
    outlined destroy of KeyConverting?((uint64_t)v9);
    KeyConverter.init()();
    v7 = &type metadata for KeyConverter;
    v8 = &protocol witness table for KeyConverter;
    outlined init with copy of KeyConverting((uint64_t)v6, (uint64_t)v5);
    swift_beginAccess();
    outlined assign with take of KeyConverting?(v5, (_QWORD *)(v4 + 64));
    swift_endAccess();
    outlined init with copy of KeyConverting((uint64_t)v6, a1);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  }
}

uint64_t GPKGroupManager.keyConverter.setter(uint64_t a1)
{
  uint64_t v1;
  _BYTE v4[40];
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = a1;
  outlined init with copy of KeyConverting(a1, (uint64_t)v4);
  swift_beginAccess();
  outlined assign with take of KeyConverting?(v4, (_QWORD *)(v1 + 64));
  swift_endAccess();
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

void (*GPKGroupManager.keyConverter.modify(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v4;

  v4 = malloc(0x58uLL);
  *a1 = v4;
  v4[10] = v1;
  GPKGroupManager.keyConverter.getter((uint64_t)v4);
  return GPKGroupManager.keyConverter.modify;
}

void GPKGroupManager.keyConverter.modify(void **a1, char a2)
{
  void *v2;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    outlined init with copy of KeyConverting((uint64_t)v2, (uint64_t)v2 + 40);
    GPKGroupManager.keyConverter.setter((uint64_t)v2 + 40);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  }
  else
  {
    GPKGroupManager.keyConverter.setter((uint64_t)v2);
  }
  free(v2);
}

uint64_t GPKGroupManager.subscribers.getter()
{
  uint64_t v0;
  uint64_t v2;

  swift_beginAccess();
  v2 = *(_QWORD *)(v0 + 104);
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v2;
}

uint64_t GPKGroupManager.subscribers.setter(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRetain();
  swift_beginAccess();
  *(_QWORD *)(v1 + 104) = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*GPKGroupManager.subscribers.modify())()
{
  swift_beginAccess();
  return GPKGroupManager.subscribers.modify;
}

uint64_t GPKGroupManager.subscribers.modify()
{
  return swift_endAccess();
}

uint64_t GPKGroupManager.__allocating_init(daemonConnection:keyConverter:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  _BYTE v9[40];
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v17 = a1;
  v16 = a2;
  v4 = type metadata accessor for MessageSender();
  type metadata accessor for XPCEncoder();
  v15 = XPCEncoder.__allocating_init()();
  type metadata accessor for XPCDecoder();
  v14 = XPCDecoder.__allocating_init()();
  swift_retain();
  v13 = a1;
  v5 = type metadata accessor for DaemonConnection();
  lazy protocol witness table accessor for type DaemonConnection and conformance DaemonConnection();
  v12 = MessageSender.__allocating_init<A, B, C>(encoder:decoder:transport:)();
  swift_retain();
  v11[3] = v4;
  v11[4] = &protocol witness table for MessageSender;
  v11[0] = v12;
  swift_retain();
  v10[3] = v5;
  v10[4] = &protocol witness table for DaemonConnection;
  v10[0] = a1;
  v8 = (*(uint64_t (**)(_QWORD *, _QWORD *))(v3 + 160))(v11, v10);
  swift_retain();
  swift_retain();
  v18 = v8;
  outlined init with copy of KeyConverting(a2, (uint64_t)v9);
  GPKGroupManager.keyConverter.setter((uint64_t)v9);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a2);
  swift_release();
  swift_release();
  return v8;
}

uint64_t GPKGroupManager.init(daemonMessageSender:daemonBroadcaster:)(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  _BYTE v9[40];
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;

  v12 = a1;
  v11 = a2;
  v10 = v2;
  v2[8] = 0;
  v2[9] = 0;
  v2[10] = 0;
  v2[11] = 0;
  v2[12] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Weak<GPKGroupManagerEventSubscriber>);
  v2[13] = _allocateUninitializedArray<A>(_:)();
  outlined init with copy of MessageSenderProtocol(a1, (uint64_t)v9);
  outlined init with take of MessageSenderProtocol(v9, v2 + 2);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BroadcastDispatcher<Data>);
  type metadata accessor for XPCDecoder();
  XPCDecoder.__allocating_init()();
  *(_QWORD *)(v8 + 56) = BroadcastDispatcher.__allocating_init<A>(decoder:)();
  v4 = a2[3];
  v5 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v4);
  swift_retain();
  (*(void (**)(uint64_t, _UNKNOWN **, uint64_t))(v5 + 8))(v8, &protocol witness table for GPKGroupManager, v4);
  swift_unknownObjectRelease();
  GPKGroupManager.registerHandlers()();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a2);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v8;
}

_QWORD *outlined init with copy of KeyConverting?(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  if (a1[3])
  {
    v2 = a1[3];
    a2[3] = v2;
    a2[4] = a1[4];
    (**(void (***)(void))(v2 - 8))();
  }
  else
  {
    memcpy(a2, a1, 0x28uLL);
  }
  return a2;
}

uint64_t outlined destroy of KeyConverting?(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 24))
    __swift_destroy_boxed_opaque_existential_1(a1);
  return a1;
}

uint64_t outlined init with copy of KeyConverting(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

_QWORD *outlined assign with take of KeyConverting?(const void *a1, _QWORD *a2)
{
  if (a2[3])
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a2);
    memcpy(a2, a1, 0x28uLL);
  }
  else
  {
    memcpy(a2, a1, 0x28uLL);
  }
  return a2;
}

void *outlined init with take of KeyConverting(const void *a1, void *__dst)
{
  memcpy(__dst, a1, 0x28uLL);
  return __dst;
}

uint64_t GPKGroupManager.registerHandlers()()
{
  swift_retain();
  implicit closure #1 in GPKGroupManager.registerHandlers()();
  lazy protocol witness table accessor for type GroupUpdatedBroadcast and conformance GroupUpdatedBroadcast();
  lazy protocol witness table accessor for type GroupUpdatedBroadcast and conformance GroupUpdatedBroadcast();
  dispatch thunk of BroadcastDispatcher.registerHandler<A>(for:_:)();
  swift_release();
  swift_release();
  swift_retain();
  implicit closure #3 in GPKGroupManager.registerHandlers()();
  lazy protocol witness table accessor for type LeftGroupBroadcast and conformance LeftGroupBroadcast();
  lazy protocol witness table accessor for type LeftGroupBroadcast and conformance LeftGroupBroadcast();
  dispatch thunk of BroadcastDispatcher.registerHandler<A>(for:_:)();
  swift_release();
  swift_release();
  swift_retain();
  type metadata accessor for GroupDeletedBroadcast();
  implicit closure #5 in GPKGroupManager.registerHandlers()();
  lazy protocol witness table accessor for type GroupDeletedBroadcast and conformance GroupDeletedBroadcast();
  lazy protocol witness table accessor for type GroupDeletedBroadcast and conformance GroupDeletedBroadcast();
  dispatch thunk of BroadcastDispatcher.registerHandler<A>(for:_:)();
  swift_release();
  swift_release();
  swift_retain();
  implicit closure #7 in GPKGroupManager.registerHandlers()();
  lazy protocol witness table accessor for type ReceivedGroupInviteBroadcast and conformance ReceivedGroupInviteBroadcast();
  lazy protocol witness table accessor for type ReceivedGroupInviteBroadcast and conformance ReceivedGroupInviteBroadcast();
  dispatch thunk of BroadcastDispatcher.registerHandler<A>(for:_:)();
  swift_release();
  swift_release();
  swift_retain();
  implicit closure #9 in GPKGroupManager.registerHandlers()();
  lazy protocol witness table accessor for type ReceivedGroupUpdateBroadcast and conformance ReceivedGroupUpdateBroadcast();
  lazy protocol witness table accessor for type ReceivedGroupUpdateBroadcast and conformance ReceivedGroupUpdateBroadcast();
  dispatch thunk of BroadcastDispatcher.registerHandler<A>(for:_:)();
  swift_release();
  swift_release();
  swift_retain();
  implicit closure #11 in GPKGroupManager.registerHandlers()();
  lazy protocol witness table accessor for type RemovedFromGroupBroadcast and conformance RemovedFromGroupBroadcast();
  lazy protocol witness table accessor for type RemovedFromGroupBroadcast and conformance RemovedFromGroupBroadcast();
  dispatch thunk of BroadcastDispatcher.registerHandler<A>(for:_:)();
  swift_release();
  swift_release();
  swift_retain();
  implicit closure #13 in GPKGroupManager.registerHandlers()();
  lazy protocol witness table accessor for type ReceivedGroupDeletionBroadcast and conformance ReceivedGroupDeletionBroadcast();
  lazy protocol witness table accessor for type ReceivedGroupDeletionBroadcast and conformance ReceivedGroupDeletionBroadcast();
  dispatch thunk of BroadcastDispatcher.registerHandler<A>(for:_:)();
  swift_release();
  swift_release();
  swift_retain();
  implicit closure #15 in GPKGroupManager.registerHandlers()();
  lazy protocol witness table accessor for type MemberInvitationResponseBroadcast and conformance MemberInvitationResponseBroadcast();
  lazy protocol witness table accessor for type MemberInvitationResponseBroadcast and conformance MemberInvitationResponseBroadcast();
  dispatch thunk of BroadcastDispatcher.registerHandler<A>(for:_:)();
  swift_release();
  swift_release();
  swift_retain();
  type metadata accessor for InvitationDeletedBroadcast();
  implicit closure #17 in GPKGroupManager.registerHandlers()();
  lazy protocol witness table accessor for type InvitationDeletedBroadcast and conformance InvitationDeletedBroadcast();
  lazy protocol witness table accessor for type InvitationDeletedBroadcast and conformance InvitationDeletedBroadcast();
  dispatch thunk of BroadcastDispatcher.registerHandler<A>(for:_:)();
  swift_release();
  return swift_release();
}

uint64_t (*implicit closure #1 in GPKGroupManager.registerHandlers()())(uint64_t *a1)
{
  swift_retain();
  return partial apply for implicit closure #2 in implicit closure #1 in GPKGroupManager.registerHandlers();
}

unint64_t lazy protocol witness table accessor for type GroupUpdatedBroadcast and conformance GroupUpdatedBroadcast()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GroupUpdatedBroadcast and conformance GroupUpdatedBroadcast;
  if (!lazy protocol witness table cache variable for type GroupUpdatedBroadcast and conformance GroupUpdatedBroadcast)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GroupUpdatedBroadcast, &type metadata for GroupUpdatedBroadcast);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GroupUpdatedBroadcast and conformance GroupUpdatedBroadcast);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GroupUpdatedBroadcast and conformance GroupUpdatedBroadcast;
  if (!lazy protocol witness table cache variable for type GroupUpdatedBroadcast and conformance GroupUpdatedBroadcast)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GroupUpdatedBroadcast, &type metadata for GroupUpdatedBroadcast);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GroupUpdatedBroadcast and conformance GroupUpdatedBroadcast);
    return v0;
  }
  return v2;
}

uint64_t implicit closure #2 in implicit closure #1 in GPKGroupManager.registerHandlers()(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = 0;
  v4 = 0;
  v5 = *a1;
  v4 = a2;
  v3 = v5;
  return GPKGroupManager.handleGroupUpdatedBroadcast(broadcast:)(&v3);
}

uint64_t GPKGroupManager.handleGroupUpdatedBroadcast(broadcast:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t ObjectType;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[32];
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v14 = 0;
  v13 = 0;
  v12 = 0;
  v10 = 0;
  v11 = 0;
  v5 = *a1;
  v14 = a1;
  v13 = v1;
  swift_retain();
  v12 = v5;
  v6 = GPKGroupManager.subscribers.modify();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Weak<GPKGroupManagerEventSubscriber>]);
  Array.allObjects<A>()(v2);
  ((void (*)(_BYTE *, _QWORD))v6)(v9, 0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GPKGroupManagerEventSubscriber]);
  lazy protocol witness table accessor for type [GPKGroupManagerEventSubscriber] and conformance [A]();
  Collection<>.makeIterator()();
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<[GPKGroupManagerEventSubscriber]>);
    IndexingIterator.next()();
    if (!v7)
      break;
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v5, ObjectType);
    swift_unknownObjectRelease();
  }
  outlined destroy of IndexingIterator<[GPKGroupManagerEventSubscriber]>();
  return swift_release();
}

_QWORD *(*implicit closure #3 in GPKGroupManager.registerHandlers()())(uint64_t *a1)
{
  swift_retain();
  return partial apply for implicit closure #4 in implicit closure #3 in GPKGroupManager.registerHandlers();
}

unint64_t lazy protocol witness table accessor for type LeftGroupBroadcast and conformance LeftGroupBroadcast()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type LeftGroupBroadcast and conformance LeftGroupBroadcast;
  if (!lazy protocol witness table cache variable for type LeftGroupBroadcast and conformance LeftGroupBroadcast)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for LeftGroupBroadcast, &type metadata for LeftGroupBroadcast);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type LeftGroupBroadcast and conformance LeftGroupBroadcast);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type LeftGroupBroadcast and conformance LeftGroupBroadcast;
  if (!lazy protocol witness table cache variable for type LeftGroupBroadcast and conformance LeftGroupBroadcast)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for LeftGroupBroadcast, &type metadata for LeftGroupBroadcast);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type LeftGroupBroadcast and conformance LeftGroupBroadcast);
    return v0;
  }
  return v2;
}

_QWORD *implicit closure #4 in implicit closure #3 in GPKGroupManager.registerHandlers()(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = 0;
  v4 = 0;
  v5 = *a1;
  v4 = a2;
  v3 = v5;
  return GPKGroupManager.handleLeftGroupBroadcast(broadcast:)(&v3);
}

_QWORD *GPKGroupManager.handleLeftGroupBroadcast(broadcast:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *result;
  uint64_t ObjectType;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[32];
  _QWORD v10[2];
  uint64_t v11;
  _QWORD *v12;

  v12 = 0;
  v11 = 0;
  v10[0] = 0;
  v10[1] = 0;
  v5 = *a1;
  v12 = a1;
  v11 = v1;
  v6 = GPKGroupManager.subscribers.modify();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Weak<GPKGroupManagerEventSubscriber>]);
  Array.allObjects<A>()(v2);
  ((void (*)(_BYTE *, _QWORD))v6)(v9, 0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GPKGroupManagerEventSubscriber]);
  lazy protocol witness table accessor for type [GPKGroupManagerEventSubscriber] and conformance [A]();
  Collection<>.makeIterator()();
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<[GPKGroupManagerEventSubscriber]>);
    IndexingIterator.next()();
    if (!v7)
      break;
    ObjectType = swift_getObjectType();
    swift_retain();
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v5, ObjectType);
    swift_release();
    swift_unknownObjectRelease();
  }
  result = v10;
  outlined destroy of IndexingIterator<[GPKGroupManagerEventSubscriber]>();
  return result;
}

_QWORD *(*implicit closure #5 in GPKGroupManager.registerHandlers()())(uint64_t a1)
{
  swift_retain();
  return partial apply for implicit closure #6 in implicit closure #5 in GPKGroupManager.registerHandlers();
}

unint64_t lazy protocol witness table accessor for type GroupDeletedBroadcast and conformance GroupDeletedBroadcast()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type GroupDeletedBroadcast and conformance GroupDeletedBroadcast;
  if (!lazy protocol witness table cache variable for type GroupDeletedBroadcast and conformance GroupDeletedBroadcast)
  {
    v0 = type metadata accessor for GroupDeletedBroadcast();
    v1 = MEMORY[0x2426331CC](&protocol conformance descriptor for GroupDeletedBroadcast, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type GroupDeletedBroadcast and conformance GroupDeletedBroadcast);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type GroupDeletedBroadcast and conformance GroupDeletedBroadcast;
  if (!lazy protocol witness table cache variable for type GroupDeletedBroadcast and conformance GroupDeletedBroadcast)
  {
    v0 = type metadata accessor for GroupDeletedBroadcast();
    v1 = MEMORY[0x2426331CC](&protocol conformance descriptor for GroupDeletedBroadcast, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type GroupDeletedBroadcast and conformance GroupDeletedBroadcast);
    return v1;
  }
  return v3;
}

_QWORD *implicit closure #6 in implicit closure #5 in GPKGroupManager.registerHandlers()(uint64_t a1)
{
  return GPKGroupManager.handleGroupDeletedBroadcast(broadcast:)(a1);
}

_QWORD *GPKGroupManager.handleGroupDeletedBroadcast(broadcast:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *result;
  uint64_t ObjectType;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t (*v14)();
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;

  v11 = a1;
  v27 = 0;
  v26 = 0;
  v17 = v25;
  v25[0] = 0;
  v25[1] = 0;
  v19 = 0;
  v20 = 0;
  v12 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for GPKGroupID() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v13 = (uint64_t)&ObjectType - v12;
  v27 = MEMORY[0x24BDAC7A8](v11);
  v26 = v1;
  v15 = &v24;
  v14 = GPKGroupManager.subscribers.modify();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Weak<GPKGroupManagerEventSubscriber>]);
  v16 = Array.allObjects<A>()(v2);
  ((void (*)(char *, _QWORD))v14)(v15, 0);
  v23 = v16;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GPKGroupManagerEventSubscriber]);
  lazy protocol witness table accessor for type [GPKGroupManagerEventSubscriber] and conformance [A]();
  Collection<>.makeIterator()();
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<[GPKGroupManagerEventSubscriber]>);
    IndexingIterator.next()();
    v9 = v21;
    v10 = v22;
    if (!v21)
      break;
    v7 = v9;
    v8 = v10;
    v5 = v10;
    v6 = v9;
    v19 = v9;
    v20 = v10;
    ObjectType = swift_getObjectType();
    outlined init with copy of GPKGroupID(v11, v13);
    (*(void (**)(uint64_t, uint64_t))(v5 + 24))(v13, ObjectType);
    outlined destroy of GPKGroupID(v13);
    swift_unknownObjectRelease();
  }
  result = v25;
  outlined destroy of IndexingIterator<[GPKGroupManagerEventSubscriber]>();
  return result;
}

_QWORD *(*implicit closure #7 in GPKGroupManager.registerHandlers()())(uint64_t *a1)
{
  swift_retain();
  return partial apply for implicit closure #8 in implicit closure #7 in GPKGroupManager.registerHandlers();
}

unint64_t lazy protocol witness table accessor for type ReceivedGroupInviteBroadcast and conformance ReceivedGroupInviteBroadcast()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type ReceivedGroupInviteBroadcast and conformance ReceivedGroupInviteBroadcast;
  if (!lazy protocol witness table cache variable for type ReceivedGroupInviteBroadcast and conformance ReceivedGroupInviteBroadcast)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for ReceivedGroupInviteBroadcast, &type metadata for ReceivedGroupInviteBroadcast);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type ReceivedGroupInviteBroadcast and conformance ReceivedGroupInviteBroadcast);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type ReceivedGroupInviteBroadcast and conformance ReceivedGroupInviteBroadcast;
  if (!lazy protocol witness table cache variable for type ReceivedGroupInviteBroadcast and conformance ReceivedGroupInviteBroadcast)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for ReceivedGroupInviteBroadcast, &type metadata for ReceivedGroupInviteBroadcast);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type ReceivedGroupInviteBroadcast and conformance ReceivedGroupInviteBroadcast);
    return v0;
  }
  return v2;
}

_QWORD *implicit closure #8 in implicit closure #7 in GPKGroupManager.registerHandlers()(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = 0;
  v4 = 0;
  v5 = *a1;
  v4 = a2;
  v3 = v5;
  return GPKGroupManager.handleReceivedGroupInviteBroadcast(broadcast:)(&v3);
}

_QWORD *GPKGroupManager.handleReceivedGroupInviteBroadcast(broadcast:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *result;
  uint64_t ObjectType;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[32];
  _QWORD v10[2];
  uint64_t v11;
  _QWORD *v12;

  v12 = 0;
  v11 = 0;
  v10[0] = 0;
  v10[1] = 0;
  v5 = *a1;
  v12 = a1;
  v11 = v1;
  v6 = GPKGroupManager.subscribers.modify();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Weak<GPKGroupManagerEventSubscriber>]);
  Array.allObjects<A>()(v2);
  ((void (*)(_BYTE *, _QWORD))v6)(v9, 0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GPKGroupManagerEventSubscriber]);
  lazy protocol witness table accessor for type [GPKGroupManagerEventSubscriber] and conformance [A]();
  Collection<>.makeIterator()();
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<[GPKGroupManagerEventSubscriber]>);
    IndexingIterator.next()();
    if (!v7)
      break;
    ObjectType = swift_getObjectType();
    swift_retain();
    (*(void (**)(uint64_t, uint64_t))(v8 + 48))(v5, ObjectType);
    swift_release();
    swift_unknownObjectRelease();
  }
  result = v10;
  outlined destroy of IndexingIterator<[GPKGroupManagerEventSubscriber]>();
  return result;
}

uint64_t (*implicit closure #9 in GPKGroupManager.registerHandlers()())(uint64_t a1)
{
  swift_retain();
  return partial apply for implicit closure #10 in implicit closure #9 in GPKGroupManager.registerHandlers();
}

unint64_t lazy protocol witness table accessor for type ReceivedGroupUpdateBroadcast and conformance ReceivedGroupUpdateBroadcast()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type ReceivedGroupUpdateBroadcast and conformance ReceivedGroupUpdateBroadcast;
  if (!lazy protocol witness table cache variable for type ReceivedGroupUpdateBroadcast and conformance ReceivedGroupUpdateBroadcast)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for ReceivedGroupUpdateBroadcast, &type metadata for ReceivedGroupUpdateBroadcast);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type ReceivedGroupUpdateBroadcast and conformance ReceivedGroupUpdateBroadcast);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type ReceivedGroupUpdateBroadcast and conformance ReceivedGroupUpdateBroadcast;
  if (!lazy protocol witness table cache variable for type ReceivedGroupUpdateBroadcast and conformance ReceivedGroupUpdateBroadcast)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for ReceivedGroupUpdateBroadcast, &type metadata for ReceivedGroupUpdateBroadcast);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type ReceivedGroupUpdateBroadcast and conformance ReceivedGroupUpdateBroadcast);
    return v0;
  }
  return v2;
}

uint64_t implicit closure #10 in implicit closure #9 in GPKGroupManager.registerHandlers()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v6[3];
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v8 = 0;
  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_BYTE *)(a1 + 24);
  v9 = *(_QWORD *)a1;
  v10 = v2;
  v11 = v3;
  v12 = v4 & 1;
  v8 = a2;
  v6[0] = v9;
  v6[1] = v2;
  v6[2] = v3;
  v7 = v4 & 1;
  return GPKGroupManager.handleReceivedGroupUpdateBroadcast(broadcast:)(v6);
}

uint64_t GPKGroupManager.handleReceivedGroupUpdateBroadcast(broadcast:)(uint64_t *a1)
{
  NSNumber *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjectType;
  uint64_t v6;
  uint64_t v8;
  Class isa;
  Class v10;
  char v11;
  NSNumber *v12;
  uint64_t v13;
  uint64_t (*v14)();
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  char v19[32];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;

  v24 = 0;
  v23 = 0;
  v22 = 0;
  v20 = 0;
  v21 = 0;
  v8 = *a1;
  v11 = *((_BYTE *)a1 + 24);
  v24 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (SubscriberUserInfoKey, Swift.AnyObject));
  _allocateUninitializedArray<A>(_:)();
  v12 = v1;
  LOBYTE(v1->super.super.isa) = 0;
  type metadata accessor for NSArray();
  swift_bridgeObjectRetain();
  type metadata accessor for GPKMember();
  v2 = _arrayForceCast<A, B>(_:)();
  isa = NSArray.__allocating_init(array:)((Swift::OpaquePointer)v2).super.isa;
  swift_bridgeObjectRelease();
  v12[1].super.super.isa = isa;
  LOBYTE(v12[2].super.super.isa) = 1;
  swift_bridgeObjectRetain();
  type metadata accessor for GPKMemberRemoval();
  v3 = _arrayForceCast<A, B>(_:)();
  v10 = NSArray.__allocating_init(array:)((Swift::OpaquePointer)v3).super.isa;
  swift_bridgeObjectRelease();
  v12[3].super.super.isa = v10;
  LOBYTE(v12[4].super.super.isa) = 3;
  type metadata accessor for NSNumber();
  v12[5].super.super.isa = NSNumber.__allocating_init(value:)(v11 & 1).super.super.isa;
  _finalizeUninitializedArray<A>(_:)();
  lazy protocol witness table accessor for type SubscriberUserInfoKey and conformance SubscriberUserInfoKey();
  v13 = Dictionary.init(dictionaryLiteral:)();
  v22 = v13;
  v14 = GPKGroupManager.subscribers.modify();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Weak<GPKGroupManagerEventSubscriber>]);
  Array.allObjects<A>()(v4);
  ((void (*)(char *, _QWORD))v14)(v19, 0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GPKGroupManagerEventSubscriber]);
  lazy protocol witness table accessor for type [GPKGroupManagerEventSubscriber] and conformance [A]();
  Collection<>.makeIterator()();
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<[GPKGroupManagerEventSubscriber]>);
    IndexingIterator.next()();
    if (!v17)
      break;
    ObjectType = swift_getObjectType();
    v16 = (*(uint64_t (**)(uint64_t))(v18 + 88))(ObjectType) & 1;
    swift_retain();
    v15 = GPKGroupManager.createSubscriberUserInfo(from:includePrivateKeys:)(v13, v16);
    v6 = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 56))(v8, v15, v6);
    swift_bridgeObjectRelease();
    swift_release();
    swift_unknownObjectRelease();
  }
  outlined destroy of IndexingIterator<[GPKGroupManagerEventSubscriber]>();
  return swift_bridgeObjectRelease();
}

_QWORD *(*implicit closure #11 in GPKGroupManager.registerHandlers()())(uint64_t *a1)
{
  swift_retain();
  return partial apply for implicit closure #12 in implicit closure #11 in GPKGroupManager.registerHandlers();
}

unint64_t lazy protocol witness table accessor for type RemovedFromGroupBroadcast and conformance RemovedFromGroupBroadcast()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type RemovedFromGroupBroadcast and conformance RemovedFromGroupBroadcast;
  if (!lazy protocol witness table cache variable for type RemovedFromGroupBroadcast and conformance RemovedFromGroupBroadcast)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for RemovedFromGroupBroadcast, &type metadata for RemovedFromGroupBroadcast);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type RemovedFromGroupBroadcast and conformance RemovedFromGroupBroadcast);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type RemovedFromGroupBroadcast and conformance RemovedFromGroupBroadcast;
  if (!lazy protocol witness table cache variable for type RemovedFromGroupBroadcast and conformance RemovedFromGroupBroadcast)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for RemovedFromGroupBroadcast, &type metadata for RemovedFromGroupBroadcast);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type RemovedFromGroupBroadcast and conformance RemovedFromGroupBroadcast);
    return v0;
  }
  return v2;
}

_QWORD *implicit closure #12 in implicit closure #11 in GPKGroupManager.registerHandlers()(uint64_t *a1, uint64_t a2)
{
  char v2;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v7 = 0;
  v8 = 0;
  v6 = 0;
  v2 = *((_BYTE *)a1 + 8);
  v7 = *a1;
  v8 = v2 & 1;
  v6 = a2;
  v4 = v7;
  v5 = v2 & 1;
  return GPKGroupManager.handleRemovedFromGroupBroadcast(broadcast:)(&v4);
}

_QWORD *GPKGroupManager.handleRemovedFromGroupBroadcast(broadcast:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *result;
  uint64_t ObjectType;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[32];
  _QWORD v10[2];
  uint64_t v11;
  _QWORD *v12;

  v12 = 0;
  v11 = 0;
  v10[0] = 0;
  v10[1] = 0;
  v5 = *a1;
  v12 = a1;
  v11 = v1;
  v6 = GPKGroupManager.subscribers.modify();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Weak<GPKGroupManagerEventSubscriber>]);
  Array.allObjects<A>()(v2);
  ((void (*)(_BYTE *, _QWORD))v6)(v9, 0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GPKGroupManagerEventSubscriber]);
  lazy protocol witness table accessor for type [GPKGroupManagerEventSubscriber] and conformance [A]();
  Collection<>.makeIterator()();
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<[GPKGroupManagerEventSubscriber]>);
    IndexingIterator.next()();
    if (!v7)
      break;
    ObjectType = swift_getObjectType();
    swift_retain();
    (*(void (**)(uint64_t, uint64_t))(v8 + 72))(v5, ObjectType);
    swift_release();
    swift_unknownObjectRelease();
  }
  result = v10;
  outlined destroy of IndexingIterator<[GPKGroupManagerEventSubscriber]>();
  return result;
}

uint64_t (*implicit closure #13 in GPKGroupManager.registerHandlers()())(uint64_t a1)
{
  swift_retain();
  return partial apply for implicit closure #14 in implicit closure #13 in GPKGroupManager.registerHandlers();
}

unint64_t lazy protocol witness table accessor for type ReceivedGroupDeletionBroadcast and conformance ReceivedGroupDeletionBroadcast()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type ReceivedGroupDeletionBroadcast and conformance ReceivedGroupDeletionBroadcast;
  if (!lazy protocol witness table cache variable for type ReceivedGroupDeletionBroadcast and conformance ReceivedGroupDeletionBroadcast)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for ReceivedGroupDeletionBroadcast, &type metadata for ReceivedGroupDeletionBroadcast);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type ReceivedGroupDeletionBroadcast and conformance ReceivedGroupDeletionBroadcast);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type ReceivedGroupDeletionBroadcast and conformance ReceivedGroupDeletionBroadcast;
  if (!lazy protocol witness table cache variable for type ReceivedGroupDeletionBroadcast and conformance ReceivedGroupDeletionBroadcast)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for ReceivedGroupDeletionBroadcast, &type metadata for ReceivedGroupDeletionBroadcast);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type ReceivedGroupDeletionBroadcast and conformance ReceivedGroupDeletionBroadcast);
    return v0;
  }
  return v2;
}

uint64_t implicit closure #14 in implicit closure #13 in GPKGroupManager.registerHandlers()(uint64_t a1, uint64_t a2)
{
  char v2;
  uint64_t v3;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v9 = 0;
  v10 = 0;
  v11 = 0;
  v8 = 0;
  v2 = *(_BYTE *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)a1;
  v10 = v2 & 1;
  v11 = v3;
  v8 = a2;
  v5 = v9;
  v6 = v2 & 1;
  v7 = v3;
  return GPKGroupManager.handleReceivedGroupDeletionBroadcast(broadcast:)(&v5);
}

uint64_t GPKGroupManager.handleReceivedGroupDeletionBroadcast(broadcast:)(uint64_t *a1)
{
  NSNumber *v1;
  uint64_t v2;
  uint64_t ObjectType;
  uint64_t v4;
  uint64_t v6;
  char v7;
  NSNumber *v8;
  objc_class *v9;
  uint64_t v10;
  uint64_t (*v11)();
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v16[32];
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;

  v21 = 0;
  v20 = 0;
  v19 = 0;
  v17 = 0;
  v18 = 0;
  v6 = *a1;
  v7 = *((_BYTE *)a1 + 8);
  v9 = (objc_class *)a1[2];
  v21 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (SubscriberUserInfoKey, Swift.AnyObject));
  _allocateUninitializedArray<A>(_:)();
  v8 = v1;
  LOBYTE(v1->super.super.isa) = 3;
  type metadata accessor for NSNumber();
  v8[1].super.super.isa = NSNumber.__allocating_init(value:)(v7 & 1).super.super.isa;
  LOBYTE(v8[2].super.super.isa) = 2;
  swift_retain();
  v8[3].super.super.isa = v9;
  _finalizeUninitializedArray<A>(_:)();
  lazy protocol witness table accessor for type SubscriberUserInfoKey and conformance SubscriberUserInfoKey();
  v10 = Dictionary.init(dictionaryLiteral:)();
  v19 = v10;
  v11 = GPKGroupManager.subscribers.modify();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Weak<GPKGroupManagerEventSubscriber>]);
  Array.allObjects<A>()(v2);
  ((void (*)(char *, _QWORD))v11)(v16, 0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GPKGroupManagerEventSubscriber]);
  lazy protocol witness table accessor for type [GPKGroupManagerEventSubscriber] and conformance [A]();
  Collection<>.makeIterator()();
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<[GPKGroupManagerEventSubscriber]>);
    IndexingIterator.next()();
    if (!v14)
      break;
    ObjectType = swift_getObjectType();
    v13 = (*(uint64_t (**)(uint64_t))(v15 + 88))(ObjectType) & 1;
    swift_retain();
    v12 = GPKGroupManager.createSubscriberUserInfo(from:includePrivateKeys:)(v10, v13);
    v4 = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 64))(v6, v12, v4);
    swift_bridgeObjectRelease();
    swift_release();
    swift_unknownObjectRelease();
  }
  outlined destroy of IndexingIterator<[GPKGroupManagerEventSubscriber]>();
  return swift_bridgeObjectRelease();
}

_QWORD *(*implicit closure #15 in GPKGroupManager.registerHandlers()())(uint64_t a1)
{
  swift_retain();
  return partial apply for implicit closure #16 in implicit closure #15 in GPKGroupManager.registerHandlers();
}

unint64_t lazy protocol witness table accessor for type MemberInvitationResponseBroadcast and conformance MemberInvitationResponseBroadcast()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type MemberInvitationResponseBroadcast and conformance MemberInvitationResponseBroadcast;
  if (!lazy protocol witness table cache variable for type MemberInvitationResponseBroadcast and conformance MemberInvitationResponseBroadcast)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for MemberInvitationResponseBroadcast, &type metadata for MemberInvitationResponseBroadcast);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type MemberInvitationResponseBroadcast and conformance MemberInvitationResponseBroadcast);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type MemberInvitationResponseBroadcast and conformance MemberInvitationResponseBroadcast;
  if (!lazy protocol witness table cache variable for type MemberInvitationResponseBroadcast and conformance MemberInvitationResponseBroadcast)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for MemberInvitationResponseBroadcast, &type metadata for MemberInvitationResponseBroadcast);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type MemberInvitationResponseBroadcast and conformance MemberInvitationResponseBroadcast);
    return v0;
  }
  return v2;
}

_QWORD *implicit closure #16 in implicit closure #15 in GPKGroupManager.registerHandlers()(uint64_t a1, uint64_t a2)
{
  char v2;
  uint64_t v3;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v9 = 0;
  v10 = 0;
  v11 = 0;
  v8 = 0;
  v2 = *(_BYTE *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)a1;
  v10 = v2 & 1;
  v11 = v3;
  v8 = a2;
  v5 = v9;
  v6 = v2 & 1;
  v7 = v3;
  return GPKGroupManager.handleMemberInvitationResponseBroadcast(broadcast:)(&v5);
}

_QWORD *GPKGroupManager.handleMemberInvitationResponseBroadcast(broadcast:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *result;
  uint64_t v4;
  uint64_t ObjectType;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t (*v9)();
  uint64_t v10;
  uint64_t v11;
  _BYTE v12[32];
  _QWORD v13[2];
  uint64_t v14;
  uint64_t *v15;

  v15 = 0;
  v14 = 0;
  v13[0] = 0;
  v13[1] = 0;
  v6 = *a1;
  v7 = *((_BYTE *)a1 + 8);
  v8 = a1[2];
  v15 = a1;
  v14 = v1;
  v9 = GPKGroupManager.subscribers.modify();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Weak<GPKGroupManagerEventSubscriber>]);
  Array.allObjects<A>()(v2);
  ((void (*)(_BYTE *, _QWORD))v9)(v12, 0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GPKGroupManagerEventSubscriber]);
  lazy protocol witness table accessor for type [GPKGroupManagerEventSubscriber] and conformance [A]();
  Collection<>.makeIterator()();
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<[GPKGroupManagerEventSubscriber]>);
    IndexingIterator.next()();
    if (!v10)
      break;
    if ((v7 & 1) != 0)
    {
      ObjectType = swift_getObjectType();
      swift_retain();
      swift_retain();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v8, v6, ObjectType);
    }
    else
    {
      v4 = swift_getObjectType();
      swift_retain();
      swift_retain();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 40))(v8, v6, v4);
    }
    swift_release();
    swift_release();
    swift_unknownObjectRelease();
  }
  result = v13;
  outlined destroy of IndexingIterator<[GPKGroupManagerEventSubscriber]>();
  return result;
}

_QWORD *(*implicit closure #17 in GPKGroupManager.registerHandlers()())(uint64_t a1)
{
  swift_retain();
  return partial apply for implicit closure #18 in implicit closure #17 in GPKGroupManager.registerHandlers();
}

unint64_t lazy protocol witness table accessor for type InvitationDeletedBroadcast and conformance InvitationDeletedBroadcast()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type InvitationDeletedBroadcast and conformance InvitationDeletedBroadcast;
  if (!lazy protocol witness table cache variable for type InvitationDeletedBroadcast and conformance InvitationDeletedBroadcast)
  {
    v0 = type metadata accessor for InvitationDeletedBroadcast();
    v1 = MEMORY[0x2426331CC](&protocol conformance descriptor for InvitationDeletedBroadcast, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type InvitationDeletedBroadcast and conformance InvitationDeletedBroadcast);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type InvitationDeletedBroadcast and conformance InvitationDeletedBroadcast;
  if (!lazy protocol witness table cache variable for type InvitationDeletedBroadcast and conformance InvitationDeletedBroadcast)
  {
    v0 = type metadata accessor for InvitationDeletedBroadcast();
    v1 = MEMORY[0x2426331CC](&protocol conformance descriptor for InvitationDeletedBroadcast, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type InvitationDeletedBroadcast and conformance InvitationDeletedBroadcast);
    return v1;
  }
  return v3;
}

unint64_t lazy protocol witness table accessor for type [GPKGroupManagerEventSubscriber] and conformance [A]()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [GPKGroupManagerEventSubscriber] and conformance [A];
  if (!lazy protocol witness table cache variable for type [GPKGroupManagerEventSubscriber] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [GPKGroupManagerEventSubscriber]);
    v1 = MEMORY[0x2426331CC](MEMORY[0x24BEE12E0], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [GPKGroupManagerEventSubscriber] and conformance [A]);
    return v1;
  }
  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of IndexingIterator<[GPKGroupManagerEventSubscriber]>()
{
  swift_bridgeObjectRelease();
}

unint64_t type metadata accessor for NSArray()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = lazy cache variable for type metadata for NSArray;
  if (!lazy cache variable for type metadata for NSArray)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for NSArray);
    return ObjCClassMetadata;
  }
  return v2;
}

_QWORD *implicit closure #18 in implicit closure #17 in GPKGroupManager.registerHandlers()(uint64_t a1)
{
  return GPKGroupManager.handleInvitationDeletedBroadcast(broadcast:)(a1);
}

_QWORD *GPKGroupManager.handleInvitationDeletedBroadcast(broadcast:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *result;
  uint64_t ObjectType;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t (*v14)();
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;

  v11 = a1;
  v27 = 0;
  v26 = 0;
  v17 = v25;
  v25[0] = 0;
  v25[1] = 0;
  v19 = 0;
  v20 = 0;
  v12 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for GPKGroupID() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v13 = (uint64_t)&ObjectType - v12;
  v27 = MEMORY[0x24BDAC7A8](v11);
  v26 = v1;
  v15 = &v24;
  v14 = GPKGroupManager.subscribers.modify();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Weak<GPKGroupManagerEventSubscriber>]);
  v16 = Array.allObjects<A>()(v2);
  ((void (*)(char *, _QWORD))v14)(v15, 0);
  v23 = v16;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GPKGroupManagerEventSubscriber]);
  lazy protocol witness table accessor for type [GPKGroupManagerEventSubscriber] and conformance [A]();
  Collection<>.makeIterator()();
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<[GPKGroupManagerEventSubscriber]>);
    IndexingIterator.next()();
    v9 = v21;
    v10 = v22;
    if (!v21)
      break;
    v7 = v9;
    v8 = v10;
    v5 = v10;
    v6 = v9;
    v19 = v9;
    v20 = v10;
    ObjectType = swift_getObjectType();
    outlined init with copy of GPKGroupID(v11, v13);
    (*(void (**)(uint64_t, uint64_t))(v5 + 80))(v13, ObjectType);
    outlined destroy of GPKGroupID(v13);
    swift_unknownObjectRelease();
  }
  result = v25;
  outlined destroy of IndexingIterator<[GPKGroupManagerEventSubscriber]>();
  return result;
}

uint64_t GPKGroupManager.createGroup(with:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[7] = v1;
  v2[6] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[4] = 0;
  v2[3] = a1;
  v2[4] = v1;
  return swift_task_switch();
}

uint64_t GPKGroupManager.createGroup(with:)()
{
  _QWORD *v0;
  char **v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v6 = v0[7];
  v5 = v0[6];
  v0[2] = v0;
  v1 = StaticString.keyRegistration.unsafeMutableAddressor();
  v11 = (uint64_t)*v1;
  v8 = (uint64_t)v1[1];
  v9 = *((_BYTE *)v1 + 16);
  swift_retain();
  swift_retain();
  v10 = swift_task_alloc();
  v0[8] = v10;
  *(_QWORD *)(v10 + 16) = v5;
  *(_QWORD *)(v10 + 24) = v6;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 72) = v2;
  v3 = type metadata accessor for GPKGroup();
  *v2 = *(_QWORD *)(v7 + 16);
  v2[1] = GPKGroupManager.createGroup(with:);
  return signpost<A>(_:_:)(v7 + 40, v11, v8, v9, (uint64_t)&async function pointer to partial apply for closure #1 in GPKGroupManager.createGroup(with:), v10, v3);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 16) = *v1;
  *(_QWORD *)(v2 + 80) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_task_dealloc();
    swift_release();
    swift_release();
  }
  return swift_task_switch();
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = v0;
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v0 + 16) + 8))(*(_QWORD *)(v0 + 40));
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  return (*(uint64_t (**)())(*(_QWORD *)(v0 + 16) + 8))();
}

uint64_t closure #1 in GPKGroupManager.createGroup(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[14] = a3;
  v3[13] = a2;
  v3[12] = a1;
  v3[7] = v3;
  v3[8] = 0;
  v3[9] = 0;
  v3[10] = 0;
  v3[8] = a2;
  v3[9] = a3;
  return swift_task_switch();
}

uint64_t closure #1 in GPKGroupManager.createGroup(with:)()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t GroupXPCMessage;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(_QWORD, _QWORD *, ValueMetadata *, unint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v5 = v0[14];
  v4 = v0[13];
  v0[7] = v0;
  swift_retain();
  CreateGroupXPCMessage.init(request:)(v4, &v12);
  v6 = v12;
  v0[15] = v12;
  v0[10] = v6;
  outlined init with copy of MessageSenderProtocol(v5 + 16, (uint64_t)(v0 + 2));
  v9 = v0[5];
  v10 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v9);
  v8 = v0 + 11;
  v0[11] = v6;
  v11 = (uint64_t (*)(_QWORD, _QWORD *, ValueMetadata *, unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 + 8) + **(int **)(v10 + 8));
  v1 = (_QWORD *)swift_task_alloc();
  v7[16] = v1;
  GroupXPCMessage = lazy protocol witness table accessor for type CreateGroupXPCMessage and conformance CreateGroupXPCMessage();
  *v1 = v7[7];
  v1[1] = closure #1 in GPKGroupManager.createGroup(with:);
  return v11(v7[12], v8, &type metadata for CreateGroupXPCMessage, GroupXPCMessage, v9, v10);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = *v1;
  *(_QWORD *)(v2 + 136) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 56) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 56) + 8))();
}

{
  uint64_t v0;
  uint64_t v2;

  *(_QWORD *)(v0 + 56) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 56) + 8))();
}

uint64_t GPKGroupManager.fetchGroup(with:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[7] = v1;
  v2[6] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[4] = 0;
  v2[3] = a1;
  v2[4] = v1;
  return swift_task_switch();
}

uint64_t GPKGroupManager.fetchGroup(with:)()
{
  _QWORD *v0;
  char **v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v6 = v0[7];
  v5 = v0[6];
  v0[2] = v0;
  v1 = StaticString.fetchGroupByID.unsafeMutableAddressor();
  v8 = (uint64_t)*v1;
  v9 = (uint64_t)v1[1];
  v10 = *((_BYTE *)v1 + 16);
  swift_retain();
  swift_retain();
  v11 = swift_task_alloc();
  v0[8] = v11;
  *(_QWORD *)(v11 + 16) = v5;
  *(_QWORD *)(v11 + 24) = v6;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 72) = v2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GPKGroup?);
  *v2 = *(_QWORD *)(v7 + 16);
  v2[1] = GPKGroupManager.fetchGroup(with:);
  return signpost<A>(_:_:)(v7 + 40, v8, v9, v10, (uint64_t)&async function pointer to partial apply for closure #1 in GPKGroupManager.fetchGroup(with:), v11, v3);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 16) = *v1;
  *(_QWORD *)(v2 + 80) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_task_dealloc();
    swift_release();
    swift_release();
  }
  return swift_task_switch();
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = v0;
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v0 + 16) + 8))(*(_QWORD *)(v0 + 40));
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  return (*(uint64_t (**)())(*(_QWORD *)(v0 + 16) + 8))();
}

uint64_t closure #1 in GPKGroupManager.fetchGroup(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[8] = a3;
  v3[7] = a2;
  v3[6] = a1;
  v3[2] = v3;
  v3[3] = 0;
  v3[4] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GPKGroupID?);
  v3[9] = swift_task_alloc();
  v3[3] = a2;
  v3[4] = a3;
  return swift_task_switch();
}

uint64_t closure #1 in GPKGroupManager.fetchGroup(with:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  Swift::String v5;
  os_log_type_t v6;
  Swift::String fileID;
  _QWORD *v8;
  uint64_t (*v9)(_QWORD);
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;

  v11 = v0[9];
  v1 = v0[7];
  v0[2] = v0;
  (*(void (**)(void))(*(_QWORD *)v1 + 144))();
  v2 = type metadata accessor for GPKGroupID();
  if ((*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(v11, 1) == 1)
  {
    outlined destroy of GPKGroupID?(*(_QWORD *)(v10 + 72));
    v8 = *(_QWORD **)(v10 + 48);
    v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Request doesn't contain group identifier to fetch a single group", 0x40uLL, 1);
    fileID = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GroupKit/GPKGroupManager.swift", 0x1EuLL, 1);
    v6 = default argument 1 of gpklog(_:type:fileID:line:subsystem:)();
    default argument 4 of gpklog(_:type:fileID:line:subsystem:)(&v12);
    v13 = v12 & 1;
    gpklog(_:type:fileID:line:subsystem:)(v5, v6, fileID, 107, (GroupKit::LogSubsystem)&v13);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *v8 = 0;
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(*(_QWORD *)(v10 + 16) + 8))();
  }
  else
  {
    outlined destroy of GPKGroupID?(*(_QWORD *)(v10 + 72));
    v9 = (uint64_t (*)(_QWORD))(*(_QWORD *)(**(_QWORD **)(v10 + 64) + 192)
                                        + **(int **)(**(_QWORD **)(v10 + 64) + 192));
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v10 + 80) = v3;
    *v3 = *(_QWORD *)(v10 + 16);
    v3[1] = closure #1 in GPKGroupManager.fetchGroup(with:);
    return v9(*(_QWORD *)(v10 + 56));
  }
}

{
  _QWORD *v0;
  uint64_t v2;

  v2 = v0[11];
  v0[2] = v0;
  swift_bridgeObjectRetain();
  v0[5] = v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GPKGroup]);
  lazy protocol witness table accessor for type [GPKGroup] and conformance [A]();
  Collection.first.getter();
  outlined destroy of [GPKGroup]();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[2] + 8))();
}

_QWORD *closure #1 in GPKGroupManager.fetchGroup(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  _QWORD *v5;

  v3 = *v2;
  *(_QWORD *)(v3 + 16) = *v2;
  v5 = (_QWORD *)(v3 + 16);
  *(_QWORD *)(v3 + 88) = a1;
  swift_task_dealloc();
  if (!v1)
    return (_QWORD *)swift_task_switch();
  swift_task_dealloc();
  return (*(_QWORD *(**)(_QWORD *__return_ptr))(*v5 + 8))(v5);
}

uint64_t GPKGroupManager.fetchGroups(with:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[7] = v1;
  v2[6] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[4] = 0;
  v2[3] = a1;
  v2[4] = v1;
  return swift_task_switch();
}

uint64_t GPKGroupManager.fetchGroups(with:)()
{
  _QWORD *v0;
  char **v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v6 = v0[7];
  v5 = v0[6];
  v0[2] = v0;
  v1 = StaticString.fetchGroups.unsafeMutableAddressor();
  v8 = (uint64_t)*v1;
  v9 = (uint64_t)v1[1];
  v10 = *((_BYTE *)v1 + 16);
  swift_retain();
  swift_retain();
  v11 = swift_task_alloc();
  v0[8] = v11;
  *(_QWORD *)(v11 + 16) = v5;
  *(_QWORD *)(v11 + 24) = v6;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 72) = v2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GPKGroup]);
  *v2 = *(_QWORD *)(v7 + 16);
  v2[1] = GPKGroupManager.fetchGroups(with:);
  return signpost<A>(_:_:)(v7 + 40, v8, v9, v10, (uint64_t)&async function pointer to partial apply for closure #1 in GPKGroupManager.fetchGroups(with:), v11, v3);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 16) = *v1;
  *(_QWORD *)(v2 + 80) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_task_dealloc();
    swift_release();
    swift_release();
  }
  return swift_task_switch();
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = v0;
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v0 + 16) + 8))(*(_QWORD *)(v0 + 40));
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  return (*(uint64_t (**)())(*(_QWORD *)(v0 + 16) + 8))();
}

uint64_t closure #1 in GPKGroupManager.fetchGroups(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[14] = a3;
  v3[13] = a2;
  v3[12] = a1;
  v3[7] = v3;
  v3[8] = 0;
  v3[9] = 0;
  v3[10] = 0;
  v3[8] = a2;
  v3[9] = a3;
  return swift_task_switch();
}

uint64_t closure #1 in GPKGroupManager.fetchGroups(with:)()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t GroupsXPCMessage;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(_QWORD, _QWORD *, ValueMetadata *, unint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v5 = v0[14];
  v4 = v0[13];
  v0[7] = v0;
  swift_retain();
  FetchGroupsXPCMessage.init(request:)(v4, &v12);
  v6 = v12;
  v0[15] = v12;
  v0[10] = v6;
  outlined init with copy of MessageSenderProtocol(v5 + 16, (uint64_t)(v0 + 2));
  v9 = v0[5];
  v10 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v9);
  v8 = v0 + 11;
  v0[11] = v6;
  v11 = (uint64_t (*)(_QWORD, _QWORD *, ValueMetadata *, unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 + 8) + **(int **)(v10 + 8));
  v1 = (_QWORD *)swift_task_alloc();
  v7[16] = v1;
  GroupsXPCMessage = lazy protocol witness table accessor for type FetchGroupsXPCMessage and conformance FetchGroupsXPCMessage();
  *v1 = v7[7];
  v1[1] = closure #1 in GPKGroupManager.fetchGroups(with:);
  return v11(v7[12], v8, &type metadata for FetchGroupsXPCMessage, GroupsXPCMessage, v9, v10);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = *v1;
  *(_QWORD *)(v2 + 136) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 56) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 56) + 8))();
}

{
  uint64_t v0;
  uint64_t v2;

  *(_QWORD *)(v0 + 56) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 56) + 8))();
}

uint64_t GPKGroupManager.updateGroup(with:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[7] = v1;
  v2[6] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[4] = 0;
  v2[3] = a1;
  v2[4] = v1;
  return swift_task_switch();
}

uint64_t GPKGroupManager.updateGroup(with:)()
{
  _QWORD *v0;
  char **v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v6 = v0[7];
  v5 = v0[6];
  v0[2] = v0;
  v1 = StaticString.updateGroup.unsafeMutableAddressor();
  v11 = (uint64_t)*v1;
  v8 = (uint64_t)v1[1];
  v9 = *((_BYTE *)v1 + 16);
  swift_retain();
  swift_retain();
  v10 = swift_task_alloc();
  v0[8] = v10;
  *(_QWORD *)(v10 + 16) = v5;
  *(_QWORD *)(v10 + 24) = v6;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 72) = v2;
  v3 = type metadata accessor for GPKGroup();
  *v2 = *(_QWORD *)(v7 + 16);
  v2[1] = GPKGroupManager.updateGroup(with:);
  return signpost<A>(_:_:)(v7 + 40, v11, v8, v9, (uint64_t)&async function pointer to partial apply for closure #1 in GPKGroupManager.updateGroup(with:), v10, v3);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 16) = *v1;
  *(_QWORD *)(v2 + 80) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_task_dealloc();
    swift_release();
    swift_release();
  }
  return swift_task_switch();
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = v0;
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v0 + 16) + 8))(*(_QWORD *)(v0 + 40));
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  return (*(uint64_t (**)())(*(_QWORD *)(v0 + 16) + 8))();
}

uint64_t closure #1 in GPKGroupManager.updateGroup(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[14] = a3;
  v3[13] = a2;
  v3[12] = a1;
  v3[7] = v3;
  v3[8] = 0;
  v3[9] = 0;
  v3[10] = 0;
  v3[8] = a2;
  v3[9] = a3;
  return swift_task_switch();
}

uint64_t closure #1 in GPKGroupManager.updateGroup(with:)()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t updated;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(_QWORD, _QWORD *, ValueMetadata *, unint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v5 = v0[14];
  v4 = v0[13];
  v0[7] = v0;
  swift_retain();
  UpdateGroupXPCMessage.init(request:)(v4, &v12);
  v6 = v12;
  v0[15] = v12;
  v0[10] = v6;
  outlined init with copy of MessageSenderProtocol(v5 + 16, (uint64_t)(v0 + 2));
  v9 = v0[5];
  v10 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v9);
  v8 = v0 + 11;
  v0[11] = v6;
  v11 = (uint64_t (*)(_QWORD, _QWORD *, ValueMetadata *, unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 + 8) + **(int **)(v10 + 8));
  v1 = (_QWORD *)swift_task_alloc();
  v7[16] = v1;
  updated = lazy protocol witness table accessor for type UpdateGroupXPCMessage and conformance UpdateGroupXPCMessage();
  *v1 = v7[7];
  v1[1] = closure #1 in GPKGroupManager.updateGroup(with:);
  return v11(v7[12], v8, &type metadata for UpdateGroupXPCMessage, updated, v9, v10);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = *v1;
  *(_QWORD *)(v2 + 136) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 56) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 56) + 8))();
}

{
  uint64_t v0;
  uint64_t v2;

  *(_QWORD *)(v0 + 56) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 56) + 8))();
}

uint64_t GPKGroupManager.updateMembership(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 80) = v1;
  *(_QWORD *)(v2 + 72) = a1;
  *(_QWORD *)(v2 + 40) = v2;
  *(_QWORD *)(v2 + 48) = 0;
  *(_QWORD *)(v2 + 56) = 0;
  *(_QWORD *)(v2 + 16) = 0;
  *(_QWORD *)(v2 + 24) = 0;
  *(_BYTE *)(v2 + 32) = 0;
  *(_QWORD *)(v2 + 88) = type metadata accessor for GPKMembershipRequest();
  *(_QWORD *)(v2 + 96) = swift_task_alloc();
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = v1;
  return swift_task_switch();
}

uint64_t GPKGroupManager.updateMembership(with:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  char **v3;
  char *v4;
  char v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = v0[11];
  v2 = v0[9];
  v0[5] = v0;
  if ((*(_BYTE *)(v2 + *(int *)(v1 + 20)) & 1) != 0)
    v3 = StaticString.leaveGroup.unsafeMutableAddressor();
  else
    v3 = StaticString.demoteGroup.unsafeMutableAddressor();
  v4 = v3[1];
  v5 = *((_BYTE *)v3 + 16);
  *(_QWORD *)(v15 + 16) = *v3;
  *(_QWORD *)(v15 + 24) = v4;
  *(_BYTE *)(v15 + 32) = v5;
  v9 = *(_QWORD *)(v15 + 96);
  v10 = *(_QWORD *)(v15 + 80);
  v14 = *(_QWORD *)(v15 + 16);
  v11 = *(_QWORD *)(v15 + 24);
  v12 = *(_BYTE *)(v15 + 32);
  outlined init with copy of GPKMembershipRequest(*(_QWORD *)(v15 + 72), v9);
  swift_retain();
  v13 = swift_task_alloc();
  *(_QWORD *)(v15 + 104) = v13;
  *(_QWORD *)(v13 + 16) = v9;
  *(_QWORD *)(v13 + 24) = v10;
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v15 + 112) = v6;
  v7 = type metadata accessor for GPKGroup();
  *v6 = *(_QWORD *)(v15 + 40);
  v6[1] = GPKGroupManager.updateMembership(with:);
  return signpost<A>(_:_:)(v15 + 64, v14, v11, v12, (uint64_t)&async function pointer to partial apply for closure #1 in GPKGroupManager.updateMembership(with:), v13, v7);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v2 = *v1;
  *(_QWORD *)(v2 + 40) = *v1;
  v2 += 40;
  v5 = v2 - 24;
  *(_QWORD *)(v2 + 80) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    v4 = *(_QWORD *)(v5 + 80);
    swift_task_dealloc();
    outlined destroy of GPKMembershipRequest(v4);
    swift_release();
  }
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v2;

  *(_QWORD *)(v0 + 40) = v0;
  v2 = *(_QWORD *)(v0 + 64);
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v0 + 40) + 8))(v2);
}

{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 96);
  *(_QWORD *)(v0 + 40) = v0;
  swift_task_dealloc();
  outlined destroy of GPKMembershipRequest(v2);
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)())(*(_QWORD *)(v0 + 40) + 8))();
}

uint64_t closure #1 in GPKGroupManager.updateMembership(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[12] = a3;
  v3[11] = a2;
  v3[10] = a1;
  v3[7] = v3;
  v3[8] = 0;
  v3[9] = 0;
  type metadata accessor for GPKMembershipRequest();
  v3[13] = swift_task_alloc();
  v3[14] = type metadata accessor for MembershipXPCMessage();
  v3[15] = swift_task_alloc();
  v3[8] = a2;
  v3[9] = a3;
  return swift_task_switch();
}

uint64_t closure #1 in GPKGroupManager.updateMembership(with:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(_QWORD, _QWORD, _QWORD, unint64_t, uint64_t, uint64_t);

  v6 = v0[15];
  v1 = v0[13];
  v7 = v1;
  v8 = v0[12];
  v2 = v0[11];
  v0[7] = v0;
  outlined init with copy of GPKMembershipRequest(v2, v1);
  MembershipXPCMessage.init(request:)(v7, v6);
  outlined init with copy of MessageSenderProtocol(v8 + 16, (uint64_t)(v0 + 2));
  v10 = v0[5];
  v11 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v10);
  v12 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 + 8)
                                                                                           + **(int **)(v11 + 8));
  v3 = (_QWORD *)swift_task_alloc();
  v9[16] = v3;
  v4 = lazy protocol witness table accessor for type MembershipXPCMessage and conformance MembershipXPCMessage();
  *v3 = v9[7];
  v3[1] = closure #1 in GPKGroupManager.updateMembership(with:);
  return v12(v9[10], v9[15], v9[14], v4, v10, v11);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = *v1;
  *(_QWORD *)(v2 + 136) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 120);
  *(_QWORD *)(v0 + 56) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  outlined destroy of MembershipXPCMessage(v2);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 56) + 8))();
}

{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 120);
  *(_QWORD *)(v0 + 56) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  outlined destroy of MembershipXPCMessage(v2);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v3 + 56) + 8))();
}

uint64_t GPKGroupManager.deleteGroup(with:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[6] = v1;
  v2[5] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[4] = 0;
  v2[3] = a1;
  v2[4] = v1;
  return swift_task_switch();
}

uint64_t GPKGroupManager.deleteGroup(with:)()
{
  _QWORD *v0;
  char **v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v5 = v0[6];
  v4 = v0[5];
  v0[2] = v0;
  v1 = StaticString.deleteGroup.unsafeMutableAddressor();
  v7 = (uint64_t)*v1;
  v8 = (uint64_t)v1[1];
  v9 = *((_BYTE *)v1 + 16);
  swift_retain();
  swift_retain();
  v10 = swift_task_alloc();
  v0[7] = v10;
  *(_QWORD *)(v10 + 16) = v4;
  *(_QWORD *)(v10 + 24) = v5;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 64) = v2;
  *v2 = *(_QWORD *)(v6 + 16);
  v2[1] = GPKGroupManager.deleteGroup(with:);
  return signpost<A>(_:_:)(v11, v7, v8, v9, (uint64_t)&async function pointer to partial apply for closure #1 in GPKGroupManager.deleteGroup(with:), v10, (uint64_t)&type metadata for NoReply);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 16) = *v1;
  *(_QWORD *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_task_dealloc();
    swift_release();
    swift_release();
  }
  return swift_task_switch();
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = v0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 8))();
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 8))();
}

uint64_t closure #1 in GPKGroupManager.deleteGroup(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[14] = a3;
  v3[13] = a2;
  v3[12] = a1;
  v3[7] = v3;
  v3[8] = 0;
  v3[9] = 0;
  v3[10] = 0;
  v3[8] = a2;
  v3[9] = a3;
  return swift_task_switch();
}

uint64_t closure #1 in GPKGroupManager.deleteGroup(with:)()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(_QWORD, _QWORD *, ValueMetadata *, unint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v5 = v0[14];
  v4 = v0[13];
  v0[7] = v0;
  swift_retain();
  DeleteGroupXPCMessage.init(request:)(v4, &v12);
  v6 = v12;
  v0[15] = v12;
  v0[10] = v6;
  outlined init with copy of MessageSenderProtocol(v5 + 16, (uint64_t)(v0 + 2));
  v9 = v0[5];
  v10 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v9);
  v8 = v0 + 11;
  v0[11] = v6;
  v11 = (uint64_t (*)(_QWORD, _QWORD *, ValueMetadata *, unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 + 8) + **(int **)(v10 + 8));
  v1 = (_QWORD *)swift_task_alloc();
  v7[16] = v1;
  v2 = lazy protocol witness table accessor for type DeleteGroupXPCMessage and conformance DeleteGroupXPCMessage();
  *v1 = v7[7];
  v1[1] = closure #1 in GPKGroupManager.deleteGroup(with:);
  return v11(v7[12], v8, &type metadata for DeleteGroupXPCMessage, v2, v9, v10);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = *v1;
  *(_QWORD *)(v2 + 136) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 56) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 56) + 8))();
}

{
  uint64_t v0;
  uint64_t v2;

  *(_QWORD *)(v0 + 56) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 56) + 8))();
}

uint64_t GPKGroupManager.destruct(with:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);

  v2[2] = v2;
  v2[3] = 0;
  v2[4] = 0;
  v2[3] = a1;
  v2[4] = v1;
  v6 = (uint64_t (*)(uint64_t))(*(_QWORD *)(*(_QWORD *)v1 + 216) + **(int **)(*(_QWORD *)v1 + 216));
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 40) = v3;
  *v3 = *(_QWORD *)(v5 + 16);
  v3[1] = GPKGroupManager.destruct(with:);
  return v6(a1);
}

_QWORD *GPKGroupManager.destruct(with:)()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v3;

  v1 = *v0;
  *(_QWORD *)(v1 + 16) = *v0;
  v3 = (_QWORD *)(v1 + 16);
  swift_task_dealloc();
  return (*(_QWORD *(**)(_QWORD *__return_ptr))(*v3 + 8))(v3);
}

uint64_t GPKGroupManager.fetchProfileInformation(with:)(uint64_t *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[6] = v1;
  v2[2] = v2;
  v2[3] = 0;
  v2[4] = 0;
  v3 = *a1;
  v2[7] = *a1;
  v2[3] = v3;
  v2[4] = v1;
  return swift_task_switch();
}

uint64_t GPKGroupManager.fetchProfileInformation(with:)()
{
  _QWORD *v0;
  char **v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v5 = v0[7];
  v6 = v0[6];
  v0[2] = v0;
  v1 = StaticString.fetchProfile.unsafeMutableAddressor();
  v11 = (uint64_t)*v1;
  v8 = (uint64_t)v1[1];
  v9 = *((_BYTE *)v1 + 16);
  swift_bridgeObjectRetain();
  swift_retain();
  v10 = swift_task_alloc();
  v0[8] = v10;
  *(_QWORD *)(v10 + 16) = v5;
  *(_QWORD *)(v10 + 24) = v6;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 72) = v2;
  v3 = type metadata accessor for GPKProfileInformationResponse();
  *v2 = *(_QWORD *)(v7 + 16);
  v2[1] = GPKGroupManager.fetchProfileInformation(with:);
  return signpost<A>(_:_:)(v7 + 40, v11, v8, v9, (uint64_t)&async function pointer to partial apply for closure #1 in GPKGroupManager.fetchProfileInformation(with:), v10, v3);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 16) = *v1;
  *(_QWORD *)(v2 + 80) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_task_dealloc();
    swift_bridgeObjectRelease();
    swift_release();
  }
  return swift_task_switch();
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = v0;
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v0 + 16) + 8))(*(_QWORD *)(v0 + 40));
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  return (*(uint64_t (**)())(*(_QWORD *)(v0 + 16) + 8))();
}

uint64_t closure #1 in GPKGroupManager.fetchProfileInformation(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[14] = a3;
  v3[13] = a2;
  v3[12] = a1;
  v3[7] = v3;
  v3[8] = 0;
  v3[9] = 0;
  v3[10] = 0;
  v3[8] = a2;
  v3[9] = a3;
  return swift_task_switch();
}

uint64_t closure #1 in GPKGroupManager.fetchProfileInformation(with:)()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(_QWORD, _QWORD *, ValueMetadata *, unint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;

  v5 = v0[14];
  v4 = v0[13];
  v0[7] = v0;
  swift_bridgeObjectRetain();
  v13 = v4;
  ProfileInformationXPCMessage.init(request:)(&v13, &v12);
  v6 = v12;
  v0[15] = v12;
  v0[10] = v6;
  outlined init with copy of MessageSenderProtocol(v5 + 16, (uint64_t)(v0 + 2));
  v9 = v0[5];
  v10 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v9);
  v8 = v0 + 11;
  v0[11] = v6;
  v11 = (uint64_t (*)(_QWORD, _QWORD *, ValueMetadata *, unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 + 8) + **(int **)(v10 + 8));
  v1 = (_QWORD *)swift_task_alloc();
  v7[16] = v1;
  v2 = lazy protocol witness table accessor for type ProfileInformationXPCMessage and conformance ProfileInformationXPCMessage();
  *v1 = v7[7];
  v1[1] = closure #1 in GPKGroupManager.fetchProfileInformation(with:);
  return v11(v7[12], v8, &type metadata for ProfileInformationXPCMessage, v2, v9, v10);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = *v1;
  *(_QWORD *)(v2 + 136) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 56) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 56) + 8))();
}

{
  uint64_t v0;
  uint64_t v2;

  *(_QWORD *)(v0 + 56) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 56) + 8))();
}

uint64_t GPKGroupManager.rsvp(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 80) = v1;
  *(_QWORD *)(v2 + 72) = a1;
  *(_QWORD *)(v2 + 40) = v2;
  *(_QWORD *)(v2 + 48) = 0;
  *(_QWORD *)(v2 + 56) = 0;
  *(_QWORD *)(v2 + 16) = 0;
  *(_QWORD *)(v2 + 24) = 0;
  *(_BYTE *)(v2 + 32) = 0;
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = v1;
  return swift_task_switch();
}

uint64_t GPKGroupManager.rsvp(with:)()
{
  uint64_t v0;
  uint64_t v1;
  char **v2;
  char *v3;
  char v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = *(_QWORD *)(v0 + 72);
  *(_QWORD *)(v0 + 40) = v0;
  if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC8GroupKit14GPKRSVPRequest_rsvp) & 1) != 0)
    v2 = StaticString.declineInvitation.unsafeMutableAddressor();
  else
    v2 = StaticString.acceptInvitation.unsafeMutableAddressor();
  v3 = v2[1];
  v4 = *((_BYTE *)v2 + 16);
  *(_QWORD *)(v14 + 16) = *v2;
  *(_QWORD *)(v14 + 24) = v3;
  *(_BYTE *)(v14 + 32) = v4;
  v9 = *(_QWORD *)(v14 + 80);
  v8 = *(_QWORD *)(v14 + 72);
  v13 = *(_QWORD *)(v14 + 16);
  v10 = *(_QWORD *)(v14 + 24);
  v11 = *(_BYTE *)(v14 + 32);
  swift_retain();
  swift_retain();
  v12 = swift_task_alloc();
  *(_QWORD *)(v14 + 88) = v12;
  *(_QWORD *)(v12 + 16) = v8;
  *(_QWORD *)(v12 + 24) = v9;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v14 + 96) = v5;
  v6 = type metadata accessor for GPKGroup();
  *v5 = *(_QWORD *)(v14 + 40);
  v5[1] = GPKGroupManager.rsvp(with:);
  return signpost<A>(_:_:)(v14 + 64, v13, v10, v11, (uint64_t)&async function pointer to partial apply for closure #1 in GPKGroupManager.rsvp(with:), v12, v6);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 40) = *v1;
  *(_QWORD *)(v2 + 104) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_task_dealloc();
    swift_release();
    swift_release();
  }
  return swift_task_switch();
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 40) = v0;
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v0 + 40) + 8))(*(_QWORD *)(v0 + 64));
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 40) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  return (*(uint64_t (**)())(*(_QWORD *)(v0 + 40) + 8))();
}

uint64_t closure #1 in GPKGroupManager.rsvp(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[14] = a3;
  v3[13] = a2;
  v3[12] = a1;
  v3[7] = v3;
  v3[8] = 0;
  v3[9] = 0;
  v3[10] = 0;
  v3[8] = a2;
  v3[9] = a3;
  return swift_task_switch();
}

uint64_t closure #1 in GPKGroupManager.rsvp(with:)()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(_QWORD, _QWORD *, ValueMetadata *, unint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v5 = v0[14];
  v4 = v0[13];
  v0[7] = v0;
  swift_retain();
  RSVPXPCMessage.init(request:)(v4, &v12);
  v6 = v12;
  v0[15] = v12;
  v0[10] = v6;
  outlined init with copy of MessageSenderProtocol(v5 + 16, (uint64_t)(v0 + 2));
  v9 = v0[5];
  v10 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v9);
  v8 = v0 + 11;
  v0[11] = v6;
  v11 = (uint64_t (*)(_QWORD, _QWORD *, ValueMetadata *, unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 + 8) + **(int **)(v10 + 8));
  v1 = (_QWORD *)swift_task_alloc();
  v7[16] = v1;
  v2 = lazy protocol witness table accessor for type RSVPXPCMessage and conformance RSVPXPCMessage();
  *v1 = v7[7];
  v1[1] = closure #1 in GPKGroupManager.rsvp(with:);
  return v11(v7[12], v8, &type metadata for RSVPXPCMessage, v2, v9, v10);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = *v1;
  *(_QWORD *)(v2 + 136) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 56) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 56) + 8))();
}

{
  uint64_t v0;
  uint64_t v2;

  *(_QWORD *)(v0 + 56) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 56) + 8))();
}

uint64_t GPKGroupManager.checkAvailability(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[10] = v2;
  v3[9] = a2;
  v3[8] = a1;
  v3[6] = v3;
  v3[2] = 0;
  v3[3] = 0;
  v3[7] = 0;
  v3[2] = a1;
  v3[3] = a2;
  v3[7] = v2;
  return swift_task_switch();
}

uint64_t GPKGroupManager.checkAvailability(for:)()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);

  v8 = v0[10];
  v7 = v0[9];
  v5 = v0[8];
  v0[6] = v0;
  v4 = _allocateUninitializedArray<A>(_:)();
  v6 = v1;
  swift_bridgeObjectRetain();
  *v6 = v5;
  v6[1] = v7;
  _finalizeUninitializedArray<A>(_:)();
  v0[11] = v4;
  v10 = (uint64_t (*)(uint64_t))(*(_QWORD *)(*(_QWORD *)v8 + 256) + **(int **)(*(_QWORD *)v8 + 256));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v9 + 96) = v2;
  *v2 = *(_QWORD *)(v9 + 48);
  v2[1] = GPKGroupManager.checkAvailability(for:);
  return v10(v4);
}

{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  v4 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 64);
  *(_QWORD *)(v0 + 48) = v0;
  swift_bridgeObjectRetain();
  *(_QWORD *)(v0 + 32) = v3;
  *(_QWORD *)(v0 + 40) = v4;
  MEMORY[0x24263250C]();
  outlined destroy of String();
  v5 = *(_BYTE *)(v0 + 121);
  swift_bridgeObjectRelease();
  if (v5 == 2)
    *(_BYTE *)(v2 + 120) = 0;
  else
    *(_BYTE *)(v2 + 120) = v5 & 1;
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v2 + 48) + 8))(*(_BYTE *)(v2 + 120) & 1);
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 48) = v0;
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v0 + 48) + 8))(v0 & 1);
}

{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;
  Swift::OpaquePointer handles;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, _QWORD *, ValueMetadata *, unint64_t, uint64_t, uint64_t);
  uint64_t v11;

  v5 = v0[14];
  handles._rawValue = (void *)v0[13];
  v0[7] = v0;
  swift_bridgeObjectRetain();
  CheckAvailabilityMessage.init(handles:)(handles);
  v0[15] = v11;
  v0[10] = v11;
  outlined init with copy of MessageSenderProtocol(v5 + 16, (uint64_t)(v0 + 2));
  v8 = v0[5];
  v9 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v8);
  v7 = v0 + 12;
  v0[12] = v11;
  v10 = (uint64_t (*)(uint64_t, _QWORD *, ValueMetadata *, unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 + 8) + **(int **)(v9 + 8));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 128) = v1;
  v2 = lazy protocol witness table accessor for type CheckAvailabilityMessage and conformance CheckAvailabilityMessage();
  *v1 = *(_QWORD *)(v6 + 56);
  v1[1] = GPKGroupManager.checkAvailability(for:);
  return v10(v6 + 88, v7, &type metadata for CheckAvailabilityMessage, v2, v8, v9);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = *v1;
  *(_QWORD *)(v2 + 136) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v2;

  *(_QWORD *)(v0 + 56) = v0;
  v2 = *(_QWORD *)(v0 + 88);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v0 + 56) + 8))(v2);
}

{
  uint64_t v0;
  uint64_t v2;

  *(_QWORD *)(v0 + 56) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)())(*(_QWORD *)(v2 + 56) + 8))();
}

uint64_t GPKGroupManager.checkAvailability(for:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[6] = *v2;
  v3 += 6;
  v3[7] = a1;
  v3[8] = v1;
  swift_task_dealloc();
  if (!v1)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

{
  uint64_t v1;
  _QWORD *v2;

  v2[14] = v1;
  v2[13] = a1;
  v2[7] = v2;
  v2[8] = 0;
  v2[9] = 0;
  v2[10] = 0;
  v2[8] = a1;
  v2[9] = v1;
  return swift_task_switch();
}

uint64_t GPKGroupManager.add(subscriber:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::String v6;
  uint64_t v7;
  uint64_t v8;
  Swift::String v9;
  void *v10;
  Swift::String v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v17;
  Builtin::Word v18;
  void *object;
  _QWORD *v20;
  _QWORD *v21;
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  Swift::String v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  char *v35;
  uint64_t (*v36)();
  uint64_t v37;
  unsigned int v38;
  char *v39;
  char v40;
  _QWORD v41[2];
  _QWORD v42[2];
  uint64_t (*v43[2])@<X0>(uint64_t@<X8>);
  char v44;
  char v45;
  _QWORD v46[2];
  _QWORD v47[2];
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v30 = a1;
  v31 = a2;
  v51 = 0;
  v52 = 0;
  v50 = 0;
  v17 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  v39 = (char *)&v17 - v17;
  v51 = MEMORY[0x24BDAC7A8](v30);
  v52 = v3;
  v50 = v2;
  v18 = 21;
  v4 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
  v23 = &v48;
  v48 = v4;
  v49 = v5;
  v38 = 1;
  v6 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("New subscriber added ", v18, 1);
  object = v6._object;
  DefaultStringInterpolation.appendLiteral(_:)(v6);
  swift_bridgeObjectRelease();
  swift_unknownObjectRetain();
  v20 = v47;
  v47[0] = v30;
  v47[1] = v31;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GPKGroupManagerEventSubscriber);
  v7 = String.init<A>(describing:)();
  v21 = v46;
  v46[0] = v7;
  v46[1] = v8;
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  outlined destroy of String();
  v37 = 0;
  v9 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, v38 & 1);
  v22 = v9._object;
  DefaultStringInterpolation.appendLiteral(_:)(v9);
  swift_bridgeObjectRelease();
  v25 = v48;
  v24 = v49;
  swift_bridgeObjectRetain();
  outlined destroy of DefaultStringInterpolation();
  v26 = String.init(stringInterpolation:)();
  v29 = v10;
  v28 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GroupKit/GPKGroupManager.swift", 0x1EuLL, v38 & 1);
  v27 = default argument 1 of gpklog(_:type:fileID:line:subsystem:)();
  default argument 4 of gpklog(_:type:fileID:line:subsystem:)(&v45);
  v11._countAndFlagsBits = v26;
  v11._object = v29;
  v44 = v45 & v38;
  gpklog(_:type:fileID:line:subsystem:)(v11, (os_log_type_t)v27, v28, 252, (GroupKit::LogSubsystem)&v44);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRetain();
  v42[0] = v30;
  v42[1] = v31;
  Weak.init(_:)((uint64_t)v42, v32, v43);
  v33 = v41;
  v41[0] = v43[0];
  v41[1] = v43[1];
  v35 = &v40;
  v36 = GPKGroupManager.subscribers.modify();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Weak<GPKGroupManagerEventSubscriber>]);
  Array.append(_:)();
  v12 = v34;
  ((void (*)(char *, _QWORD))v36)(v35, 0);
  v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, _QWORD))(*(_QWORD *)(v13 - 8) + 56))(v39, v38);
  swift_retain();
  v14 = (_QWORD *)swift_allocObject();
  v15 = (uint64_t)v39;
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = v12;
  _sScTss5Error_pRs_rlE8priority9operationScTyxsAA_pGScPSg_xyYaKYAcntcfC(v15, (uint64_t)&async function pointer to partial apply for closure #1 in GPKGroupManager.add(subscriber:), (uint64_t)v14);
  return swift_release();
}

uint64_t closure #1 in GPKGroupManager.add(subscriber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[9] = a4;
  v4[7] = v4;
  v4[8] = 0;
  v4[8] = a4;
  return swift_task_switch();
}

uint64_t closure #1 in GPKGroupManager.add(subscriber:)()
{
  _QWORD *v0;
  Swift::String v1;
  _QWORD *v2;
  unint64_t started;
  os_log_type_t v5;
  Swift::String fileID;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, ValueMetadata *, unint64_t, uint64_t, uint64_t);
  char v13;
  char v14;

  v7 = v0[9];
  v0[7] = v0;
  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Initiating broadcast messaging", 0x1EuLL, 1);
  fileID = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GroupKit/GPKGroupManager.swift", 0x1EuLL, 1);
  v5 = default argument 1 of gpklog(_:type:fileID:line:subsystem:)();
  default argument 4 of gpklog(_:type:fileID:line:subsystem:)(&v13);
  v14 = v13 & 1;
  gpklog(_:type:fileID:line:subsystem:)(v1, v5, fileID, 257, (GroupKit::LogSubsystem)&v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  StartBroadcastMessage.init()();
  outlined init with copy of MessageSenderProtocol(v7 + 16, (uint64_t)(v0 + 2));
  v10 = v0[5];
  v11 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v10);
  v12 = (uint64_t (*)(uint64_t, uint64_t, ValueMetadata *, unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 + 8) + **(int **)(v11 + 8));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 80) = v2;
  started = lazy protocol witness table accessor for type StartBroadcastMessage and conformance StartBroadcastMessage();
  *v2 = *(_QWORD *)(v8 + 56);
  v2[1] = closure #1 in GPKGroupManager.add(subscriber:);
  return v12(v9, v9, &type metadata for StartBroadcastMessage, started, v10, v11);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = *v1;
  *(_QWORD *)(v2 + 88) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 56) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 56) + 8))();
}

{
  uint64_t v0;
  uint64_t v2;

  *(_QWORD *)(v0 + 56) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 56) + 8))();
}

uint64_t GPKGroupManager.remove(subscriber:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v4)();
  _BYTE v5[32];
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v7 = a1;
  v8 = a2;
  v6 = v2;
  swift_unknownObjectRetain();
  v4 = GPKGroupManager.subscribers.modify();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Weak<GPKGroupManagerEventSubscriber>]);
  lazy protocol witness table accessor for type [Weak<GPKGroupManagerEventSubscriber>] and conformance [A]();
  lazy protocol witness table accessor for type [Weak<GPKGroupManagerEventSubscriber>] and conformance [A]();
  RangeReplaceableCollection<>.removeAll(where:)();
  ((void (*)(_BYTE *, _QWORD))v4)(v5, 0);
  return swift_unknownObjectRelease();
}

uint64_t closure #1 in GPKGroupManager.remove(subscriber:)()
{
  char v1;
  uint64_t v2;

  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Weak<GPKGroupManagerEventSubscriber>);
  Weak.value.getter();
  outlined destroy of Weak<GPKGroupManagerEventSubscriber>();
  if (v2)
    swift_getObjectType();
  swift_getObjectType();
  swift_unknownObjectRetain();
  v1 = === infix(_:_:)();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v1 & 1;
}

uint64_t GPKGroupManager.logMetrics(with:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[6] = v1;
  v2[5] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[4] = 0;
  type metadata accessor for GPKMetricsRequest();
  v2[7] = swift_task_alloc();
  v2[3] = a1;
  v2[4] = v1;
  return swift_task_switch();
}

uint64_t GPKGroupManager.logMetrics(with:)()
{
  _QWORD *v0;
  char **v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v5 = v0[7];
  v6 = v0[6];
  v4 = v0[5];
  v0[2] = v0;
  v1 = StaticString.logMetrics.unsafeMutableAddressor();
  v8 = (uint64_t)*v1;
  v9 = (uint64_t)v1[1];
  v10 = *((_BYTE *)v1 + 16);
  outlined init with copy of GPKMetricsRequest(v4, v5);
  swift_retain();
  v11 = swift_task_alloc();
  v0[8] = v11;
  *(_QWORD *)(v11 + 16) = v5;
  *(_QWORD *)(v11 + 24) = v6;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 72) = v2;
  *v2 = *(_QWORD *)(v7 + 16);
  v2[1] = GPKGroupManager.logMetrics(with:);
  return signpost<A>(_:_:)(v7 + 80, v8, v9, v10, (uint64_t)&async function pointer to partial apply for closure #1 in GPKGroupManager.logMetrics(with:), v11, MEMORY[0x24BEE1328]);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v2 = *v1;
  *(_QWORD *)(v2 + 16) = *v1;
  v5 = v2 + 16;
  result = swift_task_dealloc();
  if (!v0)
  {
    v4 = *(_QWORD *)(v5 + 40);
    swift_task_dealloc();
    outlined destroy of GPKMetricsRequest(v4);
    swift_release();
    return swift_task_switch();
  }
  return result;
}

{
  uint64_t v0;
  char v2;

  *(_QWORD *)(v0 + 16) = v0;
  v2 = *(_BYTE *)(v0 + 80);
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v0 + 16) + 8))(v2 & 1);
}

uint64_t closure #1 in GPKGroupManager.logMetrics(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[16] = a3;
  v3[15] = a2;
  v3[14] = a1;
  v3[9] = v3;
  v3[10] = 0;
  v3[11] = 0;
  v3[12] = 0;
  type metadata accessor for GPKMetricsRequest();
  v3[17] = swift_task_alloc();
  v3[18] = type metadata accessor for MetricsXPCMessage();
  v3[19] = swift_task_alloc();
  v3[10] = a2;
  v3[11] = a3;
  return swift_task_switch();
}

uint64_t closure #1 in GPKGroupManager.logMetrics(with:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(_QWORD *, _QWORD, _QWORD, unint64_t, uint64_t, uint64_t);

  v6 = v0[19];
  v1 = v0[17];
  v7 = v1;
  v8 = v0[16];
  v2 = v0[15];
  v0[9] = v0;
  outlined init with copy of GPKMetricsRequest(v2, v1);
  MetricsXPCMessage.init(request:)(v7, v6);
  outlined init with copy of MessageSenderProtocol(v8 + 16, (uint64_t)(v0 + 2));
  v10 = v0[5];
  v11 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v10);
  v12 = (uint64_t (*)(_QWORD *, _QWORD, _QWORD, unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 + 8)
                                                                                             + **(int **)(v11 + 8));
  v3 = (_QWORD *)swift_task_alloc();
  v9[20] = v3;
  v4 = lazy protocol witness table accessor for type MetricsXPCMessage and conformance MetricsXPCMessage();
  *v3 = v9[9];
  v3[1] = closure #1 in GPKGroupManager.logMetrics(with:);
  return v12(v9 + 22, v9[19], v9[18], v4, v10, v11);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 72) = *v1;
  *(_QWORD *)(v2 + 168) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  _QWORD *v0;
  _BYTE *v2;
  uint64_t v3;

  v3 = v0[19];
  v2 = (_BYTE *)v0[14];
  v0[9] = v0;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  *v2 = 1;
  outlined destroy of MetricsXPCMessage(v3);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[9] + 8))();
}

{
  _QWORD *v0;
  id v1;
  uint64_t v2;
  Swift::String v3;
  Swift::String v4;
  void *v5;
  Swift::String v6;
  uint64_t v8;
  uint64_t _;
  os_log_type_t __12;
  Swift::String fileID;
  void *v12;
  _BYTE *v13;
  void *v14;
  char v15;
  char v16;

  v14 = (void *)v0[21];
  v8 = v0[19];
  v13 = (_BYTE *)v0[14];
  v0[9] = v0;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  outlined destroy of MetricsXPCMessage(v8);
  v1 = v14;
  v0[12] = v14;
  v0[7] = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
  v0[8] = v2;
  v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Error occured when logging client metrics: ", 0x2BuLL, 1);
  DefaultStringInterpolation.appendLiteral(_:)(v3);
  swift_bridgeObjectRelease();
  v0[13] = v14;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  DefaultStringInterpolation.appendLiteral(_:)(v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  outlined destroy of DefaultStringInterpolation();
  _ = String.init(stringInterpolation:)();
  v12 = v5;
  __12 = static os_log_type_t.error.getter();
  fileID = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GroupKit/GPKGroupManager.swift", 0x1EuLL, 1);
  default argument 4 of gpklog(_:type:fileID:line:subsystem:)(&v15);
  v6._countAndFlagsBits = _;
  v6._object = v12;
  v16 = v15 & 1;
  gpklog(_:type:fileID:line:subsystem:)(v6, __12, fileID, 289, (GroupKit::LogSubsystem)&v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *v13 = 0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[9] + 8))();
}

uint64_t GPKGroupManager.deinit()
{
  uint64_t v0;
  uint64_t v2;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  outlined destroy of KeyConverting?(v0 + 64);
  outlined destroy of [Weak<GPKGroupManagerEventSubscriber>]();
  return v2;
}

uint64_t GPKGroupManager.__deallocating_deinit()
{
  GPKGroupManager.deinit();
  return swift_deallocClassInstance();
}

uint64_t GPKGroupManager.broadcastReceived(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v8 = a1;
  v9 = a2;
  v7 = v2;
  swift_retain();
  outlined copy of Data._Representation(a1, a2);
  v6[3] = MEMORY[0x24BDCDDE8];
  v6[4] = lazy protocol witness table accessor for type Data and conformance Data();
  v6[5] = lazy protocol witness table accessor for type Data and conformance Data();
  v6[0] = a1;
  v6[1] = a2;
  dispatch thunk of BroadcastDispatcher.handleBroadcastMessage(_:)();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)v6);
  return swift_release();
}

Swift::Void __swiftcall GPKGroupManager.daemonConnectionInvalidated()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;
  uint64_t (*v3)();
  uint64_t v4;
  uint64_t v5;
  _BYTE v6[32];
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = 0;
  v8 = 0;
  v9 = v0;
  v3 = GPKGroupManager.subscribers.modify();
  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Weak<GPKGroupManagerEventSubscriber>]);
  Array.allObjects<A>()(v1);
  ((void (*)(_BYTE *, _QWORD))v3)(v6, 0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GPKGroupManagerEventSubscriber]);
  lazy protocol witness table accessor for type [GPKGroupManagerEventSubscriber] and conformance [A]();
  Collection<>.makeIterator()();
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<[GPKGroupManagerEventSubscriber]>);
    IndexingIterator.next()();
    if (!v4)
      break;
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t))(v5 + 96))(ObjectType);
    swift_unknownObjectRelease();
  }
  outlined destroy of IndexingIterator<[GPKGroupManagerEventSubscriber]>();
}

NSArray __swiftcall NSArray.__allocating_init(array:)(Swift::OpaquePointer array)
{
  id v1;

  v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (NSArray)@nonobjc NSArray.init(array:)();
}

unint64_t type metadata accessor for NSNumber()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = lazy cache variable for type metadata for NSNumber;
  if (!lazy cache variable for type metadata for NSNumber)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
    return ObjCClassMetadata;
  }
  return v2;
}

NSNumber __swiftcall NSNumber.__allocating_init(value:)(Swift::Bool value)
{
  id v1;

  v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (NSNumber)@nonobjc NSNumber.init(value:)(value);
}

unint64_t lazy protocol witness table accessor for type SubscriberUserInfoKey and conformance SubscriberUserInfoKey()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type SubscriberUserInfoKey and conformance SubscriberUserInfoKey;
  if (!lazy protocol witness table cache variable for type SubscriberUserInfoKey and conformance SubscriberUserInfoKey)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for SubscriberUserInfoKey, &type metadata for SubscriberUserInfoKey);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type SubscriberUserInfoKey and conformance SubscriberUserInfoKey);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type SubscriberUserInfoKey and conformance SubscriberUserInfoKey;
  if (!lazy protocol witness table cache variable for type SubscriberUserInfoKey and conformance SubscriberUserInfoKey)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for SubscriberUserInfoKey, &type metadata for SubscriberUserInfoKey);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type SubscriberUserInfoKey and conformance SubscriberUserInfoKey);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type SubscriberUserInfoKey and conformance SubscriberUserInfoKey;
  if (!lazy protocol witness table cache variable for type SubscriberUserInfoKey and conformance SubscriberUserInfoKey)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for SubscriberUserInfoKey, &type metadata for SubscriberUserInfoKey);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type SubscriberUserInfoKey and conformance SubscriberUserInfoKey);
    return v0;
  }
  return v2;
}

uint64_t GPKGroupManager.createSubscriberUserInfo(from:includePrivateKeys:)(uint64_t a1, char a2)
{
  uint64_t v2;
  char v3;
  uint64_t v5;
  char v6;
  void *v9;
  _BYTE __b[40];
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _BYTE v15[40];

  v11 = 0;
  memset(__b, 0, sizeof(__b));
  v14 = a1;
  v13 = a2 & 1;
  v12 = v2;
  v11 = Dictionary.init()();
  swift_bridgeObjectRetain();
  lazy protocol witness table accessor for type SubscriberUserInfoKey and conformance SubscriberUserInfoKey();
  Dictionary.makeIterator()();
  memcpy(__b, v15, sizeof(__b));
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [SubscriberUserInfoKey : Swift.AnyObject].Iterator);
    Dictionary.Iterator.next()();
    if (!v9)
      break;
    SubscriberUserInfoKey.isPrivate.getter();
    if ((v3 & 1) != 0)
      v6 = a2 ^ 1;
    else
      v6 = 0;
    if ((v6 & 1) == 0)
    {
      SubscriberUserInfoKey.rawValue.getter();
      swift_getObjectType();
      swift_unknownObjectRetain();
      objc_msgSend(v9, sel_copy);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Swift.AnyObject]);
      Dictionary.subscript.setter();
      swift_unknownObjectRelease();
    }
    swift_unknownObjectRelease();
  }
  outlined destroy of [SubscriberUserInfoKey : Swift.AnyObject].Iterator();
  v5 = v11;
  swift_bridgeObjectRetain();
  outlined destroy of [String : Swift.AnyObject]();
  return v5;
}

uint64_t partial apply for closure #1 in GPKGroupManager.createGroup(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = partial apply for closure #1 in GPKGroupManager.createGroup(with:);
  return closure #1 in GPKGroupManager.createGroup(with:)(a1, v5, v6);
}

uint64_t partial apply for closure #1 in GPKGroupManager.createGroup(with:)()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t partial apply for closure #1 in GPKGroupManager.fetchGroup(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = partial apply for closure #1 in GPKGroupManager.fetchGroup(with:);
  return closure #1 in GPKGroupManager.fetchGroup(with:)(a1, v5, v6);
}

uint64_t partial apply for closure #1 in GPKGroupManager.fetchGroup(with:)()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t partial apply for closure #1 in GPKGroupManager.fetchGroups(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = partial apply for closure #1 in GPKGroupManager.fetchGroups(with:);
  return closure #1 in GPKGroupManager.fetchGroups(with:)(a1, v5, v6);
}

uint64_t partial apply for closure #1 in GPKGroupManager.fetchGroups(with:)()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t partial apply for closure #1 in GPKGroupManager.updateGroup(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = partial apply for closure #1 in GPKGroupManager.updateGroup(with:);
  return closure #1 in GPKGroupManager.updateGroup(with:)(a1, v5, v6);
}

uint64_t partial apply for closure #1 in GPKGroupManager.updateGroup(with:)()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t partial apply for closure #1 in GPKGroupManager.updateMembership(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = partial apply for closure #1 in GPKGroupManager.updateMembership(with:);
  return closure #1 in GPKGroupManager.updateMembership(with:)(a1, v5, v6);
}

uint64_t partial apply for closure #1 in GPKGroupManager.updateMembership(with:)()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t partial apply for closure #1 in GPKGroupManager.deleteGroup(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = partial apply for closure #1 in GPKGroupManager.deleteGroup(with:);
  return closure #1 in GPKGroupManager.deleteGroup(with:)(a1, v5, v6);
}

uint64_t partial apply for closure #1 in GPKGroupManager.deleteGroup(with:)()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t partial apply for closure #1 in GPKGroupManager.fetchProfileInformation(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = partial apply for closure #1 in GPKGroupManager.fetchProfileInformation(with:);
  return closure #1 in GPKGroupManager.fetchProfileInformation(with:)(a1, v5, v6);
}

uint64_t partial apply for closure #1 in GPKGroupManager.fetchProfileInformation(with:)()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t partial apply for closure #1 in GPKGroupManager.rsvp(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = partial apply for closure #1 in GPKGroupManager.rsvp(with:);
  return closure #1 in GPKGroupManager.rsvp(with:)(a1, v5, v6);
}

uint64_t partial apply for closure #1 in GPKGroupManager.rsvp(with:)()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t sub_23D2B24FC()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in GPKGroupManager.add(subscriber:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = partial apply for closure #1 in GPKGroupManager.add(subscriber:);
  return closure #1 in GPKGroupManager.add(subscriber:)(a1, v5, v6, v7);
}

uint64_t partial apply for closure #1 in GPKGroupManager.add(subscriber:)()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t partial apply for closure #1 in GPKGroupManager.remove(subscriber:)()
{
  return closure #1 in GPKGroupManager.remove(subscriber:)() & 1;
}

unint64_t lazy protocol witness table accessor for type [Weak<GPKGroupManagerEventSubscriber>] and conformance [A]()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [Weak<GPKGroupManagerEventSubscriber>] and conformance [A];
  if (!lazy protocol witness table cache variable for type [Weak<GPKGroupManagerEventSubscriber>] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Weak<GPKGroupManagerEventSubscriber>]);
    v1 = MEMORY[0x2426331CC](MEMORY[0x24BEE12B8], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [Weak<GPKGroupManagerEventSubscriber>] and conformance [A]);
    return v1;
  }
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [Weak<GPKGroupManagerEventSubscriber>] and conformance [A];
  if (!lazy protocol witness table cache variable for type [Weak<GPKGroupManagerEventSubscriber>] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Weak<GPKGroupManagerEventSubscriber>]);
    v1 = MEMORY[0x2426331CC](MEMORY[0x24BEE12E8], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [Weak<GPKGroupManagerEventSubscriber>] and conformance [A]);
    return v1;
  }
  return v3;
}

uint64_t partial apply for closure #1 in GPKGroupManager.logMetrics(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = partial apply for closure #1 in GPKGroupManager.logMetrics(with:);
  return closure #1 in GPKGroupManager.logMetrics(with:)(a1, v5, v6);
}

uint64_t partial apply for closure #1 in GPKGroupManager.logMetrics(with:)()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of [Weak<GPKGroupManagerEventSubscriber>]()
{
  swift_bridgeObjectRelease();
}

uint64_t __swift_destroy_boxed_opaque_existential_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  if ((*(_DWORD *)(*(_QWORD *)(v2 - 8) + 80) & 0x20000) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1);
}

uint64_t protocol witness for DaemonBroadcastHandler.broadcastReceived(_:) in conformance GPKGroupManager(uint64_t a1, unint64_t a2)
{
  return GPKGroupManager.broadcastReceived(_:)(a1, a2);
}

void protocol witness for DaemonBroadcastHandler.daemonConnectionInvalidated() in conformance GPKGroupManager()
{
  GPKGroupManager.daemonConnectionInvalidated()();
}

uint64_t method lookup function for GPKGroupManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of GPKGroupManager.keyConverter.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of GPKGroupManager.__allocating_init(daemonMessageSender:daemonBroadcaster:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of GPKGroupManager.createGroup(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = v2;
  v5 = (uint64_t (*)(uint64_t))(*(_QWORD *)(*(_QWORD *)v1 + 176) + **(int **)(*(_QWORD *)v1 + 176));
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = dispatch thunk of GPKGroupManager.createGroup(with:);
  return v5(a1);
}

{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(*v1 + 16) = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 16) + 8))(a1);
}

uint64_t dispatch thunk of GPKGroupManager.fetchGroup(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = v2;
  v5 = (uint64_t (*)(uint64_t))(*(_QWORD *)(*(_QWORD *)v1 + 184) + **(int **)(*(_QWORD *)v1 + 184));
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = dispatch thunk of GPKGroupManager.fetchGroup(with:);
  return v5(a1);
}

{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(*v1 + 16) = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 16) + 8))(a1);
}

uint64_t dispatch thunk of GPKGroupManager.fetchGroups(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = v2;
  v5 = (uint64_t (*)(uint64_t))(*(_QWORD *)(*(_QWORD *)v1 + 192) + **(int **)(*(_QWORD *)v1 + 192));
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = dispatch thunk of GPKGroupManager.fetchGroups(with:);
  return v5(a1);
}

{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(*v1 + 16) = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 16) + 8))(a1);
}

uint64_t dispatch thunk of GPKGroupManager.updateGroup(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = v2;
  v5 = (uint64_t (*)(uint64_t))(*(_QWORD *)(*(_QWORD *)v1 + 200) + **(int **)(*(_QWORD *)v1 + 200));
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = dispatch thunk of GPKGroupManager.updateGroup(with:);
  return v5(a1);
}

{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(*v1 + 16) = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 16) + 8))(a1);
}

uint64_t dispatch thunk of GPKGroupManager.updateMembership(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = v2;
  v5 = (uint64_t (*)(uint64_t))(*(_QWORD *)(*(_QWORD *)v1 + 208) + **(int **)(*(_QWORD *)v1 + 208));
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = dispatch thunk of GPKGroupManager.updateMembership(with:);
  return v5(a1);
}

{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(*v1 + 16) = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 16) + 8))(a1);
}

uint64_t dispatch thunk of GPKGroupManager.deleteGroup(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = v2;
  v5 = (uint64_t (*)(uint64_t))(*(_QWORD *)(*(_QWORD *)v1 + 216) + **(int **)(*(_QWORD *)v1 + 216));
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = dispatch thunk of GPKGroupManager.deleteGroup(with:);
  return v5(a1);
}

uint64_t dispatch thunk of GPKGroupManager.deleteGroup(with:)()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t dispatch thunk of GPKGroupManager.destruct(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = v2;
  v5 = (uint64_t (*)(uint64_t))(*(_QWORD *)(*(_QWORD *)v1 + 224) + **(int **)(*(_QWORD *)v1 + 224));
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = dispatch thunk of GPKGroupManager.destruct(with:);
  return v5(a1);
}

uint64_t dispatch thunk of GPKGroupManager.destruct(with:)()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t dispatch thunk of GPKGroupManager.fetchProfileInformation(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = v2;
  v5 = (uint64_t (*)(uint64_t))(*(_QWORD *)(*(_QWORD *)v1 + 232) + **(int **)(*(_QWORD *)v1 + 232));
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = dispatch thunk of GPKGroupManager.fetchProfileInformation(with:);
  return v5(a1);
}

{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(*v1 + 16) = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 16) + 8))(a1);
}

uint64_t dispatch thunk of GPKGroupManager.rsvp(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = v2;
  v5 = (uint64_t (*)(uint64_t))(*(_QWORD *)(*(_QWORD *)v1 + 240) + **(int **)(*(_QWORD *)v1 + 240));
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = dispatch thunk of GPKGroupManager.rsvp(with:);
  return v5(a1);
}

{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(*v1 + 16) = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 16) + 8))(a1);
}

uint64_t dispatch thunk of GPKGroupManager.checkAvailability(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v7)(uint64_t, uint64_t);

  *(_QWORD *)(v3 + 16) = v3;
  v7 = (uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)v2 + 248) + **(int **)(*(_QWORD *)v2 + 248));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v4;
  *v4 = *(_QWORD *)(v3 + 16);
  v4[1] = dispatch thunk of GPKGroupManager.checkAvailability(for:);
  return v7(a1, a2);
}

uint64_t dispatch thunk of GPKGroupManager.checkAvailability(for:)(unsigned int a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(*v1 + 16) = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v3 + 16) + 8))(a1);
}

uint64_t dispatch thunk of GPKGroupManager.checkAvailability(for:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = v2;
  v5 = (uint64_t (*)(uint64_t))(*(_QWORD *)(*(_QWORD *)v1 + 256) + **(int **)(*(_QWORD *)v1 + 256));
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = dispatch thunk of GPKGroupManager.checkAvailability(for:);
  return v5(a1);
}

{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(*v1 + 16) = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 16) + 8))(a1);
}

uint64_t dispatch thunk of GPKGroupManager.add(subscriber:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of GPKGroupManager.remove(subscriber:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of GPKGroupManager.logMetrics(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = v2;
  v5 = (uint64_t (*)(uint64_t))(*(_QWORD *)(*(_QWORD *)v1 + 280) + **(int **)(*(_QWORD *)v1 + 280));
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = dispatch thunk of GPKGroupManager.logMetrics(with:);
  return v5(a1);
}

uint64_t dispatch thunk of GPKGroupManager.logMetrics(with:)(unsigned int a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(*v1 + 16) = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v3 + 16) + 8))(a1);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of Weak<GPKGroupManagerEventSubscriber>()
{
  swift_release();
}

unint64_t lazy protocol witness table accessor for type [GPKGroup] and conformance [A]()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [GPKGroup] and conformance [A];
  if (!lazy protocol witness table cache variable for type [GPKGroup] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [GPKGroup]);
    v1 = MEMORY[0x2426331CC](MEMORY[0x24BEE12E0], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [GPKGroup] and conformance [A]);
    return v1;
  }
  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of [GPKGroup]()
{
  swift_bridgeObjectRelease();
}

id @nonobjc NSArray.init(array:)()
{
  id v1;
  Class isa;
  id v3;

  isa = Array._bridgeToObjectiveC()().super.isa;
  v3 = objc_msgSend(v1, sel_initWithArray_);

  swift_bridgeObjectRelease();
  return v3;
}

id @nonobjc NSNumber.init(value:)(char a1)
{
  void *v1;

  return objc_msgSend(v1, sel_initWithBool_, a1 & 1);
}

_QWORD *partial apply for implicit closure #18 in implicit closure #17 in GPKGroupManager.registerHandlers()(uint64_t a1)
{
  return implicit closure #18 in implicit closure #17 in GPKGroupManager.registerHandlers()(a1);
}

_QWORD *partial apply for implicit closure #16 in implicit closure #15 in GPKGroupManager.registerHandlers()(uint64_t a1)
{
  uint64_t v1;

  return implicit closure #16 in implicit closure #15 in GPKGroupManager.registerHandlers()(a1, v1);
}

uint64_t partial apply for implicit closure #14 in implicit closure #13 in GPKGroupManager.registerHandlers()(uint64_t a1)
{
  uint64_t v1;

  return implicit closure #14 in implicit closure #13 in GPKGroupManager.registerHandlers()(a1, v1);
}

_QWORD *partial apply for implicit closure #12 in implicit closure #11 in GPKGroupManager.registerHandlers()(uint64_t *a1)
{
  uint64_t v1;

  return implicit closure #12 in implicit closure #11 in GPKGroupManager.registerHandlers()(a1, v1);
}

uint64_t partial apply for implicit closure #10 in implicit closure #9 in GPKGroupManager.registerHandlers()(uint64_t a1)
{
  uint64_t v1;

  return implicit closure #10 in implicit closure #9 in GPKGroupManager.registerHandlers()(a1, v1);
}

_QWORD *partial apply for implicit closure #8 in implicit closure #7 in GPKGroupManager.registerHandlers()(uint64_t *a1)
{
  uint64_t v1;

  return implicit closure #8 in implicit closure #7 in GPKGroupManager.registerHandlers()(a1, v1);
}

_QWORD *partial apply for implicit closure #6 in implicit closure #5 in GPKGroupManager.registerHandlers()(uint64_t a1)
{
  return implicit closure #6 in implicit closure #5 in GPKGroupManager.registerHandlers()(a1);
}

_QWORD *partial apply for implicit closure #4 in implicit closure #3 in GPKGroupManager.registerHandlers()(uint64_t *a1)
{
  uint64_t v1;

  return implicit closure #4 in implicit closure #3 in GPKGroupManager.registerHandlers()(a1, v1);
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in GPKGroupManager.registerHandlers()(uint64_t *a1)
{
  uint64_t v1;

  return implicit closure #2 in implicit closure #1 in GPKGroupManager.registerHandlers()(a1, v1);
}

void InternalError.internalCode.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + OBJC_IVAR____TtC8GroupKit13InternalError_internalCode);
}

id InternalError.__allocating_init(_:)(void *a1)
{
  objc_class *v1;
  id v2;

  v2 = objc_allocWithZone(v1);
  return InternalError.init(_:)(a1);
}

id InternalError.init(_:)(void *a1)
{
  void *v1;
  id v2;
  uint64_t *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v27;
  id *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  Class isa;
  id v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  _BYTE *v45;
  objc_class *ObjectType;
  uint64_t *v47;
  id v48;
  id v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  objc_super v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  _QWORD v66[3];
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  id v76;

  ObjectType = (objc_class *)swift_getObjectType();
  v74 = 0;
  v57 = 0;
  v58 = 0;
  v56 = 0;
  v75 = a1;
  v2 = v1;
  v76 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any));
  _allocateUninitializedArray<A>(_:)();
  v47 = v3;
  v49 = (id)*MEMORY[0x24BDD0FC8];
  v4 = (id)*MEMORY[0x24BDD0FC8];
  *v47 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v47[1] = v5;
  swift_getErrorValue();
  v6 = Error.localizedDescription.getter();
  v50 = MEMORY[0x24BEE0D00];
  v47[5] = MEMORY[0x24BEE0D00];
  v47[2] = v6;
  v47[3] = v7;
  v48 = (id)*MEMORY[0x24BDD0BA0];
  v8 = (id)*MEMORY[0x24BDD0BA0];
  v47[6] = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v47[7] = v9;
  v10 = a1;
  v73 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  v11 = String.init<A>(reflecting:)();
  v47[11] = v50;
  v47[8] = v11;
  v47[9] = v12;
  _finalizeUninitializedArray<A>(_:)();

  v74 = Dictionary.init(dictionaryLiteral:)();
  v51 = (id)*MEMORY[0x24BDD0FD8];
  v13 = (id)*MEMORY[0x24BDD0FD8];
  v52 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v53 = v14;
  v15 = a1;
  v65 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LocalizedError);
  if ((swift_dynamicCast() & 1) == 0)
  {
    memset(v66, 0, sizeof(v66));
    v67 = 0;
    v68 = 0;
  }
  if (!v67)
  {
    outlined destroy of LocalizedError?((uint64_t)v66);
LABEL_9:
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    goto LABEL_8;
  }
  __swift_project_boxed_opaque_existential_1(v66, v67);
  v44 = dispatch thunk of LocalizedError.failureReason.getter();
  if (!v16)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v66);
    goto LABEL_9;
  }
  v72 = MEMORY[0x24BEE0D00];
  v69 = v44;
  v70 = v16;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v66);
LABEL_8:
  v63 = v52;
  v64 = v53;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
  Dictionary.subscript.setter();

  v28 = (id *)MEMORY[0x24BDD1398];
  v33 = (id)*MEMORY[0x24BDD1398];
  v17 = (id)*MEMORY[0x24BDD1398];
  v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v30 = v18;
  v19 = a1;
  v27 = (id)_convertErrorToNSError(_:)();
  v32 = objc_msgSend(v27, sel_userInfo);
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  v31 = *v28;
  v20 = *v28;
  v61 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v62 = v21;
  MEMORY[0x24263250C]();
  outlined destroy of String();
  swift_bridgeObjectRelease();
  v59 = v29;
  v60 = v30;
  Dictionary.subscript.setter();

  v22 = a1;
  v34 = (id)_convertErrorToNSError(_:)();
  v35 = objc_msgSend(v34, sel_domain);
  v37 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v42 = v23;
  v57 = v37;
  v58 = v23;

  v24 = a1;
  v36 = (id)_convertErrorToNSError(_:)();
  v39 = objc_msgSend(v36, sel_code);
  v56 = v39;

  v45[OBJC_IVAR____TtC8GroupKit13InternalError_internalCode] = 94;
  v38 = v76;
  swift_bridgeObjectRetain();
  v41 = (id)MEMORY[0x242632560](v37, v42);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v55.receiver = v38;
  v55.super_class = ObjectType;
  v43 = objc_msgSendSuper2(&v55, sel_initWithDomain_code_userInfo_, v41, v39, isa);

  v25 = v43;
  v76 = v43;
  swift_bridgeObjectRelease();
  outlined destroy of [String : Any]();

  return v43;
}

uint64_t outlined destroy of LocalizedError?(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 24))
    __swift_destroy_boxed_opaque_existential_1(a1);
  return a1;
}

id InternalError.__allocating_init(_:internalInfo:)(char *a1, uint64_t a2)
{
  objc_class *v2;
  id v3;

  v3 = objc_allocWithZone(v2);
  return InternalError.init(_:internalInfo:)(a1, a2);
}

id InternalError.init(_:internalInfo:)(char *a1, uint64_t a2)
{
  void *v2;
  id v3;
  uint64_t countAndFlagsBits;
  uint64_t v5;
  id v6;
  id v8;
  Class isa;
  Class v10;
  objc_class *ObjectType;
  id v13;
  char v14;
  uint64_t v15;
  objc_super v17;
  char v18;
  uint64_t v19;
  char v20;
  id v21;

  ObjectType = (objc_class *)swift_getObjectType();
  v21 = 0;
  v20 = 0;
  v19 = 0;
  v20 = *a1;
  v14 = v20;
  v19 = a2;
  v3 = v2;
  v21 = v2;
  *((_BYTE *)v2 + OBJC_IVAR____TtC8GroupKit13InternalError_internalCode) = v20;

  countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.groupkit", 0x12uLL, 1)._countAndFlagsBits;
  v13 = (id)MEMORY[0x242632560](countAndFlagsBits);
  swift_bridgeObjectRelease();
  v18 = v14;
  InternalErrorCode.rawValue.getter();
  v15 = v5;
  swift_bridgeObjectRetain();
  if (a2)
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v10 = isa;
  }
  else
  {
    v10 = 0;
  }
  v17.receiver = v21;
  v17.super_class = ObjectType;
  v8 = objc_msgSendSuper2(&v17, sel_initWithDomain_code_userInfo_, v13, v15);

  v6 = v8;
  v21 = v8;
  swift_bridgeObjectRelease();

  return v8;
}

void InternalErrorCode.rawValue.getter()
{
  __asm { BR              X8 }
}

uint64_t sub_23D2B43A8()
{
  return 1000;
}

id InternalError.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v4;

  v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id InternalError.init(coder:)(void *a1)
{
  void *v1;
  id v2;
  uint64_t countAndFlagsBits;
  id v4;
  id v7;
  _BYTE *v8;
  objc_class *ObjectType;
  id v11;
  id v12;
  objc_super v13;
  char v14;
  unsigned __int8 v15;
  char v16;
  id v17;
  void *v18;
  id v19;

  ObjectType = (objc_class *)swift_getObjectType();
  v18 = a1;
  v2 = v1;
  v19 = v1;
  countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("internalCode", 0xCuLL, 1)._countAndFlagsBits;
  v11 = (id)MEMORY[0x242632560](countAndFlagsBits);
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(a1, sel_decodeIntegerForKey_, v11);

  v17 = v12;
  InternalErrorCode.init(rawValue:)((Swift::Int)v12);
  v14 = v15;
  if (v15 == 187)
    v16 = 94;
  else
    v16 = v14;
  v8[OBJC_IVAR____TtC8GroupKit13InternalError_internalCode] = v16;

  v13.receiver = v19;
  v13.super_class = ObjectType;
  v7 = objc_msgSendSuper2(&v13, sel_initWithCoder_, a1);
  if (v7)
  {
    v4 = v7;
    v19 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

GroupKit::InternalErrorCode_optional __swiftcall InternalErrorCode.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v3;

  switch(rawValue)
  {
    case 1000:
      v3 = 0;
LABEL_376:
      *v1 = v3;
      return (GroupKit::InternalErrorCode_optional)rawValue;
    case 1001:
      v3 = 1;
      goto LABEL_376;
    case 1002:
      v3 = 2;
      goto LABEL_376;
    case 1003:
      v3 = 3;
      goto LABEL_376;
    case 1004:
      v3 = 4;
      goto LABEL_376;
    case 2000:
      v3 = 5;
      goto LABEL_376;
    case 2001:
      v3 = 6;
      goto LABEL_376;
    case 2002:
      v3 = 7;
      goto LABEL_376;
    case 2003:
      v3 = 8;
      goto LABEL_376;
    case 3000:
      v3 = 9;
      goto LABEL_376;
    case 3001:
      v3 = 10;
      goto LABEL_376;
    case 3002:
      v3 = 11;
      goto LABEL_376;
    case 3003:
      v3 = 12;
      goto LABEL_376;
    case 3004:
      v3 = 13;
      goto LABEL_376;
    case 3005:
      v3 = 14;
      goto LABEL_376;
    case 3006:
      v3 = 15;
      goto LABEL_376;
    case 3007:
      v3 = 16;
      goto LABEL_376;
    case 3008:
      v3 = 17;
      goto LABEL_376;
    case 3009:
      v3 = 18;
      goto LABEL_376;
    case 3010:
      v3 = 19;
      goto LABEL_376;
    case 3011:
      v3 = 20;
      goto LABEL_376;
    case 3012:
      v3 = 21;
      goto LABEL_376;
    case 3013:
      v3 = 22;
      goto LABEL_376;
    case 3014:
      v3 = 23;
      goto LABEL_376;
    case 3015:
      v3 = 24;
      goto LABEL_376;
    case 3016:
      v3 = 25;
      goto LABEL_376;
    case 3017:
      v3 = 26;
      goto LABEL_376;
    case 3018:
      v3 = 27;
      goto LABEL_376;
    case 3019:
      v3 = 28;
      goto LABEL_376;
    case 3020:
      v3 = 29;
      goto LABEL_376;
    case 3021:
      v3 = 30;
      goto LABEL_376;
    case 3022:
      v3 = 31;
      goto LABEL_376;
    case 3023:
      v3 = 32;
      goto LABEL_376;
    case 3024:
      v3 = 33;
      goto LABEL_376;
    case 3025:
      v3 = 34;
      goto LABEL_376;
    case 3026:
      v3 = 35;
      goto LABEL_376;
    case 3027:
      v3 = 36;
      goto LABEL_376;
    case 3028:
      v3 = 37;
      goto LABEL_376;
    case 3029:
      v3 = 38;
      goto LABEL_376;
    case 3030:
      v3 = 39;
      goto LABEL_376;
    case 3031:
      v3 = 40;
      goto LABEL_376;
    case 3032:
      v3 = 41;
      goto LABEL_376;
    case 3033:
      v3 = 42;
      goto LABEL_376;
    case 3034:
      v3 = 43;
      goto LABEL_376;
    case 3035:
      v3 = 44;
      goto LABEL_376;
    case 3036:
      v3 = 45;
      goto LABEL_376;
    case 4000:
      v3 = 46;
      goto LABEL_376;
    case 4001:
      v3 = 47;
      goto LABEL_376;
    case 4002:
      v3 = 48;
      goto LABEL_376;
    case 5000:
      v3 = 49;
      goto LABEL_376;
    case 5001:
      v3 = 50;
      goto LABEL_376;
    case 5002:
      v3 = 51;
      goto LABEL_376;
    case 5003:
      v3 = 52;
      goto LABEL_376;
    case 5004:
      v3 = 53;
      goto LABEL_376;
    case 5005:
      v3 = 54;
      goto LABEL_376;
    case 5006:
      v3 = 55;
      goto LABEL_376;
    case 5007:
      v3 = 56;
      goto LABEL_376;
    case 6000:
      v3 = 57;
      goto LABEL_376;
    case 6001:
      v3 = 58;
      goto LABEL_376;
    case 6002:
      v3 = 59;
      goto LABEL_376;
    case 6003:
      v3 = 60;
      goto LABEL_376;
    case 6004:
      v3 = 61;
      goto LABEL_376;
    case 6005:
      v3 = 62;
      goto LABEL_376;
    case 6006:
      v3 = 63;
      goto LABEL_376;
    case 6007:
      v3 = 64;
      goto LABEL_376;
    case 6008:
      v3 = 65;
      goto LABEL_376;
    case 6009:
      v3 = 66;
      goto LABEL_376;
    case 6010:
      v3 = 67;
      goto LABEL_376;
    case 6011:
      v3 = 68;
      goto LABEL_376;
    case 6012:
      v3 = 69;
      goto LABEL_376;
    case 6013:
      v3 = 70;
      goto LABEL_376;
    case 6014:
      v3 = 71;
      goto LABEL_376;
    case 6015:
      v3 = 72;
      goto LABEL_376;
    case 6016:
      v3 = 73;
      goto LABEL_376;
    case 6017:
      v3 = 74;
      goto LABEL_376;
    case 7000:
      v3 = 75;
      goto LABEL_376;
    case 7001:
      v3 = 76;
      goto LABEL_376;
    case 7002:
      v3 = 77;
      goto LABEL_376;
    case 7003:
      v3 = 78;
      goto LABEL_376;
    case 7004:
      v3 = 79;
      goto LABEL_376;
    case 7005:
      v3 = 80;
      goto LABEL_376;
    case 7006:
      v3 = 81;
      goto LABEL_376;
    case 7007:
      v3 = 82;
      goto LABEL_376;
    case 7008:
      v3 = 83;
      goto LABEL_376;
    case 7009:
      v3 = 84;
      goto LABEL_376;
    case 7010:
      v3 = 85;
      goto LABEL_376;
    case 8000:
      v3 = 86;
      goto LABEL_376;
    case 8001:
      v3 = 87;
      goto LABEL_376;
    case 8002:
      v3 = 88;
      goto LABEL_376;
    case 8003:
      v3 = 89;
      goto LABEL_376;
    case 8004:
      v3 = 90;
      goto LABEL_376;
    case 9000:
      v3 = 91;
      goto LABEL_376;
    case 9001:
      v3 = 92;
      goto LABEL_376;
    case 9002:
      v3 = 93;
      goto LABEL_376;
    case 9003:
      v3 = 94;
      goto LABEL_376;
    case 9004:
      v3 = 95;
      goto LABEL_376;
    case 9005:
      v3 = 96;
      goto LABEL_376;
    case 9006:
      v3 = 97;
      goto LABEL_376;
    case 9007:
      v3 = 98;
      goto LABEL_376;
    case 9008:
      v3 = 99;
      goto LABEL_376;
    case 9009:
      v3 = 100;
      goto LABEL_376;
    case 10000:
      v3 = 101;
      goto LABEL_376;
    case 10001:
      v3 = 102;
      goto LABEL_376;
    case 10002:
      v3 = 103;
      goto LABEL_376;
    case 11000:
      v3 = 104;
      goto LABEL_376;
    case 11001:
      v3 = 105;
      goto LABEL_376;
    case 11002:
      v3 = 106;
      goto LABEL_376;
    case 11003:
      v3 = 107;
      goto LABEL_376;
    case 11004:
      v3 = 108;
      goto LABEL_376;
    case 11005:
      v3 = 109;
      goto LABEL_376;
    case 11006:
      v3 = 110;
      goto LABEL_376;
    case -44000:
      v3 = 111;
      goto LABEL_376;
    case -44002:
      v3 = 112;
      goto LABEL_376;
    case -44003:
      v3 = 113;
      goto LABEL_376;
    case -44005:
      v3 = 114;
      goto LABEL_376;
    case -44006:
      v3 = 115;
      goto LABEL_376;
    case -44007:
      v3 = 116;
      goto LABEL_376;
    case -44008:
      v3 = 117;
      goto LABEL_376;
    case -44009:
      v3 = 118;
      goto LABEL_376;
    case -44010:
      v3 = 119;
      goto LABEL_376;
    case -44011:
      v3 = 120;
      goto LABEL_376;
    case -44012:
      v3 = 121;
      goto LABEL_376;
    case -44013:
      v3 = 122;
      goto LABEL_376;
    case -44014:
      v3 = 123;
      goto LABEL_376;
    case -44015:
      v3 = 124;
      goto LABEL_376;
    case -44016:
      v3 = 125;
      goto LABEL_376;
    case -44017:
      v3 = 126;
      goto LABEL_376;
    case -44018:
      v3 = 127;
      goto LABEL_376;
    case -45000:
      v3 = 0x80;
      goto LABEL_376;
    case -45001:
      v3 = -127;
      goto LABEL_376;
    case -45003:
      v3 = -126;
      goto LABEL_376;
    case -45004:
      v3 = -125;
      goto LABEL_376;
    case -45005:
      v3 = -124;
      goto LABEL_376;
    case -45006:
      v3 = -123;
      goto LABEL_376;
    case -45007:
      v3 = -122;
      goto LABEL_376;
    case -45009:
      v3 = -121;
      goto LABEL_376;
    case -45011:
      v3 = -120;
      goto LABEL_376;
    case -45012:
      v3 = -119;
      goto LABEL_376;
    case -45013:
      v3 = -118;
      goto LABEL_376;
    case -45014:
      v3 = -117;
      goto LABEL_376;
    case -45015:
      v3 = -116;
      goto LABEL_376;
    case -45016:
      v3 = -115;
      goto LABEL_376;
    case -45017:
      v3 = -114;
      goto LABEL_376;
    case -45018:
      v3 = -113;
      goto LABEL_376;
    case -45019:
      v3 = -112;
      goto LABEL_376;
    case -45021:
      v3 = -111;
      goto LABEL_376;
    case -45023:
      v3 = -110;
      goto LABEL_376;
    case -45024:
      v3 = -109;
      goto LABEL_376;
    case -45025:
      v3 = -108;
      goto LABEL_376;
    case -45026:
      v3 = -107;
      goto LABEL_376;
    case -45027:
      v3 = -106;
      goto LABEL_376;
    case -45029:
      v3 = -105;
      goto LABEL_376;
    case -45030:
      v3 = -104;
      goto LABEL_376;
    case -45031:
      v3 = -103;
      goto LABEL_376;
    case -45032:
      v3 = -102;
      goto LABEL_376;
    case -45033:
      v3 = -101;
      goto LABEL_376;
    case -45034:
      v3 = -100;
      goto LABEL_376;
    case -45035:
      v3 = -99;
      goto LABEL_376;
    case -45036:
      v3 = -98;
      goto LABEL_376;
    case -45037:
      v3 = -97;
      goto LABEL_376;
    case -45038:
      v3 = -96;
      goto LABEL_376;
    case -45039:
      v3 = -95;
      goto LABEL_376;
    case -45040:
      v3 = -94;
      goto LABEL_376;
    case -45045:
      v3 = -93;
      goto LABEL_376;
    case -45046:
      v3 = -92;
      goto LABEL_376;
    case -45047:
      v3 = -91;
      goto LABEL_376;
    case -45048:
      v3 = -90;
      goto LABEL_376;
    case -45049:
      v3 = -89;
      goto LABEL_376;
    case -45051:
      v3 = -88;
      goto LABEL_376;
    case -45052:
      v3 = -87;
      goto LABEL_376;
    case -45053:
      v3 = -86;
      goto LABEL_376;
    case -45055:
      v3 = -85;
      goto LABEL_376;
    case -45056:
      v3 = -84;
      goto LABEL_376;
    case -45057:
      v3 = -83;
      goto LABEL_376;
    case -45058:
      v3 = -82;
      goto LABEL_376;
    case -45059:
      v3 = -81;
      goto LABEL_376;
    case -45060:
      v3 = -80;
      goto LABEL_376;
    case -45061:
      v3 = -79;
      goto LABEL_376;
    case -45062:
      v3 = -78;
      goto LABEL_376;
    case -45063:
      v3 = -77;
      goto LABEL_376;
    case -45064:
      v3 = -76;
      goto LABEL_376;
    case -45066:
      v3 = -75;
      goto LABEL_376;
    case -45067:
      v3 = -74;
      goto LABEL_376;
    case -45068:
      v3 = -73;
      goto LABEL_376;
    case -45069:
      v3 = -72;
      goto LABEL_376;
    case -45070:
      v3 = -71;
      goto LABEL_376;
    case -80040:
      v3 = -70;
      goto LABEL_376;
  }
  *v1 = -69;
  return (GroupKit::InternalErrorCode_optional)rawValue;
}

Swift::Void __swiftcall InternalError.encode(with:)(NSCoder with)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t countAndFlagsBits;
  id v4;
  uint64_t v5;
  id v6;
  objc_class *ObjectType;
  id v9;
  objc_super v10;
  char v11;
  uint64_t v12;
  Class isa;

  ObjectType = (objc_class *)swift_getObjectType();
  isa = with.super.isa;
  v12 = v1;
  v11 = *(_BYTE *)(v1 + OBJC_IVAR____TtC8GroupKit13InternalError_internalCode);
  InternalErrorCode.rawValue.getter();
  v5 = v2;
  countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("internalCode", 0xCuLL, 1)._countAndFlagsBits;
  v6 = (id)MEMORY[0x242632560](countAndFlagsBits);
  swift_bridgeObjectRelease();
  -[objc_class encodeInteger:forKey:](with.super.isa, sel_encodeInteger_forKey_, v5, v6);

  v4 = v9;
  v10.receiver = v9;
  v10.super_class = ObjectType;
  objc_msgSendSuper2(&v10, sel_encodeWithCoder_, with.super.isa);

}

uint64_t static InternalError.supportsSecureCoding.getter()
{
  return 1;
}

id InternalError.__allocating_init(domain:code:userInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  id v5;
  id v7;
  id v8;
  Class isa;
  id v13;
  void *v15;

  v13 = objc_allocWithZone(v4);
  v15 = (void *)MEMORY[0x242632560](a1, a2);
  if (a4)
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v5 = objc_msgSend(v13, sel_initWithDomain_code_userInfo_, v15, a3, isa);
  }
  else
  {
    v5 = objc_msgSend(v13, sel_initWithDomain_code_userInfo_, v15, a3, 0);
  }
  v8 = v5;

  swift_bridgeObjectRelease();
  return v8;
}

uint64_t InternalError.init(domain:code:userInfo:)()
{
  uint64_t result;
  uint64_t v1;

  if (!"GroupKit.InternalError")
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  result = closure #1 in _unimplementedInitializer(className:initName:file:line:column:)((uint64_t)"GroupKit.InternalError", 22, (unint64_t)"init(domain:code:userInfo:)", 27, 2, (unint64_t)"GroupKit/InternalError.swift", 28, 2, v1, 0xCuLL, 0x14uLL);
  __break(1u);
  return result;
}

id InternalError.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t one-time initialization function for memberHandles()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("handles", 7uLL, 1);
  result = v1._countAndFlagsBits;
  static InternalErrorKey.memberHandles = (__int128)v1;
  return result;
}

__int128 *InternalErrorKey.memberHandles.unsafeMutableAddressor()
{
  if (one-time initialization token for memberHandles != -1)
    swift_once();
  return &static InternalErrorKey.memberHandles;
}

uint64_t static InternalErrorKey.memberHandles.getter()
{
  uint64_t v1;

  v1 = *(_QWORD *)InternalErrorKey.memberHandles.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t one-time initialization function for groupID()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("groupID", 7uLL, 1);
  result = v1._countAndFlagsBits;
  static InternalErrorKey.groupID = (__int128)v1;
  return result;
}

__int128 *InternalErrorKey.groupID.unsafeMutableAddressor()
{
  if (one-time initialization token for groupID != -1)
    swift_once();
  return &static InternalErrorKey.groupID;
}

uint64_t static InternalErrorKey.groupID.getter()
{
  uint64_t v1;

  v1 = *(_QWORD *)InternalErrorKey.groupID.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t one-time initialization function for className()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("className", 9uLL, 1);
  result = v1._countAndFlagsBits;
  static InternalErrorKey.className = (__int128)v1;
  return result;
}

__int128 *InternalErrorKey.className.unsafeMutableAddressor()
{
  if (one-time initialization token for className != -1)
    swift_once();
  return &static InternalErrorKey.className;
}

uint64_t static InternalErrorKey.className.getter()
{
  uint64_t v1;

  v1 = *(_QWORD *)InternalErrorKey.className.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t one-time initialization function for url()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("url", 3uLL, 1);
  result = v1._countAndFlagsBits;
  static InternalErrorKey.url = (__int128)v1;
  return result;
}

__int128 *InternalErrorKey.url.unsafeMutableAddressor()
{
  if (one-time initialization token for url != -1)
    swift_once();
  return &static InternalErrorKey.url;
}

uint64_t static InternalErrorKey.url.getter()
{
  uint64_t v1;

  v1 = *(_QWORD *)InternalErrorKey.url.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t one-time initialization function for httpStatusCode()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("httpStatusCode", 0xEuLL, 1);
  result = v1._countAndFlagsBits;
  static InternalErrorKey.httpStatusCode = (__int128)v1;
  return result;
}

__int128 *InternalErrorKey.httpStatusCode.unsafeMutableAddressor()
{
  if (one-time initialization token for httpStatusCode != -1)
    swift_once();
  return &static InternalErrorKey.httpStatusCode;
}

uint64_t static InternalErrorKey.httpStatusCode.getter()
{
  uint64_t v1;

  v1 = *(_QWORD *)InternalErrorKey.httpStatusCode.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t one-time initialization function for serverErrorCode()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("serverErrorCode", 0xFuLL, 1);
  result = v1._countAndFlagsBits;
  static InternalErrorKey.serverErrorCode = (__int128)v1;
  return result;
}

__int128 *InternalErrorKey.serverErrorCode.unsafeMutableAddressor()
{
  if (one-time initialization token for serverErrorCode != -1)
    swift_once();
  return &static InternalErrorKey.serverErrorCode;
}

uint64_t static InternalErrorKey.serverErrorCode.getter()
{
  uint64_t v1;

  v1 = *(_QWORD *)InternalErrorKey.serverErrorCode.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t one-time initialization function for serverErrorMessage()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("serverErrorMessage", 0x12uLL, 1);
  result = v1._countAndFlagsBits;
  static InternalErrorKey.serverErrorMessage = (__int128)v1;
  return result;
}

__int128 *InternalErrorKey.serverErrorMessage.unsafeMutableAddressor()
{
  if (one-time initialization token for serverErrorMessage != -1)
    swift_once();
  return &static InternalErrorKey.serverErrorMessage;
}

uint64_t static InternalErrorKey.serverErrorMessage.getter()
{
  uint64_t v1;

  v1 = *(_QWORD *)InternalErrorKey.serverErrorMessage.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t one-time initialization function for clientErrorCode()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("serverErrorCode", 0xFuLL, 1);
  result = v1._countAndFlagsBits;
  static InternalErrorKey.clientErrorCode = (__int128)v1;
  return result;
}

__int128 *InternalErrorKey.clientErrorCode.unsafeMutableAddressor()
{
  if (one-time initialization token for clientErrorCode != -1)
    swift_once();
  return &static InternalErrorKey.clientErrorCode;
}

uint64_t static InternalErrorKey.clientErrorCode.getter()
{
  uint64_t v1;

  v1 = *(_QWORD *)InternalErrorKey.clientErrorCode.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t one-time initialization function for clientErrorMessage()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("serverErrorMessage", 0x12uLL, 1);
  result = v1._countAndFlagsBits;
  static InternalErrorKey.clientErrorMessage = (__int128)v1;
  return result;
}

__int128 *InternalErrorKey.clientErrorMessage.unsafeMutableAddressor()
{
  if (one-time initialization token for clientErrorMessage != -1)
    swift_once();
  return &static InternalErrorKey.clientErrorMessage;
}

uint64_t static InternalErrorKey.clientErrorMessage.getter()
{
  uint64_t v1;

  v1 = *(_QWORD *)InternalErrorKey.clientErrorMessage.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance InternalErrorCode()
{
  lazy protocol witness table accessor for type InternalErrorCode and conformance InternalErrorCode();
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance InternalErrorCode()
{
  lazy protocol witness table accessor for type InternalErrorCode and conformance InternalErrorCode();
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance InternalErrorCode()
{
  lazy protocol witness table accessor for type InternalErrorCode and conformance InternalErrorCode();
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance InternalErrorCode()
{
  lazy protocol witness table accessor for type InternalErrorCode and conformance InternalErrorCode();
  return RawRepresentable<>._rawHashValue(seed:)();
}

GroupKit::InternalErrorCode_optional protocol witness for RawRepresentable.init(rawValue:) in conformance InternalErrorCode(Swift::Int *a1)
{
  return InternalErrorCode.init(rawValue:)(*a1);
}

void protocol witness for RawRepresentable.rawValue.getter in conformance InternalErrorCode(_QWORD *a1@<X8>)
{
  uint64_t v1;

  InternalErrorCode.rawValue.getter();
  *a1 = v1;
}

uint64_t protocol witness for Decodable.init(from:) in conformance InternalErrorCode()
{
  lazy protocol witness table accessor for type InternalErrorCode and conformance InternalErrorCode();
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance InternalErrorCode()
{
  lazy protocol witness table accessor for type InternalErrorCode and conformance InternalErrorCode();
  return RawRepresentable<>.encode(to:)();
}

unint64_t lazy protocol witness table accessor for type InternalErrorCode and conformance InternalErrorCode()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type InternalErrorCode and conformance InternalErrorCode;
  if (!lazy protocol witness table cache variable for type InternalErrorCode and conformance InternalErrorCode)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for InternalErrorCode, &type metadata for InternalErrorCode);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type InternalErrorCode and conformance InternalErrorCode);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type InternalErrorCode and conformance InternalErrorCode;
  if (!lazy protocol witness table cache variable for type InternalErrorCode and conformance InternalErrorCode)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for InternalErrorCode, &type metadata for InternalErrorCode);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type InternalErrorCode and conformance InternalErrorCode);
    return v0;
  }
  return v2;
}

unint64_t base witness table accessor for Equatable in InternalErrorCode()
{
  return lazy protocol witness table accessor for type InternalErrorCode and conformance InternalErrorCode();
}

uint64_t type metadata accessor for InternalError()
{
  return objc_opt_self();
}

uint64_t method lookup function for InternalError()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of InternalError.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of InternalError.__allocating_init(_:internalInfo:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

ValueMetadata *type metadata accessor for InternalErrorKey()
{
  return &type metadata for InternalErrorKey;
}

uint64_t getEnumTagSinglePayload for InternalErrorCode(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v5;
  int v6;
  unsigned int v7;
  int v8;

  if (a2)
  {
    if (a2 <= 0x45)
      goto LABEL_15;
    v7 = ((a2 + 186) >> 8) + 1;
    v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000)
        v2 = 4;
      else
        v2 = 2;
      v8 = v2;
    }
    if (v8 == 1)
      v6 = a1[1];
    else
      v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    if (v6)
    {
      v5 = (*a1 | ((v6 - 1) << 8)) + 69;
    }
    else
    {
LABEL_15:
      v3 = *a1 - 187;
      if (v3 < 0)
        v3 = -1;
      v5 = v3;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

_BYTE *storeEnumTagSinglePayload for InternalErrorCode(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  v7 = 0;
  if (a3 > 0x45)
  {
    v5 = ((a3 + 186) >> 8) + 1;
    v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000)
        v3 = 4;
      else
        v3 = 2;
      v6 = v3;
    }
    v7 = v6;
  }
  if (a2 > 0x45)
  {
    v4 = ((a2 - 70) >> 8) + 1;
    *result = a2 - 70;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2)
      *result = a2 - 70;
  }
  return result;
}

uint64_t getEnumTag for InternalErrorCode(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for InternalErrorCode(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for InternalErrorCode()
{
  return &type metadata for InternalErrorCode;
}

uint64_t Validator.source.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2);
}

uint64_t Validator.init(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;

  v13 = a3;
  v15 = a1;
  v17 = a2;
  v20 = 0;
  v19 = 0;
  v21 = a2;
  v14 = *(_QWORD *)(a2 - 8);
  v10 = (*(_QWORD *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](a1);
  v12 = (char *)&v10 - v10;
  v18 = type metadata accessor for Validator(0, v3, v4, v5);
  v11 = (*(_QWORD *)(*(_QWORD *)(v18 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v6 = MEMORY[0x24BDAC7A8](v12);
  v16 = (uint64_t)&v10 - v11;
  v20 = (char *)&v10 - v11;
  v19 = v7;
  (*(void (**)(uint64_t))(v8 + 16))(v6);
  (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(v16, v12, v17);
  outlined init with copy of Validator<A>(v16, v13, v17);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v15, v17);
  result = v16;
  outlined destroy of Validator<A>(v16, v17);
  return result;
}

uint64_t type metadata accessor for Validator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a4, a4, (uint64_t)&nominal type descriptor for Validator);
}

uint64_t outlined init with copy of Validator<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(a3 - 8) + 16))();
  return a2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of Validator<A>(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(_QWORD *)(a2 - 8) + 8))();
}

uint64_t Validator.required<A>(_:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  void (*v23)(uint64_t);
  char *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;

  v11 = a2;
  v25 = a1;
  v12 = v2;
  v31 = 0;
  v30 = 0;
  v29 = 0;
  v20 = *(_QWORD *)(*a1 + *MEMORY[0x24BEE46A8] + 8);
  v13 = (*(_QWORD *)(*(_QWORD *)(v20 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](a1);
  v27 = (uint64_t)v10 - v13;
  v14 = *(_QWORD *)(v3 + 16);
  v33 = v14;
  v15 = *(_QWORD *)(v14 - 8);
  v17 = *(_QWORD *)(v15 + 64);
  v16 = (v17 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]((char *)v10 - v13);
  v18 = (uint64_t)v10 - v16;
  v19 = (v17 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]((char *)v10 - v16);
  v24 = (char *)v10 - v19;
  v28 = *(_QWORD *)(v20 + 16);
  v32 = v28;
  v26 = *(_QWORD *)(v28 - 8);
  v21 = (*(_QWORD *)(v26 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = MEMORY[0x24BDAC7A8]((char *)v10 - v19);
  v22 = (char *)v10 - v21;
  v31 = (char *)v10 - v21;
  v30 = v25;
  v29 = v5;
  v23 = *(void (**)(uint64_t))(v6 + 16);
  v23(v4);
  swift_retain();
  swift_getAtKeyPath();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v27, 1, v28) == 1)
  {
    outlined destroy of A1?(v27, v28);
    swift_release();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v24, v14);
    ((void (*)(uint64_t, uint64_t, uint64_t))v23)(v18, v12, v14);
    swift_retain();
    v10[2] = type metadata accessor for Validator.MissingRequiredValue(0, v14, v28, v8);
    MEMORY[0x2426331CC](&protocol conformance descriptor for Validator<A>.MissingRequiredValue<A1>);
    v10[3] = swift_allocError();
    Validator.MissingRequiredValue.init(source:keyPath:)(v18, v25, v9);
    return swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v26 + 32))(v22, v27, v28);
    swift_release();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v24, v14);
    (*(void (**)(uint64_t, char *, uint64_t))(v26 + 16))(v11, v22, v28);
    return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v22, v28);
  }
}

uint64_t outlined destroy of A1?(uint64_t a1, uint64_t a2)
{
  uint64_t v5;

  v5 = *(_QWORD *)(a2 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v5 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, a2);
  return a1;
}

{
  uint64_t v5;

  v5 = *(_QWORD *)(a2 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v5 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, a2);
  return a1;
}

uint64_t Validator.MissingRequiredValue.init(source:keyPath:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v9;

  v6 = *a2;
  v5 = (_QWORD *)MEMORY[0x24BEE46A8];
  v9 = *(_QWORD *)(*a2 + *MEMORY[0x24BEE46A8]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a3, a1);
  result = type metadata accessor for Validator.MissingRequiredValue(0, v9, *(_QWORD *)(*(_QWORD *)(v6 + *v5 + 8) + 16), v3);
  *(_QWORD *)(a3 + *(int *)(result + 36)) = a2;
  return result;
}

uint64_t type metadata accessor for Validator.MissingRequiredValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Validator.MissingRequiredValue);
}

uint64_t Validator.MissingRequiredValue.source.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2);
}

uint64_t Validator.MissingRequiredValue.keyPath.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + *(int *)(a1 + 36));
  swift_retain();
  return v3;
}

uint64_t Validator.MissingRequiredValue.errorDescription.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  Swift::String v4;
  Swift::String v5;
  Swift::String v6;
  uint64_t v8;
  unint64_t v9;
  void *object;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Builtin::Word v20;
  int v21;
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v11 = a1;
  v30 = 0;
  v19 = *(_QWORD *)(a1 + 16);
  v31 = v19;
  v17 = *(_QWORD *)(v19 - 8);
  v9 = (*(_QWORD *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v18 = (char *)&v8 - v9;
  v30 = v1;
  v13 = *(_QWORD *)(MEMORY[0x24BDAC7A8](a1) + 24);
  v29 = v13;
  v2 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
  v23 = &v27;
  v27 = v2;
  v28 = v3;
  v21 = 1;
  v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Missing required value at: ", 0x1BuLL, 1);
  object = v4._object;
  DefaultStringInterpolation.appendLiteral(_:)(v4);
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(v16 + *(int *)(v11 + 36));
  swift_retain();
  v14 = &v26;
  v26 = v12;
  type metadata accessor for Optional();
  v20 = 0;
  type metadata accessor for KeyPath();
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  swift_release();
  v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(" for: ", 6uLL, v21 & 1);
  v15 = v5._object;
  DefaultStringInterpolation.appendLiteral(_:)(v5);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v18, v16, v19);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v18, v19);
  v6 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", v20, v21 & 1);
  v22 = v6._object;
  DefaultStringInterpolation.appendLiteral(_:)(v6);
  swift_bridgeObjectRelease();
  v25 = v27;
  v24 = v28;
  swift_bridgeObjectRetain();
  outlined destroy of DefaultStringInterpolation();
  return String.init(stringInterpolation:)();
}

uint64_t protocol witness for Error._domain.getter in conformance Validator<A>.MissingRequiredValue<A1>()
{
  return Error._domain.getter();
}

uint64_t protocol witness for Error._code.getter in conformance Validator<A>.MissingRequiredValue<A1>()
{
  return Error._code.getter();
}

uint64_t protocol witness for Error._userInfo.getter in conformance Validator<A>.MissingRequiredValue<A1>()
{
  return Error._userInfo.getter();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance Validator<A>.MissingRequiredValue<A1>()
{
  return Error._getEmbeddedNSError()();
}

uint64_t protocol witness for LocalizedError.errorDescription.getter in conformance Validator<A>.MissingRequiredValue<A1>(uint64_t a1)
{
  return Validator.MissingRequiredValue.errorDescription.getter(a1);
}

uint64_t protocol witness for LocalizedError.failureReason.getter in conformance Validator<A>.MissingRequiredValue<A1>()
{
  return LocalizedError.failureReason.getter();
}

uint64_t protocol witness for LocalizedError.recoverySuggestion.getter in conformance Validator<A>.MissingRequiredValue<A1>()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t protocol witness for LocalizedError.helpAnchor.getter in conformance Validator<A>.MissingRequiredValue<A1>()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t base witness table accessor for Error in Validator<A>.MissingRequiredValue<A1>(uint64_t a1)
{
  return MEMORY[0x2426331CC](&protocol conformance descriptor for Validator<A>.MissingRequiredValue<A1>, a1);
}

uint64_t type metadata instantiation function for Validator()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata completion function for Validator()
{
  unint64_t v0;
  uint64_t v2;

  v2 = swift_checkMetadataState();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

uint64_t initializeBufferWithCopyOfBuffer for Validator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (**(uint64_t (***)(void))(*(_QWORD *)(a3 + 16) - 8))();
}

uint64_t destroy for Validator(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> initializeWithCopy for Validator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 16))();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> assignWithCopy for Validator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 24))();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> initializeWithTake for Validator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 32))();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> assignWithTake for Validator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))();
}

uint64_t getEnumTagSinglePayload for Validator()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23D2B8CE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for Validator()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23D2B8D2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 56))(a1, a2);
}

uint64_t type metadata instantiation function for Validator.MissingRequiredValue()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata completion function for Validator.MissingRequiredValue()
{
  unint64_t v0;
  uint64_t v2;

  v2 = swift_checkMetadataState();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

unint64_t initializeBufferWithCopyOfBuffer for Validator.MissingRequiredValue(_QWORD *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v11;

  v11 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v11 & 0x20000) != 0)
  {
    v6 = *a2;
    swift_retain();
    *a1 = v6;
    return *a1 + ((v11 + 16) & ~(unint64_t)v11);
  }
  else
  {
    (*(void (**)(_QWORD *, uint64_t *))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 16))(a1, a2);
    v4 = *(int *)(a3 + 36);
    v5 = *(uint64_t *)((char *)a2 + v4);
    swift_retain();
    *(_QWORD *)((char *)a1 + v4) = v5;
    return (unint64_t)a1;
  }
}

uint64_t destroy for Validator.MissingRequiredValue(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
  return swift_release();
}

uint64_t initializeWithCopy for Validator.MissingRequiredValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 16))();
  v7 = *(int *)(a3 + 36);
  v8 = *(_QWORD *)(a2 + v7);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + v7) = v8;
  return result;
}

uint64_t assignWithCopy for Validator.MissingRequiredValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 24))();
  v6 = *(int *)(a3 + 36);
  v7 = *(_QWORD *)(a2 + v6);
  swift_retain();
  *(_QWORD *)(a1 + v6) = v7;
  swift_release();
  return a1;
}

uint64_t initializeWithTake for Validator.MissingRequiredValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 32))();
  result = a1;
  *(_QWORD *)(a1 + *(int *)(a3 + 36)) = *(_QWORD *)(a2 + *(int *)(a3 + 36));
  return result;
}

uint64_t assignWithTake for Validator.MissingRequiredValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))();
  *(_QWORD *)(a1 + *(int *)(a3 + 36)) = *(_QWORD *)(a2 + *(int *)(a3 + 36));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Validator.MissingRequiredValue()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23D2B9144(uint64_t a1, unsigned int a2, uint64_t a3)
{
  int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  if (a2 == *(_DWORD *)(v7 + 84))
  {
    return (*(unsigned int (**)(uint64_t, _QWORD, uint64_t))(v7 + 48))(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    v4 = -1;
    if (*(_QWORD *)(a1 + *(int *)(a3 + 36)) < 0x100000000uLL)
      v4 = *(_QWORD *)(a1 + *(int *)(a3 + 36));
    return (v4 + 1);
  }
  else
  {
    __break(1u);
  }
  return v5;
}

uint64_t storeEnumTagSinglePayload for Validator.MissingRequiredValue()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23D2B923C(uint64_t result, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a4 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  if (a3 == *(_DWORD *)(v5 + 84))
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(v5 + 56))(result, a2, a2, v4);
  if (a3 == 0x7FFFFFFF)
    *(_QWORD *)(result + *(int *)(a4 + 36)) = a2 - 1;
  else
    __break(1u);
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x242633178](a1, v6, a5);
}

BOOL static GPKProfileInformationRequest.Scope.== infix(_:_:)(_BYTE *a1, _BYTE *a2)
{
  return ((*a1 & 1) != 0) == (unint64_t)((*a2 & 1) != 0);
}

uint64_t GPKProfileInformationRequest.Scope.hash(into:)()
{
  return Hasher.combine<A>(_:)();
}

BOOL static GPKProfileInformationRequest.Scope.CodingKeys.== infix(_:_:)(char a1, char a2)
{
  return ((a1 & 1) != 0) == (unint64_t)((a2 & 1) != 0);
}

uint64_t GPKProfileInformationRequest.Scope.CodingKeys.hash(into:)()
{
  return Hasher.combine<A>(_:)();
}

uint64_t GPKProfileInformationRequest.Scope.CodingKeys.init(stringValue:)()
{
  char v2;
  char v3;
  char v4;

  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("name", 4uLL, 1);
  swift_bridgeObjectRetain();
  v3 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v3 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
LABEL_6:
    swift_bridgeObjectRelease();
    return v4 & 1;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("photo", 5uLL, 1);
  swift_bridgeObjectRetain();
  v2 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v4 = 1;
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 2;
}

uint64_t GPKProfileInformationRequest.Scope.CodingKeys.init(intValue:)()
{
  return 2;
}

uint64_t GPKProfileInformationRequest.Scope.CodingKeys.hashValue.getter()
{
  lazy protocol witness table accessor for type GPKProfileInformationRequest.Scope.CodingKeys and conformance GPKProfileInformationRequest.Scope.CodingKeys();
  return _hashValue<A>(for:)();
}

unint64_t lazy protocol witness table accessor for type GPKProfileInformationRequest.Scope.CodingKeys and conformance GPKProfileInformationRequest.Scope.CodingKeys()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.CodingKeys and conformance GPKProfileInformationRequest.Scope.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.CodingKeys and conformance GPKProfileInformationRequest.Scope.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKProfileInformationRequest.Scope.CodingKeys, &type metadata for GPKProfileInformationRequest.Scope.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.CodingKeys and conformance GPKProfileInformationRequest.Scope.CodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.CodingKeys and conformance GPKProfileInformationRequest.Scope.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.CodingKeys and conformance GPKProfileInformationRequest.Scope.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKProfileInformationRequest.Scope.CodingKeys, &type metadata for GPKProfileInformationRequest.Scope.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.CodingKeys and conformance GPKProfileInformationRequest.Scope.CodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.CodingKeys and conformance GPKProfileInformationRequest.Scope.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.CodingKeys and conformance GPKProfileInformationRequest.Scope.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKProfileInformationRequest.Scope.CodingKeys, &type metadata for GPKProfileInformationRequest.Scope.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.CodingKeys and conformance GPKProfileInformationRequest.Scope.CodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.CodingKeys and conformance GPKProfileInformationRequest.Scope.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.CodingKeys and conformance GPKProfileInformationRequest.Scope.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKProfileInformationRequest.Scope.CodingKeys, &type metadata for GPKProfileInformationRequest.Scope.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.CodingKeys and conformance GPKProfileInformationRequest.Scope.CodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.CodingKeys and conformance GPKProfileInformationRequest.Scope.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.CodingKeys and conformance GPKProfileInformationRequest.Scope.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKProfileInformationRequest.Scope.CodingKeys, &type metadata for GPKProfileInformationRequest.Scope.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.CodingKeys and conformance GPKProfileInformationRequest.Scope.CodingKeys);
    return v0;
  }
  return v2;
}

uint64_t GPKProfileInformationRequest.Scope.CodingKeys.intValue.getter()
{
  return 0;
}

uint64_t GPKProfileInformationRequest.Scope.CodingKeys.stringValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("photo", 5uLL, 1)._countAndFlagsBits;
  else
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("name", 4uLL, 1)._countAndFlagsBits;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance GPKProfileInformationRequest.Scope.CodingKeys(_BYTE *a1, _BYTE *a2)
{
  return static GPKProfileInformationRequest.Scope.CodingKeys.== infix(_:_:)(*a1 & 1, *a2 & 1);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance GPKProfileInformationRequest.Scope.CodingKeys()
{
  return GPKProfileInformationRequest.Scope.CodingKeys.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GPKProfileInformationRequest.Scope.CodingKeys()
{
  return GPKProfileInformationRequest.Scope.CodingKeys.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GPKProfileInformationRequest.Scope.CodingKeys(Swift::Int a1)
{
  return Hashable._rawHashValue(seed:)(a1);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GPKProfileInformationRequest.Scope.CodingKeys()
{
  _BYTE *v0;

  return GPKProfileInformationRequest.Scope.CodingKeys.stringValue.getter(*v0 & 1);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GPKProfileInformationRequest.Scope.CodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = GPKProfileInformationRequest.Scope.CodingKeys.init(stringValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance GPKProfileInformationRequest.Scope.CodingKeys()
{
  return GPKProfileInformationRequest.Scope.CodingKeys.intValue.getter();
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance GPKProfileInformationRequest.Scope.CodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = GPKProfileInformationRequest.Scope.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GPKProfileInformationRequest.Scope.CodingKeys()
{
  lazy protocol witness table accessor for type GPKProfileInformationRequest.Scope.CodingKeys and conformance GPKProfileInformationRequest.Scope.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GPKProfileInformationRequest.Scope.CodingKeys()
{
  lazy protocol witness table accessor for type GPKProfileInformationRequest.Scope.CodingKeys and conformance GPKProfileInformationRequest.Scope.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t GPKProfileInformationRequest.Scope.NameCodingKeys.init(stringValue:)()
{
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t GPKProfileInformationRequest.Scope.NameCodingKeys.init(intValue:)()
{
  return 1;
}

uint64_t GPKProfileInformationRequest.Scope.NameCodingKeys.intValue.getter()
{
  return 0;
}

uint64_t GPKProfileInformationRequest.Scope.NameCodingKeys.stringValue.getter()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1)._countAndFlagsBits;
}

uint64_t GPKProfileInformationRequest.Scope.PhotoCodingKeys.init(stringValue:)()
{
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t GPKProfileInformationRequest.Scope.PhotoCodingKeys.init(intValue:)()
{
  return 1;
}

uint64_t GPKProfileInformationRequest.Scope.PhotoCodingKeys.intValue.getter()
{
  return 0;
}

uint64_t GPKProfileInformationRequest.Scope.PhotoCodingKeys.stringValue.getter()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1)._countAndFlagsBits;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GPKProfileInformationRequest.Scope.NameCodingKeys()
{
  return GPKProfileInformationRequest.Scope.NameCodingKeys.stringValue.getter();
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GPKProfileInformationRequest.Scope.NameCodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = GPKProfileInformationRequest.Scope.NameCodingKeys.init(stringValue:)();
  *a1 = result & 1;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance GPKProfileInformationRequest.Scope.NameCodingKeys()
{
  return GPKProfileInformationRequest.Scope.NameCodingKeys.intValue.getter();
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance GPKProfileInformationRequest.Scope.NameCodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = GPKProfileInformationRequest.Scope.NameCodingKeys.init(intValue:)();
  *a1 = result & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GPKProfileInformationRequest.Scope.NameCodingKeys()
{
  lazy protocol witness table accessor for type GPKProfileInformationRequest.Scope.NameCodingKeys and conformance GPKProfileInformationRequest.Scope.NameCodingKeys();
  return CodingKey.description.getter();
}

unint64_t lazy protocol witness table accessor for type GPKProfileInformationRequest.Scope.NameCodingKeys and conformance GPKProfileInformationRequest.Scope.NameCodingKeys()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.NameCodingKeys and conformance GPKProfileInformationRequest.Scope.NameCodingKeys;
  if (!lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.NameCodingKeys and conformance GPKProfileInformationRequest.Scope.NameCodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKProfileInformationRequest.Scope.NameCodingKeys, &type metadata for GPKProfileInformationRequest.Scope.NameCodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.NameCodingKeys and conformance GPKProfileInformationRequest.Scope.NameCodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.NameCodingKeys and conformance GPKProfileInformationRequest.Scope.NameCodingKeys;
  if (!lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.NameCodingKeys and conformance GPKProfileInformationRequest.Scope.NameCodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKProfileInformationRequest.Scope.NameCodingKeys, &type metadata for GPKProfileInformationRequest.Scope.NameCodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.NameCodingKeys and conformance GPKProfileInformationRequest.Scope.NameCodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.NameCodingKeys and conformance GPKProfileInformationRequest.Scope.NameCodingKeys;
  if (!lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.NameCodingKeys and conformance GPKProfileInformationRequest.Scope.NameCodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKProfileInformationRequest.Scope.NameCodingKeys, &type metadata for GPKProfileInformationRequest.Scope.NameCodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.NameCodingKeys and conformance GPKProfileInformationRequest.Scope.NameCodingKeys);
    return v0;
  }
  return v2;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GPKProfileInformationRequest.Scope.NameCodingKeys()
{
  lazy protocol witness table accessor for type GPKProfileInformationRequest.Scope.NameCodingKeys and conformance GPKProfileInformationRequest.Scope.NameCodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GPKProfileInformationRequest.Scope.PhotoCodingKeys()
{
  return GPKProfileInformationRequest.Scope.PhotoCodingKeys.stringValue.getter();
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GPKProfileInformationRequest.Scope.PhotoCodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = GPKProfileInformationRequest.Scope.PhotoCodingKeys.init(stringValue:)();
  *a1 = result & 1;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance GPKProfileInformationRequest.Scope.PhotoCodingKeys()
{
  return GPKProfileInformationRequest.Scope.PhotoCodingKeys.intValue.getter();
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance GPKProfileInformationRequest.Scope.PhotoCodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = GPKProfileInformationRequest.Scope.PhotoCodingKeys.init(intValue:)();
  *a1 = result & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GPKProfileInformationRequest.Scope.PhotoCodingKeys()
{
  lazy protocol witness table accessor for type GPKProfileInformationRequest.Scope.PhotoCodingKeys and conformance GPKProfileInformationRequest.Scope.PhotoCodingKeys();
  return CodingKey.description.getter();
}

unint64_t lazy protocol witness table accessor for type GPKProfileInformationRequest.Scope.PhotoCodingKeys and conformance GPKProfileInformationRequest.Scope.PhotoCodingKeys()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.PhotoCodingKeys and conformance GPKProfileInformationRequest.Scope.PhotoCodingKeys;
  if (!lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.PhotoCodingKeys and conformance GPKProfileInformationRequest.Scope.PhotoCodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKProfileInformationRequest.Scope.PhotoCodingKeys, &type metadata for GPKProfileInformationRequest.Scope.PhotoCodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.PhotoCodingKeys and conformance GPKProfileInformationRequest.Scope.PhotoCodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.PhotoCodingKeys and conformance GPKProfileInformationRequest.Scope.PhotoCodingKeys;
  if (!lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.PhotoCodingKeys and conformance GPKProfileInformationRequest.Scope.PhotoCodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKProfileInformationRequest.Scope.PhotoCodingKeys, &type metadata for GPKProfileInformationRequest.Scope.PhotoCodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.PhotoCodingKeys and conformance GPKProfileInformationRequest.Scope.PhotoCodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.PhotoCodingKeys and conformance GPKProfileInformationRequest.Scope.PhotoCodingKeys;
  if (!lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.PhotoCodingKeys and conformance GPKProfileInformationRequest.Scope.PhotoCodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKProfileInformationRequest.Scope.PhotoCodingKeys, &type metadata for GPKProfileInformationRequest.Scope.PhotoCodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope.PhotoCodingKeys and conformance GPKProfileInformationRequest.Scope.PhotoCodingKeys);
    return v0;
  }
  return v2;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GPKProfileInformationRequest.Scope.PhotoCodingKeys()
{
  lazy protocol witness table accessor for type GPKProfileInformationRequest.Scope.PhotoCodingKeys and conformance GPKProfileInformationRequest.Scope.PhotoCodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t GPKProfileInformationRequest.Scope.encode(to:)(uint64_t a1)
{
  unsigned __int8 *v1;
  _QWORD *v2;
  _QWORD v4[3];
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  char v21;
  char v22;
  char v23;
  _QWORD *v24;

  v13 = a1;
  v24 = 0;
  v23 = 0;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GPKProfileInformationRequest.Scope.PhotoCodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v4 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GPKProfileInformationRequest.Scope.NameCodingKeys>);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v4 - v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GPKProfileInformationRequest.Scope.CodingKeys>);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = (*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = (_QWORD *)MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v4 - v16;
  v24 = v2;
  v20 = *v1;
  v23 = v20 & 1;
  v18 = v2[3];
  v19 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v18);
  lazy protocol witness table accessor for type GPKProfileInformationRequest.Scope.CodingKeys and conformance GPKProfileInformationRequest.Scope.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  if ((v20 & 1) != 0)
  {
    v4[1] = &v22;
    v22 = 1;
    lazy protocol witness table accessor for type GPKProfileInformationRequest.Scope.PhotoCodingKeys and conformance GPKProfileInformationRequest.Scope.PhotoCodingKeys();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  else
  {
    v4[2] = &v21;
    v21 = 0;
    lazy protocol witness table accessor for type GPKProfileInformationRequest.Scope.NameCodingKeys and conformance GPKProfileInformationRequest.Scope.NameCodingKeys();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

uint64_t GPKProfileInformationRequest.Scope.hashValue.getter()
{
  lazy protocol witness table accessor for type GPKProfileInformationRequest.Scope and conformance GPKProfileInformationRequest.Scope();
  return _hashValue<A>(for:)();
}

unint64_t lazy protocol witness table accessor for type GPKProfileInformationRequest.Scope and conformance GPKProfileInformationRequest.Scope()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope and conformance GPKProfileInformationRequest.Scope;
  if (!lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope and conformance GPKProfileInformationRequest.Scope)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKProfileInformationRequest.Scope, &type metadata for GPKProfileInformationRequest.Scope);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope and conformance GPKProfileInformationRequest.Scope);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope and conformance GPKProfileInformationRequest.Scope;
  if (!lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope and conformance GPKProfileInformationRequest.Scope)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKProfileInformationRequest.Scope, &type metadata for GPKProfileInformationRequest.Scope);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope and conformance GPKProfileInformationRequest.Scope);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope and conformance GPKProfileInformationRequest.Scope;
  if (!lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope and conformance GPKProfileInformationRequest.Scope)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKProfileInformationRequest.Scope, &type metadata for GPKProfileInformationRequest.Scope);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope and conformance GPKProfileInformationRequest.Scope);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope and conformance GPKProfileInformationRequest.Scope;
  if (!lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope and conformance GPKProfileInformationRequest.Scope)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKProfileInformationRequest.Scope, &type metadata for GPKProfileInformationRequest.Scope);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKProfileInformationRequest.Scope and conformance GPKProfileInformationRequest.Scope);
    return v0;
  }
  return v2;
}

uint64_t GPKProfileInformationRequest.Scope.init(from:)@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v12;
  uint64_t v13;
  _QWORD v14[2];
  uint64_t v15;
  uint64_t v16;
  int v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t countAndFlagsBits;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  int v40;
  int v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  unint64_t v45;
  int v46;
  _BYTE *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  char v67;
  _QWORD v68[4];
  unsigned __int8 v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  char v76;

  v47 = a2;
  v56 = a1;
  v75 = 0;
  v48 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GPKProfileInformationRequest.Scope.PhotoCodingKeys>);
  v49 = *(_QWORD *)(v48 - 8);
  v50 = (*(_QWORD *)(v49 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v48);
  v51 = (char *)v14 - v50;
  v52 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GPKProfileInformationRequest.Scope.NameCodingKeys>);
  v53 = *(_QWORD *)(v52 - 8);
  v54 = (*(_QWORD *)(v53 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v52);
  v55 = (char *)v14 - v54;
  v57 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GPKProfileInformationRequest.Scope.CodingKeys>);
  v58 = *(_QWORD *)(v57 - 8);
  v59 = (*(_QWORD *)(v58 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = (_QWORD *)MEMORY[0x24BDAC7A8](v56);
  v60 = (char *)v14 - v59;
  v75 = v2;
  v62 = v2[3];
  v63 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v62);
  lazy protocol witness table accessor for type GPKProfileInformationRequest.Scope.CodingKeys and conformance GPKProfileInformationRequest.Scope.CodingKeys();
  v3 = v61;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  v64 = v3;
  v65 = v3;
  if (v3)
  {
    v25 = v65;
  }
  else
  {
    v4 = KeyedDecodingContainer.allKeys.getter();
    v43 = &v70;
    v70 = v4;
    v42 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GPKProfileInformationRequest.Scope.CodingKeys]);
    lazy protocol witness table accessor for type [GPKProfileInformationRequest.Scope.CodingKeys] and conformance [A]();
    v71 = ArraySlice.init<A>(_:)();
    v72 = v5;
    v73 = v6;
    v74 = v7;
    v44 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArraySlice<GPKProfileInformationRequest.Scope.CodingKeys>);
    v45 = lazy protocol witness table accessor for type ArraySlice<GPKProfileInformationRequest.Scope.CodingKeys> and conformance ArraySlice<A>();
    Collection<>.popFirst()();
    v46 = v69;
    if (v69 == 2)
      goto LABEL_12;
    v41 = v46;
    v34 = v46;
    v39 = v71;
    v35 = v72;
    v36 = v73;
    v37 = v74;
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    v38 = v68;
    v68[0] = v39;
    v68[1] = v35;
    v68[2] = v36;
    v68[3] = v37;
    v40 = Collection.isEmpty.getter();
    outlined destroy of ArraySlice<GPKProfileInformationRequest.Scope.CodingKeys>();
    swift_unknownObjectRelease();
    if ((v40 & 1) == 0)
    {
LABEL_12:
      v19 = 0;
      v23 = type metadata accessor for DecodingError();
      v17 = 1;
      v24 = swift_allocError();
      v22 = v12;
      v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
      v18 = (char *)v22 + *(int *)(v13 + 48);
      *v22 = &type metadata for GPKProfileInformationRequest.Scope;
      v20 = KeyedDecodingContainer.codingPath.getter();
      countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Invalid number of keys found, expected one.", 0x2BuLL, v17 & 1)._countAndFlagsBits;
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(_QWORD *, _QWORD))(*(_QWORD *)(v23 - 8) + 104))(v22, *MEMORY[0x24BEE26D0]);
      swift_willThrow();
      outlined destroy of ArraySlice<GPKProfileInformationRequest.Scope.CodingKeys>();
      (*(void (**)(char *, uint64_t))(v58 + 8))(v60, v57);
      v25 = v24;
    }
    else if ((v34 & 1) != 0)
    {
      v27 = &v67;
      v67 = v34 & 1;
      lazy protocol witness table accessor for type GPKProfileInformationRequest.Scope.PhotoCodingKeys and conformance GPKProfileInformationRequest.Scope.PhotoCodingKeys();
      v9 = v64;
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      v28 = v9;
      v29 = v9;
      if (!v9)
      {
        v76 = 1;
        (*(void (**)(char *, uint64_t))(v49 + 8))(v51, v48);
        v30 = v28;
        goto LABEL_11;
      }
      v15 = v29;
      outlined destroy of ArraySlice<GPKProfileInformationRequest.Scope.CodingKeys>();
      (*(void (**)(char *, uint64_t))(v58 + 8))(v60, v57);
      v25 = v15;
    }
    else
    {
      v31 = &v66;
      v66 = v34 & 1;
      lazy protocol witness table accessor for type GPKProfileInformationRequest.Scope.NameCodingKeys and conformance GPKProfileInformationRequest.Scope.NameCodingKeys();
      v8 = v64;
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      v32 = v8;
      v33 = v8;
      if (!v8)
      {
        v76 = 0;
        (*(void (**)(char *, uint64_t))(v53 + 8))(v55, v52);
        v30 = v32;
LABEL_11:
        v26 = v30;
        outlined destroy of ArraySlice<GPKProfileInformationRequest.Scope.CodingKeys>();
        (*(void (**)(char *, uint64_t))(v58 + 8))(v60, v57);
        v10 = v56;
        *v47 = v76 & 1;
        return __swift_destroy_boxed_opaque_existential_1(v10);
      }
      v16 = v33;
      outlined destroy of ArraySlice<GPKProfileInformationRequest.Scope.CodingKeys>();
      (*(void (**)(char *, uint64_t))(v58 + 8))(v60, v57);
      v25 = v16;
    }
  }
  v14[1] = v25;
  return __swift_destroy_boxed_opaque_existential_1(v56);
}

unint64_t lazy protocol witness table accessor for type [GPKProfileInformationRequest.Scope.CodingKeys] and conformance [A]()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [GPKProfileInformationRequest.Scope.CodingKeys] and conformance [A];
  if (!lazy protocol witness table cache variable for type [GPKProfileInformationRequest.Scope.CodingKeys] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [GPKProfileInformationRequest.Scope.CodingKeys]);
    v1 = MEMORY[0x2426331CC](MEMORY[0x24BEE12C8], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [GPKProfileInformationRequest.Scope.CodingKeys] and conformance [A]);
    return v1;
  }
  return v3;
}

unint64_t lazy protocol witness table accessor for type ArraySlice<GPKProfileInformationRequest.Scope.CodingKeys> and conformance ArraySlice<A>()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type ArraySlice<GPKProfileInformationRequest.Scope.CodingKeys> and conformance ArraySlice<A>;
  if (!lazy protocol witness table cache variable for type ArraySlice<GPKProfileInformationRequest.Scope.CodingKeys> and conformance ArraySlice<A>)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ArraySlice<GPKProfileInformationRequest.Scope.CodingKeys>);
    v1 = MEMORY[0x2426331CC](MEMORY[0x24BEE2190], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type ArraySlice<GPKProfileInformationRequest.Scope.CodingKeys> and conformance ArraySlice<A>);
    return v1;
  }
  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of ArraySlice<GPKProfileInformationRequest.Scope.CodingKeys>()
{
  swift_unknownObjectRelease();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance GPKProfileInformationRequest.Scope(_BYTE *a1, _BYTE *a2)
{
  return static GPKProfileInformationRequest.Scope.== infix(_:_:)(a1, a2);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance GPKProfileInformationRequest.Scope()
{
  return GPKProfileInformationRequest.Scope.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GPKProfileInformationRequest.Scope()
{
  return GPKProfileInformationRequest.Scope.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GPKProfileInformationRequest.Scope(Swift::Int a1)
{
  return Hashable._rawHashValue(seed:)(a1);
}

uint64_t protocol witness for Decodable.init(from:) in conformance GPKProfileInformationRequest.Scope@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  return GPKProfileInformationRequest.Scope.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GPKProfileInformationRequest.Scope(uint64_t a1)
{
  return GPKProfileInformationRequest.Scope.encode(to:)(a1);
}

uint64_t GPKProfileInformationRequest.scopes.getter()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t *GPKProfileInformationRequest.init(scopes:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *result;
  uint64_t v5;

  v5 = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v5 = a1;
  *a2 = a1;
  swift_bridgeObjectRelease();
  result = &v5;
  outlined destroy of GPKProfileInformationRequest();
  return result;
}

uint64_t static GPKProfileInformationRequest.CodingKeys.== infix(_:_:)()
{
  return 1;
}

uint64_t GPKProfileInformationRequest.CodingKeys.hash(into:)()
{
  return Hasher.combine<A>(_:)();
}

BOOL GPKProfileInformationRequest.CodingKeys.init(stringValue:)()
{
  char v1;

  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("scopes", 6uLL, 1);
  swift_bridgeObjectRetain();
  v1 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (v1 & 1) == 0;
}

uint64_t GPKProfileInformationRequest.CodingKeys.init(intValue:)()
{
  return 1;
}

uint64_t GPKProfileInformationRequest.CodingKeys.hashValue.getter()
{
  lazy protocol witness table accessor for type GPKProfileInformationRequest.CodingKeys and conformance GPKProfileInformationRequest.CodingKeys();
  return _hashValue<A>(for:)();
}

unint64_t lazy protocol witness table accessor for type GPKProfileInformationRequest.CodingKeys and conformance GPKProfileInformationRequest.CodingKeys()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKProfileInformationRequest.CodingKeys and conformance GPKProfileInformationRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKProfileInformationRequest.CodingKeys and conformance GPKProfileInformationRequest.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKProfileInformationRequest.CodingKeys, &type metadata for GPKProfileInformationRequest.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKProfileInformationRequest.CodingKeys and conformance GPKProfileInformationRequest.CodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKProfileInformationRequest.CodingKeys and conformance GPKProfileInformationRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKProfileInformationRequest.CodingKeys and conformance GPKProfileInformationRequest.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKProfileInformationRequest.CodingKeys, &type metadata for GPKProfileInformationRequest.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKProfileInformationRequest.CodingKeys and conformance GPKProfileInformationRequest.CodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKProfileInformationRequest.CodingKeys and conformance GPKProfileInformationRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKProfileInformationRequest.CodingKeys and conformance GPKProfileInformationRequest.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKProfileInformationRequest.CodingKeys, &type metadata for GPKProfileInformationRequest.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKProfileInformationRequest.CodingKeys and conformance GPKProfileInformationRequest.CodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKProfileInformationRequest.CodingKeys and conformance GPKProfileInformationRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKProfileInformationRequest.CodingKeys and conformance GPKProfileInformationRequest.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKProfileInformationRequest.CodingKeys, &type metadata for GPKProfileInformationRequest.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKProfileInformationRequest.CodingKeys and conformance GPKProfileInformationRequest.CodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKProfileInformationRequest.CodingKeys and conformance GPKProfileInformationRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKProfileInformationRequest.CodingKeys and conformance GPKProfileInformationRequest.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKProfileInformationRequest.CodingKeys, &type metadata for GPKProfileInformationRequest.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKProfileInformationRequest.CodingKeys and conformance GPKProfileInformationRequest.CodingKeys);
    return v0;
  }
  return v2;
}

uint64_t GPKProfileInformationRequest.CodingKeys.intValue.getter()
{
  return 0;
}

uint64_t GPKProfileInformationRequest.CodingKeys.stringValue.getter()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("scopes", 6uLL, 1)._countAndFlagsBits;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GPKProfileInformationRequest.CodingKeys()
{
  return static GPKProfileInformationRequest.CodingKeys.== infix(_:_:)() & 1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance GPKProfileInformationRequest.CodingKeys()
{
  return GPKProfileInformationRequest.CodingKeys.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GPKProfileInformationRequest.CodingKeys()
{
  return GPKProfileInformationRequest.CodingKeys.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GPKProfileInformationRequest.CodingKeys(Swift::Int a1)
{
  return Hashable._rawHashValue(seed:)(a1);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GPKProfileInformationRequest.CodingKeys()
{
  return GPKProfileInformationRequest.CodingKeys.stringValue.getter();
}

BOOL protocol witness for CodingKey.init(stringValue:) in conformance GPKProfileInformationRequest.CodingKeys@<W0>(_BYTE *a1@<X8>)
{
  _BOOL8 result;

  result = GPKProfileInformationRequest.CodingKeys.init(stringValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance GPKProfileInformationRequest.CodingKeys()
{
  return GPKProfileInformationRequest.CodingKeys.intValue.getter();
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance GPKProfileInformationRequest.CodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = GPKProfileInformationRequest.CodingKeys.init(intValue:)();
  *a1 = result & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GPKProfileInformationRequest.CodingKeys()
{
  lazy protocol witness table accessor for type GPKProfileInformationRequest.CodingKeys and conformance GPKProfileInformationRequest.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GPKProfileInformationRequest.CodingKeys()
{
  lazy protocol witness table accessor for type GPKProfileInformationRequest.CodingKeys and conformance GPKProfileInformationRequest.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t GPKProfileInformationRequest.encode(to:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;

  v5 = a1;
  v20 = 0;
  v19 = 0;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GPKProfileInformationRequest.CodingKeys>);
  v6 = *(_QWORD *)(v12 - 8);
  v7 = (*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v10 = (char *)&v4 - v7;
  v20 = (_QWORD *)MEMORY[0x24BDAC7A8](v5);
  v11 = *v1;
  v19 = v1;
  v8 = v20[3];
  v9 = v20[4];
  __swift_project_boxed_opaque_existential_1(v20, v8);
  lazy protocol witness table accessor for type GPKProfileInformationRequest.CodingKeys and conformance GPKProfileInformationRequest.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  swift_bridgeObjectRetain();
  v15 = &v18;
  v18 = v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Set<GPKProfileInformationRequest.Scope>);
  lazy protocol witness table accessor for type Set<GPKProfileInformationRequest.Scope> and conformance <> Set<A>();
  v2 = v14;
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  v16 = v2;
  v17 = v2;
  if (v2)
    v4 = v17;
  outlined destroy of Set<GPKProfileInformationRequest.Scope>();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v10, v12);
}

unint64_t lazy protocol witness table accessor for type Set<GPKProfileInformationRequest.Scope> and conformance <> Set<A>()
{
  unint64_t v0;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v3 = lazy protocol witness table cache variable for type Set<GPKProfileInformationRequest.Scope> and conformance <> Set<A>;
  if (!lazy protocol witness table cache variable for type Set<GPKProfileInformationRequest.Scope> and conformance <> Set<A>)
  {
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Set<GPKProfileInformationRequest.Scope>);
    v4 = lazy protocol witness table accessor for type GPKProfileInformationRequest.Scope and conformance GPKProfileInformationRequest.Scope();
    v0 = MEMORY[0x2426331CC](MEMORY[0x24BEE1700], v2, &v4);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type Set<GPKProfileInformationRequest.Scope> and conformance <> Set<A>);
    return v0;
  }
  return v3;
}

{
  unint64_t v0;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v3 = lazy protocol witness table cache variable for type Set<GPKProfileInformationRequest.Scope> and conformance <> Set<A>;
  if (!lazy protocol witness table cache variable for type Set<GPKProfileInformationRequest.Scope> and conformance <> Set<A>)
  {
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Set<GPKProfileInformationRequest.Scope>);
    v4 = lazy protocol witness table accessor for type GPKProfileInformationRequest.Scope and conformance GPKProfileInformationRequest.Scope();
    v0 = MEMORY[0x2426331CC](MEMORY[0x24BEE1720], v2, &v4);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type Set<GPKProfileInformationRequest.Scope> and conformance <> Set<A>);
    return v0;
  }
  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of Set<GPKProfileInformationRequest.Scope>()
{
  swift_bridgeObjectRelease();
}

uint64_t GPKProfileInformationRequest.init(from:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  _QWORD v6[2];
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;

  v14 = a2;
  v15 = a1;
  v26 = 0;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GPKProfileInformationRequest.CodingKeys>);
  v17 = *(_QWORD *)(v16 - 8);
  v18 = (*(_QWORD *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v19 = (char *)v6 - v18;
  v26 = (_QWORD *)MEMORY[0x24BDAC7A8](v15);
  v21 = v26[3];
  v22 = v26[4];
  __swift_project_boxed_opaque_existential_1(v26, v21);
  lazy protocol witness table accessor for type GPKProfileInformationRequest.CodingKeys and conformance GPKProfileInformationRequest.CodingKeys();
  v2 = v20;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  v23 = v2;
  v24 = v2;
  if (v2)
  {
    v8 = v24;
  }
  else
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Set<GPKProfileInformationRequest.Scope>);
    lazy protocol witness table accessor for type Set<GPKProfileInformationRequest.Scope> and conformance <> Set<A>();
    v3 = v23;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    v12 = v3;
    v13 = v3;
    if (!v3)
    {
      v9 = v25;
      swift_bridgeObjectRetain();
      v10 = &v27;
      v27 = v9;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
      v4 = v15;
      *v14 = v9;
      __swift_destroy_boxed_opaque_existential_1(v4);
      result = (uint64_t)v10;
      outlined destroy of GPKProfileInformationRequest();
      return result;
    }
    v7 = v13;
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    v8 = v7;
  }
  v6[1] = v8;
  return __swift_destroy_boxed_opaque_existential_1(v15);
}

unint64_t base witness table accessor for Equatable in GPKProfileInformationRequest.Scope()
{
  return lazy protocol witness table accessor for type GPKProfileInformationRequest.Scope and conformance GPKProfileInformationRequest.Scope();
}

uint64_t protocol witness for Decodable.init(from:) in conformance GPKProfileInformationRequest@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return GPKProfileInformationRequest.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GPKProfileInformationRequest(uint64_t a1)
{
  return GPKProfileInformationRequest.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for GPKProfileInformationRequest()
{
  return &type metadata for GPKProfileInformationRequest;
}

uint64_t getEnumTagSinglePayload for GPKProfileInformationRequest.Scope(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v5;
  int v6;
  unsigned int v7;
  int v8;

  if (a2)
  {
    if (a2 <= 0xFE)
      goto LABEL_15;
    v7 = ((a2 + 1) >> 8) + 1;
    v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000)
        v2 = 4;
      else
        v2 = 2;
      v8 = v2;
    }
    if (v8 == 1)
      v6 = a1[1];
    else
      v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    if (v6)
    {
      v5 = (*a1 | ((v6 - 1) << 8)) + 254;
    }
    else
    {
LABEL_15:
      v3 = *a1 - 2;
      if (v3 < 0)
        v3 = -1;
      v5 = v3;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

_BYTE *storeEnumTagSinglePayload for GPKProfileInformationRequest.Scope(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  v7 = 0;
  if (a3 > 0xFE)
  {
    v5 = ((a3 + 1) >> 8) + 1;
    v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000)
        v3 = 4;
      else
        v3 = 2;
      v6 = v3;
    }
    v7 = v6;
  }
  if (a2 > 0xFE)
  {
    v4 = ((a2 - 255) >> 8) + 1;
    *result = a2 + 1;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2)
      *result = a2 + 1;
  }
  return result;
}

uint64_t getEnumTag for GPKProfileInformationRequest.Scope(_BYTE *a1)
{
  return *a1 & 1;
}

_BYTE *destructiveInjectEnumTag for GPKProfileInformationRequest.Scope(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for GPKProfileInformationRequest.Scope()
{
  return &type metadata for GPKProfileInformationRequest.Scope;
}

uint64_t getEnumTagSinglePayload for GPKProfileInformationRequest.Scope.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v5;
  int v6;
  unsigned int v7;
  int v8;

  if (a2)
  {
    if (a2 <= 0xFE)
      goto LABEL_15;
    v7 = ((a2 + 1) >> 8) + 1;
    v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000)
        v2 = 4;
      else
        v2 = 2;
      v8 = v2;
    }
    if (v8 == 1)
      v6 = a1[1];
    else
      v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    if (v6)
    {
      v5 = (*a1 | ((v6 - 1) << 8)) + 254;
    }
    else
    {
LABEL_15:
      v3 = *a1 - 2;
      if (v3 < 0)
        v3 = -1;
      v5 = v3;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

_BYTE *storeEnumTagSinglePayload for GPKProfileInformationRequest.Scope.CodingKeys(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  v7 = 0;
  if (a3 > 0xFE)
  {
    v5 = ((a3 + 1) >> 8) + 1;
    v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000)
        v3 = 4;
      else
        v3 = 2;
      v6 = v3;
    }
    v7 = v6;
  }
  if (a2 > 0xFE)
  {
    v4 = ((a2 - 255) >> 8) + 1;
    *result = a2 + 1;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2)
      *result = a2 + 1;
  }
  return result;
}

uint64_t getEnumTag for GPKProfileInformationRequest.Scope.CodingKeys(_BYTE *a1)
{
  return *a1 & 1;
}

_BYTE *destructiveInjectEnumTag for GPKProfileInformationRequest.Scope.CodingKeys(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for GPKProfileInformationRequest.Scope.CodingKeys()
{
  return &type metadata for GPKProfileInformationRequest.Scope.CodingKeys;
}

ValueMetadata *type metadata accessor for GPKProfileInformationRequest.Scope.NameCodingKeys()
{
  return &type metadata for GPKProfileInformationRequest.Scope.NameCodingKeys;
}

ValueMetadata *type metadata accessor for GPKProfileInformationRequest.Scope.PhotoCodingKeys()
{
  return &type metadata for GPKProfileInformationRequest.Scope.PhotoCodingKeys;
}

uint64_t getEnumTagSinglePayload for GPKProfileInformationRequest.CodingKeys(unsigned __int8 *a1, int a2)
{
  int v2;
  int v4;
  int v5;
  int v6;

  if (a2)
  {
    v6 = 1;
    if ((a2 + 1) >= 0x100)
    {
      if ((a2 + 1) >= 0x10000)
        v2 = 4;
      else
        v2 = 2;
      v6 = v2;
    }
    if (v6 == 1)
    {
      v5 = *a1;
    }
    else if (v6 == 2)
    {
      v5 = *(unsigned __int16 *)a1;
    }
    else
    {
      v5 = *(_DWORD *)a1;
    }
    if (v5)
      v4 = v5 - 1;
    else
      v4 = -1;
  }
  else
  {
    v4 = -1;
  }
  return (v4 + 1);
}

_BYTE *storeEnumTagSinglePayload for GPKProfileInformationRequest.CodingKeys(_BYTE *result, int a2, int a3)
{
  int v3;
  int v4;
  int v5;

  v5 = 0;
  if (a3)
  {
    v4 = 1;
    if ((a3 + 1) >= 0x100)
    {
      if ((a3 + 1) >= 0x10000)
        v3 = 4;
      else
        v3 = 2;
      v4 = v3;
    }
    v5 = v4;
  }
  if (a2)
  {
    if (v5)
    {
      if (v5 == 1)
      {
        *result = a2;
      }
      else if (v5 == 2)
      {
        *(_WORD *)result = a2;
      }
      else
      {
        *(_DWORD *)result = a2;
      }
    }
  }
  else if (v5)
  {
    if (v5 == 1)
    {
      *result = 0;
    }
    else if (v5 == 2)
    {
      *(_WORD *)result = 0;
    }
    else
    {
      *(_DWORD *)result = 0;
    }
  }
  return result;
}

uint64_t getEnumTag for GPKProfileInformationRequest.CodingKeys()
{
  return 0;
}

ValueMetadata *type metadata accessor for GPKProfileInformationRequest.CodingKeys()
{
  return &type metadata for GPKProfileInformationRequest.CodingKeys;
}

unint64_t base witness table accessor for CustomDebugStringConvertible in GPKProfileInformationRequest.CodingKeys()
{
  return lazy protocol witness table accessor for type GPKProfileInformationRequest.CodingKeys and conformance GPKProfileInformationRequest.CodingKeys();
}

unint64_t base witness table accessor for CustomStringConvertible in GPKProfileInformationRequest.CodingKeys()
{
  return lazy protocol witness table accessor for type GPKProfileInformationRequest.CodingKeys and conformance GPKProfileInformationRequest.CodingKeys();
}

unint64_t base witness table accessor for Equatable in GPKProfileInformationRequest.CodingKeys()
{
  return lazy protocol witness table accessor for type GPKProfileInformationRequest.CodingKeys and conformance GPKProfileInformationRequest.CodingKeys();
}

unint64_t base witness table accessor for CustomDebugStringConvertible in GPKProfileInformationRequest.Scope.PhotoCodingKeys()
{
  return lazy protocol witness table accessor for type GPKProfileInformationRequest.Scope.PhotoCodingKeys and conformance GPKProfileInformationRequest.Scope.PhotoCodingKeys();
}

unint64_t base witness table accessor for CustomStringConvertible in GPKProfileInformationRequest.Scope.PhotoCodingKeys()
{
  return lazy protocol witness table accessor for type GPKProfileInformationRequest.Scope.PhotoCodingKeys and conformance GPKProfileInformationRequest.Scope.PhotoCodingKeys();
}

unint64_t base witness table accessor for CustomDebugStringConvertible in GPKProfileInformationRequest.Scope.NameCodingKeys()
{
  return lazy protocol witness table accessor for type GPKProfileInformationRequest.Scope.NameCodingKeys and conformance GPKProfileInformationRequest.Scope.NameCodingKeys();
}

unint64_t base witness table accessor for CustomStringConvertible in GPKProfileInformationRequest.Scope.NameCodingKeys()
{
  return lazy protocol witness table accessor for type GPKProfileInformationRequest.Scope.NameCodingKeys and conformance GPKProfileInformationRequest.Scope.NameCodingKeys();
}

unint64_t base witness table accessor for CustomDebugStringConvertible in GPKProfileInformationRequest.Scope.CodingKeys()
{
  return lazy protocol witness table accessor for type GPKProfileInformationRequest.Scope.CodingKeys and conformance GPKProfileInformationRequest.Scope.CodingKeys();
}

unint64_t base witness table accessor for CustomStringConvertible in GPKProfileInformationRequest.Scope.CodingKeys()
{
  return lazy protocol witness table accessor for type GPKProfileInformationRequest.Scope.CodingKeys and conformance GPKProfileInformationRequest.Scope.CodingKeys();
}

unint64_t base witness table accessor for Equatable in GPKProfileInformationRequest.Scope.CodingKeys()
{
  return lazy protocol witness table accessor for type GPKProfileInformationRequest.Scope.CodingKeys and conformance GPKProfileInformationRequest.Scope.CodingKeys();
}

void SubscriberUserInfoKey.isPrivate.getter()
{
  __asm { BR              X8 }
}

uint64_t sub_23D2BC674()
{
  return 0;
}

GroupKit::SubscriberUserInfoKey_optional __swiftcall SubscriberUserInfoKey.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  GroupKit::SubscriberUserInfoKey_optional result;
  char *v5;
  Swift::Int v7;
  char v8;

  v5 = v1;
  v2 = _allocateUninitializedArray<A>(_:)();
  *(_QWORD *)v3 = "GPKSubscriberUserInfoKeyAddedMembers";
  *(_QWORD *)(v3 + 8) = 36;
  *(_BYTE *)(v3 + 16) = 2;
  *(_QWORD *)(v3 + 24) = "GPKSubscriberUserInfoKeyRemovedMembers";
  *(_QWORD *)(v3 + 32) = 38;
  *(_BYTE *)(v3 + 40) = 2;
  *(_QWORD *)(v3 + 48) = "GPKSubscriberUserInfoKeyActingMember";
  *(_QWORD *)(v3 + 56) = 36;
  *(_BYTE *)(v3 + 64) = 2;
  *(_QWORD *)(v3 + 72) = "GPKSubscriberUserInfoKeyDeliveredSilently";
  *(_QWORD *)(v3 + 80) = 41;
  *(_BYTE *)(v3 + 88) = 2;
  _finalizeUninitializedArray<A>(_:)();
  v7 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)v2, rawValue);
  swift_bridgeObjectRelease();
  if (v7)
  {
    switch(v7)
    {
      case 1:
        v8 = 1;
        break;
      case 2:
        v8 = 2;
        break;
      case 3:
        v8 = 3;
        break;
      default:
        result.value = swift_bridgeObjectRelease();
        *v5 = 4;
        return result;
    }
  }
  else
  {
    v8 = 0;
  }
  *v5 = v8;
  return (GroupKit::SubscriberUserInfoKey_optional)swift_bridgeObjectRelease();
}

void SubscriberUserInfoKey.rawValue.getter()
{
  __asm { BR              X8 }
}

uint64_t sub_23D2BC8B8()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GPKSubscriberUserInfoKeyAddedMembers", 0x24uLL, 1)._countAndFlagsBits;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance SubscriberUserInfoKey()
{
  lazy protocol witness table accessor for type SubscriberUserInfoKey and conformance SubscriberUserInfoKey();
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance SubscriberUserInfoKey()
{
  lazy protocol witness table accessor for type SubscriberUserInfoKey and conformance SubscriberUserInfoKey();
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance SubscriberUserInfoKey()
{
  lazy protocol witness table accessor for type SubscriberUserInfoKey and conformance SubscriberUserInfoKey();
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance SubscriberUserInfoKey()
{
  lazy protocol witness table accessor for type SubscriberUserInfoKey and conformance SubscriberUserInfoKey();
  return RawRepresentable<>._rawHashValue(seed:)();
}

GroupKit::SubscriberUserInfoKey_optional protocol witness for RawRepresentable.init(rawValue:) in conformance SubscriberUserInfoKey(Swift::String *a1)
{
  return SubscriberUserInfoKey.init(rawValue:)(*a1);
}

void protocol witness for RawRepresentable.rawValue.getter in conformance SubscriberUserInfoKey(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  SubscriberUserInfoKey.rawValue.getter();
  *a1 = v1;
  a1[1] = v2;
}

void GPKGroupManagerEventSubscriber.didUpdate(group:)()
{
  GPKGroupManagerEventSubscriber.didUpdate(group:)();
}

void GPKGroupManagerEventSubscriber.didLeave(group:)()
{
  GPKGroupManagerEventSubscriber.didLeave(group:)();
}

void GPKGroupManagerEventSubscriber.didDeleteGroup(with:)()
{
  GPKGroupManagerEventSubscriber.didDeleteGroup(with:)();
}

void GPKGroupManagerEventSubscriber.memberAcceptedInvite(_:group:)()
{
  GPKGroupManagerEventSubscriber.memberAcceptedInvite(_:group:)();
}

void GPKGroupManagerEventSubscriber.memberDeclinedInvite(_:group:)()
{
  GPKGroupManagerEventSubscriber.memberDeclinedInvite(_:group:)();
}

void GPKGroupManagerEventSubscriber.receivedGroupInvite(for:)()
{
  GPKGroupManagerEventSubscriber.receivedGroupInvite(for:)();
}

void GPKGroupManagerEventSubscriber.receivedGroupUpdate(for:userInfo:)()
{
  GPKGroupManagerEventSubscriber.receivedGroupUpdate(for:userInfo:)();
}

void GPKGroupManagerEventSubscriber.receivedGroupDeletion(for:userInfo:)()
{
  GPKGroupManagerEventSubscriber.receivedGroupDeletion(for:userInfo:)();
}

void GPKGroupManagerEventSubscriber.removedFromGroup(_:)()
{
  GPKGroupManagerEventSubscriber.removedFromGroup(_:)();
}

void GPKGroupManagerEventSubscriber.receivedInvitationDeletion(groupID:)()
{
  GPKGroupManagerEventSubscriber.receivedInvitationDeletion(groupID:)();
}

Swift::Bool __swiftcall GPKGroupManagerEventSubscriber.includePrivateUserInfoKeys()()
{
  return GPKGroupManagerEventSubscriber.includePrivateUserInfoKeys()();
}

{
  return 1;
}

Swift::Void __swiftcall GPKGroupManagerEventSubscriber.daemonConnectionInvalidated()()
{
  GPKGroupManagerEventSubscriber.daemonConnectionInvalidated()();
}

uint64_t GPKMemberRemoval.removedMember.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 16);
  swift_retain();
  return v2;
}

uint64_t GPKMemberRemoval.actingMember.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 24);
  swift_retain();
  return v2;
}

uint64_t GPKMemberRemoval.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = *(_QWORD *)(v0 + 16);
  v1 = swift_retain();
  (*(void (**)(uint64_t))(*(_QWORD *)v5 + 472))(v1);
  swift_release();
  Hasher.combine<A>(_:)();
  v2 = *(_QWORD *)(v6 + 24);
  v3 = swift_retain();
  (*(void (**)(uint64_t))(*(_QWORD *)v2 + 472))(v3);
  swift_release();
  return Hasher.combine<A>(_:)();
}

uint64_t GPKMemberRemoval.__allocating_init(removedMember:actingMember:)(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  return GPKMemberRemoval.init(removedMember:actingMember:)(a1, a2);
}

uint64_t GPKMemberRemoval.init(removedMember:actingMember:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v6;

  swift_retain();
  *(_QWORD *)(v2 + 16) = a1;
  swift_retain();
  *(_QWORD *)(v2 + 24) = a2;
  swift_release();
  swift_release();
  return v6;
}

BOOL static GPKMemberRemoval.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v11;

  type metadata accessor for GPKMember();
  v8 = *(_QWORD *)(a1 + 16);
  swift_retain();
  v7 = *(_QWORD *)(a2 + 16);
  swift_retain();
  v11 = static GPKMember.== infix(_:_:)(v8, v7);
  swift_release();
  swift_release();
  swift_retain();
  swift_retain();
  if (v11)
  {
    v4 = *(_QWORD *)(a1 + 24);
    swift_retain();
    v3 = *(_QWORD *)(a2 + 24);
    swift_retain();
    v5 = static GPKMember.== infix(_:_:)(v4, v3);
    swift_release();
    swift_release();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  swift_release();
  swift_release();
  return v6;
}

BOOL static GPKMemberRemoval.CodingKeys.== infix(_:_:)(char a1, char a2)
{
  return ((a1 & 1) != 0) == (unint64_t)((a2 & 1) != 0);
}

uint64_t GPKMemberRemoval.CodingKeys.hash(into:)()
{
  return Hasher.combine<A>(_:)();
}

uint64_t GPKMemberRemoval.CodingKeys.init(stringValue:)()
{
  char v2;
  char v3;
  char v4;

  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("removedMember", 0xDuLL, 1);
  swift_bridgeObjectRetain();
  v3 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v3 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
LABEL_6:
    swift_bridgeObjectRelease();
    return v4 & 1;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("actingMember", 0xCuLL, 1);
  swift_bridgeObjectRetain();
  v2 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v4 = 1;
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 2;
}

uint64_t GPKMemberRemoval.CodingKeys.init(intValue:)()
{
  return 2;
}

uint64_t GPKMemberRemoval.CodingKeys.hashValue.getter()
{
  lazy protocol witness table accessor for type GPKMemberRemoval.CodingKeys and conformance GPKMemberRemoval.CodingKeys();
  return _hashValue<A>(for:)();
}

unint64_t lazy protocol witness table accessor for type GPKMemberRemoval.CodingKeys and conformance GPKMemberRemoval.CodingKeys()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKMemberRemoval.CodingKeys and conformance GPKMemberRemoval.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKMemberRemoval.CodingKeys and conformance GPKMemberRemoval.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKMemberRemoval.CodingKeys, &type metadata for GPKMemberRemoval.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKMemberRemoval.CodingKeys and conformance GPKMemberRemoval.CodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKMemberRemoval.CodingKeys and conformance GPKMemberRemoval.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKMemberRemoval.CodingKeys and conformance GPKMemberRemoval.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKMemberRemoval.CodingKeys, &type metadata for GPKMemberRemoval.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKMemberRemoval.CodingKeys and conformance GPKMemberRemoval.CodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKMemberRemoval.CodingKeys and conformance GPKMemberRemoval.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKMemberRemoval.CodingKeys and conformance GPKMemberRemoval.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKMemberRemoval.CodingKeys, &type metadata for GPKMemberRemoval.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKMemberRemoval.CodingKeys and conformance GPKMemberRemoval.CodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKMemberRemoval.CodingKeys and conformance GPKMemberRemoval.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKMemberRemoval.CodingKeys and conformance GPKMemberRemoval.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKMemberRemoval.CodingKeys, &type metadata for GPKMemberRemoval.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKMemberRemoval.CodingKeys and conformance GPKMemberRemoval.CodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKMemberRemoval.CodingKeys and conformance GPKMemberRemoval.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKMemberRemoval.CodingKeys and conformance GPKMemberRemoval.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKMemberRemoval.CodingKeys, &type metadata for GPKMemberRemoval.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKMemberRemoval.CodingKeys and conformance GPKMemberRemoval.CodingKeys);
    return v0;
  }
  return v2;
}

uint64_t GPKMemberRemoval.CodingKeys.intValue.getter()
{
  return 0;
}

uint64_t GPKMemberRemoval.CodingKeys.stringValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("actingMember", 0xCuLL, 1)._countAndFlagsBits;
  else
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("removedMember", 0xDuLL, 1)._countAndFlagsBits;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance GPKMemberRemoval.CodingKeys(_BYTE *a1, _BYTE *a2)
{
  return static GPKMemberRemoval.CodingKeys.== infix(_:_:)(*a1 & 1, *a2 & 1);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance GPKMemberRemoval.CodingKeys()
{
  return GPKMemberRemoval.CodingKeys.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GPKMemberRemoval.CodingKeys()
{
  return GPKMemberRemoval.CodingKeys.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GPKMemberRemoval.CodingKeys(Swift::Int a1)
{
  return Hashable._rawHashValue(seed:)(a1);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GPKMemberRemoval.CodingKeys()
{
  _BYTE *v0;

  return GPKMemberRemoval.CodingKeys.stringValue.getter(*v0 & 1);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GPKMemberRemoval.CodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = GPKMemberRemoval.CodingKeys.init(stringValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance GPKMemberRemoval.CodingKeys()
{
  return GPKMemberRemoval.CodingKeys.intValue.getter();
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance GPKMemberRemoval.CodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = GPKMemberRemoval.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GPKMemberRemoval.CodingKeys()
{
  lazy protocol witness table accessor for type GPKMemberRemoval.CodingKeys and conformance GPKMemberRemoval.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GPKMemberRemoval.CodingKeys()
{
  lazy protocol witness table accessor for type GPKMemberRemoval.CodingKeys and conformance GPKMemberRemoval.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t GPKMemberRemoval.deinit()
{
  uint64_t v1;

  swift_release();
  swift_release();
  return v1;
}

uint64_t GPKMemberRemoval.__deallocating_deinit()
{
  GPKMemberRemoval.deinit();
  return swift_deallocClassInstance();
}

uint64_t GPKMemberRemoval.encode(to:)(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;

  v10 = a1;
  v31 = 0;
  v30 = 0;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GPKMemberRemoval.CodingKeys>);
  v11 = *(_QWORD *)(v19 - 8);
  v12 = (*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v15 = (char *)v6 - v12;
  v31 = (_QWORD *)MEMORY[0x24BDAC7A8](v10);
  v30 = v1;
  v13 = v31[3];
  v14 = v31[4];
  __swift_project_boxed_opaque_existential_1(v31, v13);
  lazy protocol witness table accessor for type GPKMemberRemoval.CodingKeys and conformance GPKMemberRemoval.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v17 = *(_QWORD *)(v16 + 16);
  swift_retain();
  v22 = &v29;
  v29 = v17;
  v18 = &v28;
  v28 = 0;
  v20 = type metadata accessor for GPKMember();
  v2 = lazy protocol witness table accessor for type GPKMember and conformance GPKMember();
  v3 = v21;
  v23 = v2;
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  v24 = v3;
  v25 = v3;
  if (v3)
  {
    v6[1] = v25;
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v15, v19);
  }
  else
  {
    swift_release();
    v4 = v24;
    v7 = *(_QWORD *)(v16 + 24);
    swift_retain();
    v27 = v7;
    v26 = 1;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    v8 = v4;
    v9 = v4;
    if (v4)
      v6[0] = v9;
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v15, v19);
  }
}

uint64_t GPKMemberRemoval.hashValue.getter()
{
  type metadata accessor for GPKMemberRemoval();
  lazy protocol witness table accessor for type GPKMemberRemoval and conformance GPKMemberRemoval();
  return _hashValue<A>(for:)();
}

uint64_t type metadata accessor for GPKMemberRemoval()
{
  return objc_opt_self();
}

uint64_t GPKMemberRemoval.__allocating_init(from:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  swift_allocObject();
  v5 = GPKMemberRemoval.init(from:)(a1);
  if (v3)
    return v2;
  else
    return v5;
}

uint64_t GPKMemberRemoval.init(from:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v9[4];
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  char v36;

  v20 = a1;
  v35 = 0;
  v34 = 0;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GPKMemberRemoval.CodingKeys>);
  v22 = *(_QWORD *)(v21 - 8);
  v23 = (*(_QWORD *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v24 = (char *)v9 - v23;
  v35 = (_QWORD *)MEMORY[0x24BDAC7A8](v20);
  v34 = v1;
  v36 = 0;
  v26 = v35[3];
  v27 = v35[4];
  __swift_project_boxed_opaque_existential_1(v35, v26);
  lazy protocol witness table accessor for type GPKMemberRemoval.CodingKeys and conformance GPKMemberRemoval.CodingKeys();
  v2 = v25;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  v28 = v2;
  v29 = v2;
  if (v2)
  {
    v11 = v29;
  }
  else
  {
    v15 = type metadata accessor for GPKMember();
    v14 = &v32;
    v32 = 0;
    v3 = lazy protocol witness table accessor for type GPKMember and conformance GPKMember();
    v4 = v28;
    v16 = v3;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    v17 = v4;
    v18 = v4;
    if (!v4)
    {
      v36 = 1;
      *(_QWORD *)(v19 + 16) = v33;
      v30 = 1;
      KeyedDecodingContainer.decode<A>(_:forKey:)();
      v12 = 0;
      v13 = 0;
      v5 = v21;
      v6 = v24;
      v7 = v22;
      v36 = 3;
      *(_QWORD *)(v19 + 24) = v31;
      (*(void (**)(char *, uint64_t))(v7 + 8))(v6, v5);
      __swift_destroy_boxed_opaque_existential_1(v20);
      return v19;
    }
    v10 = v18;
    (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
    v11 = v10;
  }
  v9[3] = v11;
  if ((v36 & 3) == 3)
  {
    swift_release();
  }
  else
  {
    if ((v36 & 1) != 0)
      swift_release();
    v9[2] = v19;
    v9[1] = v19;
    type metadata accessor for GPKMemberRemoval();
    swift_deallocPartialClassInstance();
  }
  __swift_destroy_boxed_opaque_existential_1(v20);
  return v9[0];
}

uint64_t protocol witness for Decodable.init(from:) in conformance GPKMemberRemoval@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 128))();
  if (!v2)
    *a1 = result;
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GPKMemberRemoval()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 112))();
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance GPKMemberRemoval()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 120))();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GPKMemberRemoval()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 96))();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GPKMemberRemoval(Swift::Int a1)
{
  return Hashable._rawHashValue(seed:)(a1);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance GPKMemberRemoval(uint64_t *a1, uint64_t *a2)
{
  return static GPKMemberRemoval.== infix(_:_:)(*a1, *a2);
}

unint64_t base witness table accessor for Equatable in SubscriberUserInfoKey()
{
  return lazy protocol witness table accessor for type SubscriberUserInfoKey and conformance SubscriberUserInfoKey();
}

unint64_t base witness table accessor for Equatable in GPKMemberRemoval()
{
  return lazy protocol witness table accessor for type GPKMemberRemoval and conformance GPKMemberRemoval();
}

uint64_t getEnumTagSinglePayload for SubscriberUserInfoKey(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v5;
  int v6;
  unsigned int v7;
  int v8;

  if (a2)
  {
    if (a2 <= 0xFC)
      goto LABEL_15;
    v7 = ((a2 + 3) >> 8) + 1;
    v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000)
        v2 = 4;
      else
        v2 = 2;
      v8 = v2;
    }
    if (v8 == 1)
      v6 = a1[1];
    else
      v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    if (v6)
    {
      v5 = (*a1 | ((v6 - 1) << 8)) + 252;
    }
    else
    {
LABEL_15:
      v3 = *a1 - 4;
      if (v3 < 0)
        v3 = -1;
      v5 = v3;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

_BYTE *storeEnumTagSinglePayload for SubscriberUserInfoKey(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  v7 = 0;
  if (a3 > 0xFC)
  {
    v5 = ((a3 + 3) >> 8) + 1;
    v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000)
        v3 = 4;
      else
        v3 = 2;
      v6 = v3;
    }
    v7 = v6;
  }
  if (a2 > 0xFC)
  {
    v4 = ((a2 - 253) >> 8) + 1;
    *result = a2 + 3;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2)
      *result = a2 + 3;
  }
  return result;
}

uint64_t getEnumTag for SubscriberUserInfoKey(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for SubscriberUserInfoKey(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SubscriberUserInfoKey()
{
  return &type metadata for SubscriberUserInfoKey;
}

uint64_t dispatch thunk of GPKGroupManagerEventSubscriber.didUpdate(group:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of GPKGroupManagerEventSubscriber.didLeave(group:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of GPKGroupManagerEventSubscriber.didDeleteGroup(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of GPKGroupManagerEventSubscriber.memberAcceptedInvite(_:group:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of GPKGroupManagerEventSubscriber.memberDeclinedInvite(_:group:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of GPKGroupManagerEventSubscriber.receivedGroupInvite(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of GPKGroupManagerEventSubscriber.receivedGroupUpdate(for:userInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t dispatch thunk of GPKGroupManagerEventSubscriber.receivedGroupDeletion(for:userInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 64))();
}

uint64_t dispatch thunk of GPKGroupManagerEventSubscriber.removedFromGroup(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of GPKGroupManagerEventSubscriber.receivedInvitationDeletion(groupID:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of GPKGroupManagerEventSubscriber.includePrivateUserInfoKeys()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))() & 1;
}

uint64_t dispatch thunk of GPKGroupManagerEventSubscriber.daemonConnectionInvalidated()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t method lookup function for GPKMemberRemoval()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of GPKMemberRemoval.hash(into:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of GPKMemberRemoval.__allocating_init(removedMember:actingMember:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of GPKMemberRemoval.encode(to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of GPKMemberRemoval.hashValue.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of GPKMemberRemoval.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t getEnumTagSinglePayload for GPKMemberRemoval.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v5;
  int v6;
  unsigned int v7;
  int v8;

  if (a2)
  {
    if (a2 <= 0xFE)
      goto LABEL_15;
    v7 = ((a2 + 1) >> 8) + 1;
    v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000)
        v2 = 4;
      else
        v2 = 2;
      v8 = v2;
    }
    if (v8 == 1)
      v6 = a1[1];
    else
      v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    if (v6)
    {
      v5 = (*a1 | ((v6 - 1) << 8)) + 254;
    }
    else
    {
LABEL_15:
      v3 = *a1 - 2;
      if (v3 < 0)
        v3 = -1;
      v5 = v3;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

_BYTE *storeEnumTagSinglePayload for GPKMemberRemoval.CodingKeys(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  v7 = 0;
  if (a3 > 0xFE)
  {
    v5 = ((a3 + 1) >> 8) + 1;
    v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000)
        v3 = 4;
      else
        v3 = 2;
      v6 = v3;
    }
    v7 = v6;
  }
  if (a2 > 0xFE)
  {
    v4 = ((a2 - 255) >> 8) + 1;
    *result = a2 + 1;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2)
      *result = a2 + 1;
  }
  return result;
}

uint64_t getEnumTag for GPKMemberRemoval.CodingKeys(_BYTE *a1)
{
  return *a1 & 1;
}

_BYTE *destructiveInjectEnumTag for GPKMemberRemoval.CodingKeys(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for GPKMemberRemoval.CodingKeys()
{
  return &type metadata for GPKMemberRemoval.CodingKeys;
}

unint64_t base witness table accessor for CustomDebugStringConvertible in GPKMemberRemoval.CodingKeys()
{
  return lazy protocol witness table accessor for type GPKMemberRemoval.CodingKeys and conformance GPKMemberRemoval.CodingKeys();
}

unint64_t base witness table accessor for CustomStringConvertible in GPKMemberRemoval.CodingKeys()
{
  return lazy protocol witness table accessor for type GPKMemberRemoval.CodingKeys and conformance GPKMemberRemoval.CodingKeys();
}

unint64_t base witness table accessor for Equatable in GPKMemberRemoval.CodingKeys()
{
  return lazy protocol witness table accessor for type GPKMemberRemoval.CodingKeys and conformance GPKMemberRemoval.CodingKeys();
}

uint64_t *DatabaseParticipant.userID.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of GPKUserID((uint64_t *)(v1 + OBJC_IVAR____TtC8GroupKit19DatabaseParticipant_userID), a1);
}

uint64_t DatabaseParticipant.handle.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC8GroupKit19DatabaseParticipant_handle);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t DatabaseParticipant.permission.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC8GroupKit19DatabaseParticipant_permission);
}

uint64_t DatabaseParticipant.inviteStatus.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC8GroupKit19DatabaseParticipant_inviteStatus);
}

uint64_t DatabaseParticipant.isMe.getter()
{
  uint64_t v0;

  return *(_BYTE *)(v0 + OBJC_IVAR____TtC8GroupKit19DatabaseParticipant_isMe) & 1;
}

id DatabaseParticipant.__allocating_init(member:)(uint64_t a1)
{
  objc_class *v1;
  id v2;
  uint64_t v4;
  uint64_t v5;
  id v7;

  v2 = objc_allocWithZone(v1);
  v7 = DatabaseParticipant.init(member:)(a1);
  if (v5)
    return (id)v4;
  else
    return v7;
}

{
  objc_class *v1;
  id v2;
  uint64_t v4;
  uint64_t v5;
  id v7;

  v2 = objc_allocWithZone(v1);
  v7 = DatabaseParticipant.init(member:)(a1);
  if (v5)
    return (id)v4;
  else
    return v7;
}

id DatabaseParticipant.init(member:)(uint64_t a1)
{
  char *v1;
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v13;
  uint64_t v14;
  objc_class *ObjectType;
  uint64_t v17;
  unint64_t v18;
  objc_super v19;
  char v20;
  _BYTE v21[2];
  char v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  id v29;

  ObjectType = (objc_class *)swift_getObjectType();
  v23 = 0;
  v24 = 0;
  v28 = a1;
  v2 = v1;
  v3 = v1;
  v4 = v1;
  v5 = v1;
  v29 = v1;
  (*(void (**)(uint64_t *__return_ptr, char *))(*(_QWORD *)a1 + 304))(&v26, v1);
  v17 = v26;
  v18 = v27;
  if ((v27 & 0xF000000000000000) == 0xF000000000000000)
  {

    type metadata accessor for InternalError();
    v25 = 46;
    InternalError.__allocating_init(_:internalInfo:)(&v25, 0);
    swift_willThrow();
    swift_release();
    swift_deallocPartialClassInstance();
    return (id)v14;
  }
  else
  {
    v23 = v26;
    v24 = v27;
    outlined copy of Data._Representation(v26, v27);
    v6 = (uint64_t *)&v1[OBJC_IVAR____TtC8GroupKit19DatabaseParticipant_userID];
    *v6 = v17;
    v6[1] = v18;

    v7 = (*(uint64_t (**)(void))(*(_QWORD *)a1 + 160))();
    v8 = (uint64_t *)&v1[OBJC_IVAR____TtC8GroupKit19DatabaseParticipant_handle];
    *v8 = v7;
    v8[1] = v9;

    (*(void (**)(char *__return_ptr))(*(_QWORD *)a1 + 184))(&v22);
    v21[1] = v22 & 1;
    *(_QWORD *)&v1[OBJC_IVAR____TtC8GroupKit19DatabaseParticipant_permission] = GPKMemberRole.rawValue.getter();

    (*(void (**)(_BYTE *__return_ptr))(*(_QWORD *)a1 + 232))(v21);
    v20 = v21[0];
    GPKMember.InviteStatus.rawValue.getter();
    *(_QWORD *)&v1[OBJC_IVAR____TtC8GroupKit19DatabaseParticipant_inviteStatus] = v10;

    v1[OBJC_IVAR____TtC8GroupKit19DatabaseParticipant_isMe] = (*(uint64_t (**)(void))(*(_QWORD *)a1 + 256))() & 1;
    outlined consume of Data._Representation(v17, v18);
    v19.receiver = v29;
    v19.super_class = ObjectType;
    v13 = objc_msgSendSuper2(&v19, sel_init);
    v11 = v13;
    v29 = v13;
    swift_release();

    return v13;
  }
}

{
  char *v1;
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  objc_class *ObjectType;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  objc_super v21;
  uint64_t v22[3];
  id v23;

  ObjectType = (objc_class *)swift_getObjectType();
  v22[2] = a1;
  v2 = v1;
  v3 = v1;
  v4 = v1;
  v5 = v1;
  v6 = v1;
  v23 = v1;
  v18 = *(_QWORD *)a1;
  v19 = *(_QWORD *)(a1 + 8);
  outlined copy of Data._Representation(*(_QWORD *)a1, v19);
  GPKUserID.init(_:)(v18, v19, v22);
  if (v20)
  {

    outlined destroy of GPK_DatabaseParticipants.Participant(a1);
    swift_deallocPartialClassInstance();
    return (id)v12;
  }
  else
  {
    v7 = v22[1];
    v8 = &v1[OBJC_IVAR____TtC8GroupKit19DatabaseParticipant_userID];
    *(_QWORD *)v8 = v22[0];
    *((_QWORD *)v8 + 1) = v7;

    v13 = *(_QWORD *)(a1 + 16);
    v14 = *(_QWORD *)(a1 + 24);
    swift_bridgeObjectRetain();
    v9 = &v1[OBJC_IVAR____TtC8GroupKit19DatabaseParticipant_handle];
    *(_QWORD *)v9 = v13;
    *((_QWORD *)v9 + 1) = v14;

    *(_QWORD *)&v1[OBJC_IVAR____TtC8GroupKit19DatabaseParticipant_permission] = *(_QWORD *)(a1 + 32);
    *(_QWORD *)&v1[OBJC_IVAR____TtC8GroupKit19DatabaseParticipant_inviteStatus] = *(_QWORD *)(a1 + 40);

    v1[OBJC_IVAR____TtC8GroupKit19DatabaseParticipant_isMe] = *(_BYTE *)(a1 + 48) & 1;
    v21.receiver = v23;
    v21.super_class = ObjectType;
    v15 = objc_msgSendSuper2(&v21, sel_init);
    v10 = v15;
    v23 = v15;
    outlined destroy of GPK_DatabaseParticipants.Participant(a1);

    return v15;
  }
}

uint64_t outlined destroy of GPK_DatabaseParticipants.Participant(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  outlined consume of Data._Representation(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  swift_bridgeObjectRelease();
  v3 = *(int *)(type metadata accessor for GPK_DatabaseParticipants.Participant() + 36);
  v1 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(a1 + v3);
  return a1;
}

void DatabaseParticipant.protobufRepresentation()()
{
  id v0;
  id v1;

  type metadata accessor for GPK_DatabaseParticipants.Participant();
  v0 = v1;
  lazy protocol witness table accessor for type GPK_DatabaseParticipants.Participant and conformance GPK_DatabaseParticipants.Participant();
  static Message.with(_:)();

}

uint64_t closure #1 in DatabaseParticipant.protobufRepresentation()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a2 + OBJC_IVAR____TtC8GroupKit19DatabaseParticipant_userID);
  v6 = *(_QWORD *)(a2 + OBJC_IVAR____TtC8GroupKit19DatabaseParticipant_userID + 8);
  outlined copy of Data._Representation(v5, v6);
  v2 = *(_QWORD *)a1;
  v3 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = v6;
  outlined consume of Data._Representation(v2, v3);
  v7 = *(_QWORD *)(a2 + OBJC_IVAR____TtC8GroupKit19DatabaseParticipant_handle);
  v8 = *(_QWORD *)(a2 + OBJC_IVAR____TtC8GroupKit19DatabaseParticipant_handle + 8);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 16) = v7;
  *(_QWORD *)(a1 + 24) = v8;
  swift_bridgeObjectRelease();
  result = a1;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + OBJC_IVAR____TtC8GroupKit19DatabaseParticipant_permission);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + OBJC_IVAR____TtC8GroupKit19DatabaseParticipant_inviteStatus);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + OBJC_IVAR____TtC8GroupKit19DatabaseParticipant_isMe) & 1;
  return result;
}

uint64_t partial apply for closure #1 in DatabaseParticipant.protobufRepresentation()(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in DatabaseParticipant.protobufRepresentation()(a1, *(_QWORD *)(v1 + 16));
}

id DatabaseParticipant.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t DatabaseParticipant.init()()
{
  uint64_t result;
  uint64_t v1;

  if (!"GroupKit.DatabaseParticipant")
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  result = closure #1 in _unimplementedInitializer(className:initName:file:line:column:)((uint64_t)"GroupKit.DatabaseParticipant", 28, (unint64_t)"init()", 6, 2, (unint64_t)"GroupKit/DatabaseParticipant.swift", 34, 2, v1, 0xCuLL, 0x14uLL);
  __break(1u);
  return result;
}

id DatabaseParticipant.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static ParticipantTransformer.register()()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ParticipantTransformer.Type);
  v4 = String.init<A>(describing:)();
  v7 = v0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v6 = (id)MEMORY[0x242632560](v4, v7);
  v1 = v6;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v8 = ParticipantTransformer.__allocating_init()();
  v5 = (id)objc_opt_self();
  v2 = v8;
  objc_msgSend(v5, sel_setValueTransformer_forName_, v8, v6);

  return swift_bridgeObjectRelease();
}

id ParticipantTransformer.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t static ParticipantTransformer.allowsReverseTransformation()()
{
  return 1;
}

uint64_t ParticipantTransformer.transformedValue(_:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v33[24];
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;

  v25 = a2;
  v27 = a1;
  v37 = 0;
  v36 = 0;
  v35 = 0;
  v32 = 0;
  v26 = 0;
  v28 = type metadata accessor for GPK_DatabaseParticipants();
  v29 = (*(_QWORD *)(*(_QWORD *)(v28 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v30 = (uint64_t)&v12 - v29;
  v37 = (char *)&v12 - v29;
  v36 = MEMORY[0x24BDAC7A8](v27);
  v35 = v2;
  outlined init with copy of Any?(v36, (uint64_t)v33);
  if (v34)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DatabaseParticipant]);
    result = swift_dynamicCast();
    if ((result & 1) != 0)
      v24 = v31;
    else
      v24 = 0;
    v23 = v24;
  }
  else
  {
    v12 = 0;
    result = outlined destroy of Any?((uint64_t)v33);
    v23 = v12;
  }
  v22 = v23;
  if (v23)
  {
    v21 = v22;
    v4 = v26;
    v16 = v22;
    v32 = v22;
    swift_bridgeObjectRetain();
    v17 = &v12;
    MEMORY[0x24BDAC7A8](&v12);
    v18 = &v12 - 4;
    *(&v12 - 2) = v5;
    v19 = lazy protocol witness table accessor for type GPK_DatabaseParticipants and conformance GPK_DatabaseParticipants();
    static Message.with(_:)();
    v20 = v4;
    if (v4)
    {
      __break(1u);

      v11 = v25;
      *v25 = 0;
      v11[1] = 0;
      v11[2] = 0;
      v11[3] = 0;
    }
    else
    {
      swift_bridgeObjectRelease();
      default argument 0 of Message.serializedData(partial:)();
      v13 = Message.serializedData(partial:)();
      v14 = v6;
      v15 = 0;
      v7 = v25;
      v8 = v13;
      v9 = v14;
      v25[3] = MEMORY[0x24BDCDDE8];
      *v7 = v8;
      v7[1] = v9;
    }
    outlined destroy of GPK_DatabaseParticipants(v30);
    return swift_bridgeObjectRelease();
  }
  else
  {
    v10 = v25;
    *v25 = 0;
    v10[1] = 0;
    v10[2] = 0;
    v10[3] = 0;
  }
  return result;
}

uint64_t closure #1 in ParticipantTransformer.transformedValue(_:)(uint64_t *a1)
{
  unint64_t v1;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DatabaseParticipant]);
  v5 = type metadata accessor for GPK_DatabaseParticipants.Participant();
  v1 = lazy protocol witness table accessor for type [DatabaseParticipant] and conformance [A]();
  result = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))closure #1 in closure #1 in ParticipantTransformer.transformedValue(_:), 0, v4, v5, MEMORY[0x24BEE4078], v1, MEMORY[0x24BEE40A8], v7);
  if (v6)
  {
    __break(1u);
  }
  else
  {
    *a1 = result;
    return swift_bridgeObjectRelease();
  }
  return result;
}

void closure #1 in closure #1 in ParticipantTransformer.transformedValue(_:)()
{
  DatabaseParticipant.protobufRepresentation()();
}

uint64_t default argument 0 of Message.serializedData(partial:)()
{
  return 0;
}

uint64_t ParticipantTransformer.reverseTransformedValue(_:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  id v18;
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
  unint64_t v31;
  _QWORD *v32;
  int v33;
  unint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  _QWORD *v45;
  void *v46;
  unint64_t v47;
  char *v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char *v56;
  uint64_t v57;
  unint64_t v58;
  _QWORD v59[2];
  _QWORD v60[5];
  uint64_t v61;
  unint64_t v62;
  char v63[8];
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;

  v45 = a2;
  v52 = a1;
  v67 = 0;
  v66 = 0;
  v65 = 0;
  v61 = 0;
  v62 = 0;
  v46 = 0;
  v49 = 0;
  v3 = type metadata accessor for BinaryDecodingOptions();
  v47 = (*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v3);
  v48 = (char *)&v17 - v47;
  v50 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GPK_DatabaseParticipants?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v49);
  v51 = (char *)&v17 - v50;
  v53 = type metadata accessor for GPK_DatabaseParticipants();
  v54 = *(_QWORD *)(v53 - 8);
  v55 = (*(_QWORD *)(v54 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = MEMORY[0x24BDAC7A8](v52);
  v56 = (char *)&v17 - v55;
  v67 = (char *)&v17 - v55;
  v66 = v4;
  v65 = v2;
  outlined init with copy of Any?(v4, (uint64_t)v63);
  if (v64)
  {
    result = swift_dynamicCast();
    if ((result & 1) != 0)
    {
      v43 = v57;
      v44 = v58;
    }
    else
    {
      v43 = 0;
      v44 = 0xF000000000000000;
    }
    v41 = v43;
    v42 = v44;
  }
  else
  {
    v20 = 0;
    v21 = 0xF000000000000000;
    result = outlined destroy of Any?((uint64_t)v63);
    v41 = v20;
    v42 = v21;
  }
  v39 = v42;
  v40 = v41;
  if ((v42 & 0xF000000000000000) == 0xF000000000000000)
  {
    v15 = v45;
    *v45 = 0;
    v15[1] = 0;
    v15[2] = 0;
    v15[3] = 0;
  }
  else
  {
    v37 = v40;
    v38 = v39;
    v6 = v46;
    v31 = v39;
    v30 = v40;
    v61 = v40;
    v62 = v39;
    outlined copy of Data._Representation(v40, v39);
    v32 = v60;
    memset(v60, 0, sizeof(v60));
    v34 = lazy protocol witness table accessor for type GPK_DatabaseParticipants and conformance GPK_DatabaseParticipants();
    v33 = default argument 2 of Message.init(serializedData:extensions:partial:options:)();
    default argument 3 of Message.init(serializedData:extensions:partial:options:)();
    Message.init(serializedData:extensions:partial:options:)();
    v35 = (uint64_t)v6;
    v36 = v6;
    if (v6)
    {
      v19 = 0;

      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v54 + 56))(v51, 1, 1, v53);
      v29 = v19;
    }
    else
    {
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v54 + 56))(v51, 0, 1, v53);
      v29 = v35;
    }
    v28 = v29;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v54 + 48))(v51, 1, v53) == 1)
    {
      outlined destroy of GPK_DatabaseParticipants?((uint64_t)v51);
      v12 = v45;
      v13 = v31;
      v14 = v30;
      *v45 = 0;
      v12[1] = 0;
      v12[2] = 0;
      v12[3] = 0;
      return outlined consume of Data._Representation(v14, v13);
    }
    else
    {
      v7 = v28;
      outlined init with take of GPK_DatabaseParticipants(v51, v56);
      v23 = *(_QWORD *)v56;
      swift_bridgeObjectRetain();
      v59[1] = v23;
      v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GPK_DatabaseParticipants.Participant]);
      v25 = type metadata accessor for DatabaseParticipant();
      v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
      v8 = lazy protocol witness table accessor for type [GPK_DatabaseParticipants.Participant] and conformance [A]();
      v27 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))closure #1 in ParticipantTransformer.reverseTransformedValue(_:), 0, v24, v25, v26, v8, MEMORY[0x24BEE3F20], (uint64_t)v59);
      if (v7)
      {
        v18 = (id)v59[0];
        outlined destroy of [GPK_DatabaseParticipants.Participant]();

        v16 = v45;
        *v45 = 0;
        v16[1] = 0;
        v16[2] = 0;
        v16[3] = 0;
      }
      else
      {
        v22 = v27;
        outlined destroy of [GPK_DatabaseParticipants.Participant]();
        v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DatabaseParticipant]);
        v10 = v45;
        v11 = v22;
        v45[3] = v9;
        *v10 = v11;
      }
      outlined destroy of GPK_DatabaseParticipants((uint64_t)v56);
      return outlined consume of Data._Representation(v30, v31);
    }
  }
  return result;
}

uint64_t default argument 2 of Message.init(serializedData:extensions:partial:options:)()
{
  return 0;
}

uint64_t default argument 3 of Message.init(serializedData:extensions:partial:options:)()
{
  return BinaryDecodingOptions.init()();
}

id closure #1 in ParticipantTransformer.reverseTransformedValue(_:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v7 = a3;
  v11 = a1;
  v8 = a2;
  v17 = 0;
  v9 = 0;
  v10 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for GPK_DatabaseParticipants.Participant() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0);
  v13 = (uint64_t)&v6 - v10;
  v17 = v3;
  type metadata accessor for DatabaseParticipant();
  outlined init with copy of GPK_DatabaseParticipants.Participant(v11, v13);
  v4 = v12;
  result = DatabaseParticipant.__allocating_init(member:)(v13);
  v14 = v4;
  v15 = result;
  v16 = v4;
  if (v4)
    *v8 = v16;
  else
    *v7 = v15;
  return result;
}

id ParticipantTransformer.init()()
{
  void *v0;
  id v1;
  id v3;
  objc_super v4;
  id v5;

  v5 = v0;
  v4.receiver = v0;
  v4.super_class = (Class)swift_getObjectType();
  v3 = objc_msgSendSuper2(&v4, sel_init);
  v1 = v3;
  v5 = v3;

  return v3;
}

id ParticipantTransformer.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 24))
    __swift_destroy_boxed_opaque_existential_0(a1);
  return a1;
}

uint64_t partial apply for closure #1 in ParticipantTransformer.transformedValue(_:)(uint64_t *a1)
{
  return closure #1 in ParticipantTransformer.transformedValue(_:)(a1);
}

uint64_t outlined destroy of GPK_DatabaseParticipants(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  swift_bridgeObjectRelease();
  v3 = *(int *)(type metadata accessor for GPK_DatabaseParticipants() + 20);
  v1 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(a1 + v3);
  return a1;
}

uint64_t outlined destroy of GPK_DatabaseParticipants?(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v5;

  v5 = type metadata accessor for GPK_DatabaseParticipants();
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(a1, 1))
  {
    swift_bridgeObjectRelease();
    v3 = a1 + *(int *)(v5 + 20);
    v1 = type metadata accessor for UnknownStorage();
    (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v3);
  }
  return a1;
}

uint64_t type metadata accessor for DatabaseParticipant()
{
  return objc_opt_self();
}

uint64_t method lookup function for DatabaseParticipant()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DatabaseParticipant.__allocating_init(member:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t type metadata accessor for ParticipantTransformer()
{
  return objc_opt_self();
}

uint64_t outlined init with copy of GPK_DatabaseParticipants.Participant(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  outlined copy of Data._Representation(*(_QWORD *)a1, v5);
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v5;
  *(_QWORD *)(a2 + 16) = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(a1 + 24);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a2 + 24) = v6;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a2 + 40) = *(_QWORD *)(a1 + 40);
  *(_BYTE *)(a2 + 48) = *(_BYTE *)(a1 + 48);
  v7 = *(int *)(type metadata accessor for GPK_DatabaseParticipants.Participant() + 36);
  v2 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a2 + v7, a1 + v7);
  return a2;
}

unint64_t lazy protocol witness table accessor for type [DatabaseParticipant] and conformance [A]()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [DatabaseParticipant] and conformance [A];
  if (!lazy protocol witness table cache variable for type [DatabaseParticipant] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [DatabaseParticipant]);
    v1 = MEMORY[0x2426331CC](MEMORY[0x24BEE12E0], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [DatabaseParticipant] and conformance [A]);
    return v1;
  }
  return v3;
}

uint64_t Weak.value.getter()
{
  void (**v0)(uint64_t);
  uint64_t v1;
  void (*v3)(uint64_t);

  v3 = *v0;
  v1 = swift_retain();
  v3(v1);
  return swift_release();
}

uint64_t (**Weak.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (**a3)@<X0>(uint64_t a1@<X8>)@<X8>))@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (**v10)@<X0>(uint64_t@<X8>);
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)@<X0>(uint64_t@<X8>);
  uint64_t (**result)@<X0>(uint64_t@<X8>);
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (**v21)@<X0>(uint64_t@<X8>);
  uint64_t v22;
  uint64_t v23;
  uint64_t (**v24)@<X0>(uint64_t@<X8>);
  uint64_t v25;
  uint64_t (*v26)@<X0>(uint64_t@<X8>);
  uint64_t v27;
  uint64_t v28;

  v21 = a3;
  v19 = a1;
  v23 = a2;
  v24 = &v26;
  v26 = 0;
  v27 = 0;
  v25 = 0;
  v28 = a2;
  v22 = *(_QWORD *)(a2 - 8);
  v16 = *(_QWORD *)(v22 + 64);
  v15 = (v16 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](a1);
  v18 = (char *)&v15 - v15;
  v25 = v3;
  (*(void (**)(void))(v4 + 16))();
  v17 = (*(unsigned __int8 *)(v22 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  v5 = swift_allocObject();
  v6 = v17;
  v7 = v18;
  v8 = v22;
  v20 = v5;
  *(_QWORD *)(v5 + 16) = v23;
  (*(void (**)(unint64_t, char *))(v8 + 32))(v5 + v6, v7);
  swift_retain();
  v9 = v19;
  v10 = v21;
  v11 = v22;
  v12 = v23;
  v26 = partial apply for closure #1 in Weak.init(_:);
  v13 = (uint64_t (*)@<X0>(uint64_t@<X8>))v20;
  v27 = v20;
  *v21 = partial apply for closure #1 in Weak.init(_:);
  v10[1] = v13;
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v12);
  result = v24;
  outlined destroy of Weak<A>();
  return result;
}

uint64_t closure #1 in Weak.init(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 - 8);
  (*(void (**)(uint64_t))(v3 + 16))(a2);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v3 + 56))(a2, 0, 1, a1);
}

uint64_t sub_23D2C0CD0()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in Weak.init(_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return closure #1 in Weak.init(_:)(*(_QWORD *)(v1 + 16), a1);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of Weak<A>()
{
  swift_release();
}

{
  swift_release();
}

uint64_t (**Weak.init<A>(_:)@<X0>(uint64_t a1@<X1>, uint64_t (**a2)@<X0>(uint64_t *a1@<X8>)@<X8>))@<X0>(uint64_t *a1@<X8>)
{
  uint64_t (**result)@<X0>(uint64_t *@<X8>);
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)@<X0>(uint64_t *@<X8>);
  _QWORD *v9;
  uint64_t v10;

  v8 = 0;
  v9 = 0;
  v10 = a1;
  v5 = swift_allocObject();
  swift_unknownObjectRetain();
  swift_unknownObjectWeakInit();
  swift_unknownObjectRelease();
  swift_retain();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = v5;
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = a1;
  v6[3] = partial apply for closure #1 in Weak.init<A>(_:);
  v6[4] = v4;
  swift_retain();
  v8 = partial apply for thunk for @escaping @callee_guaranteed () -> (@owned A?);
  v9 = v6;
  swift_release();
  *a2 = partial apply for thunk for @escaping @callee_guaranteed () -> (@owned A?);
  a2[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v6;
  swift_unknownObjectRelease();
  result = &v8;
  outlined destroy of Weak<A>();
  return result;
}

uint64_t sub_23D2C0EF0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t closure #1 in Weak.init<A>(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x2426332C8](v2);
  swift_endAccess();
  return v3;
}

uint64_t sub_23D2C0F90()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in Weak.init<A>(_:)()
{
  uint64_t v0;

  return closure #1 in Weak.init<A>(_:)(*(_QWORD *)(v0 + 24));
}

uint64_t thunk for @escaping @callee_guaranteed () -> (@owned A?)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_23D2C1020()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> (@owned A?)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@owned A?)(*(uint64_t (**)(void))(v1 + 24), a1);
}

uint64_t Array.allObjects<A>()(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[16];
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t *v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  _QWORD v27[2];
  _QWORD *v28;

  v22 = a1;
  v19 = 0;
  v28 = v1;
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 16);
  v27[1] = v20;
  v24 = *v1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v23 = v27;
  v27[0] = v24;
  MEMORY[0x2426331CC](MEMORY[0x24BEE12E0], v22, v21);
  v25 = Collection.isEmpty.getter();
  outlined destroy of [Weak<A1>]();
  swift_bridgeObjectRelease();
  if ((v25 & 1) != 0)
    return _allocateUninitializedArray<A>(_:)();
  v2 = v19;
  v13 = &v8;
  MEMORY[0x24BDAC7A8](&v8);
  v14 = v6;
  v7 = v3;
  v15 = MEMORY[0x2426331CC](MEMORY[0x24BEE12B8]);
  MEMORY[0x2426331CC](MEMORY[0x24BEE12E8], v22, v21);
  RangeReplaceableCollection<>.removeAll(where:)();
  v16 = v2;
  v9 = *v18;
  swift_bridgeObjectRetain();
  v26 = v9;
  v10 = &v8;
  MEMORY[0x24BDAC7A8](&v8);
  v11 = v6;
  v7 = v4;
  MEMORY[0x2426331CC](MEMORY[0x24BEE12C8]);
  v12 = Sequence.compactMap<A>(_:)();
  v8 = v12;
  outlined destroy of [Weak<A1>]();
  return v8;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of [Weak<A1>]()
{
  swift_bridgeObjectRelease();
}

BOOL closure #1 in Array.allObjects<A>()(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v8 = a1;
  v15 = a2;
  v18 = 0;
  v19 = 0;
  v20 = a2;
  v11 = 0;
  v9 = type metadata accessor for Optional();
  v10 = (*(_QWORD *)(*(_QWORD *)(v9 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = (uint64_t *)MEMORY[0x24BDAC7A8](v8);
  v16 = (uint64_t)&v6 - v10;
  v12 = *v2;
  v13 = v2[1];
  v18 = v12;
  v19 = v13;
  swift_retain();
  v14 = v17;
  v17[0] = v12;
  v17[1] = v13;
  type metadata accessor for Weak(v11, v15, v3, v4);
  Weak.value.getter();
  outlined destroy of Weak<A1>();
  v7 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 48))(v16, 1) == 1;
  v6 = v7;
  outlined destroy of A1?(v16, v15);
  return v6;
}

BOOL partial apply for closure #1 in Array.allObjects<A>()(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in Array.allObjects<A>()(a1, *(_QWORD *)(v1 + 16));
}

_QWORD *closure #2 in Array.allObjects<A>()(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *result;
  uint64_t v5;
  _QWORD v7[2];
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = 0;
  v9 = 0;
  v10 = a2;
  v5 = a1[1];
  v8 = *a1;
  v9 = v5;
  swift_retain();
  v7[0] = v8;
  v7[1] = v5;
  type metadata accessor for Weak(0, a2, v2, v3);
  Weak.value.getter();
  result = v7;
  outlined destroy of Weak<A1>();
  return result;
}

_QWORD *partial apply for closure #2 in Array.allObjects<A>()(uint64_t *a1)
{
  uint64_t v1;

  return closure #2 in Array.allObjects<A>()(a1, *(_QWORD *)(v1 + 16));
}

uint64_t type metadata instantiation function for Weak()
{
  return swift_allocateGenericValueMetadata();
}

_QWORD *initializeBufferWithCopyOfBuffer for Weak(_QWORD *a1, uint64_t *a2)
{
  _QWORD *result;
  uint64_t v4;
  uint64_t v5;

  v4 = *a2;
  v5 = a2[1];
  swift_retain();
  result = a1;
  *a1 = v4;
  a1[1] = v5;
  return result;
}

uint64_t destroy for Weak()
{
  return swift_release();
}

_QWORD *initializeWithCopy for Weak(_QWORD *a1, uint64_t *a2)
{
  _QWORD *result;
  uint64_t v4;
  uint64_t v5;

  v4 = *a2;
  v5 = a2[1];
  swift_retain();
  result = a1;
  *a1 = v4;
  a1[1] = v5;
  return result;
}

_QWORD *assignWithCopy for Weak(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  swift_retain();
  *a1 = v3;
  a1[1] = v4;
  swift_release();
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> assignWithTake for Weak(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = a2[1];
  *a1 = *a2;
  a1[1] = v2;
  swift_release();
}

uint64_t getEnumTagSinglePayload for Weak(uint64_t a1, unsigned int a2)
{
  int v3;
  int v4;

  if (a2)
  {
    if (a2 > 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    {
      v4 = *(_OWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v3 = -1;
      if (*(_QWORD *)a1 < 0x100000000uLL)
        v3 = *(_QWORD *)a1;
      v4 = v3;
    }
  }
  else
  {
    v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Weak(uint64_t result, unsigned int a2, unsigned int a3)
{
  _BOOL4 v3;

  v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(_OWORD *)result = a2 + 0x80000000;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3)
        *(_BYTE *)(result + 16) = 1;
      else
        __break(1u);
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3)
        *(_BYTE *)(result + 16) = 0;
      else
        __break(1u);
    }
    if (a2)
      *(_QWORD *)result = a2 - 1;
  }
  return result;
}

uint64_t type metadata accessor for Weak(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a4, a4, (uint64_t)&nominal type descriptor for Weak);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of Weak<A1>()
{
  swift_release();
}

id CachedGroup.__allocating_init(groupID:groupBlob:invitationGroupVersion:clientModelVersion:context:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, void *a5, float a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  Swift::String v11;
  id v12;
  id v13;
  char *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  double v19;
  id v20;
  uint64_t v22;
  Class isa;
  id v24;
  Class v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  Class v34;
  unint64_t v35;
  uint64_t v36;
  float v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char *v43;
  void *object;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;

  v39 = a1;
  v38 = a2;
  v35 = a3;
  v36 = a4;
  v37 = a6;
  v46 = a5;
  v55 = 0;
  v53 = 0;
  v54 = 0;
  v52 = 0;
  v51 = 0;
  v50 = 0;
  v49 = 0;
  v40 = type metadata accessor for UUID();
  v41 = *(_QWORD *)(v40 - 8);
  v42 = (*(_QWORD *)(v41 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v43 = (char *)&v22 - v42;
  v55 = MEMORY[0x24BDAC7A8](v39);
  v53 = v6;
  v54 = v7;
  v52 = v8;
  v51 = v9;
  v50 = v10;
  v45 = (id)objc_opt_self();
  v11 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("CachedGroup", 0xBuLL, 1);
  object = v11._object;
  v47 = (id)MEMORY[0x242632560](v11._countAndFlagsBits);
  swift_bridgeObjectRelease();
  v48 = objc_msgSend(v45, sel_entityForName_inManagedObjectContext_, v47, v46);

  if (v48)
  {
    v33 = v48;
    v32 = v48;
    v49 = v48;
    v30 = objc_allocWithZone(v34);
    v13 = v46;
    v31 = objc_msgSend(v30, sel_initWithEntity_insertIntoManagedObjectContext_, v32, v46);

    v56 = v31;
  }
  else
  {
    v12 = objc_allocWithZone(v34);
    v56 = objc_msgSend(v12, sel_initWithContext_, v46);
  }
  v14 = v43;
  v24 = v56;
  v15 = v56;
  (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v14, v39, v40);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v41 + 8))(v43, v40);
  objc_msgSend(v24, sel_setGroupID_, isa);

  v26 = v56;
  v16 = v56;
  outlined copy of Data._Representation(v38, v35);
  v25 = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v38, v35);
  objc_msgSend(v26, sel_setGroupBlob_, v25);

  v27 = v56;
  v17 = v56;
  objc_msgSend(v27, sel_setInvitationGroupVersion_, v36);

  v28 = v56;
  v18 = v56;
  *(float *)&v19 = v37;
  objc_msgSend(v28, sel_setClientModelVersion_, v19);

  v29 = v56;
  v20 = v56;

  outlined consume of Data._Representation(v38, v35);
  outlined destroy of GPKGroupID(v39);

  return v29;
}

id CachedGroup.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v6;

  v6 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v6;
}

id CachedGroup.init(entity:insertInto:)(void *a1, void *a2)
{
  id v2;
  id v6;
  objc_super v7;
  void *v8;
  void *v9;
  id v10;

  v10 = 0;
  v9 = a1;
  v8 = a2;
  v7.receiver = 0;
  v7.super_class = (Class)type metadata accessor for CachedGroup();
  v6 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);
  v2 = v6;
  v10 = v6;

  return v6;
}

uint64_t type metadata accessor for CachedGroup()
{
  return objc_opt_self();
}

id CachedGroup.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CachedGroup();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t protocol witness for MessageSenderProtocol.send<A>(_:) in conformance MessageSender(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v4 + 16) = v4;
  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(MEMORY[0x24BDFC478] + (int)*MEMORY[0x24BDFC478]);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 24) = v5;
  *v5 = *(_QWORD *)(v4 + 16);
  v5[1] = protocol witness for MessageSenderProtocol.send<A>(_:) in conformance MessageSender;
  return v10(a1, a2, a3, a4);
}

_QWORD *protocol witness for MessageSenderProtocol.send<A>(_:) in conformance MessageSender()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v3;

  v1 = *v0;
  *(_QWORD *)(v1 + 16) = *v0;
  v3 = (_QWORD *)(v1 + 16);
  swift_task_dealloc();
  return (*(_QWORD *(**)(_QWORD *__return_ptr))(*v3 + 8))(v3);
}

uint64_t *DaemonMessageSender.shared.unsafeMutableAddressor()
{
  if (one-time initialization token for shared != -1)
    swift_once();
  return &static DaemonMessageSender.shared;
}

uint64_t static DaemonMessageSender.shared.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  v1 = DaemonMessageSender.shared.unsafeMutableAddressor();
  return outlined init with copy of MessageSenderProtocol((uint64_t)v1, a1);
}

uint64_t protocol witness for SyncMessageSenderProtocol.send<A>(_:) in conformance SyncMessageSender()
{
  return dispatch thunk of SyncMessageSender.send<A>(_:)();
}

uint64_t *SyncDaemonMessageSender.shared.unsafeMutableAddressor()
{
  if (one-time initialization token for shared != -1)
    swift_once();
  return &static SyncDaemonMessageSender.shared;
}

uint64_t static SyncDaemonMessageSender.shared.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  v1 = SyncDaemonMessageSender.shared.unsafeMutableAddressor();
  return outlined init with copy of SyncMessageSenderProtocol((uint64_t)v1, a1);
}

uint64_t outlined init with copy of SyncMessageSenderProtocol(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

uint64_t dispatch thunk of MessageSenderProtocol.send<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v6 + 16) = v6;
  v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a6 + 8)
                                                                                     + **(int **)(a6 + 8));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 24) = v7;
  *v7 = *(_QWORD *)(v6 + 16);
  v7[1] = dispatch thunk of MessageSenderProtocol.send<A>(_:);
  return v14(a1, a2, a3, a4, a5, a6);
}

uint64_t dispatch thunk of MessageSenderProtocol.send<A>(_:)()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

ValueMetadata *type metadata accessor for DaemonMessageSender()
{
  return &type metadata for DaemonMessageSender;
}

uint64_t dispatch thunk of SyncMessageSenderProtocol.send<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

ValueMetadata *type metadata accessor for SyncDaemonMessageSender()
{
  return &type metadata for SyncDaemonMessageSender;
}

id Group.__allocating_init(from:clientModelVersion:context:)(uint64_t a1, void *a2, float a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  Swift::String v7;
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSUUID v14;
  uint64_t v15;
  NSDate v16;
  uint64_t v17;
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
  id v33;
  id v34;
  double v35;
  id v36;
  _QWORD v38[3];
  Class v39;
  id v40;
  id v41;
  Class v42;
  id v43;
  id v44;
  id v45;
  Class v46;
  Class v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  Class v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  Class v61;
  Class v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  Class isa;
  void (*v67)(char *, uint64_t);
  Class v68;
  id v69;
  Class v70;
  id v71;
  id v72;
  uint64_t v73;
  id v74;
  id v75;
  id v76;
  id v77;
  uint64_t v78;
  unint64_t v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  id v87;
  id v88;
  id v89;
  Class v90;
  uint64_t v91;
  unint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  char *v102;
  float v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  void *object;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  char v113;
  char v114;
  _QWORD v115[2];
  uint64_t v116;
  int v117;
  uint64_t v118;
  id v119;

  v104 = a1;
  v103 = a3;
  v109 = a2;
  v118 = 0;
  v117 = 0;
  v116 = 0;
  v112 = 0;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  v92 = (*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v3);
  v93 = (char *)v38 - v92;
  v98 = 0;
  v94 = type metadata accessor for Date();
  v95 = *(_QWORD *)(v94 - 8);
  v96 = (*(_QWORD *)(v95 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v98);
  v97 = (char *)v38 - v96;
  v99 = type metadata accessor for UUID();
  v100 = *(_QWORD *)(v99 - 8);
  v101 = (*(_QWORD *)(v100 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v98);
  v102 = (char *)v38 - v101;
  v105 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for GPKGroupID() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = MEMORY[0x24BDAC7A8](v104);
  v106 = (uint64_t)v38 - v105;
  v118 = v4;
  v117 = v5;
  v116 = v6;
  v108 = (id)objc_opt_self();
  v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Group", 5uLL, 1);
  object = v7._object;
  v110 = (id)MEMORY[0x242632560](v7._countAndFlagsBits);
  swift_bridgeObjectRelease();
  v111 = objc_msgSend(v108, sel_entityForName_inManagedObjectContext_, v110, v109);

  if (v111)
  {
    v89 = v111;
    v88 = v111;
    v112 = v111;
    v86 = objc_allocWithZone(v90);
    v9 = v109;
    v87 = objc_msgSend(v86, sel_initWithEntity_insertIntoManagedObjectContext_, v88, v109);

    v119 = v87;
  }
  else
  {
    v8 = objc_allocWithZone(v90);
    v119 = objc_msgSend(v8, sel_initWithContext_, v109);
  }
  v80 = v119;
  v115[1] = (*(uint64_t (**)(id))(*(_QWORD *)v104 + 336))(v119);
  v81 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GPKMember]);
  v82 = type metadata accessor for DatabaseParticipant();
  v83 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  v10 = lazy protocol witness table accessor for type [GPKMember] and conformance [A]();
  v11 = v91;
  v12 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))closure #1 in Group.init(from:clientModelVersion:context:), 0, v81, v82, v83, v10, MEMORY[0x24BEE3F20], (uint64_t)v115);
  v84 = v11;
  v85 = v12;
  if (v11)
  {
    v38[1] = v115[0];
    outlined destroy of [GPKMember]();

    swift_release();
    return (id)v38[2];
  }
  else
  {
    v13 = v104;
    v65 = v85;
    outlined destroy of [GPKMember]();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    objc_msgSend(v80, sel_setParticipants_, isa);

    v69 = v119;
    (*(void (**)(id))(*(_QWORD *)v13 + 312))(v119);
    (*(void (**)(char *, uint64_t, uint64_t))(v100 + 16))(v102, v106, v99);
    outlined destroy of GPKGroupID(v106);
    v14.super.isa = UUID._bridgeToObjectiveC()().super.isa;
    v15 = v104;
    v68 = v14.super.isa;
    v67 = *(void (**)(char *, uint64_t))(v100 + 8);
    v67(v102, v99);
    objc_msgSend(v69, sel_setGroupID_, v68);

    v71 = v119;
    (*(void (**)(id))(*(_QWORD *)v15 + 360))(v119);
    v16.super.isa = Date._bridgeToObjectiveC()().super.isa;
    v17 = v104;
    v70 = v16.super.isa;
    (*(void (**)(char *, uint64_t))(v95 + 8))(v97, v94);
    objc_msgSend(v71, sel_setCreationDate_, v70);

    v72 = v119;
    v18 = (*(uint64_t (**)(id))(*(_QWORD *)v17 + 408))(v119);
    v19 = v104;
    objc_msgSend(v72, sel_setVersion_, v18);

    v75 = v119;
    v20 = (*(uint64_t (**)(id))(*(_QWORD *)v19 + 288))(v119);
    v21 = v104;
    v73 = v22;
    v74 = (id)MEMORY[0x242632560](v20);
    swift_bridgeObjectRelease();
    objc_msgSend(v75, sel_setGroupDomain_, v74);

    v76 = v119;
    (*(void (**)(char *__return_ptr, id))(*(_QWORD *)v21 + 432))(&v114, v119);
    v113 = v114;
    GPKGroup.JoinState.rawValue.getter();
    v23 = v104;
    objc_msgSend(v76, sel_setJoinState_, v24);

    v77 = v119;
    v78 = (*(uint64_t (**)(id))(*(_QWORD *)v23 + 504))(v119);
    v79 = v25;
    if ((v25 & 0xF000000000000000) == 0xF000000000000000)
    {
      v62 = 0;
    }
    else
    {
      v63 = v78;
      v64 = v79;
      v59 = v79;
      v60 = v78;
      v61 = Data._bridgeToObjectiveC()().super.isa;
      outlined consume of Data._Representation(v60, v59);
      v62 = v61;
    }
    v26 = v104;
    v55 = v62;
    objc_msgSend(v77, sel_setInvitationBlob_);

    v56 = v119;
    v57 = (*(uint64_t (**)(id))(*(_QWORD *)v26 + 688))(v119);
    v58 = v27;
    if (v27)
    {
      v53 = v57;
      v54 = v58;
      v50 = v58;
      v51 = MEMORY[0x242632560](v57);
      swift_bridgeObjectRelease();
      v52 = (void *)v51;
    }
    else
    {
      v52 = 0;
    }
    v28 = v104;
    v48 = v52;
    objc_msgSend(v56, sel_setInvitationSenderHandle_);

    v49 = v119;
    (*(void (**)(id))(*(_QWORD *)v28 + 480))(v119);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v100 + 48))(v93, 1, v99) == 1)
    {
      v47 = 0;
    }
    else
    {
      v46 = UUID._bridgeToObjectiveC()().super.isa;
      v67(v93, v99);
      v47 = v46;
    }
    v29 = v104;
    v39 = v47;
    objc_msgSend(v49, sel_setInvitationID_);

    v40 = v119;
    v30 = (*(uint64_t (**)(id))(*(_QWORD *)v29 + 528))(v119);
    v31 = v104;
    objc_msgSend(v40, sel_setLastKnownRSVPQueueSeqNumber_, v30);

    v41 = v119;
    (*(void (**)(id))(*(_QWORD *)v31 + 456))(v119);
    GPKGroup.Mode.rawValue.getter();
    objc_msgSend(v41, sel_setGroupMode_, v32);

    v43 = v119;
    v33 = v119;
    UUID.init()();
    v42 = UUID._bridgeToObjectiveC()().super.isa;
    v67(v102, v99);
    objc_msgSend(v43, sel_setDedupeID_, v42);

    v44 = v119;
    v34 = v119;
    *(float *)&v35 = v103;
    objc_msgSend(v44, sel_setClientModelVersion_, v35);

    v45 = v119;
    v36 = v119;

    swift_release();
    return v45;
  }
}

id closure #1 in Group.init(from:clientModelVersion:context:)@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  id result;
  uint64_t v6;
  uint64_t v7;

  v7 = *a1;
  type metadata accessor for DatabaseParticipant();
  swift_retain();
  result = DatabaseParticipant.__allocating_init(member:)(v7);
  if (v6)
    *a2 = v6;
  else
    *a3 = result;
  return result;
}

void Group.update(using:)(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];
  Class v23;
  _BOOL4 v24;
  _BOOL4 v25;
  id v26;
  id v27;
  uint64_t v28;
  Class v29;
  id v30;
  Class v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  Class v37;
  Class v38;
  id v39;
  unsigned int (*v40)(char *, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  Class v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  Class isa;
  Class v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char *v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char *v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  unint64_t v70;
  _QWORD v71[2];
  char v72;
  char v73;
  uint64_t v74;
  uint64_t v75;

  v67 = a1;
  v2 = v1;
  v3 = v67;
  v68 = v2;
  v75 = 0;
  v74 = 0;
  v56 = type metadata accessor for UUID();
  v57 = *(_QWORD *)(v56 - 8);
  v58 = (*(_QWORD *)(v57 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v56);
  v59 = (char *)v22 - v58;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  v61 = *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64);
  v60 = (v61 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v4);
  v62 = (uint64_t)v22 - v60;
  v63 = (v61 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]((char *)v22 - v60);
  v64 = (char *)v22 - v63;
  v75 = v3;
  v74 = v5;
  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 408))(v3);
  v7 = (*(uint64_t (**)(id))(*(_QWORD *)v67 + 288))(objc_msgSend(v68, sel_setVersion_, v6));
  v8 = v67;
  v65 = v9;
  v66 = (id)MEMORY[0x242632560](v7);
  swift_bridgeObjectRelease();
  objc_msgSend(v68, sel_setGroupDomain_, v66);

  (*(void (**)(char *__return_ptr))(*(_QWORD *)v8 + 432))(&v73);
  v72 = v73;
  GPKGroup.JoinState.rawValue.getter();
  v69 = (*(uint64_t (**)(id))(*(_QWORD *)v67 + 504))(objc_msgSend(v68, sel_setJoinState_, v10));
  v70 = v11;
  if ((v11 & 0xF000000000000000) == 0xF000000000000000)
  {
    v52 = 0;
  }
  else
  {
    v53 = v69;
    v54 = v70;
    v49 = v70;
    v50 = v69;
    isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data._Representation(v50, v49);
    v52 = isa;
  }
  v12 = v67;
  v46 = v52;
  objc_msgSend(v68, sel_setInvitationBlob_);

  v47 = (*(uint64_t (**)(void))(*(_QWORD *)v12 + 688))();
  v48 = v13;
  if (v13)
  {
    v44 = v47;
    v45 = v48;
    v41 = v48;
    v42 = MEMORY[0x242632560](v47);
    swift_bridgeObjectRelease();
    v43 = (void *)v42;
  }
  else
  {
    v43 = 0;
  }
  v14 = v67;
  v39 = v43;
  objc_msgSend(v68, sel_setInvitationSenderHandle_);

  (*(void (**)(void))(*(_QWORD *)v14 + 480))();
  v40 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v57 + 48);
  if (v40(v64, 1, v56) == 1)
  {
    v38 = 0;
  }
  else
  {
    v37 = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v57 + 8))(v64, v56);
    v38 = v37;
  }
  v15 = v67;
  v31 = v38;
  objc_msgSend(v68, sel_setInvitationID_);

  v16 = (*(uint64_t (**)(void))(*(_QWORD *)v15 + 528))();
  (*(void (**)(id))(*(_QWORD *)v67 + 456))(objc_msgSend(v68, sel_setLastKnownRSVPQueueSeqNumber_, v16));
  v17 = v67;
  GPKGroup.Mode.rawValue.getter();
  v71[1] = (*(uint64_t (**)(id))(*(_QWORD *)v17 + 336))(objc_msgSend(v68, sel_setGroupMode_, v18));
  v32 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GPKMember]);
  v33 = type metadata accessor for DatabaseParticipant();
  v34 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  v19 = lazy protocol witness table accessor for type [GPKMember] and conformance [A]();
  v20 = v55;
  v21 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))closure #1 in Group.update(using:), 0, v32, v33, v34, v19, MEMORY[0x24BEE3F20], (uint64_t)v71);
  v35 = v20;
  v36 = v21;
  if (v20)
  {
    v22[1] = v71[0];
    outlined destroy of [GPKMember]();
  }
  else
  {
    v28 = v36;
    outlined destroy of [GPKMember]();
    v29 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    objc_msgSend(v68, sel_setParticipants_, v29);

    v30 = objc_msgSend(v68, sel_dedupeID);
    if (v30)
    {
      v27 = v30;
      v26 = v30;
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();
      (*(void (**)(uint64_t, char *, uint64_t))(v57 + 32))(v62, v59, v56);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v57 + 56))(v62, 0, 1, v56);

    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v57 + 56))(v62, 1, 1, v56);
    }
    v25 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v40)(v62, 1, v56) == 1;
    v24 = v25;
    outlined destroy of UUID?(v62);
    if (v24)
    {
      UUID.init()();
      v23 = UUID._bridgeToObjectiveC()().super.isa;
      (*(void (**)(char *, uint64_t))(v57 + 8))(v59, v56);
      objc_msgSend(v68, sel_setDedupeID_, v23);

    }
  }
}

id closure #1 in Group.update(using:)@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  id result;
  uint64_t v6;
  uint64_t v7;

  v7 = *a1;
  type metadata accessor for DatabaseParticipant();
  swift_retain();
  result = DatabaseParticipant.__allocating_init(member:)(v7);
  if (v6)
    *a2 = v6;
  else
    *a3 = result;
  return result;
}

id Group.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v6;

  v6 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v6;
}

id Group.init(entity:insertInto:)(void *a1, void *a2)
{
  id v2;
  id v6;
  objc_super v7;
  void *v8;
  void *v9;
  id v10;

  v10 = 0;
  v9 = a1;
  v8 = a2;
  v7.receiver = 0;
  v7.super_class = (Class)type metadata accessor for Group();
  v6 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);
  v2 = v6;
  v10 = v6;

  return v6;
}

uint64_t type metadata accessor for Group()
{
  return objc_opt_self();
}

id Group.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Group();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL Group.shouldOverwrite(other:)(void *a1)
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
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  id v24;
  _BOOL4 v25;
  _BOOL4 v26;
  id v27;
  id v28;
  id v29;
  _QWORD *v30;
  _QWORD *v31;
  void (*v32)(char *, uint64_t);
  int v33;
  id v34;
  id v35;
  void (*v36)(char *, uint64_t, uint64_t);
  id v37;
  id v38;
  id v39;
  id v40;
  unint64_t v41;
  id v42;
  unint64_t v43;
  id v44;
  unint64_t v45;
  id v46;
  unint64_t v48;
  id v49;
  int v50;
  void (*v51)(char *, char *, uint64_t);
  void (*v52)(char *, uint64_t);
  int v53;
  int v54;
  char *v55;
  unsigned int (*v56)(char *, uint64_t, uint64_t);
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  unint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char *v68;
  unint64_t v69;
  char *v70;
  unint64_t v71;
  char *v72;
  unint64_t v73;
  char *v74;
  id v75;
  id v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  char *v80;
  unint64_t v81;
  char *v82;
  unint64_t v83;
  char *v84;
  unint64_t v85;
  uint64_t v86;
  char *v87;
  unint64_t v88;
  char *v89;
  id v90;
  _QWORD v91[2];
  _QWORD v92[2];
  char v93;
  void *v94;
  uint64_t v95;
  char *v96;
  char *v97;
  uint64_t vars0;

  v75 = a1;
  v97 = 0;
  v96 = 0;
  v95 = 0;
  v94 = 0;
  v62 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (UUID?, UUID?));
  v63 = (*(_QWORD *)(*(_QWORD *)(v62 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v62);
  v64 = (char *)&v22 - v63;
  v65 = type metadata accessor for UUID();
  v66 = *(_QWORD *)(v65 - 8);
  v67 = (*(_QWORD *)(v66 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1 = MEMORY[0x24BDAC7A8](v65);
  v68 = (char *)&v22 - v67;
  v97 = (char *)&v22 - v67;
  v69 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  v3 = MEMORY[0x24BDAC7A8](v1);
  v70 = (char *)&v22 - v69;
  v96 = (char *)&v22 - v69;
  v71 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v3);
  v72 = (char *)&v22 - v71;
  v73 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]((char *)&v22 - v71);
  v74 = (char *)&v22 - v73;
  v86 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?)
                              - 8)
                  + 64);
  v77 = (v86 + 15) & 0xFFFFFFFFFFFFFFF0;
  v6 = MEMORY[0x24BDAC7A8](v76);
  v78 = (uint64_t)&v22 - v77;
  v79 = (v86 + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = MEMORY[0x24BDAC7A8](v6);
  v80 = (char *)&v22 - v79;
  v81 = (v86 + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v82 = (char *)&v22 - v81;
  v83 = (v86 + 15) & 0xFFFFFFFFFFFFFFF0;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v84 = (char *)&v22 - v83;
  v85 = (v86 + 15) & 0xFFFFFFFFFFFFFFF0;
  v10 = MEMORY[0x24BDAC7A8](v9);
  v87 = (char *)&v22 - v85;
  v88 = (v86 + 15) & 0xFFFFFFFFFFFFFFF0;
  v11 = (void *)MEMORY[0x24BDAC7A8](v10);
  v89 = (char *)&v22 - v88;
  v95 = v12;
  v94 = v11;
  v90 = objc_msgSend(v11, sel_groupID);
  if (v90)
  {
    v61 = v90;
    v60 = v90;
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    (*(void (**)(char *, char *, uint64_t))(v66 + 32))(v89, v74, v65);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v66 + 56))(v89, 0, 1, v65);

  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v66 + 56))(v89, 1, 1, v65);
  }
  v59 = objc_msgSend(v75, sel_groupID);
  if (v59)
  {
    v58 = v59;
    v57 = v59;
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    (*(void (**)(char *, char *, uint64_t))(v66 + 32))(v87, v74, v65);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v66 + 56))(v87, 0, 1, v65);

  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v66 + 56))(v87, 1, 1, v65);
  }
  v55 = &v64[*(int *)(v62 + 48)];
  outlined init with copy of UUID?(v89, v64);
  outlined init with copy of UUID?(v87, v55);
  v56 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v66 + 48);
  if (v56(v64, 1, v65) == 1)
  {
    if (v56(v55, 1, v65) == 1)
    {
      outlined destroy of UUID?((uint64_t)v64);
      v54 = 1;
      goto LABEL_13;
    }
  }
  else
  {
    outlined init with copy of UUID?(v64, v84);
    if (v56(v55, 1, v65) != 1)
    {
      v51 = *(void (**)(char *, char *, uint64_t))(v66 + 32);
      v51(v74, v84, v65);
      v51(v72, v55, v65);
      lazy protocol witness table accessor for type UUID and conformance UUID();
      v53 = dispatch thunk of static Equatable.== infix(_:_:)();
      v52 = *(void (**)(char *, uint64_t))(v66 + 8);
      v52(v72, v65);
      v52(v74, v65);
      outlined destroy of UUID?((uint64_t)v64);
      v54 = v53;
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v66 + 8))(v84, v65);
  }
  outlined destroy of (UUID?, UUID?)((uint64_t)v64);
  v54 = 0;
LABEL_13:
  v50 = v54;
  outlined destroy of UUID?((uint64_t)v87);
  outlined destroy of UUID?((uint64_t)v89);
  if ((v50 & 1) == 0)
  {
    v23 = 0;
    type metadata accessor for InternalError();
    v93 = 41;
    v24 = InternalError.__allocating_init(_:internalInfo:)(&v93, v23);
    swift_willThrow();
    return (&vars0 - 360) & 1;
  }
  v48 = 0x1F3010000uLL;
  v49 = objc_msgSend(v76, (SEL)0x1F3010AC8);
  v13 = objc_msgSend(v75, (SEL)(v48 + 2760));
  if (v49 == v13)
  {
    v43 = 0x1F6516000uLL;
    v44 = objc_msgSend(v76, (SEL)0x1F6516F3CLL);
    v15 = objc_msgSend(v75, (SEL)(v43 + 3900));
    if (v44 == v15)
    {
      v40 = objc_msgSend(v76, sel_dedupeID);
      if (v40)
      {
        v39 = v40;
        v38 = v40;
        static UUID._unconditionallyBridgeFromObjectiveC(_:)();
        (*(void (**)(char *, char *, uint64_t))(v66 + 32))(v82, v74, v65);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v66 + 56))(v82, 0, 1, v65);

      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v66 + 56))(v82, 1, 1, v65);
      }
      if (v56(v82, 1, v65) == 1)
      {
        outlined destroy of UUID?((uint64_t)v82);
      }
      else
      {
        v36 = *(void (**)(char *, uint64_t, uint64_t))(v66 + 32);
        v36(v70, (uint64_t)v82, v65);
        v37 = objc_msgSend(v75, sel_dedupeID);
        if (v37)
        {
          v35 = v37;
          v34 = v37;
          static UUID._unconditionallyBridgeFromObjectiveC(_:)();
          v36(v80, (uint64_t)v74, v65);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v66 + 56))(v80, 0, 1, v65);

        }
        else
        {
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v66 + 56))(v80, 1, 1, v65);
        }
        if (v56(v80, 1, v65) != 1)
        {
          v36(v68, (uint64_t)v80, v65);
          v17 = UUID.data.getter();
          v31 = v92;
          v92[0] = v17;
          v92[1] = v18;
          v19 = UUID.data.getter();
          v30 = v91;
          v91[0] = v19;
          v91[1] = v20;
          lazy protocol witness table accessor for type Data and conformance Data();
          v33 = Sequence<>.lexicographicallyPrecedes<A>(_:)();
          outlined destroy of Data((uint64_t)v30);
          outlined destroy of Data((uint64_t)v31);
          v32 = *(void (**)(char *, uint64_t))(v66 + 8);
          v32(v68, v65);
          v32(v70, v65);
          return v33;
        }
        outlined destroy of UUID?((uint64_t)v80);
        (*(void (**)(char *, uint64_t))(v66 + 8))(v70, v65);
      }
      v29 = objc_msgSend(v75, sel_dedupeID);
      if (v29)
      {
        v28 = v29;
        v27 = v29;
        static UUID._unconditionallyBridgeFromObjectiveC(_:)();
        (*(void (**)(uint64_t, char *, uint64_t))(v66 + 32))(v78, v74, v65);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v66 + 56))(v78, 0, 1, v65);

      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v66 + 56))(v78, 1, 1, v65);
      }
      v26 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v56)(v78, 1, v65) == 1;
      v25 = v26;
      outlined destroy of UUID?(v78);
      return v25;
    }
    v41 = 0x1F6516000uLL;
    v42 = objc_msgSend(v76, (SEL)0x1F6516F3CLL);
    v16 = objc_msgSend(v75, (SEL)(v41 + 3900));
    return (uint64_t)v16 < (uint64_t)v42;
  }
  else
  {
    v45 = 0x1F3010000uLL;
    v46 = objc_msgSend(v76, (SEL)0x1F3010AC8);
    v14 = objc_msgSend(v75, (SEL)(v45 + 2760));
    return (uint64_t)v14 < (uint64_t)v46;
  }
}

uint64_t outlined destroy of (UUID?, UUID?)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unsigned int (*v6)(void);

  v4 = type metadata accessor for UUID();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int (**)(void))(v5 + 48);
  if (!((unsigned int (*)(uint64_t, uint64_t))v6)(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  v2 = a1
     + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (UUID?, UUID?))
              + 48);
  if (!v6())
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
  return a1;
}

BOOL Group.shouldOverwrite(other:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void (*v6)(char *, _QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v19;
  int v20;
  void (*v21)(char *, char *, uint64_t);
  void (*v22)(char *, uint64_t);
  int v23;
  int v24;
  char *v25;
  unsigned int v26;
  unsigned int (*v27)(char *, uint64_t, uint64_t);
  id v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  unint64_t v40;
  char *v41;
  uint64_t v42;
  id v43;
  unint64_t v44;
  char *v45;
  unint64_t v46;
  uint64_t v47;
  char *v48;
  unint64_t v49;
  char *v50;
  id v51;
  char v52;
  void *v53;
  uint64_t v54;
  uint64_t vars0;

  v42 = a1;
  v54 = 0;
  v53 = 0;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (UUID?, UUID?));
  v31 = (*(_QWORD *)(*(_QWORD *)(v30 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v30);
  v32 = (char *)&v12 - v31;
  v33 = 0;
  v34 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for GPKGroupID() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v33);
  v35 = (uint64_t)&v12 - v34;
  v36 = type metadata accessor for UUID();
  v37 = *(_QWORD *)(v36 - 8);
  v38 = (*(_QWORD *)(v37 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v36);
  v39 = (char *)&v12 - v38;
  v40 = (v1 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]((char *)&v12 - v38);
  v41 = (char *)&v12 - v40;
  v47 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?)
                              - 8)
                  + 64);
  v44 = (v47 + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x24BDAC7A8](v43);
  v45 = (char *)&v12 - v44;
  v46 = (v47 + 15) & 0xFFFFFFFFFFFFFFF0;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v48 = (char *)&v12 - v46;
  v49 = (v47 + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = (void *)MEMORY[0x24BDAC7A8](v3);
  v50 = (char *)&v12 - v49;
  v54 = v5;
  v53 = v4;
  v51 = objc_msgSend(v4, sel_groupID);
  if (v51)
  {
    v29 = v51;
    v28 = v51;
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v50, v41, v36);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v50, 0, 1, v36);

  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v37 + 56))(v50, 1, 1, v36);
  }
  (*(void (**)(void))(*(_QWORD *)v42 + 312))();
  (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v48, v35, v36);
  outlined destroy of GPKGroupID(v35);
  v6 = *(void (**)(char *, _QWORD))(v37 + 56);
  v26 = 1;
  v6(v48, 0);
  v25 = &v32[*(int *)(v30 + 48)];
  outlined init with copy of UUID?(v50, v32);
  outlined init with copy of UUID?(v48, v25);
  v27 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48);
  if (v27(v32, v26, v36) == 1)
  {
    if (v27(v25, 1, v36) == 1)
    {
      outlined destroy of UUID?((uint64_t)v32);
      v24 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    outlined init with copy of UUID?(v32, v45);
    if (v27(v25, 1, v36) != 1)
    {
      v21 = *(void (**)(char *, char *, uint64_t))(v37 + 32);
      v21(v41, v45, v36);
      v21(v39, v25, v36);
      lazy protocol witness table accessor for type UUID and conformance UUID();
      v23 = dispatch thunk of static Equatable.== infix(_:_:)();
      v22 = *(void (**)(char *, uint64_t))(v37 + 8);
      v22(v39, v36);
      v22(v41, v36);
      outlined destroy of UUID?((uint64_t)v32);
      v24 = v23;
      goto LABEL_10;
    }
    (*(void (**)(char *, uint64_t))(v37 + 8))(v45, v36);
  }
  outlined destroy of (UUID?, UUID?)((uint64_t)v32);
  v24 = 0;
LABEL_10:
  v20 = v24;
  outlined destroy of UUID?((uint64_t)v48);
  outlined destroy of UUID?((uint64_t)v50);
  if ((v20 & 1) != 0)
  {
    v7 = v42;
    v19 = objc_msgSend(v43, sel_version);
    if (v19 == (id)(*(uint64_t (**)(void))(*(_QWORD *)v7 + 408))())
    {
      v9 = v42;
      v16 = objc_msgSend(v43, sel_lastKnownRSVPQueueSeqNumber);
      if (v16 == (id)(*(uint64_t (**)(void))(*(_QWORD *)v9 + 528))())
      {
        return 0;
      }
      else
      {
        v10 = v42;
        v15 = objc_msgSend(v43, sel_lastKnownRSVPQueueSeqNumber);
        return (*(uint64_t (**)(void))(*(_QWORD *)v10 + 528))() < (uint64_t)v15;
      }
    }
    else
    {
      v8 = v42;
      v17 = objc_msgSend(v43, sel_version);
      return (*(uint64_t (**)(void))(*(_QWORD *)v8 + 408))() < (uint64_t)v17;
    }
  }
  else
  {
    v13 = 0;
    type metadata accessor for InternalError();
    v52 = 41;
    v14 = InternalError.__allocating_init(_:internalInfo:)(&v52, v13);
    swift_willThrow();
    return (&vars0 - 88) & 1;
  }
}

uint64_t protocol witness for ConflictResolving.shouldOverwrite(other:) in conformance Group(void **a1)
{
  uint64_t v1;
  BOOL v2;

  v2 = Group.shouldOverwrite(other:)(*a1);
  return v1 || v2;
}

uint64_t protocol witness for ConflictResolving.shouldOverwrite(other:) in conformance Group(uint64_t a1)
{
  uint64_t v1;
  BOOL v2;

  v2 = Group.shouldOverwrite(other:)(a1);
  return v1 || v2;
}

uint64_t method lookup function for Group()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Group.update(using:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x24BEE4EA0]) + 0x50))();
}

uint64_t dispatch thunk of ConflictResolving.shouldOverwrite(other:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))() & 1;
}

{
  return (*(uint64_t (**)(void))(a3 + 16))() & 1;
}

uint64_t GPKAccountManager.signOut()()
{
  uint64_t v0;
  _QWORD *v1;

  v1[4] = v0;
  v1[2] = v1;
  v1[3] = 0;
  v1[3] = v0;
  return swift_task_switch();
}

{
  _QWORD *v0;
  char **v1;
  id v2;
  _QWORD *v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v5 = (id)v0[4];
  v0[2] = v0;
  v1 = StaticString.signout.unsafeMutableAddressor();
  v7 = (uint64_t)*v1;
  v8 = (uint64_t)v1[1];
  v9 = *((_BYTE *)v1 + 16);
  v2 = v5;
  v10 = swift_task_alloc();
  v0[5] = v10;
  *(_QWORD *)(v10 + 16) = v5;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 48) = v3;
  *v3 = *(_QWORD *)(v6 + 16);
  v3[1] = GPKAccountManager.signOut();
  return signpost<A>(_:_:)(v11, v7, v8, v9, (uint64_t)&async function pointer to partial apply for closure #1 in GPKAccountManager.signOut(), v10, MEMORY[0x24BEE4AE0] + 8);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v4;
  uint64_t v5;

  v2 = *v1;
  *(_QWORD *)(v2 + 16) = *v1;
  v5 = v2 + 16;
  *(_QWORD *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    v4 = *(void **)(v5 + 16);
    swift_task_dealloc();

  }
  return swift_task_switch();
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = v0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 8))();
}

{
  uint64_t v0;
  id v2;

  v2 = *(id *)(v0 + 32);
  *(_QWORD *)(v0 + 16) = v0;
  swift_task_dealloc();

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 8))();
}

uint64_t closure #1 in GPKAccountManager.signOut()(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[9] = a2;
  v2[7] = v2;
  v2[8] = 0;
  v2[8] = a2;
  return swift_task_switch();
}

uint64_t closure #1 in GPKAccountManager.signOut()()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, ValueMetadata *, unint64_t, uint64_t, uint64_t);

  v4 = v0[9];
  v0[7] = v0;
  AccountNotificationMessage.init()();
  outlined init with copy of MessageSenderProtocol(v4 + OBJC_IVAR___GPKAccountManager_daemonMessageSender, (uint64_t)(v0 + 2));
  v7 = v0[5];
  v8 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v7);
  v9 = (uint64_t (*)(uint64_t, uint64_t, ValueMetadata *, unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 + 8) + **(int **)(v8 + 8));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 80) = v1;
  v2 = lazy protocol witness table accessor for type AccountNotificationMessage and conformance AccountNotificationMessage();
  *v1 = *(_QWORD *)(v5 + 56);
  v1[1] = closure #1 in GPKAccountManager.signOut();
  return v9(v6, v6, &type metadata for AccountNotificationMessage, v2, v7, v8);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = *v1;
  *(_QWORD *)(v2 + 88) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 56) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 56) + 8))();
}

{
  uint64_t v0;
  uint64_t v2;

  *(_QWORD *)(v0 + 56) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 56) + 8))();
}

uint64_t partial apply for closure #1 in GPKAccountManager.signOut()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = *(_QWORD *)(v1 + 16);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = partial apply for closure #1 in GPKAccountManager.signOut();
  return closure #1 in GPKAccountManager.signOut()(a1, v5);
}

uint64_t partial apply for closure #1 in GPKAccountManager.signOut()()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t one-time initialization function for GPKErrorDomain()
{
  uint64_t result;
  Swift::String v1;

  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.groupkit", 0x12uLL, 1);
  result = v1._countAndFlagsBits;
  GPKErrorDomain = v1;
  return result;
}

Swift::String *GPKErrorDomain.unsafeMutableAddressor()
{
  if (one-time initialization token for GPKErrorDomain != -1)
    swift_once();
  return &GPKErrorDomain;
}

uint64_t GPKErrorDomain.getter()
{
  uint64_t countAndFlagsBits;

  countAndFlagsBits = GPKErrorDomain.unsafeMutableAddressor()->_countAndFlagsBits;
  swift_bridgeObjectRetain();
  return countAndFlagsBits;
}

uint64_t GPKError.internalErrorCode.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  char *v3;
  char v5;

  v3 = (char *)(v1 + OBJC_IVAR____TtC8GroupKit8GPKError_internalErrorCode);
  swift_beginAccess();
  v5 = *v3;
  result = swift_endAccess();
  *a1 = v5;
  return result;
}

uint64_t GPKError.internalErrorCode.setter(char *a1)
{
  uint64_t v1;
  _BYTE *v3;
  char v4;

  v4 = *a1;
  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC8GroupKit8GPKError_internalErrorCode);
  swift_beginAccess();
  *v3 = v4;
  return swift_endAccess();
}

uint64_t GPKError.publicErrorCode.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  char *v3;
  char v5;

  v3 = (char *)(v1 + OBJC_IVAR____TtC8GroupKit8GPKError_publicErrorCode);
  swift_beginAccess();
  v5 = *v3;
  result = swift_endAccess();
  *a1 = v5;
  return result;
}

uint64_t GPKError.publicErrorCode.setter(char *a1)
{
  uint64_t v1;
  _BYTE *v3;
  char v4;

  v4 = *a1;
  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC8GroupKit8GPKError_publicErrorCode);
  swift_beginAccess();
  *v3 = v4;
  return swift_endAccess();
}

id GPKError.__allocating_init(internalError:)(void *a1)
{
  objc_class *v1;
  id v2;

  v2 = objc_allocWithZone(v1);
  return GPKError.init(internalError:)(a1);
}

id GPKError.init(internalError:)(void *a1)
{
  char *v1;
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v16;
  uint64_t *v17;
  id v18;
  char *v19;
  char v20;
  char *v21;
  Swift::String v22;
  char v23;
  id v24;
  uint64_t v25;
  Class isa;
  id v27;
  id v28;
  char *v29;
  Swift::String v30;
  id v31;
  id v32;
  id v33;
  _BYTE *v34;
  objc_class *ObjectType;
  objc_super v37;
  char v38;
  uint64_t v39;
  char v40;
  char v41;
  char v42;
  char v43;
  _BYTE *v44;
  objc_super v45;
  char v46;
  _BYTE *v47;
  void *v48;
  void *v49;
  id v50;

  ObjectType = (objc_class *)swift_getObjectType();
  v44 = 0;
  v41 = 0;
  v39 = 0;
  v49 = a1;
  v2 = v1;
  v3 = v1;
  v4 = v1;
  v5 = v1;
  v6 = v1;
  v50 = v1;
  v1[OBJC_IVAR____TtC8GroupKit8GPKError_internalErrorCode] = -69;

  v1[OBJC_IVAR____TtC8GroupKit8GPKError_publicErrorCode] = 26;
  v7 = a1;
  v48 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  type metadata accessor for InternalError();
  if ((swift_dynamicCast() & 1) != 0)
    v34 = v47;
  else
    v34 = 0;

  if (v34)
  {
    v44 = v34;
    v42 = v34[OBJC_IVAR____TtC8GroupKit13InternalError_internalCode];
    GPKError.Code.init(_:)((GroupKit::InternalErrorCode)&v42);
    v23 = v43;
    v41 = v43;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Int));
    _allocateUninitializedArray<A>(_:)();
    v17 = v9;
    v18 = (id)*MEMORY[0x24BDD0FD8];
    v10 = (id)*MEMORY[0x24BDD0FD8];
    *v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v17[1] = v11;
    v40 = v34[OBJC_IVAR____TtC8GroupKit13InternalError_internalCode];
    InternalErrorCode.rawValue.getter();
    v17[2] = v12;
    _finalizeUninitializedArray<A>(_:)();

    v39 = Dictionary.init(dictionaryLiteral:)();
    v20 = v34[OBJC_IVAR____TtC8GroupKit13InternalError_internalCode];
    v19 = &v1[OBJC_IVAR____TtC8GroupKit8GPKError_internalErrorCode];
    swift_beginAccess();
    *v19 = v20;
    swift_endAccess();

    v21 = &v1[OBJC_IVAR____TtC8GroupKit8GPKError_publicErrorCode];
    swift_beginAccess();
    *v21 = v23;
    swift_endAccess();

    v24 = v50;
    v22 = *GPKErrorDomain.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    v27 = (id)MEMORY[0x242632560](v22._countAndFlagsBits, v22._object);
    swift_bridgeObjectRelease();
    v38 = v23;
    GPKError.Code.rawValue.getter();
    v25 = v13;
    swift_bridgeObjectRetain();
    _dictionaryUpCast<A, B, C, D>(_:)();
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v37.receiver = v24;
    v37.super_class = ObjectType;
    v28 = objc_msgSendSuper2(&v37, sel_initWithDomain_code_userInfo_, v27, v25, isa);

    v50 = v28;
    swift_bridgeObjectRelease();

  }
  else
  {

    v29 = &v1[OBJC_IVAR____TtC8GroupKit8GPKError_publicErrorCode];
    swift_beginAccess();
    *v29 = 0;
    swift_endAccess();

    v31 = v50;
    v30 = *GPKErrorDomain.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    v32 = (id)MEMORY[0x242632560](v30._countAndFlagsBits, v30._object);
    swift_bridgeObjectRelease();
    v46 = 0;
    GPKError.Code.rawValue.getter();
    v45.receiver = v31;
    v45.super_class = ObjectType;
    v33 = objc_msgSendSuper2(&v45, sel_initWithDomain_code_userInfo_, v32, v8, 0);

    v50 = v33;
  }
  v16 = v50;
  v14 = v50;

  return v16;
}

GroupKit::GPKError::Code __swiftcall GPKError.Code.init(_:)(GroupKit::InternalErrorCode a1)
{
  char *v1;
  uint64_t v2;
  GroupKit::GPKError::Code result;
  uint64_t v4;
  char *v5;
  unint64_t v6;
  char v7;

  v5 = v1;
  v6 = (*(_BYTE *)a1 + 76);
  if (v6 <= 0xBA)
    __asm { BR              X8 }
  InternalErrorCode.rawValue.getter();
  v4 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ClosedRange<Int>);
  lazy protocol witness table accessor for type ClosedRange<Int> and conformance ClosedRange<A>();
  result = static RangeExpression.~= infix(_:_:)();
  if ((result & 1) != 0)
  {
    v7 = 13;
  }
  else if (v4 == -45059)
  {
    v7 = 25;
  }
  else
  {
    result = static RangeExpression.~= infix(_:_:)();
    if ((result & 1) != 0)
      v7 = 14;
    else
      v7 = 0;
  }
  *v5 = v7;
  return result;
}

void GPKError.Code.rawValue.getter()
{
  __asm { BR              X8 }
}

uint64_t sub_23D2C68E4()
{
  return 0;
}

unint64_t lazy protocol witness table accessor for type ClosedRange<Int> and conformance ClosedRange<A>()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type ClosedRange<Int> and conformance ClosedRange<A>;
  if (!lazy protocol witness table cache variable for type ClosedRange<Int> and conformance ClosedRange<A>)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ClosedRange<Int>);
    v1 = MEMORY[0x2426331CC](MEMORY[0x24BEE08F8], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type ClosedRange<Int> and conformance ClosedRange<A>);
    return v1;
  }
  return v3;
}

uint64_t default argument 1 of GPKError.init(code:userInfo:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any));
  _allocateUninitializedArray<A>(_:)();
  return Dictionary.init(dictionaryLiteral:)();
}

id GPKError.__allocating_init(code:userInfo:)(char *a1, uint64_t a2)
{
  objc_class *v2;
  id v3;

  v3 = objc_allocWithZone(v2);
  return GPKError.init(code:userInfo:)(a1, a2);
}

id GPKError.init(code:userInfo:)(char *a1, uint64_t a2)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  Swift::String v9;
  char v10;
  objc_class *ObjectType;
  uint64_t v12;
  Class isa;
  id v14;
  id v16;
  objc_super v17;
  char v18;
  uint64_t v19;
  char v20;
  id v21;

  ObjectType = (objc_class *)swift_getObjectType();
  v21 = 0;
  v20 = 0;
  v19 = 0;
  v20 = *a1;
  v10 = v20;
  v19 = a2;
  v3 = v2;
  v4 = v2;
  v21 = v2;
  *((_BYTE *)v2 + OBJC_IVAR____TtC8GroupKit8GPKError_internalErrorCode) = -69;

  *((_BYTE *)v2 + OBJC_IVAR____TtC8GroupKit8GPKError_publicErrorCode) = 26;
  v9 = *GPKErrorDomain.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v14 = (id)MEMORY[0x242632560](v9._countAndFlagsBits, v9._object);
  swift_bridgeObjectRelease();
  v18 = v10;
  GPKError.Code.rawValue.getter();
  v12 = v5;
  swift_bridgeObjectRetain();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v17.receiver = v21;
  v17.super_class = ObjectType;
  v16 = objc_msgSendSuper2(&v17, sel_initWithDomain_code_userInfo_, v14, v12, isa);

  v6 = v16;
  v21 = v16;
  swift_bridgeObjectRelease();

  return v16;
}

id GPKError.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v4;

  v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id GPKError.init(coder:)(void *a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;
  objc_class *ObjectType;
  id v9;
  objc_super v10;
  void *v11;
  id v12;

  ObjectType = (objc_class *)swift_getObjectType();
  v11 = a1;
  v2 = v1;
  v3 = v1;
  v12 = v1;
  *((_BYTE *)v1 + OBJC_IVAR____TtC8GroupKit8GPKError_internalErrorCode) = -69;

  *((_BYTE *)v1 + OBJC_IVAR____TtC8GroupKit8GPKError_publicErrorCode) = 26;
  v10.receiver = v12;
  v10.super_class = ObjectType;
  v9 = objc_msgSendSuper2(&v10, sel_initWithCoder_, a1);
  if (v9)
  {
    v4 = v9;
    v12 = v9;

    return v9;
  }
  else
  {

    return 0;
  }
}

uint64_t static GPKError.supportsSecureCoding.getter()
{
  return 1;
}

id GPKError.__allocating_init(domain:code:userInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  id v5;
  id v7;
  id v8;
  Class isa;
  id v13;
  void *v15;

  v13 = objc_allocWithZone(v4);
  v15 = (void *)MEMORY[0x242632560](a1, a2);
  if (a4)
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v5 = objc_msgSend(v13, sel_initWithDomain_code_userInfo_, v15, a3, isa);
  }
  else
  {
    v5 = objc_msgSend(v13, sel_initWithDomain_code_userInfo_, v15, a3, 0);
  }
  v8 = v5;

  swift_bridgeObjectRelease();
  return v8;
}

uint64_t GPKError.init(domain:code:userInfo:)()
{
  uint64_t result;
  uint64_t v1;

  if (!"GroupKit.GPKError")
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  result = closure #1 in _unimplementedInitializer(className:initName:file:line:column:)((uint64_t)"GroupKit.GPKError", 17, (unint64_t)"init(domain:code:userInfo:)", 27, 2, (unint64_t)"GroupKit/GPKError.swift", 23, 2, v1, 0xCuLL, 0x14uLL);
  __break(1u);
  return result;
}

id GPKError.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

GroupKit::GPKError::Code_optional __swiftcall GPKError.Code.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v3;

  switch(rawValue)
  {
    case 0:
      v3 = 0;
LABEL_54:
      *v1 = v3;
      return (GroupKit::GPKError::Code_optional)rawValue;
    case 1:
      v3 = 1;
      goto LABEL_54;
    case 2:
      v3 = 2;
      goto LABEL_54;
    case 3:
      v3 = 3;
      goto LABEL_54;
    case 4:
      v3 = 4;
      goto LABEL_54;
    case 5:
      v3 = 5;
      goto LABEL_54;
    case 6:
      v3 = 6;
      goto LABEL_54;
    case 7:
      v3 = 7;
      goto LABEL_54;
    case 8:
      v3 = 8;
      goto LABEL_54;
    case 9:
      v3 = 9;
      goto LABEL_54;
    case 10:
      v3 = 10;
      goto LABEL_54;
    case 11:
      v3 = 11;
      goto LABEL_54;
    case 12:
      v3 = 12;
      goto LABEL_54;
    case 13:
      v3 = 13;
      goto LABEL_54;
    case 14:
      v3 = 14;
      goto LABEL_54;
    case 15:
      v3 = 15;
      goto LABEL_54;
    case 16:
      v3 = 16;
      goto LABEL_54;
    case 17:
      v3 = 17;
      goto LABEL_54;
    case 18:
      v3 = 18;
      goto LABEL_54;
    case 19:
      v3 = 19;
      goto LABEL_54;
    case 20:
      v3 = 20;
      goto LABEL_54;
    case 21:
      v3 = 21;
      goto LABEL_54;
    case 22:
      v3 = 22;
      goto LABEL_54;
    case 23:
      v3 = 23;
      goto LABEL_54;
    case 24:
      v3 = 24;
      goto LABEL_54;
    case 25:
      v3 = 25;
      goto LABEL_54;
  }
  *v1 = 26;
  return (GroupKit::GPKError::Code_optional)rawValue;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GPKError.Code()
{
  lazy protocol witness table accessor for type GPKError.Code and conformance GPKError.Code();
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance GPKError.Code()
{
  lazy protocol witness table accessor for type GPKError.Code and conformance GPKError.Code();
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GPKError.Code()
{
  lazy protocol witness table accessor for type GPKError.Code and conformance GPKError.Code();
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance GPKError.Code()
{
  lazy protocol witness table accessor for type GPKError.Code and conformance GPKError.Code();
  return RawRepresentable<>._rawHashValue(seed:)();
}

GroupKit::GPKError::Code_optional protocol witness for RawRepresentable.init(rawValue:) in conformance GPKError.Code(Swift::Int *a1)
{
  return GPKError.Code.init(rawValue:)(*a1);
}

void protocol witness for RawRepresentable.rawValue.getter in conformance GPKError.Code(_QWORD *a1@<X8>)
{
  uint64_t v1;

  GPKError.Code.rawValue.getter();
  *a1 = v1;
}

uint64_t protocol witness for Decodable.init(from:) in conformance GPKError.Code()
{
  lazy protocol witness table accessor for type GPKError.Code and conformance GPKError.Code();
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GPKError.Code()
{
  lazy protocol witness table accessor for type GPKError.Code and conformance GPKError.Code();
  return RawRepresentable<>.encode(to:)();
}

unint64_t lazy protocol witness table accessor for type GPKError.Code and conformance GPKError.Code()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKError.Code and conformance GPKError.Code;
  if (!lazy protocol witness table cache variable for type GPKError.Code and conformance GPKError.Code)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKError.Code, &type metadata for GPKError.Code);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKError.Code and conformance GPKError.Code);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKError.Code and conformance GPKError.Code;
  if (!lazy protocol witness table cache variable for type GPKError.Code and conformance GPKError.Code)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKError.Code, &type metadata for GPKError.Code);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKError.Code and conformance GPKError.Code);
    return v0;
  }
  return v2;
}

unint64_t base witness table accessor for Equatable in GPKError.Code()
{
  return lazy protocol witness table accessor for type GPKError.Code and conformance GPKError.Code();
}

uint64_t type metadata accessor for GPKError()
{
  return objc_opt_self();
}

uint64_t method lookup function for GPKError()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of GPKError.__allocating_init(internalError:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of GPKError.__allocating_init(code:userInfo:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t getEnumTagSinglePayload for GPKError.Code(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v5;
  int v6;
  unsigned int v7;
  int v8;

  if (a2)
  {
    if (a2 <= 0xE6)
      goto LABEL_15;
    v7 = ((a2 + 25) >> 8) + 1;
    v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000)
        v2 = 4;
      else
        v2 = 2;
      v8 = v2;
    }
    if (v8 == 1)
      v6 = a1[1];
    else
      v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    if (v6)
    {
      v5 = (*a1 | ((v6 - 1) << 8)) + 230;
    }
    else
    {
LABEL_15:
      v3 = *a1 - 26;
      if (v3 < 0)
        v3 = -1;
      v5 = v3;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

_BYTE *storeEnumTagSinglePayload for GPKError.Code(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  v7 = 0;
  if (a3 > 0xE6)
  {
    v5 = ((a3 + 25) >> 8) + 1;
    v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000)
        v3 = 4;
      else
        v3 = 2;
      v6 = v3;
    }
    v7 = v6;
  }
  if (a2 > 0xE6)
  {
    v4 = ((a2 - 231) >> 8) + 1;
    *result = a2 + 25;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2)
      *result = a2 + 25;
  }
  return result;
}

uint64_t getEnumTag for GPKError.Code(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for GPKError.Code(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for GPKError.Code()
{
  return &type metadata for GPKError.Code;
}

uint64_t GPKUpdateGroupRequest.Member.handle.getter()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t GPKUpdateGroupRequest.Member.handle.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  swift_bridgeObjectRetain();
  *v2 = a1;
  v2[1] = a2;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void (*GPKUpdateGroupRequest.Member.handle.modify())()
{
  return GPKUpdateGroupRequest.Member.handle.modify;
}

void GPKUpdateGroupRequest.Member.role.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16) & 1;
}

_BYTE *GPKUpdateGroupRequest.Member.role.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = *result & 1;
  return result;
}

void (*GPKUpdateGroupRequest.Member.role.modify())()
{
  return GPKUpdateGroupRequest.Member.role.modify;
}

uint64_t GPKUpdateGroupRequest.Member.metadata.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t GPKUpdateGroupRequest.Member.metadata.setter(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRetain();
  *(_QWORD *)(v1 + 24) = a1;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void (*GPKUpdateGroupRequest.Member.metadata.modify())()
{
  return GPKUpdateGroupRequest.Member.metadata.modify;
}

void GPKUpdateGroupRequest.Member.policy.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 32) & 1;
}

_BYTE *GPKUpdateGroupRequest.Member.policy.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 32) = *result & 1;
  return result;
}

void (*GPKUpdateGroupRequest.Member.policy.modify())()
{
  return GPKUpdateGroupRequest.Member.policy.modify;
}

uint64_t GPKUpdateGroupRequest.Member.userID.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  unint64_t v5;

  v3 = *(_QWORD *)(v1 + 40);
  v5 = *(_QWORD *)(v1 + 48);
  result = outlined copy of GPKUserID?(v3, v5);
  *a1 = v3;
  a1[1] = v5;
  return result;
}

uint64_t GPKUpdateGroupRequest.Member.init(handle:role:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  unint64_t v15;
  char v16;
  char v17;
  _QWORD v18[2];
  char v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD __b[7];

  memset(__b, 0, sizeof(__b));
  v24 = 0;
  v25 = a1;
  v26 = a2;
  v24 = *a3 & 1;
  v17 = v24;
  v16 = 0;
  GPKUpdateGroupRequest.Member.init(handle:role:policy:)(a1, a2, &v17, &v16, (uint64_t)v18);
  v8 = v18[0];
  v9 = v18[1];
  v10 = v19;
  v11 = v20;
  v12 = v21;
  v13 = v22;
  v15 = v23;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  outlined copy of GPKUserID?(v13, v15);
  __b[0] = v8;
  __b[1] = v9;
  LOBYTE(__b[2]) = v10 & 1;
  __b[3] = v11;
  LOBYTE(__b[4]) = v12 & 1;
  __b[5] = v13;
  __b[6] = v15;
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v9;
  *(_BYTE *)(a4 + 16) = v10 & 1;
  *(_QWORD *)(a4 + 24) = v11;
  *(_BYTE *)(a4 + 32) = v12 & 1;
  *(_QWORD *)(a4 + 40) = v13;
  *(_QWORD *)(a4 + 48) = v15;
  return outlined destroy of GPKUpdateGroupRequest.Member((uint64_t)__b);
}

uint64_t GPKUpdateGroupRequest.Member.init(handle:role:policy:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X2>, _BYTE *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  char v12;
  char v13;
  _QWORD __b[7];

  memset(__b, 0, sizeof(__b));
  v13 = *a3 & 1;
  v12 = *a4 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, String));
  _allocateUninitializedArray<A>(_:)();
  v9 = Dictionary.init(dictionaryLiteral:)();
  swift_bridgeObjectRetain();
  __b[3] = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __b[0] = a1;
  __b[1] = a2;
  LOBYTE(__b[2]) = v13;
  __b[5] = 0;
  __b[6] = 0xF000000000000000;
  LOBYTE(__b[4]) = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  outlined copy of GPKUserID?(0, 0xF000000000000000);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_QWORD *)a5 = a1;
  *(_QWORD *)(a5 + 8) = a2;
  *(_BYTE *)(a5 + 16) = v13;
  *(_QWORD *)(a5 + 24) = v9;
  *(_BYTE *)(a5 + 32) = v12;
  *(_QWORD *)(a5 + 40) = 0;
  *(_QWORD *)(a5 + 48) = 0xF000000000000000;
  swift_bridgeObjectRelease();
  return outlined destroy of GPKUpdateGroupRequest.Member((uint64_t)__b);
}

uint64_t outlined destroy of GPKUpdateGroupRequest.Member(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((*(_QWORD *)(a1 + 48) & 0xF000000000000000) != 0xF000000000000000)
    outlined consume of Data._Representation(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return a1;
}

uint64_t GPKUpdateGroupRequest.Member.init(member:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  unint64_t v22;
  char v24;
  char v25;
  char v26;
  char v27;
  _QWORD v28[2];
  char v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  unint64_t v33;
  _QWORD *v34;
  _QWORD __b[7];

  memset(__b, 0, sizeof(__b));
  v34 = a1;
  v5 = a1[3];
  v4 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  v10 = (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
  v11 = v2;
  v7 = a1[3];
  v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  (*(void (**)(char *__return_ptr, uint64_t))(v6 + 16))(&v27, v7);
  v26 = v27 & 1;
  v9 = a1[3];
  v8 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v9);
  (*(void (**)(char *__return_ptr, uint64_t))(v8 + 32))(&v25, v9);
  v24 = v25 & 1;
  GPKUpdateGroupRequest.Member.init(handle:role:policy:)(v10, v11, &v26, &v24, (uint64_t)v28);
  v15 = v28[0];
  v16 = v28[1];
  v17 = v29;
  v12 = v30;
  v19 = v31;
  v20 = v32;
  v22 = v33;
  swift_bridgeObjectRetain();
  outlined copy of GPKUserID?(v20, v22);
  __b[0] = v15;
  __b[1] = v16;
  LOBYTE(__b[2]) = v17 & 1;
  __b[3] = v12;
  LOBYTE(__b[4]) = v19 & 1;
  __b[5] = v20;
  __b[6] = v22;
  v14 = a1[3];
  v13 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v14);
  v18 = (*(uint64_t (**)(uint64_t))(v13 + 24))(v14);
  swift_bridgeObjectRetain();
  __b[3] = v18;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  outlined copy of GPKUserID?(v20, v22);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  outlined copy of GPKUserID?(v20, v22);
  outlined consume of GPKUserID?(v20, v22);
  outlined consume of GPKUserID?(v20, v22);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_QWORD *)a2 = v15;
  *(_QWORD *)(a2 + 8) = v16;
  *(_BYTE *)(a2 + 16) = v17 & 1;
  *(_QWORD *)(a2 + 24) = v18;
  *(_BYTE *)(a2 + 32) = v19 & 1;
  *(_QWORD *)(a2 + 40) = v20;
  *(_QWORD *)(a2 + 48) = v22;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return outlined destroy of GPKUpdateGroupRequest.Member((uint64_t)__b);
}

_QWORD *GPKUpdateGroupRequest.Member.init(member:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  _QWORD *v3;
  Swift::String v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  os_log_type_t v14;
  Swift::String fileID;
  uint64_t v18;
  unint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD __b[7];

  memset(__b, 0, sizeof(__b));
  v22 = 0;
  v23 = 0;
  v28 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, String));
  _allocateUninitializedArray<A>(_:)();
  __b[3] = Dictionary.init(dictionaryLiteral:)();
  v3 = (*(_QWORD *(**)(uint64_t *__return_ptr))(*(_QWORD *)a1 + 304))(&v26);
  v18 = v26;
  v19 = v27;
  if ((v27 & 0xF000000000000000) == 0xF000000000000000)
  {
    v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Attempting create member use his not resolved in update request", 0x3FuLL, 1);
    v14 = static os_log_type_t.error.getter();
    fileID = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GroupKit/GPKUpdateGroupRequest.swift", 0x24uLL, 1);
    default argument 4 of gpklog(_:type:fileID:line:subsystem:)(&v25);
    v24 = v25 & 1;
    gpklog(_:type:fileID:line:subsystem:)(v4, v14, fileID, 85, (GroupKit::LogSubsystem)&v24);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    result = &__b[3];
    outlined destroy of [String : String]();
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    a2[3] = 0;
    a2[4] = 0;
    a2[5] = 0;
    a2[6] = 0;
  }
  else
  {
    v22 = v26;
    v23 = v27;
    v9 = (*(uint64_t (**)(_QWORD *))(*(_QWORD *)a1 + 160))(v3);
    v10 = v5;
    swift_bridgeObjectRetain();
    __b[0] = v9;
    __b[1] = v10;
    (*(void (**)(char *__return_ptr))(*(_QWORD *)a1 + 184))(&v21);
    v11 = v21;
    LOBYTE(__b[2]) = v21 & 1;
    outlined copy of Data._Representation(v18, v19);
    v6 = outlined copy of GPKUserID?(v18, v19);
    __b[5] = v18;
    __b[6] = v19;
    v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 208))(v6);
    swift_bridgeObjectRetain();
    __b[3] = v12;
    v7 = swift_bridgeObjectRelease();
    (*(void (**)(char *__return_ptr, uint64_t))(*(_QWORD *)a1 + 384))(&v20, v7);
    v13 = v20;
    LOBYTE(__b[4]) = v20 & 1;
    outlined consume of Data._Representation(v18, v19);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    outlined copy of GPKUserID?(v18, v19);
    outlined consume of GPKUserID?(v18, v19);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *a2 = v9;
    a2[1] = v10;
    *((_BYTE *)a2 + 16) = v11 & 1;
    a2[3] = v12;
    *((_BYTE *)a2 + 32) = v13 & 1;
    a2[5] = v18;
    a2[6] = v19;
    swift_release();
    return (_QWORD *)outlined destroy of GPKUpdateGroupRequest.Member((uint64_t)__b);
  }
  return result;
}

Swift::Void __swiftcall GPKUpdateGroupRequest.Member.setMetadataValue(_:forKey:)(Swift::String_optional _, Swift::String forKey)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : String]);
  Dictionary.subscript.setter();
}

Swift::Void __swiftcall GPKUpdateGroupRequest.Member.setMetadata(_:)(Swift::OpaquePointer a1)
{
  Swift::OpaquePointer *v1;

  swift_bridgeObjectRetain();
  v1[3]._rawValue = a1._rawValue;
  swift_bridgeObjectRelease();
}

uint64_t static GPKUpdateGroupRequest.Member.== infix(_:_:)()
{
  char v1;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v1 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t GPKUpdateGroupRequest.Member.hash(into:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD v10[2];
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;

  v16 = 0;
  v17 = a1;
  v3 = *v1;
  v4 = v1[1];
  v5 = *((_BYTE *)v1 + 16);
  v6 = v1[3];
  v7 = *((_BYTE *)v1 + 32);
  v8 = v1[5];
  v9 = v1[6];
  v16 = v1;
  swift_bridgeObjectRetain();
  v14 = v3;
  v15 = v4;
  Hasher.combine<A>(_:)();
  outlined destroy of String();
  v13 = v5 & 1;
  lazy protocol witness table accessor for type GPKMemberRole and conformance GPKMemberRole();
  Hasher.combine<A>(_:)();
  swift_bridgeObjectRetain();
  v12 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : String]);
  lazy protocol witness table accessor for type [String : String] and conformance <> [A : B]();
  Hasher.combine<A>(_:)();
  outlined destroy of [String : String]();
  v11 = v7 & 1;
  lazy protocol witness table accessor for type GPKMemberPolicy and conformance GPKMemberPolicy();
  Hasher.combine<A>(_:)();
  outlined copy of GPKUserID?(v8, v9);
  v10[0] = v8;
  v10[1] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GPKUserID?);
  lazy protocol witness table accessor for type GPKUserID? and conformance <A> A?();
  Hasher.combine<A>(_:)();
  return outlined destroy of GPKUserID?((uint64_t)v10);
}

void static GPKUpdateGroupRequest.Member.CodingKeys.== infix(_:_:)(char a1)
{
  __asm { BR              X8 }
}

uint64_t sub_23D2C8E64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, unsigned __int8 a12)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_23D2C8EBC
                                                                                       + dword_23D2C8F34[a12]))(a1, a2, a3, a4, a5, a6);
}

BOOL sub_23D2C8ECC()
{
  uint64_t v1;

  return v1 == 0;
}

void GPKUpdateGroupRequest.Member.CodingKeys.hash(into:)(uint64_t a1, char a2)
{
  __asm { BR              X8 }
}

uint64_t sub_23D2C8F98()
{
  return Hasher.combine<A>(_:)();
}

uint64_t GPKUpdateGroupRequest.Member.CodingKeys.init(stringValue:)()
{
  char v2;
  char v3;
  char v4;
  char v5;
  char v6;
  unsigned __int8 v7;

  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("handle", 6uLL, 1);
  swift_bridgeObjectRetain();
  v6 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v6 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v7 = 0;
LABEL_12:
    swift_bridgeObjectRelease();
    return v7;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("role", 4uLL, 1);
  swift_bridgeObjectRetain();
  v5 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v5 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v7 = 1;
    goto LABEL_12;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("metadata", 8uLL, 1);
  swift_bridgeObjectRetain();
  v4 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v4 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v7 = 2;
    goto LABEL_12;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("policy", 6uLL, 1);
  swift_bridgeObjectRetain();
  v3 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v3 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v7 = 3;
    goto LABEL_12;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("userID", 6uLL, 1);
  swift_bridgeObjectRetain();
  v2 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v7 = 4;
    goto LABEL_12;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 5;
}

uint64_t GPKUpdateGroupRequest.Member.CodingKeys.init(intValue:)()
{
  return 5;
}

uint64_t GPKUpdateGroupRequest.Member.CodingKeys.hashValue.getter()
{
  lazy protocol witness table accessor for type GPKUpdateGroupRequest.Member.CodingKeys and conformance GPKUpdateGroupRequest.Member.CodingKeys();
  return _hashValue<A>(for:)();
}

unint64_t lazy protocol witness table accessor for type GPKUpdateGroupRequest.Member.CodingKeys and conformance GPKUpdateGroupRequest.Member.CodingKeys()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKUpdateGroupRequest.Member.CodingKeys and conformance GPKUpdateGroupRequest.Member.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKUpdateGroupRequest.Member.CodingKeys and conformance GPKUpdateGroupRequest.Member.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKUpdateGroupRequest.Member.CodingKeys, &type metadata for GPKUpdateGroupRequest.Member.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKUpdateGroupRequest.Member.CodingKeys and conformance GPKUpdateGroupRequest.Member.CodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKUpdateGroupRequest.Member.CodingKeys and conformance GPKUpdateGroupRequest.Member.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKUpdateGroupRequest.Member.CodingKeys and conformance GPKUpdateGroupRequest.Member.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKUpdateGroupRequest.Member.CodingKeys, &type metadata for GPKUpdateGroupRequest.Member.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKUpdateGroupRequest.Member.CodingKeys and conformance GPKUpdateGroupRequest.Member.CodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKUpdateGroupRequest.Member.CodingKeys and conformance GPKUpdateGroupRequest.Member.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKUpdateGroupRequest.Member.CodingKeys and conformance GPKUpdateGroupRequest.Member.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKUpdateGroupRequest.Member.CodingKeys, &type metadata for GPKUpdateGroupRequest.Member.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKUpdateGroupRequest.Member.CodingKeys and conformance GPKUpdateGroupRequest.Member.CodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKUpdateGroupRequest.Member.CodingKeys and conformance GPKUpdateGroupRequest.Member.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKUpdateGroupRequest.Member.CodingKeys and conformance GPKUpdateGroupRequest.Member.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKUpdateGroupRequest.Member.CodingKeys, &type metadata for GPKUpdateGroupRequest.Member.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKUpdateGroupRequest.Member.CodingKeys and conformance GPKUpdateGroupRequest.Member.CodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKUpdateGroupRequest.Member.CodingKeys and conformance GPKUpdateGroupRequest.Member.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKUpdateGroupRequest.Member.CodingKeys and conformance GPKUpdateGroupRequest.Member.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKUpdateGroupRequest.Member.CodingKeys, &type metadata for GPKUpdateGroupRequest.Member.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKUpdateGroupRequest.Member.CodingKeys and conformance GPKUpdateGroupRequest.Member.CodingKeys);
    return v0;
  }
  return v2;
}

uint64_t GPKUpdateGroupRequest.Member.CodingKeys.intValue.getter()
{
  return 0;
}

void GPKUpdateGroupRequest.Member.CodingKeys.stringValue.getter(char a1)
{
  __asm { BR              X8 }
}

uint64_t sub_23D2C94A8()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("handle", 6uLL, 1)._countAndFlagsBits;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GPKUpdateGroupRequest.Member.CodingKeys(char *a1)
{
  char v1;

  static GPKUpdateGroupRequest.Member.CodingKeys.== infix(_:_:)(*a1);
  return v1 & 1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance GPKUpdateGroupRequest.Member.CodingKeys()
{
  return GPKUpdateGroupRequest.Member.CodingKeys.hashValue.getter();
}

void protocol witness for Hashable.hash(into:) in conformance GPKUpdateGroupRequest.Member.CodingKeys(uint64_t a1)
{
  char *v1;

  GPKUpdateGroupRequest.Member.CodingKeys.hash(into:)(a1, *v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GPKUpdateGroupRequest.Member.CodingKeys(Swift::Int a1)
{
  return Hashable._rawHashValue(seed:)(a1);
}

void protocol witness for CodingKey.stringValue.getter in conformance GPKUpdateGroupRequest.Member.CodingKeys()
{
  char *v0;

  GPKUpdateGroupRequest.Member.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GPKUpdateGroupRequest.Member.CodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = GPKUpdateGroupRequest.Member.CodingKeys.init(stringValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance GPKUpdateGroupRequest.Member.CodingKeys()
{
  return GPKUpdateGroupRequest.Member.CodingKeys.intValue.getter();
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance GPKUpdateGroupRequest.Member.CodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = GPKUpdateGroupRequest.Member.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GPKUpdateGroupRequest.Member.CodingKeys()
{
  lazy protocol witness table accessor for type GPKUpdateGroupRequest.Member.CodingKeys and conformance GPKUpdateGroupRequest.Member.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GPKUpdateGroupRequest.Member.CodingKeys()
{
  lazy protocol witness table accessor for type GPKUpdateGroupRequest.Member.CodingKeys and conformance GPKUpdateGroupRequest.Member.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t GPKUpdateGroupRequest.Member.encode(to:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  _BYTE *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  int v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  _QWORD v48[2];
  char v49;
  char v50;
  char v51;
  uint64_t v52;
  char v53;
  _BYTE v54[2];
  uint64_t *v55;
  _QWORD *v56;

  v30 = a1;
  v56 = 0;
  v55 = 0;
  v44 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GPKUpdateGroupRequest.Member.CodingKeys>);
  v31 = *(_QWORD *)(v44 - 8);
  v32 = (*(_QWORD *)(v31 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v40 = (char *)v8 - v32;
  v56 = (_QWORD *)MEMORY[0x24BDAC7A8](v30);
  v42 = *v1;
  v43 = v1[1];
  v33 = *((unsigned __int8 *)v1 + 16);
  v34 = v1[3];
  v35 = *((unsigned __int8 *)v1 + 32);
  v36 = v1[5];
  v37 = v1[6];
  v55 = v1;
  v38 = v56[3];
  v39 = v56[4];
  __swift_project_boxed_opaque_existential_1(v56, v38);
  lazy protocol witness table accessor for type GPKUpdateGroupRequest.Member.CodingKeys and conformance GPKUpdateGroupRequest.Member.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v2 = v41;
  swift_bridgeObjectRetain();
  v54[1] = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  v45 = v2;
  v46 = v2;
  if (v2)
  {
    v11 = v46;
    swift_bridgeObjectRelease();
    result = (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v40, v44);
    v12 = v11;
  }
  else
  {
    swift_bridgeObjectRelease();
    v27 = v54;
    v54[0] = v33 & 1;
    v26 = &v53;
    v53 = 1;
    lazy protocol witness table accessor for type GPKMemberRole and conformance GPKMemberRole();
    v3 = v45;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    v28 = v3;
    v29 = v3;
    if (v3)
    {
      v10 = v29;
      result = (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v40, v44);
      v12 = v10;
    }
    else
    {
      swift_bridgeObjectRetain();
      v23 = &v52;
      v52 = v34;
      v21 = &v51;
      v51 = 2;
      v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : String]);
      lazy protocol witness table accessor for type [String : String] and conformance <> [A : B]();
      v4 = v28;
      KeyedEncodingContainer.encode<A>(_:forKey:)();
      v24 = v4;
      v25 = v4;
      if (v4)
      {
        v9 = v25;
        outlined destroy of [String : String]();
        result = (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v40, v44);
        v12 = v9;
      }
      else
      {
        outlined destroy of [String : String]();
        v18 = &v50;
        v50 = v35 & 1;
        v17 = &v49;
        v49 = 3;
        lazy protocol witness table accessor for type GPKMemberPolicy and conformance GPKMemberPolicy();
        v5 = v24;
        KeyedEncodingContainer.encode<A>(_:forKey:)();
        v19 = v5;
        v20 = v5;
        if (v5)
        {
          v8[2] = v20;
          return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v40, v44);
        }
        else
        {
          outlined copy of GPKUserID?(v36, v37);
          v14 = v48;
          v48[0] = v36;
          v48[1] = v37;
          v13 = &v47;
          v47 = 4;
          lazy protocol witness table accessor for type GPKUserID and conformance GPKUserID();
          v6 = v19;
          KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
          v15 = v6;
          v16 = v6;
          if (v6)
            v8[1] = v16;
          outlined destroy of GPKUserID?((uint64_t)v48);
          return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v40, v44);
        }
      }
    }
  }
  return result;
}

uint64_t GPKUpdateGroupRequest.Member.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD __b[7];

  memset(__b, 0, sizeof(__b));
  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(_BYTE *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = *(_BYTE *)(v0 + 32);
  v5 = *(_QWORD *)(v0 + 40);
  v6 = *(_QWORD *)(v0 + 48);
  __b[0] = *(_QWORD *)v0;
  __b[1] = v1;
  LOBYTE(__b[2]) = v2 & 1;
  __b[3] = v3;
  LOBYTE(__b[4]) = v4 & 1;
  __b[5] = v5;
  __b[6] = v6;
  lazy protocol witness table accessor for type GPKUpdateGroupRequest.Member and conformance GPKUpdateGroupRequest.Member();
  return _hashValue<A>(for:)();
}

unint64_t lazy protocol witness table accessor for type GPKUpdateGroupRequest.Member and conformance GPKUpdateGroupRequest.Member()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKUpdateGroupRequest.Member and conformance GPKUpdateGroupRequest.Member;
  if (!lazy protocol witness table cache variable for type GPKUpdateGroupRequest.Member and conformance GPKUpdateGroupRequest.Member)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKUpdateGroupRequest.Member, &type metadata for GPKUpdateGroupRequest.Member);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKUpdateGroupRequest.Member and conformance GPKUpdateGroupRequest.Member);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKUpdateGroupRequest.Member and conformance GPKUpdateGroupRequest.Member;
  if (!lazy protocol witness table cache variable for type GPKUpdateGroupRequest.Member and conformance GPKUpdateGroupRequest.Member)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKUpdateGroupRequest.Member, &type metadata for GPKUpdateGroupRequest.Member);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKUpdateGroupRequest.Member and conformance GPKUpdateGroupRequest.Member);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKUpdateGroupRequest.Member and conformance GPKUpdateGroupRequest.Member;
  if (!lazy protocol witness table cache variable for type GPKUpdateGroupRequest.Member and conformance GPKUpdateGroupRequest.Member)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKUpdateGroupRequest.Member, &type metadata for GPKUpdateGroupRequest.Member);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKUpdateGroupRequest.Member and conformance GPKUpdateGroupRequest.Member);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKUpdateGroupRequest.Member and conformance GPKUpdateGroupRequest.Member;
  if (!lazy protocol witness table cache variable for type GPKUpdateGroupRequest.Member and conformance GPKUpdateGroupRequest.Member)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKUpdateGroupRequest.Member, &type metadata for GPKUpdateGroupRequest.Member);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKUpdateGroupRequest.Member and conformance GPKUpdateGroupRequest.Member);
    return v0;
  }
  return v2;
}

uint64_t *GPKUpdateGroupRequest.Member.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t *result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  int v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  _QWORD *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  unint64_t v63;
  char v64;
  unsigned __int8 v65;
  char v66;
  uint64_t v67;
  char v68;
  unsigned __int8 v69;
  char v70;
  uint64_t v71;
  _QWORD v72[2];
  char v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  unint64_t v77;
  char v78;

  v50 = a2;
  v54 = a1;
  v71 = 0;
  v51 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GPKUpdateGroupRequest.Member.CodingKeys>);
  v52 = *(_QWORD *)(v51 - 8);
  v53 = (*(_QWORD *)(v52 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v55 = (char *)&v19 - v53;
  v78 = 0;
  v71 = MEMORY[0x24BDAC7A8](v54);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, String));
  _allocateUninitializedArray<A>(_:)();
  v2 = Dictionary.init(dictionaryLiteral:)();
  v78 = 4;
  v74 = v2;
  v57 = v54[3];
  v58 = v54[4];
  __swift_project_boxed_opaque_existential_1(v54, v57);
  lazy protocol witness table accessor for type GPKUpdateGroupRequest.Member.CodingKeys and conformance GPKUpdateGroupRequest.Member.CodingKeys();
  v3 = v56;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  v59 = v3;
  v60 = v3;
  if (v3)
  {
    v24 = v60;
  }
  else
  {
    v70 = 0;
    v4 = KeyedDecodingContainer.decode(_:forKey:)();
    v46 = 0;
    v47 = v4;
    v48 = v5;
    v49 = 0;
    v42 = v5;
    v41 = v4;
    v78 = 5;
    swift_bridgeObjectRetain();
    v72[0] = v41;
    v72[1] = v42;
    v43 = &v68;
    v68 = 1;
    lazy protocol witness table accessor for type GPKMemberRole and conformance GPKMemberRole();
    v6 = v46;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    v44 = v6;
    v45 = v6;
    if (v6)
    {
      v23 = v45;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v52 + 8))(v55, v51);
      v24 = v23;
    }
    else
    {
      v36 = v69;
      v73 = v69 & 1;
      v38 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : String]);
      v37 = &v66;
      v66 = 2;
      lazy protocol witness table accessor for type [String : String] and conformance <> [A : B]();
      v7 = v44;
      KeyedDecodingContainer.decode<A>(_:forKey:)();
      v39 = v7;
      v40 = v7;
      if (v7)
      {
        v22 = v40;
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v52 + 8))(v55, v51);
        v24 = v22;
      }
      else
      {
        v32 = v67;
        swift_bridgeObjectRetain();
        v74 = v32;
        swift_bridgeObjectRelease();
        v33 = &v64;
        v64 = 3;
        lazy protocol witness table accessor for type GPKMemberPolicy and conformance GPKMemberPolicy();
        v8 = v39;
        KeyedDecodingContainer.decode<A>(_:forKey:)();
        v34 = v8;
        v35 = v8;
        if (v8)
        {
          v21 = v35;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v52 + 8))(v55, v51);
          v24 = v21;
        }
        else
        {
          v28 = v65;
          v75 = v65 & 1;
          v29 = &v61;
          v61 = 4;
          lazy protocol witness table accessor for type GPKUserID and conformance GPKUserID();
          v9 = v34;
          KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
          v30 = v9;
          v31 = v9;
          if (!v9)
          {
            v25 = v62;
            v26 = v63;
            v27 = v72;
            v78 = 21;
            outlined copy of GPKUserID?(v62, v63);
            v76 = v25;
            v77 = v26;
            (*(void (**)(char *, uint64_t))(v52 + 8))(v55, v51);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            outlined copy of GPKUserID?(v25, v26);
            outlined consume of GPKUserID?(v25, v26);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v10 = v42;
            v11 = v36;
            v12 = v32;
            v13 = v28;
            v14 = v25;
            v15 = v50;
            v16 = v26;
            v17 = v54;
            *v50 = v41;
            v15[1] = v10;
            *((_BYTE *)v15 + 16) = v11 & 1;
            v15[3] = v12;
            *((_BYTE *)v15 + 32) = v13 & 1;
            v15[5] = v14;
            v15[6] = v16;
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
            return (uint64_t *)outlined destroy of GPKUpdateGroupRequest.Member((uint64_t)v27);
          }
          v20 = v31;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v52 + 8))(v55, v51);
          v24 = v20;
        }
      }
    }
  }
  v19 = v24;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v54);
  if ((v78 & 1) != 0)
    outlined destroy of String();
  result = &v74;
  outlined destroy of [String : String]();
  return result;
}

uint64_t protocol witness for GPKMemberProperty.handle.getter in conformance GPKUpdateGroupRequest.Member()
{
  return GPKUpdateGroupRequest.Member.handle.getter();
}

void protocol witness for GPKMemberProperty.role.getter in conformance GPKUpdateGroupRequest.Member(_BYTE *a1@<X8>)
{
  GPKUpdateGroupRequest.Member.role.getter(a1);
}

uint64_t protocol witness for GPKMemberProperty.metadata.getter in conformance GPKUpdateGroupRequest.Member()
{
  return GPKUpdateGroupRequest.Member.metadata.getter();
}

void protocol witness for GPKMemberProperty.policy.getter in conformance GPKUpdateGroupRequest.Member(_BYTE *a1@<X8>)
{
  GPKUpdateGroupRequest.Member.policy.getter(a1);
}

uint64_t *protocol witness for Decodable.init(from:) in conformance GPKUpdateGroupRequest.Member@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return GPKUpdateGroupRequest.Member.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GPKUpdateGroupRequest.Member(uint64_t a1)
{
  return GPKUpdateGroupRequest.Member.encode(to:)(a1);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance GPKUpdateGroupRequest.Member()
{
  return GPKUpdateGroupRequest.Member.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GPKUpdateGroupRequest.Member(uint64_t a1)
{
  return GPKUpdateGroupRequest.Member.hash(into:)(a1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GPKUpdateGroupRequest.Member(Swift::Int a1)
{
  return Hashable._rawHashValue(seed:)(a1);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GPKUpdateGroupRequest.Member()
{
  return static GPKUpdateGroupRequest.Member.== infix(_:_:)() & 1;
}

void static GPKUpdateGroupRequest.CodingKeys.== infix(_:_:)(char a1)
{
  __asm { BR              X8 }
}

uint64_t sub_23D2CA580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, unsigned __int8 a12)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_23D2CA608
                                                                                       + *((int *)qword_23D2CA6C0 + a12)))(a1, a2, a3, a4, a5, a6);
}

BOOL sub_23D2CA618()
{
  uint64_t v1;

  return v1 == 0;
}

void GPKUpdateGroupRequest.CodingKeys.hash(into:)(uint64_t a1, char a2)
{
  __asm { BR              X8 }
}

uint64_t sub_23D2CA734()
{
  return Hasher.combine<A>(_:)();
}

GroupKit::GPKUpdateGroupRequest::CodingKeys_optional __swiftcall GPKUpdateGroupRequest.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  char v3;
  char v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;
  char v11;
  GroupKit::GPKUpdateGroupRequest::CodingKeys_optional v12;

  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("groupID", 7uLL, 1);
  swift_bridgeObjectRetain();
  v11 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v11 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v12.value = GroupKit_GPKUpdateGroupRequest_CodingKeys_groupID;
LABEL_20:
    swift_bridgeObjectRelease();
    return v12;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("groupMetadata", 0xDuLL, 1);
  swift_bridgeObjectRetain();
  v10 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v10 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v12.value = GroupKit_GPKUpdateGroupRequest_CodingKeys_groupMetadata;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("addedMembers", 0xCuLL, 1);
  swift_bridgeObjectRetain();
  v9 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v12.value = GroupKit_GPKUpdateGroupRequest_CodingKeys_addedMembers;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("removedMembers", 0xEuLL, 1);
  swift_bridgeObjectRetain();
  v8 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v8 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v12.value = GroupKit_GPKUpdateGroupRequest_CodingKeys_removedMembers;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("updatedMembers", 0xEuLL, 1);
  swift_bridgeObjectRetain();
  v7 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v7 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v12.value = GroupKit_GPKUpdateGroupRequest_CodingKeys_updatedMembers;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("removedManagedMembers", 0x15uLL, 1);
  swift_bridgeObjectRetain();
  v6 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v6 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v12.value = GroupKit_GPKUpdateGroupRequest_CodingKeys_removedManagedMembers;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("updatedManagedMembers", 0x15uLL, 1);
  swift_bridgeObjectRetain();
  v5 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v5 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v12.value = GroupKit_GPKUpdateGroupRequest_CodingKeys_updatedManagedMembers;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("serviceName", 0xBuLL, 1);
  swift_bridgeObjectRetain();
  v4 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v4 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v12.value = GroupKit_GPKUpdateGroupRequest_CodingKeys_serviceName;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("groupDomain", 0xBuLL, 1);
  swift_bridgeObjectRetain();
  v3 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v3 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v12.value = GroupKit_GPKUpdateGroupRequest_CodingKeys_groupDomain;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (GroupKit::GPKUpdateGroupRequest::CodingKeys_optional)9;
}

GroupKit::GPKUpdateGroupRequest::CodingKeys_optional __swiftcall GPKUpdateGroupRequest.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  return (GroupKit::GPKUpdateGroupRequest::CodingKeys_optional)9;
}

uint64_t GPKUpdateGroupRequest.CodingKeys.hashValue.getter()
{
  lazy protocol witness table accessor for type GPKUpdateGroupRequest.CodingKeys and conformance GPKUpdateGroupRequest.CodingKeys();
  return _hashValue<A>(for:)();
}

unint64_t lazy protocol witness table accessor for type GPKUpdateGroupRequest.CodingKeys and conformance GPKUpdateGroupRequest.CodingKeys()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKUpdateGroupRequest.CodingKeys and conformance GPKUpdateGroupRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKUpdateGroupRequest.CodingKeys and conformance GPKUpdateGroupRequest.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKUpdateGroupRequest.CodingKeys, &type metadata for GPKUpdateGroupRequest.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKUpdateGroupRequest.CodingKeys and conformance GPKUpdateGroupRequest.CodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKUpdateGroupRequest.CodingKeys and conformance GPKUpdateGroupRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKUpdateGroupRequest.CodingKeys and conformance GPKUpdateGroupRequest.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKUpdateGroupRequest.CodingKeys, &type metadata for GPKUpdateGroupRequest.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKUpdateGroupRequest.CodingKeys and conformance GPKUpdateGroupRequest.CodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKUpdateGroupRequest.CodingKeys and conformance GPKUpdateGroupRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKUpdateGroupRequest.CodingKeys and conformance GPKUpdateGroupRequest.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKUpdateGroupRequest.CodingKeys, &type metadata for GPKUpdateGroupRequest.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKUpdateGroupRequest.CodingKeys and conformance GPKUpdateGroupRequest.CodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKUpdateGroupRequest.CodingKeys and conformance GPKUpdateGroupRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKUpdateGroupRequest.CodingKeys and conformance GPKUpdateGroupRequest.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKUpdateGroupRequest.CodingKeys, &type metadata for GPKUpdateGroupRequest.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKUpdateGroupRequest.CodingKeys and conformance GPKUpdateGroupRequest.CodingKeys);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GPKUpdateGroupRequest.CodingKeys and conformance GPKUpdateGroupRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type GPKUpdateGroupRequest.CodingKeys and conformance GPKUpdateGroupRequest.CodingKeys)
  {
    v0 = MEMORY[0x2426331CC](&protocol conformance descriptor for GPKUpdateGroupRequest.CodingKeys, &type metadata for GPKUpdateGroupRequest.CodingKeys);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GPKUpdateGroupRequest.CodingKeys and conformance GPKUpdateGroupRequest.CodingKeys);
    return v0;
  }
  return v2;
}

uint64_t GPKUpdateGroupRequest.CodingKeys.intValue.getter()
{
  return 0;
}

void GPKUpdateGroupRequest.CodingKeys.stringValue.getter(char a1)
{
  __asm { BR              X8 }
}

uint64_t sub_23D2CAEE4()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("groupID", 7uLL, 1)._countAndFlagsBits;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GPKUpdateGroupRequest.CodingKeys(char *a1)
{
  char v1;

  static GPKUpdateGroupRequest.CodingKeys.== infix(_:_:)(*a1);
  return v1 & 1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance GPKUpdateGroupRequest.CodingKeys()
{
  return GPKUpdateGroupRequest.CodingKeys.hashValue.getter();
}

void protocol witness for Hashable.hash(into:) in conformance GPKUpdateGroupRequest.CodingKeys(uint64_t a1)
{
  char *v1;

  GPKUpdateGroupRequest.CodingKeys.hash(into:)(a1, *v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GPKUpdateGroupRequest.CodingKeys(Swift::Int a1)
{
  return Hashable._rawHashValue(seed:)(a1);
}

void protocol witness for CodingKey.stringValue.getter in conformance GPKUpdateGroupRequest.CodingKeys()
{
  char *v0;

  GPKUpdateGroupRequest.CodingKeys.stringValue.getter(*v0);
}

GroupKit::GPKUpdateGroupRequest::CodingKeys_optional protocol witness for CodingKey.init(stringValue:) in conformance GPKUpdateGroupRequest.CodingKeys@<W0>(uint64_t a1@<X0>, GroupKit::GPKUpdateGroupRequest::CodingKeys_optional *a2@<X8>)
{
  GroupKit::GPKUpdateGroupRequest::CodingKeys_optional result;

  result.value = GPKUpdateGroupRequest.CodingKeys.init(stringValue:)(*(Swift::String *)&a1).value;
  a2->value = result.value;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance GPKUpdateGroupRequest.CodingKeys()
{
  return GPKUpdateGroupRequest.CodingKeys.intValue.getter();
}

GroupKit::GPKUpdateGroupRequest::CodingKeys_optional protocol witness for CodingKey.init(intValue:) in conformance GPKUpdateGroupRequest.CodingKeys@<W0>(Swift::Int a1@<X0>, GroupKit::GPKUpdateGroupRequest::CodingKeys_optional *a2@<X8>)
{
  GroupKit::GPKUpdateGroupRequest::CodingKeys_optional result;

  result.value = GPKUpdateGroupRequest.CodingKeys.init(intValue:)(a1).value;
  a2->value = result.value;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GPKUpdateGroupRequest.CodingKeys()
{
  lazy protocol witness table accessor for type GPKUpdateGroupRequest.CodingKeys and conformance GPKUpdateGroupRequest.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GPKUpdateGroupRequest.CodingKeys()
{
  lazy protocol witness table accessor for type GPKUpdateGroupRequest.CodingKeys and conformance GPKUpdateGroupRequest.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t GPKUpdateGroupRequest.groupID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of GPKGroupID(v1 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_groupID, a1);
}

uint64_t key path getter for GPKUpdateGroupRequest.groupMetadata : GPKUpdateGroupRequest@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *a1;
  v2 = swift_retain();
  *a2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 176))(v2);
  return swift_release();
}

uint64_t key path setter for GPKUpdateGroupRequest.groupMetadata : GPKUpdateGroupRequest(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;

  outlined init with copy of [String : String](a1, &v3);
  v2 = v3;
  swift_retain();
  GPKUpdateGroupRequest.groupMetadata.setter(v2);
  return swift_release();
}

uint64_t GPKUpdateGroupRequest.groupMetadata.getter()
{
  uint64_t v0;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_groupMetadata);
  swift_beginAccess();
  v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t GPKUpdateGroupRequest.groupMetadata.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  swift_bridgeObjectRetain();
  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_groupMetadata);
  swift_beginAccess();
  *v3 = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*GPKUpdateGroupRequest.groupMetadata.modify())()
{
  swift_beginAccess();
  return GPKUpdateGroupRequest.groupMetadata.modify;
}

uint64_t GPKUpdateGroupRequest.groupMetadata.modify()
{
  return swift_endAccess();
}

uint64_t key path getter for GPKUpdateGroupRequest.addedMembers : GPKUpdateGroupRequest@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *a1;
  v2 = swift_retain();
  *a2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 200))(v2);
  return swift_release();
}

uint64_t key path setter for GPKUpdateGroupRequest.addedMembers : GPKUpdateGroupRequest(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;

  outlined init with copy of [String : GPKUpdateGroupRequest.Member](a1, &v3);
  v2 = v3;
  swift_retain();
  GPKUpdateGroupRequest.addedMembers.setter(v2);
  return swift_release();
}

uint64_t GPKUpdateGroupRequest.addedMembers.getter()
{
  uint64_t v0;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_addedMembers);
  swift_beginAccess();
  v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t GPKUpdateGroupRequest.addedMembers.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  swift_bridgeObjectRetain();
  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_addedMembers);
  swift_beginAccess();
  *v3 = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*GPKUpdateGroupRequest.addedMembers.modify())()
{
  swift_beginAccess();
  return GPKUpdateGroupRequest.addedMembers.modify;
}

uint64_t GPKUpdateGroupRequest.addedMembers.modify()
{
  return swift_endAccess();
}

uint64_t key path getter for GPKUpdateGroupRequest.removedMembers : GPKUpdateGroupRequest@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *a1;
  v2 = swift_retain();
  *a2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 224))(v2);
  return swift_release();
}

uint64_t key path setter for GPKUpdateGroupRequest.removedMembers : GPKUpdateGroupRequest(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;

  outlined init with copy of [String : GPKUpdateGroupRequest.Member](a1, &v3);
  v2 = v3;
  swift_retain();
  GPKUpdateGroupRequest.removedMembers.setter(v2);
  return swift_release();
}

uint64_t GPKUpdateGroupRequest.removedMembers.getter()
{
  uint64_t v0;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_removedMembers);
  swift_beginAccess();
  v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t GPKUpdateGroupRequest.removedMembers.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  swift_bridgeObjectRetain();
  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_removedMembers);
  swift_beginAccess();
  *v3 = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*GPKUpdateGroupRequest.removedMembers.modify())()
{
  swift_beginAccess();
  return GPKUpdateGroupRequest.removedMembers.modify;
}

uint64_t GPKUpdateGroupRequest.removedMembers.modify()
{
  return swift_endAccess();
}

uint64_t key path getter for GPKUpdateGroupRequest.updatedMembers : GPKUpdateGroupRequest@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *a1;
  v2 = swift_retain();
  *a2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 248))(v2);
  return swift_release();
}

uint64_t key path setter for GPKUpdateGroupRequest.updatedMembers : GPKUpdateGroupRequest(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;

  outlined init with copy of [String : GPKUpdateGroupRequest.Member](a1, &v3);
  v2 = v3;
  swift_retain();
  GPKUpdateGroupRequest.updatedMembers.setter(v2);
  return swift_release();
}

uint64_t GPKUpdateGroupRequest.updatedMembers.getter()
{
  uint64_t v0;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_updatedMembers);
  swift_beginAccess();
  v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t GPKUpdateGroupRequest.updatedMembers.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  swift_bridgeObjectRetain();
  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_updatedMembers);
  swift_beginAccess();
  *v3 = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*GPKUpdateGroupRequest.updatedMembers.modify())()
{
  swift_beginAccess();
  return GPKUpdateGroupRequest.updatedMembers.modify;
}

uint64_t GPKUpdateGroupRequest.updatedMembers.modify()
{
  return swift_endAccess();
}

uint64_t key path getter for GPKUpdateGroupRequest.removedManagedMembers : GPKUpdateGroupRequest@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *a1;
  v2 = swift_retain();
  *a2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 272))(v2);
  return swift_release();
}

uint64_t key path setter for GPKUpdateGroupRequest.removedManagedMembers : GPKUpdateGroupRequest(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;

  outlined init with copy of [String : GPKMember](a1, &v3);
  v2 = v3;
  swift_retain();
  GPKUpdateGroupRequest.removedManagedMembers.setter(v2);
  return swift_release();
}

uint64_t GPKUpdateGroupRequest.removedManagedMembers.getter()
{
  uint64_t v0;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_removedManagedMembers);
  swift_beginAccess();
  v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t GPKUpdateGroupRequest.removedManagedMembers.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  swift_bridgeObjectRetain();
  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_removedManagedMembers);
  swift_beginAccess();
  *v3 = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*GPKUpdateGroupRequest.removedManagedMembers.modify())()
{
  swift_beginAccess();
  return GPKUpdateGroupRequest.removedManagedMembers.modify;
}

uint64_t GPKUpdateGroupRequest.removedManagedMembers.modify()
{
  return swift_endAccess();
}

uint64_t key path getter for GPKUpdateGroupRequest.updatedManagedMembers : GPKUpdateGroupRequest@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *a1;
  v2 = swift_retain();
  *a2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 296))(v2);
  return swift_release();
}

uint64_t key path setter for GPKUpdateGroupRequest.updatedManagedMembers : GPKUpdateGroupRequest(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;

  outlined init with copy of [String : GPKMember](a1, &v3);
  v2 = v3;
  swift_retain();
  GPKUpdateGroupRequest.updatedManagedMembers.setter(v2);
  return swift_release();
}

uint64_t GPKUpdateGroupRequest.updatedManagedMembers.getter()
{
  uint64_t v0;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_updatedManagedMembers);
  swift_beginAccess();
  v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t GPKUpdateGroupRequest.updatedManagedMembers.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  swift_bridgeObjectRetain();
  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_updatedManagedMembers);
  swift_beginAccess();
  *v3 = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*GPKUpdateGroupRequest.updatedManagedMembers.modify())()
{
  swift_beginAccess();
  return GPKUpdateGroupRequest.updatedManagedMembers.modify;
}

uint64_t GPKUpdateGroupRequest.updatedManagedMembers.modify()
{
  return swift_endAccess();
}

uint64_t key path getter for GPKUpdateGroupRequest.serviceName : GPKUpdateGroupRequest@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v5 = *a1;
  v2 = swift_retain();
  *a2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 320))(v2);
  a2[1] = v3;
  return swift_release();
}

uint64_t key path setter for GPKUpdateGroupRequest.serviceName : GPKUpdateGroupRequest(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[2];

  outlined init with copy of String?(a1, v7);
  v4 = v7[0];
  v6 = v7[1];
  v5 = *a2;
  swift_retain();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v5 + 328))(v4, v6);
  return swift_release();
}

uint64_t GPKUpdateGroupRequest.serviceName.getter()
{
  uint64_t v0;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_serviceName);
  swift_beginAccess();
  v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t GPKUpdateGroupRequest.serviceName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  swift_bridgeObjectRetain();
  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_serviceName);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*GPKUpdateGroupRequest.serviceName.modify())()
{
  swift_beginAccess();
  return GPKUpdateGroupRequest.serviceName.modify;
}

uint64_t GPKUpdateGroupRequest.serviceName.modify()
{
  return swift_endAccess();
}

uint64_t key path getter for GPKUpdateGroupRequest.groupDomain : GPKUpdateGroupRequest@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v5 = *a1;
  v2 = swift_retain();
  *a2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 344))(v2);
  a2[1] = v3;
  return swift_release();
}

uint64_t key path setter for GPKUpdateGroupRequest.groupDomain : GPKUpdateGroupRequest(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[2];

  outlined init with copy of String?(a1, v7);
  v4 = v7[0];
  v6 = v7[1];
  v5 = *a2;
  swift_retain();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v5 + 352))(v4, v6);
  return swift_release();
}

uint64_t GPKUpdateGroupRequest.groupDomain.getter()
{
  uint64_t v0;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_groupDomain);
  swift_beginAccess();
  v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t GPKUpdateGroupRequest.groupDomain.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  swift_bridgeObjectRetain();
  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_groupDomain);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*GPKUpdateGroupRequest.groupDomain.modify())()
{
  swift_beginAccess();
  return GPKUpdateGroupRequest.groupDomain.modify;
}

uint64_t GPKUpdateGroupRequest.groupDomain.modify()
{
  return swift_endAccess();
}

uint64_t GPKUpdateGroupRequest.__allocating_init(group:)(uint64_t a1)
{
  swift_allocObject();
  return GPKUpdateGroupRequest.init(group:)(a1);
}

uint64_t GPKUpdateGroupRequest.init(group:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
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
  _QWORD *v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  ValueMetadata *v28;
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
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[2];
  uint64_t v50;
  uint64_t v51;

  v38 = a1;
  v2 = v1;
  v39 = v2;
  v51 = 0;
  v50 = 0;
  v40 = 0;
  v32 = 0;
  v4 = type metadata accessor for GPKGroupID();
  v24 = (*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v4);
  v37 = (uint64_t)&v17 - v24;
  v51 = a1;
  v50 = v5;
  v25 = OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_addedMembers;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, GPKUpdateGroupRequest.Member));
  _allocateUninitializedArray<A>(_:)();
  v35 = MEMORY[0x24BEE0D00];
  v28 = &type metadata for GPKUpdateGroupRequest.Member;
  v34 = MEMORY[0x24BEE0D10];
  *(_QWORD *)(v39 + v25) = Dictionary.init(dictionaryLiteral:)();
  v26 = OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_removedMembers;
  _allocateUninitializedArray<A>(_:)();
  *(_QWORD *)(v39 + v26) = Dictionary.init(dictionaryLiteral:)();
  v29 = OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_updatedMembers;
  _allocateUninitializedArray<A>(_:)();
  *(_QWORD *)(v39 + v29) = Dictionary.init(dictionaryLiteral:)();
  v31 = OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_removedManagedMembers;
  v42 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, GPKMember));
  v30 = _allocateUninitializedArray<A>(_:)();
  v33 = type metadata accessor for GPKMember();
  *(_QWORD *)(v39 + v31) = Dictionary.init(dictionaryLiteral:)();
  v36 = OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_updatedManagedMembers;
  _allocateUninitializedArray<A>(_:)();
  v6 = Dictionary.init(dictionaryLiteral:)();
  v7 = v39;
  *(_QWORD *)(v39 + v36) = v6;
  v8 = (_QWORD *)(v7 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_serviceName);
  *v8 = 0;
  v8[1] = 0;
  v9 = (_QWORD *)(v7 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_groupDomain);
  *v9 = 0;
  v9[1] = 0;
  swift_retain();
  *(_QWORD *)(v39 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_group) = a1;
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 312))(a1);
  v10 = v38;
  v11 = outlined init with take of GPKGroupID(v37, v39 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_groupID);
  v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v10 + 608))(v11);
  v13 = v38;
  *(_QWORD *)(v39 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_groupMetadata) = v12;
  v49[1] = (*(uint64_t (**)(void))(*(_QWORD *)v13 + 336))();
  v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GPKMember]);
  v44 = lazy protocol witness table accessor for type [GPKMember] and conformance [A]();
  v14 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))closure #1 in GPKUpdateGroupRequest.init(group:), v40, v41, v42, MEMORY[0x24BEE4078], v44, MEMORY[0x24BEE40A8], v43);
  v45 = 0;
  v46 = v14;
  v15 = v38;
  v19 = v14;
  outlined destroy of [GPKMember]();
  v21 = v49;
  v49[0] = v19;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(String, GPKMember)]);
  v22 = lazy protocol witness table accessor for type [(String, GPKMember)] and conformance [A]();
  *(_QWORD *)(v39 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_existingMemberByHandle) = Dictionary.init<A>(uniqueKeysWithValues:)();
  v48 = (*(uint64_t (**)(void))(*(_QWORD *)v15 + 712))();
  v23 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))closure #2 in GPKUpdateGroupRequest.init(group:), 0, v41, v42, MEMORY[0x24BEE4078], v44, MEMORY[0x24BEE40A8], v43);
  v18 = v23;
  outlined destroy of [GPKMember]();
  v47 = v18;
  *(_QWORD *)(v39 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_existingManagedMemberByHandle) = Dictionary.init<A>(uniqueKeysWithValues:)();
  swift_release();
  return v39;
}

uint64_t closure #1 in GPKUpdateGroupRequest.init(group:)@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v4 = *a1;
  *a2 = (*(uint64_t (**)(void))(*(_QWORD *)*a1 + 160))();
  a2[1] = v2;
  result = swift_retain();
  a2[2] = v4;
  return result;
}

uint64_t closure #2 in GPKUpdateGroupRequest.init(group:)@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v4 = *a1;
  *a2 = (*(uint64_t (**)(void))(*(_QWORD *)*a1 + 160))();
  a2[1] = v2;
  result = swift_retain();
  a2[2] = v4;
  return result;
}

uint64_t GPKUpdateGroupRequest.__allocating_init(group:diffingMembers:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::String v6;
  Swift::String v7;
  void *v8;
  Swift::String v9;
  char v10;
  uint64_t v11;
  Swift::String v12;
  Swift::String v13;
  Swift::String v14;
  void *v15;
  Swift::String v16;
  uint64_t v17;
  Swift::String v18;
  Swift::String v19;
  void *v20;
  Swift::String v21;
  uint64_t v22;
  Swift::String v23;
  Swift::String v24;
  void *v25;
  Swift::String v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  void *v33;
  Swift::String v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  os_log_type_t v43;
  Swift::String v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  os_log_type_t v49;
  Swift::String v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  os_log_type_t v55;
  Swift::String v56;
  void *v57;
  uint64_t v58;
  char v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  os_log_type_t v68;
  Swift::String v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  os_log_type_t v75;
  Swift::String fileID;
  void *_;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  uint64_t v88;
  char v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  _QWORD v100[2];
  char v101;
  uint64_t v102;
  char v103;
  uint64_t v104;
  unint64_t v105;
  char v106;
  char v107;
  _BYTE v108[2];
  char v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char v116;
  _BYTE v117[2];
  char v118;
  char v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char v124;
  char v125;
  char v126;
  _BYTE v127[2];
  char v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  char v135;
  _BYTE v136[2];
  char v137;
  char v138;
  char v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  _QWORD v145[2];
  char v146;
  uint64_t v147;
  char v148;
  uint64_t v149;
  unint64_t v150;
  char v151;
  char v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  _QWORD v157[7];
  _QWORD v158[5];
  uint64_t v159;
  uint64_t v160;
  char v161;
  uint64_t v162;
  char v163;
  uint64_t v164;
  unint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  unint64_t v175;
  _QWORD v176[7];
  uint64_t v177;
  uint64_t v178;
  _QWORD v179[3];
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  _BYTE __dst[40];
  uint64_t v189;
  uint64_t v190;
  _BYTE __b[40];
  _BYTE v192[24];
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  _BYTE v206[40];
  _BYTE v207[40];

  v202 = 0;
  v199 = 0;
  v195 = 0;
  v196 = 0;
  memset(__b, 0, sizeof(__b));
  memset(__dst, 0, sizeof(__dst));
  v184 = 0;
  v185 = 0;
  v182 = 0;
  v183 = 0;
  v177 = 0;
  v178 = 0;
  memset(v176, 0, sizeof(v176));
  memset(v157, 0, sizeof(v157));
  v144 = 0;
  v204 = a1;
  v203 = a2;
  swift_retain();
  v95 = (*(uint64_t (**)(uint64_t))(v2 + 368))(a1);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v205 = v95;
  v201 = (*(uint64_t (**)(void))(*(_QWORD *)a1 + 336))();
  v96 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GPKMember]);
  v98 = lazy protocol witness table accessor for type [GPKMember] and conformance [A]();
  v99 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))closure #1 in GPKUpdateGroupRequest.init(group:diffingMembers:), 0, v96, MEMORY[0x24BEE0D00], MEMORY[0x24BEE4078], v98, MEMORY[0x24BEE40A8], v97);
  outlined destroy of [GPKMember]();
  v200 = v99;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
  lazy protocol witness table accessor for type [String] and conformance [A]();
  v202 = Set.init<A>(_:)();
  v198 = (*(uint64_t (**)(void))(*(_QWORD *)a1 + 712))();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, GPKMember));
  v92 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))closure #2 in GPKUpdateGroupRequest.init(group:diffingMembers:), 0, v96, v3, MEMORY[0x24BEE4078], v98, MEMORY[0x24BEE40A8], v97);
  outlined destroy of [GPKMember]();
  v197 = v92;
  type metadata accessor for GPKMember();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(String, GPKMember)]);
  lazy protocol witness table accessor for type [(String, GPKMember)] and conformance [A]();
  v199 = Dictionary.init<A>(uniqueKeysWithValues:)();
  swift_bridgeObjectRetain();
  v194 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GPKMemberProperty]);
  lazy protocol witness table accessor for type [GPKMemberProperty] and conformance [A]();
  Collection<>.makeIterator()();
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<[GPKMemberProperty]>);
    IndexingIterator.next()();
    if (!v193)
      break;
    outlined init with take of GPKMemberProperty(v192, v179);
    v82 = v180;
    v81 = v181;
    __swift_project_boxed_opaque_existential_1(v179, v180);
    v83 = (*(uint64_t (**)(uint64_t))(v81 + 8))(v82);
    v84 = v4;
    v177 = v83;
    v178 = v4;
    swift_retain();
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)v95 + 392))(&v169, v83, v84);
    swift_release();
    v85 = v169;
    v86 = v170;
    v87 = v171;
    v88 = v172;
    v89 = v173;
    v90 = v174;
    v91 = v175;
    if (v170)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      outlined copy of GPKUserID?(v90, v91);
      v176[0] = v85;
      v176[1] = v86;
      LOBYTE(v176[2]) = v87 & 1;
      v176[3] = v88;
      LOBYTE(v176[4]) = v89 & 1;
      v176[5] = v90;
      v176[6] = v91;
      v122 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
      v123 = v5;
      v6 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Member already part of group ", 0x1DuLL, 1);
      DefaultStringInterpolation.appendLiteral(_:)(v6);
      swift_bridgeObjectRelease();
      v120 = v83;
      v121 = v84;
      DefaultStringInterpolation.appendInterpolation<A>(_:)();
      v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
      DefaultStringInterpolation.appendLiteral(_:)(v7);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      outlined destroy of DefaultStringInterpolation();
      v74 = String.init(stringInterpolation:)();
      _ = v8;
      fileID = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GroupKit/GPKUpdateGroupRequest.swift", 0x24uLL, 1);
      v75 = default argument 1 of gpklog(_:type:fileID:line:subsystem:)();
      default argument 4 of gpklog(_:type:fileID:line:subsystem:)(&v119);
      v9._countAndFlagsBits = v74;
      v9._object = _;
      v118 = v119 & 1;
      gpklog(_:type:fileID:line:subsystem:)(v9, v75, fileID, 188, (GroupKit::LogSubsystem)&v118);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v117[1] = v87 & 1;
      v79 = v180;
      v78 = v181;
      __swift_project_boxed_opaque_existential_1(v179, v180);
      (*(void (**)(_BYTE *__return_ptr, uint64_t))(v78 + 16))(v117, v79);
      v116 = v117[0] & 1;
      lazy protocol witness table accessor for type GPKMemberRole and conformance GPKMemberRole();
      v10 = dispatch thunk of static Equatable.== infix(_:_:)();
      if ((v10 & 1) != 0)
      {
        outlined consume of GPKUserID?(v90, v91);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        v112 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
        v113 = v11;
        v12 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Member role updated: ", 0x15uLL, 1);
        DefaultStringInterpolation.appendLiteral(_:)(v12);
        swift_bridgeObjectRelease();
        v110 = v83;
        v111 = v84;
        DefaultStringInterpolation.appendInterpolation<A>(_:)();
        v13 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(", ", 2uLL, 1);
        DefaultStringInterpolation.appendLiteral(_:)(v13);
        swift_bridgeObjectRelease();
        v66 = v180;
        v65 = v181;
        __swift_project_boxed_opaque_existential_1(v179, v180);
        (*(void (**)(char *__return_ptr, uint64_t))(v65 + 16))(&v109, v66);
        v108[1] = v109 & 1;
        lazy protocol witness table accessor for type GPKMemberRole and conformance GPKMemberRole();
        DefaultStringInterpolation.appendInterpolation<A>(_:)();
        v14 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
        DefaultStringInterpolation.appendLiteral(_:)(v14);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        outlined destroy of DefaultStringInterpolation();
        v67 = String.init(stringInterpolation:)();
        v70 = v15;
        v69 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GroupKit/GPKUpdateGroupRequest.swift", 0x24uLL, 1);
        v68 = default argument 1 of gpklog(_:type:fileID:line:subsystem:)();
        default argument 4 of gpklog(_:type:fileID:line:subsystem:)(v108);
        v16._countAndFlagsBits = v67;
        v16._object = v70;
        v107 = v108[0] & 1;
        gpklog(_:type:fileID:line:subsystem:)(v16, v68, v69, 190, (GroupKit::LogSubsystem)&v107);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v72 = v180;
        v71 = v181;
        __swift_project_boxed_opaque_existential_1(v179, v180);
        (*(void (**)(char *__return_ptr, uint64_t))(v71 + 16))(&v106, v72);
        v73 = v106;
        LOBYTE(v176[2]) = v106 & 1;
        swift_retain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        outlined copy of GPKUserID?(v90, v91);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        outlined copy of GPKUserID?(v90, v91);
        outlined consume of GPKUserID?(v90, v91);
        outlined consume of GPKUserID?(v90, v91);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v100[0] = v85;
        v100[1] = v86;
        v101 = v73 & 1;
        v102 = v88;
        v103 = v89 & 1;
        v104 = v90;
        v105 = v91;
        (*(void (**)(void))(*(_QWORD *)v95 + 448))();
        outlined destroy of GPKUpdateGroupRequest.Member((uint64_t)v100);
        swift_release();
      }
      v114 = v83;
      v115 = v84;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Set<String>);
      Set.remove(_:)();
      swift_bridgeObjectRelease();
      outlined destroy of GPKUpdateGroupRequest.Member((uint64_t)v176);
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v179);
    }
    else
    {
      swift_bridgeObjectRetain();
      v166 = v83;
      v167 = v84;
      MEMORY[0x24263250C](&v168);
      outlined destroy of String();
      v80 = v168;
      if (v168)
      {
        v144 = v168;
        v142 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
        v143 = v22;
        v23 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Member already part of managed member list ", 0x2BuLL, 1);
        DefaultStringInterpolation.appendLiteral(_:)(v23);
        swift_bridgeObjectRelease();
        v140 = v83;
        v141 = v84;
        DefaultStringInterpolation.appendInterpolation<A>(_:)();
        v24 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
        DefaultStringInterpolation.appendLiteral(_:)(v24);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        outlined destroy of DefaultStringInterpolation();
        v48 = String.init(stringInterpolation:)();
        v51 = v25;
        v50 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GroupKit/GPKUpdateGroupRequest.swift", 0x24uLL, 1);
        v49 = default argument 1 of gpklog(_:type:fileID:line:subsystem:)();
        default argument 4 of gpklog(_:type:fileID:line:subsystem:)(&v139);
        v26._countAndFlagsBits = v48;
        v26._object = v51;
        v138 = v139 & 1;
        gpklog(_:type:fileID:line:subsystem:)(v26, v49, v50, 202, (GroupKit::LogSubsystem)&v138);
        swift_bridgeObjectRelease();
        v27 = swift_bridgeObjectRelease();
        (*(void (**)(char *__return_ptr, uint64_t))(*(_QWORD *)v80 + 184))(&v137, v27);
        v136[1] = v137 & 1;
        v53 = v180;
        v52 = v181;
        __swift_project_boxed_opaque_existential_1(v179, v180);
        (*(void (**)(_BYTE *__return_ptr, uint64_t))(v52 + 16))(v136, v53);
        v135 = v136[0] & 1;
        lazy protocol witness table accessor for type GPKMemberRole and conformance GPKMemberRole();
        v28 = dispatch thunk of static Equatable.== infix(_:_:)();
        if ((v28 & 1) == 0)
        {
          v131 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
          v132 = v29;
          v30 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Managed member role updated: ", 0x1DuLL, 1);
          DefaultStringInterpolation.appendLiteral(_:)(v30);
          swift_bridgeObjectRelease();
          v129 = v83;
          v130 = v84;
          DefaultStringInterpolation.appendInterpolation<A>(_:)();
          v31 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(", ", 2uLL, 1);
          DefaultStringInterpolation.appendLiteral(_:)(v31);
          swift_bridgeObjectRelease();
          v41 = v180;
          v40 = v181;
          __swift_project_boxed_opaque_existential_1(v179, v180);
          (*(void (**)(char *__return_ptr, uint64_t))(v40 + 16))(&v128, v41);
          v127[1] = v128 & 1;
          lazy protocol witness table accessor for type GPKMemberRole and conformance GPKMemberRole();
          DefaultStringInterpolation.appendInterpolation<A>(_:)();
          v32 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
          DefaultStringInterpolation.appendLiteral(_:)(v32);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          outlined destroy of DefaultStringInterpolation();
          v42 = String.init(stringInterpolation:)();
          v45 = v33;
          v44 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GroupKit/GPKUpdateGroupRequest.swift", 0x24uLL, 1);
          v43 = default argument 1 of gpklog(_:type:fileID:line:subsystem:)();
          default argument 4 of gpklog(_:type:fileID:line:subsystem:)(v127);
          v34._countAndFlagsBits = v42;
          v34._object = v45;
          v126 = v127[0] & 1;
          gpklog(_:type:fileID:line:subsystem:)(v34, v43, v44, 204, (GroupKit::LogSubsystem)&v126);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v47 = v180;
          v46 = v181;
          __swift_project_boxed_opaque_existential_1(v179, v180);
          (*(void (**)(char *__return_ptr, uint64_t))(v46 + 16))(&v125, v47);
          v124 = v125 & 1;
          (*(void (**)(char *))(*(_QWORD *)v80 + 192))(&v124);
          swift_retain();
          (*(void (**)(uint64_t))(*(_QWORD *)v95 + 464))(v80);
          swift_release();
        }
        v133 = v83;
        v134 = v84;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : GPKMember]);
        Dictionary.removeValue(forKey:)();
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v179);
      }
      else
      {
        outlined init with copy of GPKMemberProperty((uint64_t)v179, (uint64_t)v158);
        GPKUpdateGroupRequest.Member.init(member:)(v158, (uint64_t)&v159);
        v58 = v159;
        v61 = v160;
        v59 = v161;
        v62 = v162;
        v60 = v163;
        v63 = v164;
        v64 = v165;
        v157[0] = v159;
        v157[1] = v160;
        LOBYTE(v157[2]) = v161 & 1;
        v157[3] = v162;
        LOBYTE(v157[4]) = v163 & 1;
        v157[5] = v164;
        v157[6] = v165;
        v155 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
        v156 = v17;
        v18 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Adding new member to the group ", 0x1FuLL, 1);
        DefaultStringInterpolation.appendLiteral(_:)(v18);
        swift_bridgeObjectRelease();
        v153 = v83;
        v154 = v84;
        DefaultStringInterpolation.appendInterpolation<A>(_:)();
        v19 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
        DefaultStringInterpolation.appendLiteral(_:)(v19);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        outlined destroy of DefaultStringInterpolation();
        v54 = String.init(stringInterpolation:)();
        v57 = v20;
        v56 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GroupKit/GPKUpdateGroupRequest.swift", 0x24uLL, 1);
        v55 = default argument 1 of gpklog(_:type:fileID:line:subsystem:)();
        default argument 4 of gpklog(_:type:fileID:line:subsystem:)(&v152);
        v21._countAndFlagsBits = v54;
        v21._object = v57;
        v151 = v152 & 1;
        gpklog(_:type:fileID:line:subsystem:)(v21, v55, v56, 214, (GroupKit::LogSubsystem)&v151);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_retain();
        v145[0] = v58;
        v145[1] = v61;
        v146 = v59 & 1;
        v147 = v62;
        v148 = v60 & 1;
        v149 = v63;
        v150 = v64;
        (*(void (**)(_QWORD *))(*(_QWORD *)v95 + 408))(v145);
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        outlined consume of GPKUserID?(v63, v64);
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v179);
      }
    }
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  outlined destroy of IndexingIterator<[GPKMemberProperty]>();
  swift_bridgeObjectRetain();
  Set.makeIterator()();
  memcpy(__b, v206, sizeof(__b));
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Set<String>.Iterator);
    Set.Iterator.next()();
    v38 = v189;
    v39 = v190;
    if (!v190)
      break;
    v182 = v189;
    v183 = v190;
    swift_retain();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v95 + 424))(v38, v39);
    swift_release();
    swift_bridgeObjectRelease();
  }
  swift_release();
  outlined destroy of Set<String>.Iterator();
  swift_bridgeObjectRetain();
  Dictionary.makeIterator()();
  memcpy(__dst, v207, sizeof(__dst));
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : GPKMember].Iterator);
    Dictionary.Iterator.next()();
    v36 = v186;
    v37 = v187;
    if (!v187)
      break;
    v184 = v186;
    v185 = v187;
    swift_retain();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v95 + 440))(v36, v37);
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
  }
  swift_release();
  outlined destroy of [String : GPKMember].Iterator();
  outlined destroy of [String : GPKMember]();
  outlined destroy of Set<String>();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v95;
}

uint64_t closure #1 in GPKUpdateGroupRequest.init(group:diffingMembers:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 160))();
  *a2 = result;
  a2[1] = v3;
  return result;
}

uint64_t closure #2 in GPKUpdateGroupRequest.init(group:diffingMembers:)@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v4 = *a1;
  *a2 = (*(uint64_t (**)(void))(*(_QWORD *)*a1 + 160))();
  a2[1] = v2;
  result = swift_retain();
  a2[2] = v4;
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of Set<String>.Iterator()
{
  outlined consume of Set<String>.Iterator._Variant();
}

uint64_t outlined consume of Set<String>.Iterator._Variant()
{
  return swift_release();
}

uint64_t GPKUpdateGroupRequest.__allocating_init(from:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  swift_allocObject();
  v5 = GPKUpdateGroupRequest.init(from:)(a1);
  if (v3)
    return v2;
  else
    return v5;
}

uint64_t GPKUpdateGroupRequest.init(from:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  Swift::String *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD v36[5];
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
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  _BYTE *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  _BYTE *v64;
  char *v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  _BYTE *v77;
  char *v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  uint64_t v84;
  _BYTE *v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD *v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  unint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  ValueMetadata *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  _QWORD *v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  _BYTE v134[32];
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  char v138;
  uint64_t v139;
  uint64_t v140;
  _BYTE v141[32];
  uint64_t v142;
  char v143;
  char v144;
  uint64_t v145;
  _BYTE v146[32];
  uint64_t v147;
  _BYTE v148[32];
  uint64_t v149;
  char v150;
  char v151;
  uint64_t v152;
  char v153;
  uint64_t v154;
  char v155;
  uint64_t v156;
  uint64_t v157;
  __int16 v158;
  char *v159;

  v127 = (_QWORD *)a1;
  v159 = 0;
  v157 = 0;
  v156 = 0;
  v122 = 0;
  v106 = type metadata accessor for GPKGroupID();
  v107 = (*(_QWORD *)(*(_QWORD *)(v106 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v106);
  v108 = (uint64_t)v36 - v107;
  v109 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]((char *)v36 - v107);
  v110 = (uint64_t)v36 - v109;
  v111 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GPKUpdateGroupRequest.CodingKeys>);
  v112 = *(_QWORD *)(v111 - 8);
  v113 = (*(_QWORD *)(v112 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3 = MEMORY[0x24BDAC7A8](v127);
  v128 = (char *)v36 - v113;
  v159 = (char *)v36 - v113;
  v157 = v3;
  v156 = v1;
  v158 = 0;
  v114 = OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_addedMembers;
  v116 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, GPKUpdateGroupRequest.Member));
  _allocateUninitializedArray<A>(_:)();
  v125 = MEMORY[0x24BEE0D00];
  v117 = &type metadata for GPKUpdateGroupRequest.Member;
  v124 = MEMORY[0x24BEE0D10];
  v4 = Dictionary.init(dictionaryLiteral:)();
  v158 = 4;
  *(_QWORD *)(v1 + v114) = v4;
  v115 = OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_removedMembers;
  _allocateUninitializedArray<A>(_:)();
  v5 = Dictionary.init(dictionaryLiteral:)();
  v158 = 12;
  *(_QWORD *)(v1 + v115) = v5;
  v118 = OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_updatedMembers;
  _allocateUninitializedArray<A>(_:)();
  v6 = Dictionary.init(dictionaryLiteral:)();
  v158 = 28;
  *(_QWORD *)(v1 + v118) = v6;
  v120 = OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_removedManagedMembers;
  v121 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, GPKMember));
  v119 = _allocateUninitializedArray<A>(_:)();
  v123 = type metadata accessor for GPKMember();
  v7 = Dictionary.init(dictionaryLiteral:)();
  v158 = 60;
  *(_QWORD *)(v1 + v120) = v7;
  v126 = OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_updatedManagedMembers;
  _allocateUninitializedArray<A>(_:)();
  v8 = Dictionary.init(dictionaryLiteral:)();
  v9 = v127;
  *(_QWORD *)(v1 + v126) = v8;
  v10 = (_QWORD *)(v1 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_serviceName);
  *v10 = 0;
  v10[1] = 0;
  v158 = 508;
  v11 = (_QWORD *)(v1 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_groupDomain);
  *v11 = 0;
  v11[1] = 0;
  v130 = v9[3];
  v131 = v9[4];
  __swift_project_boxed_opaque_existential_1(v9, v130);
  lazy protocol witness table accessor for type GPKUpdateGroupRequest.CodingKeys and conformance GPKUpdateGroupRequest.CodingKeys();
  v12 = v129;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  v132 = v12;
  v133 = v12;
  if (v12)
  {
    v46 = v133;
  }
  else
  {
    v102 = &v155;
    v155 = 0;
    lazy protocol witness table accessor for type GPKGroupID and conformance GPKGroupID();
    v13 = v132;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    v103 = v13;
    v104 = v13;
    if (v13)
    {
      v45 = v104;
      (*(void (**)(char *, uint64_t))(v112 + 8))(v128, v111);
      v46 = v45;
    }
    else
    {
      v158 = 509;
      outlined init with take of GPKGroupID(v110, v105 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_groupID);
      v99 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : String]);
      v98 = &v153;
      v153 = 1;
      lazy protocol witness table accessor for type [String : String] and conformance <> [A : B]();
      v14 = v103;
      KeyedDecodingContainer.decode<A>(_:forKey:)();
      v100 = v14;
      v101 = v14;
      if (v14)
      {
        v44 = v101;
        (*(void (**)(char *, uint64_t))(v112 + 8))(v128, v111);
        v46 = v44;
      }
      else
      {
        v158 = 511;
        *(_QWORD *)(v105 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_groupMetadata) = v154;
        v94 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : GPKUpdateGroupRequest.Member]);
        v93 = &v151;
        v151 = 2;
        v15 = lazy protocol witness table accessor for type [String : GPKUpdateGroupRequest.Member] and conformance <> [A : B]();
        v16 = v100;
        v95 = v15;
        KeyedDecodingContainer.decode<A>(_:forKey:)();
        v96 = v16;
        v97 = v16;
        if (v16)
        {
          v43 = v97;
          (*(void (**)(char *, uint64_t))(v112 + 8))(v128, v111);
          v46 = v43;
        }
        else
        {
          v89 = v152;
          v88 = (_QWORD *)(v105 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_addedMembers);
          v90 = &v150;
          swift_beginAccess();
          *v88 = v89;
          swift_bridgeObjectRelease();
          swift_endAccess();
          v17 = v96;
          v148[31] = 3;
          KeyedDecodingContainer.decode<A>(_:forKey:)();
          v91 = v17;
          v92 = v17;
          if (v17)
          {
            v42 = v92;
            (*(void (**)(char *, uint64_t))(v112 + 8))(v128, v111);
            v46 = v42;
          }
          else
          {
            v84 = v149;
            v83 = (_QWORD *)(v105 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_removedMembers);
            v85 = v148;
            swift_beginAccess();
            *v83 = v84;
            swift_bridgeObjectRelease();
            swift_endAccess();
            v18 = v91;
            v146[31] = 4;
            KeyedDecodingContainer.decode<A>(_:forKey:)();
            v86 = v18;
            v87 = v18;
            if (v18)
            {
              v41 = v87;
              (*(void (**)(char *, uint64_t))(v112 + 8))(v128, v111);
              v46 = v41;
            }
            else
            {
              v76 = v147;
              v75 = (_QWORD *)(v105 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_updatedMembers);
              v77 = v146;
              swift_beginAccess();
              *v75 = v76;
              swift_bridgeObjectRelease();
              swift_endAccess();
              v79 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : GPKMember]);
              v78 = &v144;
              v144 = 5;
              v19 = lazy protocol witness table accessor for type [String : GPKMember] and conformance <> [A : B]();
              v20 = v86;
              v80 = v19;
              KeyedDecodingContainer.decode<A>(_:forKey:)();
              v81 = v20;
              v82 = v20;
              if (v20)
              {
                v40 = v82;
                (*(void (**)(char *, uint64_t))(v112 + 8))(v128, v111);
                v46 = v40;
              }
              else
              {
                v71 = v145;
                v70 = (_QWORD *)(v105 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_removedManagedMembers);
                v72 = &v143;
                swift_beginAccess();
                *v70 = v71;
                swift_bridgeObjectRelease();
                swift_endAccess();
                v21 = v81;
                v141[31] = 6;
                KeyedDecodingContainer.decode<A>(_:forKey:)();
                v73 = v21;
                v74 = v21;
                if (v21)
                {
                  v39 = v74;
                  (*(void (**)(char *, uint64_t))(v112 + 8))(v128, v111);
                  v46 = v39;
                }
                else
                {
                  v63 = v142;
                  v62 = (_QWORD *)(v105 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_updatedManagedMembers);
                  v64 = v141;
                  swift_beginAccess();
                  *v62 = v63;
                  swift_bridgeObjectRelease();
                  swift_endAccess();
                  v66 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
                  v65 = &v138;
                  v138 = 7;
                  v22 = lazy protocol witness table accessor for type String? and conformance <A> A?();
                  v23 = v73;
                  v67 = v22;
                  KeyedDecodingContainer.decode<A>(_:forKey:)();
                  v68 = v23;
                  v69 = v23;
                  if (v23)
                  {
                    v38 = v69;
                    (*(void (**)(char *, uint64_t))(v112 + 8))(v128, v111);
                    v46 = v38;
                  }
                  else
                  {
                    v56 = v139;
                    v58 = v140;
                    v57 = (_QWORD *)(v105 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_serviceName);
                    v59 = &v137;
                    swift_beginAccess();
                    v24 = v57;
                    v25 = v58;
                    *v57 = v56;
                    v24[1] = v25;
                    swift_bridgeObjectRelease();
                    swift_endAccess();
                    v26 = v68;
                    v134[31] = 8;
                    KeyedDecodingContainer.decode<A>(_:forKey:)();
                    v60 = v26;
                    v61 = v26;
                    if (!v26)
                    {
                      v47 = v135;
                      v49 = v136;
                      v48 = (_QWORD *)(v105 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_groupDomain);
                      v50 = v134;
                      swift_beginAccess();
                      v27 = v48;
                      v28 = v49;
                      *v48 = v47;
                      v27[1] = v28;
                      swift_bridgeObjectRelease();
                      swift_endAccess();
                      v51 = 0;
                      type metadata accessor for GPKGroup();
                      v29 = _allocateUninitializedArray<A>(_:)();
                      v30 = GPKGroup.__allocating_init(members:)(v29);
                      v54 = &unk_256C57000;
                      v158 = 1023;
                      *(_QWORD *)(v105 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_group) = v30;
                      _allocateUninitializedArray<A>(_:)();
                      v53 = MEMORY[0x24BEE0D00];
                      v52 = MEMORY[0x24BEE0D10];
                      v31 = Dictionary.init(dictionaryLiteral:)();
                      v158 = 2047;
                      *(_QWORD *)(v105 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_existingMemberByHandle) = v31;
                      _allocateUninitializedArray<A>(_:)();
                      v32 = Dictionary.init(dictionaryLiteral:)();
                      v33 = v54;
                      v34 = v105;
                      v158 = 4095;
                      *(_QWORD *)(v105 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_existingManagedMemberByHandle) = v32;
                      v55 = *(_QWORD *)(v34 + v33[98]);
                      swift_retain();
                      outlined init with copy of GPKGroupID(v105 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_groupID, v108);
                      GPKGroup.setGroupID(_:)(v108);
                      outlined destroy of GPKGroupID(v108);
                      swift_release();
                      (*(void (**)(char *, uint64_t))(v112 + 8))(v128, v111);
                      __swift_destroy_boxed_opaque_existential_1((uint64_t)v127);
                      return v105;
                    }
                    v37 = v61;
                    (*(void (**)(char *, uint64_t))(v112 + 8))(v128, v111);
                    v46 = v37;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v36[4] = v46;
  if ((v158 & 0xFFF) == 0xFFF)
  {
    swift_release();
  }
  else
  {
    if ((v158 & 1) != 0)
      outlined destroy of GPKGroupID(v105 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_groupID);
    v36[3] = v105;
    v36[2] = v105;
    if ((v158 & 2) != 0)
      outlined destroy of [String : String]();
    outlined destroy of [String : GPKUpdateGroupRequest.Member]();
    outlined destroy of [String : GPKUpdateGroupRequest.Member]();
    outlined destroy of [String : GPKUpdateGroupRequest.Member]();
    outlined destroy of [String : GPKMember]();
    outlined destroy of [String : GPKMember]();
    outlined destroy of String?();
    outlined destroy of String?();
    type metadata accessor for GPKUpdateGroupRequest();
    swift_deallocPartialClassInstance();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v127);
  return v36[1];
}

uint64_t type metadata accessor for GPKUpdateGroupRequest()
{
  uint64_t v1;

  v1 = type metadata singleton initialization cache for GPKUpdateGroupRequest;
  if (!type metadata singleton initialization cache for GPKUpdateGroupRequest)
    return swift_getSingletonMetadata();
  return v1;
}

uint64_t GPKUpdateGroupRequest.encode(to:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t result;
  _QWORD v36[3];
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
  char *v47;
  uint64_t v48;
  _QWORD *v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t *v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t *v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  uint64_t v93;
  uint64_t v94;
  char v95;
  _QWORD v96[2];
  char v97;
  uint64_t v98;
  char v99;
  uint64_t v100;
  char v101;
  uint64_t v102;
  char v103;
  uint64_t v104;
  char v105;
  uint64_t v106;
  char v107;
  char v108[8];
  char v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;

  v77 = (uint64_t *)v108;
  v78 = a1;
  v112 = 0;
  v111 = 0;
  v110 = 0;
  v87 = type metadata accessor for GPKGroupID();
  v76 = (*(_QWORD *)(*(_QWORD *)(v87 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v87);
  v89 = (uint64_t)v36 - v76;
  v86 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GPKUpdateGroupRequest.CodingKeys>);
  v79 = *(_QWORD *)(v86 - 8);
  v80 = (*(_QWORD *)(v79 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = (_QWORD *)MEMORY[0x24BDAC7A8](v78);
  v83 = (char *)v36 - v80;
  v3[4] = (char *)v36 - v80;
  v3[3] = v2;
  v3[2] = v1;
  v81 = v2[3];
  v82 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v81);
  lazy protocol witness table accessor for type GPKUpdateGroupRequest.CodingKeys and conformance GPKUpdateGroupRequest.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  outlined init with copy of GPKGroupID(v84 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_groupID, v89);
  v85 = &v109;
  v109 = 0;
  lazy protocol witness table accessor for type GPKGroupID and conformance GPKGroupID();
  v4 = v88;
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  v90 = v4;
  v91 = v4;
  if (v4)
  {
    v43 = v91;
    outlined destroy of GPKGroupID(v89);
    result = (*(uint64_t (**)(char *, uint64_t))(v79 + 8))(v83, v86);
    v44 = v43;
  }
  else
  {
    v5 = v84;
    v6 = outlined destroy of GPKGroupID(v89);
    v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 176))(v6);
    v73 = v108;
    *v77 = v7;
    v71 = &v107;
    v107 = 1;
    v72 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : String]);
    lazy protocol witness table accessor for type [String : String] and conformance <> [A : B]();
    v8 = v90;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    v74 = v8;
    v75 = v8;
    if (v8)
    {
      v42 = v75;
      outlined destroy of [String : String]();
      result = (*(uint64_t (**)(char *, uint64_t))(v79 + 8))(v83, v86);
      v44 = v42;
    }
    else
    {
      v9 = v84;
      outlined destroy of [String : String]();
      v10 = (*(uint64_t (**)(char *))(*(_QWORD *)v9 + 200))(v108);
      v67 = &v106;
      v106 = v10;
      v65 = &v105;
      v105 = 2;
      v66 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : GPKUpdateGroupRequest.Member]);
      v11 = lazy protocol witness table accessor for type [String : GPKUpdateGroupRequest.Member] and conformance <> [A : B]();
      v12 = v74;
      v68 = v11;
      KeyedEncodingContainer.encode<A>(_:forKey:)();
      v69 = v12;
      v70 = v12;
      if (v12)
      {
        v41 = v70;
        outlined destroy of [String : GPKUpdateGroupRequest.Member]();
        result = (*(uint64_t (**)(char *, uint64_t))(v79 + 8))(v83, v86);
        v44 = v41;
      }
      else
      {
        v13 = v84;
        outlined destroy of [String : GPKUpdateGroupRequest.Member]();
        v14 = (*(uint64_t (**)(uint64_t *))(*(_QWORD *)v13 + 224))(&v106);
        v15 = v69;
        v104 = v14;
        v103 = 3;
        KeyedEncodingContainer.encode<A>(_:forKey:)();
        v63 = v15;
        v64 = v15;
        if (v15)
        {
          v40 = v64;
          outlined destroy of [String : GPKUpdateGroupRequest.Member]();
          result = (*(uint64_t (**)(char *, uint64_t))(v79 + 8))(v83, v86);
          v44 = v40;
        }
        else
        {
          v16 = v84;
          outlined destroy of [String : GPKUpdateGroupRequest.Member]();
          v17 = (*(uint64_t (**)(uint64_t *))(*(_QWORD *)v16 + 248))(&v104);
          v18 = v63;
          v102 = v17;
          v101 = 4;
          KeyedEncodingContainer.encode<A>(_:forKey:)();
          v61 = v18;
          v62 = v18;
          if (v18)
          {
            v39 = v62;
            outlined destroy of [String : GPKUpdateGroupRequest.Member]();
            result = (*(uint64_t (**)(char *, uint64_t))(v79 + 8))(v83, v86);
            v44 = v39;
          }
          else
          {
            v19 = v84;
            outlined destroy of [String : GPKUpdateGroupRequest.Member]();
            v20 = (*(uint64_t (**)(uint64_t *))(*(_QWORD *)v19 + 272))(&v102);
            v57 = &v100;
            v100 = v20;
            v55 = &v99;
            v99 = 5;
            v56 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : GPKMember]);
            v21 = lazy protocol witness table accessor for type [String : GPKMember] and conformance <> [A : B]();
            v22 = v61;
            v58 = v21;
            KeyedEncodingContainer.encode<A>(_:forKey:)();
            v59 = v22;
            v60 = v22;
            if (v22)
            {
              v38 = v60;
              outlined destroy of [String : GPKMember]();
              result = (*(uint64_t (**)(char *, uint64_t))(v79 + 8))(v83, v86);
              v44 = v38;
            }
            else
            {
              v23 = v84;
              outlined destroy of [String : GPKMember]();
              v24 = (*(uint64_t (**)(uint64_t *))(*(_QWORD *)v23 + 296))(&v100);
              v25 = v59;
              v98 = v24;
              v97 = 6;
              KeyedEncodingContainer.encode<A>(_:forKey:)();
              v53 = v25;
              v54 = v25;
              if (v25)
              {
                v37 = v54;
                outlined destroy of [String : GPKMember]();
                result = (*(uint64_t (**)(char *, uint64_t))(v79 + 8))(v83, v86);
                v44 = v37;
              }
              else
              {
                v26 = v84;
                outlined destroy of [String : GPKMember]();
                v27 = (*(uint64_t (**)(uint64_t *))(*(_QWORD *)v26 + 320))(&v98);
                v49 = v96;
                v96[0] = v27;
                v96[1] = v28;
                v47 = &v95;
                v95 = 7;
                v48 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
                v29 = lazy protocol witness table accessor for type String? and conformance <A> A?();
                v30 = v53;
                v50 = v29;
                KeyedEncodingContainer.encode<A>(_:forKey:)();
                v51 = v30;
                v52 = v30;
                if (v30)
                {
                  v36[2] = v52;
                  outlined destroy of String?();
                  return (*(uint64_t (**)(char *, uint64_t))(v79 + 8))(v83, v86);
                }
                else
                {
                  v31 = v84;
                  outlined destroy of String?();
                  v32 = (*(uint64_t (**)(_QWORD *))(*(_QWORD *)v31 + 344))(v96);
                  v33 = v51;
                  v93 = v32;
                  v94 = v34;
                  v92 = 8;
                  KeyedEncodingContainer.encode<A>(_:forKey:)();
                  v45 = v33;
                  v46 = v33;
                  if (v33)
                    v36[1] = v46;
                  outlined destroy of String?();
                  return (*(uint64_t (**)(char *, uint64_t))(v79 + 8))(v83, v86);
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

_QWORD *GPKUpdateGroupRequest.existingMember(forHandle:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v18;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[14];
  uint64_t v29;
  _QWORD v30[2];
  _QWORD v31[3];
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v29 = 0;
  memset(v28, 0, sizeof(v28));
  v49 = a1;
  v50 = a2;
  v48 = v3;
  v4 = swift_bridgeObjectRetain();
  (*(void (**)(uint64_t))(*(_QWORD *)v3 + 200))(v4);
  v39 = a1;
  v40 = a2;
  MEMORY[0x24263250C](&v41);
  outlined destroy of String();
  v21 = v41;
  v22 = v42;
  v23 = v43;
  v24 = v44;
  v25 = v45;
  v26 = v46;
  v27 = v47;
  if (v42)
  {
    v28[0] = v41;
    v28[1] = v42;
    LOBYTE(v28[2]) = v43 & 1;
    v28[3] = v44;
    LOBYTE(v28[4]) = v45 & 1;
    v28[5] = v46;
    v28[6] = v47;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    outlined copy of GPKUserID?(v26, v27);
    *a3 = v21;
    a3[1] = v22;
    a3[2] = v23 & 1;
    a3[3] = v24;
    a3[4] = v25 & 1;
    a3[5] = v26;
    a3[6] = v27;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (_QWORD *)outlined consume of GPKUserID?(v26, v27);
  }
  else
  {
    swift_bridgeObjectRelease();
    v6 = swift_bridgeObjectRetain();
    (*(void (**)(uint64_t))(*(_QWORD *)v18 + 248))(v6);
    v31[1] = a1;
    v31[2] = a2;
    MEMORY[0x24263250C](&v32);
    outlined destroy of String();
    v10 = v32;
    v11 = v33;
    v12 = v34;
    v13 = v35;
    v14 = v36;
    v15 = v37;
    v16 = v38;
    if (v33)
    {
      v28[7] = v32;
      v28[8] = v33;
      LOBYTE(v28[9]) = v34 & 1;
      v28[10] = v35;
      LOBYTE(v28[11]) = v36 & 1;
      v28[12] = v37;
      v28[13] = v38;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      outlined copy of GPKUserID?(v15, v16);
      *a3 = v10;
      a3[1] = v11;
      a3[2] = v12 & 1;
      a3[3] = v13;
      a3[4] = v14 & 1;
      a3[5] = v15;
      a3[6] = v16;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (_QWORD *)outlined consume of GPKUserID?(v15, v16);
    }
    else
    {
      swift_bridgeObjectRelease();
      v8 = *(_QWORD *)(v18 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_existingMemberByHandle);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v30[0] = a1;
      v30[1] = a2;
      v7 = type metadata accessor for GPKMember();
      MEMORY[0x24263250C](v31, v30, v8, MEMORY[0x24BEE0D00], v7, MEMORY[0x24BEE0D10]);
      outlined destroy of String();
      v9 = v31[0];
      if (v31[0])
      {
        v29 = v31[0];
        swift_bridgeObjectRelease();
        return GPKUpdateGroupRequest.Member.init(member:)(v9, a3);
      }
      else
      {
        result = (_QWORD *)swift_bridgeObjectRelease();
        *a3 = 0;
        a3[1] = 0;
        a3[2] = 0;
        a3[3] = 0;
        a3[4] = 0;
        a3[5] = 0;
        a3[6] = 0;
      }
    }
  }
  return result;
}

Swift::Void __swiftcall GPKUpdateGroupRequest.setGroupMetadataValue(_:forKey:)(Swift::String_optional _, Swift::String forKey)
{
  uint64_t v2;
  uint64_t (*v5)();
  _BYTE v6[32];
  Swift::String v7;
  Swift::String_optional v8;
  uint64_t v9;
  Swift::String v10;
  Swift::String_optional v11;

  v11 = _;
  v10 = forKey;
  v9 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8 = _;
  v7 = forKey;
  v5 = GPKUpdateGroupRequest.groupMetadata.modify();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : String]);
  Dictionary.subscript.setter();
  ((void (*)(_BYTE *, _QWORD))v5)(v6, 0);
}

uint64_t GPKUpdateGroupRequest.addMember(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  Swift::String v4;
  Swift::String v5;
  void *v6;
  Swift::String v7;
  uint64_t v9;
  os_log_type_t v10;
  Swift::String fileID;
  void *_;
  uint64_t (*v13)();
  char v14;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE v25[32];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[2];
  uint64_t v43;
  uint64_t v44;
  _QWORD __b[7];

  memset(__b, 0, sizeof(__b));
  v44 = 0;
  v22 = *(_QWORD *)(a1 + 8);
  v16 = *(_BYTE *)(a1 + 16);
  v17 = *(_QWORD *)(a1 + 24);
  v18 = *(_BYTE *)(a1 + 32);
  v19 = *(_QWORD *)(a1 + 40);
  v20 = *(_QWORD *)(a1 + 48);
  __b[0] = *(_QWORD *)a1;
  v21 = __b[0];
  __b[1] = v22;
  LOBYTE(__b[2]) = v16 & 1;
  __b[3] = v17;
  LOBYTE(__b[4]) = v18 & 1;
  __b[5] = v19;
  __b[6] = v20;
  v44 = v1;
  v23 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_existingMemberByHandle);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v42[0] = v21;
  v42[1] = v22;
  v2 = type metadata accessor for GPKMember();
  MEMORY[0x24263250C](&v43, v42, v23, MEMORY[0x24BEE0D00], v2, MEMORY[0x24BEE0D10]);
  outlined destroy of String();
  v24 = v43;
  swift_bridgeObjectRelease();
  v41 = v24;
  outlined destroy of GPKMember?();
  if (v24)
  {
    v39 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
    v40 = v3;
    v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Attempting to add a member with same handle: ", 0x2DuLL, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v37 = v21;
    v38 = v22;
    DefaultStringInterpolation.appendInterpolation<A>(_:)();
    outlined destroy of String();
    v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    outlined destroy of DefaultStringInterpolation();
    v9 = String.init(stringInterpolation:)();
    _ = v6;
    v10 = static os_log_type_t.error.getter();
    fileID = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GroupKit/GPKUpdateGroupRequest.swift", 0x24uLL, 1);
    default argument 4 of gpklog(_:type:fileID:line:subsystem:)(&v36);
    v7._countAndFlagsBits = v9;
    v7._object = _;
    v35 = v36 & 1;
    gpklog(_:type:fileID:line:subsystem:)(v7, v10, fileID, 315, (GroupKit::LogSubsystem)&v35);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v14 = 0;
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    outlined copy of GPKUserID?(v19, v20);
    v28 = v21;
    v29 = v22;
    v30 = v16 & 1;
    v31 = v17;
    v32 = v18 & 1;
    v33 = v19;
    v34 = v20;
    v26 = v21;
    v27 = v22;
    v13 = GPKUpdateGroupRequest.addedMembers.modify();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : GPKUpdateGroupRequest.Member]);
    Dictionary.subscript.setter();
    ((void (*)(_BYTE *, _QWORD))v13)(v25, 0);
    v14 = 1;
  }
  return v14 & 1;
}

uint64_t GPKUpdateGroupRequest.removeMember(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::String v3;
  uint64_t v4;
  Swift::String v5;
  uint64_t v6;
  Swift::String v7;
  Swift::String v8;
  void *v9;
  Swift::String v10;
  uint64_t v12;
  os_log_type_t v13;
  Swift::String v14;
  void *v15;
  os_log_type_t v16;
  Swift::String v17;
  uint64_t (*v18)();
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  os_log_type_t v22;
  Swift::String fileID;
  uint64_t (*v24)();
  char v25;
  BOOL v26;
  uint64_t v27;
  char v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[32];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  char v47;
  _QWORD v48[2];
  _BYTE v49[32];
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  char v60;
  char v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[2];
  uint64_t v69;
  _QWORD v70[9];
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD __b[7];

  memset(__b, 0, sizeof(__b));
  v78 = 0;
  v35 = *(_QWORD *)(a1 + 8);
  v29 = *(_BYTE *)(a1 + 16);
  v30 = *(_QWORD *)(a1 + 24);
  v31 = *(_BYTE *)(a1 + 32);
  v32 = *(_QWORD *)(a1 + 40);
  v33 = *(_QWORD *)(a1 + 48);
  __b[0] = *(_QWORD *)a1;
  v34 = __b[0];
  __b[1] = v35;
  LOBYTE(__b[2]) = v29 & 1;
  __b[3] = v30;
  LOBYTE(__b[4]) = v31 & 1;
  __b[5] = v32;
  __b[6] = v33;
  v78 = v1;
  v2 = swift_bridgeObjectRetain();
  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 200))(v2);
  v70[7] = v34;
  v70[8] = v35;
  MEMORY[0x24263250C](&v71);
  outlined destroy of String();
  v70[0] = v71;
  v70[1] = v72;
  v70[2] = v73;
  v70[3] = v74;
  v70[4] = v75;
  v70[5] = v76;
  v70[6] = v77;
  v26 = v72 != 0;
  outlined destroy of GPKUpdateGroupRequest.Member?(v70);
  swift_bridgeObjectRelease();
  if (v26)
  {
    v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Removed member from newly added members list", 0x2CuLL, 1);
    fileID = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GroupKit/GPKUpdateGroupRequest.swift", 0x24uLL, 1);
    v22 = default argument 1 of gpklog(_:type:fileID:line:subsystem:)();
    default argument 4 of gpklog(_:type:fileID:line:subsystem:)(&v47);
    v46 = v47 & 1;
    gpklog(_:type:fileID:line:subsystem:)(v3, v22, fileID, 339, (GroupKit::LogSubsystem)&v46);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v37 = v34;
    v38 = v35;
    v24 = GPKUpdateGroupRequest.addedMembers.modify();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : GPKUpdateGroupRequest.Member]);
    Dictionary.removeValue(forKey:)();
    ((void (*)(_BYTE *, _QWORD))v24)(v36, 0);
    outlined destroy of String();
    outlined consume of GPKUpdateGroupRequest.Member?(v39, v40, v41, v42, v43, v44, v45);
    v25 = 1;
  }
  else
  {
    v20 = *(_QWORD *)(v27 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_existingMemberByHandle);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v68[0] = v34;
    v68[1] = v35;
    v4 = type metadata accessor for GPKMember();
    MEMORY[0x24263250C](&v69, v68, v20, MEMORY[0x24BEE0D00], v4, MEMORY[0x24BEE0D10]);
    outlined destroy of String();
    v21 = v69;
    swift_bridgeObjectRelease();
    v67 = v21;
    outlined destroy of GPKMember?();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    outlined copy of GPKUserID?(v32, v33);
    if (v21)
    {
      outlined copy of GPKUserID?(v32, v33);
      v48[0] = v32;
      v48[1] = v33;
      outlined destroy of GPKUserID?((uint64_t)v48);
      v19 = (v33 & 0xF000000000000000) != 0xF000000000000000;
    }
    else
    {
      v19 = 0;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    outlined consume of GPKUserID?(v32, v33);
    if (v19)
    {
      v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Added to removed members list", 0x1DuLL, 1);
      v17 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GroupKit/GPKUpdateGroupRequest.swift", 0x24uLL, 1);
      v16 = default argument 1 of gpklog(_:type:fileID:line:subsystem:)();
      default argument 4 of gpklog(_:type:fileID:line:subsystem:)(&v60);
      v59 = v60 & 1;
      gpklog(_:type:fileID:line:subsystem:)(v5, v16, v17, 345, (GroupKit::LogSubsystem)&v59);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      outlined copy of GPKUserID?(v32, v33);
      v52 = v34;
      v53 = v35;
      v54 = v29 & 1;
      v55 = v30;
      v56 = v31 & 1;
      v57 = v32;
      v58 = v33;
      v50 = v34;
      v51 = v35;
      v18 = GPKUpdateGroupRequest.removedMembers.modify();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : GPKUpdateGroupRequest.Member]);
      Dictionary.subscript.setter();
      ((void (*)(_BYTE *, _QWORD))v18)(v49, 0);
      v25 = 1;
    }
    else
    {
      v65 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
      v66 = v6;
      v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Attempting to remove a member who is not a part of group: ", 0x3AuLL, 1);
      DefaultStringInterpolation.appendLiteral(_:)(v7);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      v63 = v34;
      v64 = v35;
      DefaultStringInterpolation.appendInterpolation<A>(_:)();
      outlined destroy of String();
      v8 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
      DefaultStringInterpolation.appendLiteral(_:)(v8);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      outlined destroy of DefaultStringInterpolation();
      v12 = String.init(stringInterpolation:)();
      v15 = v9;
      v13 = static os_log_type_t.error.getter();
      v14 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GroupKit/GPKUpdateGroupRequest.swift", 0x24uLL, 1);
      default argument 4 of gpklog(_:type:fileID:line:subsystem:)(&v62);
      v10._countAndFlagsBits = v12;
      v10._object = v15;
      v61 = v62 & 1;
      gpklog(_:type:fileID:line:subsystem:)(v10, v13, v14, 350, (GroupKit::LogSubsystem)&v61);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v25 = 0;
    }
  }
  return v25 & 1;
}

_QWORD *outlined destroy of GPKUpdateGroupRequest.Member?(_QWORD *a1)
{
  if (a1[1])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((a1[6] & 0xF000000000000000) != 0xF000000000000000)
      outlined consume of Data._Representation(a1[5], a1[6]);
  }
  return a1;
}

uint64_t outlined consume of GPKUpdateGroupRequest.Member?(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return outlined consume of GPKUserID?(a6, a7);
  }
  return result;
}

Swift::Bool __swiftcall GPKUpdateGroupRequest.removeMember(handle:)(Swift::String handle)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  Swift::String v4;
  Swift::String v5;
  void *v6;
  Swift::String v7;
  uint64_t v8;
  Swift::String v9;
  Swift::String v10;
  void *v11;
  Swift::String v12;
  uint64_t v14;
  os_log_type_t v15;
  Swift::String v16;
  void *v17;
  uint64_t v18;
  os_log_type_t v19;
  Swift::String fileID;
  void *_;
  char v22;
  char v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];
  char v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  unint64_t v35;
  _QWORD __b[7];
  char v37;
  char v38;
  Swift::String v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  char v50;
  char v51;
  Swift::String v52;
  uint64_t v53;
  uint64_t v54;
  Swift::String v55;
  uint64_t v56;
  uint64_t v57;
  Swift::String v58;

  v49 = 0;
  memset(__b, 0, sizeof(__b));
  v58 = handle;
  v57 = v1;
  v28 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_existingMemberByHandle);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v55 = handle;
  v2 = type metadata accessor for GPKMember();
  MEMORY[0x24263250C](&v56, &v55, v28, MEMORY[0x24BEE0D00], v2, MEMORY[0x24BEE0D10]);
  outlined destroy of String();
  v29 = v56;
  if (v56)
  {
    v49 = v56;
    swift_bridgeObjectRelease();
    swift_retain();
    GPKUpdateGroupRequest.Member.init(member:)(v29, &v42);
    v24 = v47;
    v25 = v48;
    if (v43)
    {
      __b[0] = v42;
      __b[1] = v43;
      LOBYTE(__b[2]) = v44 & 1;
      __b[3] = v45;
      LOBYTE(__b[4]) = v46 & 1;
      __b[5] = v47;
      __b[6] = v48;
      v30[0] = v42;
      v30[1] = v43;
      v31 = v44 & 1;
      v32 = v45;
      v33 = v46 & 1;
      v34 = v47;
      v35 = v48;
      v22 = (*(uint64_t (**)(_QWORD *))(*(_QWORD *)v26 + 416))(v30);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      outlined consume of GPKUserID?(v24, v25);
      swift_release();
      v23 = v22;
    }
    else
    {
      v40 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
      v41 = v3;
      v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Unexpected found invalid member in the group: ", 0x2EuLL, 1);
      DefaultStringInterpolation.appendLiteral(_:)(v4);
      swift_bridgeObjectRelease();
      v39 = handle;
      DefaultStringInterpolation.appendInterpolation<A>(_:)();
      v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(", couldn't add to remove list.", 0x1EuLL, 1);
      DefaultStringInterpolation.appendLiteral(_:)(v5);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      outlined destroy of DefaultStringInterpolation();
      v18 = String.init(stringInterpolation:)();
      _ = v6;
      v19 = static os_log_type_t.error.getter();
      fileID = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GroupKit/GPKUpdateGroupRequest.swift", 0x24uLL, 1);
      default argument 4 of gpklog(_:type:fileID:line:subsystem:)(&v38);
      v7._countAndFlagsBits = v18;
      v7._object = _;
      v37 = v38 & 1;
      gpklog(_:type:fileID:line:subsystem:)(v7, v19, fileID, 373, (GroupKit::LogSubsystem)&v37);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      v23 = 0;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    v53 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
    v54 = v8;
    v9 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Attempting to remove a member who is not a part of group: ", 0x3AuLL, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v9);
    swift_bridgeObjectRelease();
    v52 = handle;
    DefaultStringInterpolation.appendInterpolation<A>(_:)();
    v10 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v10);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    outlined destroy of DefaultStringInterpolation();
    v14 = String.init(stringInterpolation:)();
    v17 = v11;
    v15 = static os_log_type_t.error.getter();
    v16 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GroupKit/GPKUpdateGroupRequest.swift", 0x24uLL, 1);
    default argument 4 of gpklog(_:type:fileID:line:subsystem:)(&v51);
    v12._countAndFlagsBits = v14;
    v12._object = v17;
    v50 = v51 & 1;
    gpklog(_:type:fileID:line:subsystem:)(v12, v15, v16, 368, (GroupKit::LogSubsystem)&v50);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v23 = 0;
  }
  return v23 & 1;
}

uint64_t GPKUpdateGroupRequest.removeManagedMember(_:)(uint64_t a1)
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
  uint64_t v11;
  Swift::String v12;
  uint64_t v13;
  uint64_t v14;
  Swift::String v15;
  void *v16;
  Swift::String v17;
  uint64_t v19;
  os_log_type_t v20;
  Swift::String fileID;
  void *_;
  uint64_t (*v23)();
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)();
  char v27;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[32];
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE v35[32];
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[2];
  _QWORD v47[3];

  v2 = v1;
  v47[2] = a1;
  v47[1] = v2;
  v29 = *(_QWORD *)(v2 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_existingManagedMemberByHandle);
  v4 = swift_bridgeObjectRetain();
  v46[0] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 160))(v4);
  v46[1] = v5;
  v6 = type metadata accessor for GPKMember();
  MEMORY[0x24263250C](v47, v46, v29, MEMORY[0x24BEE0D00], v6, MEMORY[0x24BEE0D10]);
  outlined destroy of String();
  v30 = v47[0];
  swift_bridgeObjectRelease();
  v45 = v30;
  outlined destroy of GPKMember?();
  if (v30)
  {
    v7 = (*(uint64_t (**)(uint64_t *))(*(_QWORD *)a1 + 160))(&v45);
    v38 = 0;
    v36 = v7;
    v37 = v8;
    v23 = GPKUpdateGroupRequest.updatedManagedMembers.modify();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : GPKMember]);
    Dictionary.subscript.setter();
    v9 = ((uint64_t (*)(_BYTE *, _QWORD))v23)(v35, 0);
    v24 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 160))(v9);
    v25 = v10;
    swift_retain();
    v34 = a1;
    v32 = v24;
    v33 = v25;
    v26 = GPKUpdateGroupRequest.removedManagedMembers.modify();
    Dictionary.subscript.setter();
    ((void (*)(_BYTE *, _QWORD))v26)(v31, 0);
    v27 = 1;
  }
  else
  {
    v43 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
    v44 = v11;
    v12 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Attempting to remove a managed member who is not a part of group: ", 0x42uLL, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v12);
    v13 = swift_bridgeObjectRelease();
    v41 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 160))(v13);
    v42 = v14;
    DefaultStringInterpolation.appendInterpolation<A>(_:)();
    outlined destroy of String();
    v15 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v15);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    outlined destroy of DefaultStringInterpolation();
    v19 = String.init(stringInterpolation:)();
    _ = v16;
    v20 = static os_log_type_t.error.getter();
    fileID = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GroupKit/GPKUpdateGroupRequest.swift", 0x24uLL, 1);
    default argument 4 of gpklog(_:type:fileID:line:subsystem:)(&v40);
    v17._countAndFlagsBits = v19;
    v17._object = _;
    v39 = v40 & 1;
    gpklog(_:type:fileID:line:subsystem:)(v17, v20, fileID, 385, (GroupKit::LogSubsystem)&v39);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v27 = 0;
  }
  return v27 & 1;
}

Swift::Bool __swiftcall GPKUpdateGroupRequest.removeManagedMember(handle:)(Swift::String handle)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  Swift::String v4;
  Swift::String v5;
  void *v6;
  Swift::String v7;
  uint64_t v9;
  os_log_type_t v10;
  Swift::String fileID;
  void *_;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  Swift::String v21;
  uint64_t v22;
  uint64_t v23;
  Swift::String v24;
  uint64_t v25;
  uint64_t v26;
  Swift::String v27;

  v27 = handle;
  v26 = v1;
  v17 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_existingManagedMemberByHandle);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v24 = handle;
  v2 = type metadata accessor for GPKMember();
  MEMORY[0x24263250C](&v25, &v24, v17, MEMORY[0x24BEE0D00], v2, MEMORY[0x24BEE0D10]);
  outlined destroy of String();
  v18 = v25;
  if (v25)
  {
    swift_bridgeObjectRelease();
    v13 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v15 + 432))(v18);
    swift_release();
    v14 = v13;
  }
  else
  {
    swift_bridgeObjectRelease();
    v22 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
    v23 = v3;
    v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Attempting to remove a managed member who is not a part of group: ", 0x42uLL, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v4);
    swift_bridgeObjectRelease();
    v21 = handle;
    DefaultStringInterpolation.appendInterpolation<A>(_:)();
    v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    outlined destroy of DefaultStringInterpolation();
    v9 = String.init(stringInterpolation:)();
    _ = v6;
    v10 = static os_log_type_t.error.getter();
    fileID = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GroupKit/GPKUpdateGroupRequest.swift", 0x24uLL, 1);
    default argument 4 of gpklog(_:type:fileID:line:subsystem:)(&v20);
    v7._countAndFlagsBits = v9;
    v7._object = _;
    v19 = v20 & 1;
    gpklog(_:type:fileID:line:subsystem:)(v7, v10, fileID, 397, (GroupKit::LogSubsystem)&v19);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v14 = 0;
  }
  return v14 & 1;
}

uint64_t GPKUpdateGroupRequest.updateMember(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::String v3;
  uint64_t v4;
  Swift::String v5;
  uint64_t v6;
  Swift::String v7;
  uint64_t (*v9)();
  os_log_type_t v10;
  Swift::String v11;
  uint64_t v12;
  uint64_t v13;
  os_log_type_t v14;
  Swift::String v15;
  uint64_t (*v16)();
  BOOL v17;
  os_log_type_t v18;
  Swift::String fileID;
  char v20;
  BOOL v21;
  uint64_t v22;
  char v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  _BYTE v33[32];
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  char v45;
  char v46;
  _BYTE v47[32];
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  _QWORD v58[2];
  uint64_t v59;
  _QWORD v60[9];
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[9];
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD __b[7];

  memset(__b, 0, sizeof(__b));
  v76 = 0;
  v30 = *(_QWORD *)(a1 + 8);
  v24 = *(_BYTE *)(a1 + 16);
  v25 = *(_QWORD *)(a1 + 24);
  v26 = *(_BYTE *)(a1 + 32);
  v27 = *(_QWORD *)(a1 + 40);
  v28 = *(_QWORD *)(a1 + 48);
  __b[0] = *(_QWORD *)a1;
  v29 = __b[0];
  __b[1] = v30;
  LOBYTE(__b[2]) = v24 & 1;
  __b[3] = v25;
  LOBYTE(__b[4]) = v26 & 1;
  __b[5] = v27;
  __b[6] = v28;
  v76 = v1;
  v2 = swift_bridgeObjectRetain();
  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 224))(v2);
  v68[7] = v29;
  v68[8] = v30;
  MEMORY[0x24263250C](&v69);
  outlined destroy of String();
  v68[0] = v69;
  v68[1] = v70;
  v68[2] = v71;
  v68[3] = v72;
  v68[4] = v73;
  v68[5] = v74;
  v68[6] = v75;
  v21 = v70 != 0;
  outlined destroy of GPKUpdateGroupRequest.Member?(v68);
  swift_bridgeObjectRelease();
  if (v21)
  {
    v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Attempting update the member how is on removed list, not added to update list", 0x4DuLL, 1);
    v18 = static os_log_type_t.error.getter();
    fileID = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GroupKit/GPKUpdateGroupRequest.swift", 0x24uLL, 1);
    default argument 4 of gpklog(_:type:fileID:line:subsystem:)(&v32);
    v31 = v32 & 1;
    gpklog(_:type:fileID:line:subsystem:)(v3, v18, fileID, 424, (GroupKit::LogSubsystem)&v31);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v20 = 0;
  }
  else
  {
    v4 = swift_bridgeObjectRetain();
    (*(void (**)(uint64_t))(*(_QWORD *)v22 + 200))(v4);
    v60[7] = v29;
    v60[8] = v30;
    MEMORY[0x24263250C](&v61);
    outlined destroy of String();
    v60[0] = v61;
    v60[1] = v62;
    v60[2] = v63;
    v60[3] = v64;
    v60[4] = v65;
    v60[5] = v66;
    v60[6] = v67;
    v17 = v62 != 0;
    outlined destroy of GPKUpdateGroupRequest.Member?(v60);
    swift_bridgeObjectRelease();
    if (v17)
    {
      v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Member exist in the newly added member list, so updating the newly added member list", 0x54uLL, 1);
      v15 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GroupKit/GPKUpdateGroupRequest.swift", 0x24uLL, 1);
      v14 = default argument 1 of gpklog(_:type:fileID:line:subsystem:)();
      default argument 4 of gpklog(_:type:fileID:line:subsystem:)(&v44);
      v43 = v44 & 1;
      gpklog(_:type:fileID:line:subsystem:)(v5, v14, v15, 429, (GroupKit::LogSubsystem)&v43);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      outlined copy of GPKUserID?(v27, v28);
      v36 = v29;
      v37 = v30;
      v38 = v24 & 1;
      v39 = v25;
      v40 = v26 & 1;
      v41 = v27;
      v42 = v28;
      v34 = v29;
      v35 = v30;
      v16 = GPKUpdateGroupRequest.addedMembers.modify();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : GPKUpdateGroupRequest.Member]);
      Dictionary.subscript.setter();
      ((void (*)(_BYTE *, _QWORD))v16)(v33, 0);
      v20 = 1;
    }
    else
    {
      v12 = *(_QWORD *)(v22 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_existingMemberByHandle);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v58[0] = v29;
      v58[1] = v30;
      v6 = type metadata accessor for GPKMember();
      MEMORY[0x24263250C](&v59, v58, v12, MEMORY[0x24BEE0D00], v6, MEMORY[0x24BEE0D10]);
      outlined destroy of String();
      v13 = v59;
      swift_bridgeObjectRelease();
      v57 = v13;
      outlined destroy of GPKMember?();
      if (v13)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        outlined copy of GPKUserID?(v27, v28);
        v50 = v29;
        v51 = v30;
        v52 = v24 & 1;
        v53 = v25;
        v54 = v26 & 1;
        v55 = v27;
        v56 = v28;
        v48 = v29;
        v49 = v30;
        v9 = GPKUpdateGroupRequest.updatedMembers.modify();
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : GPKUpdateGroupRequest.Member]);
        Dictionary.subscript.setter();
        ((void (*)(_BYTE *, _QWORD))v9)(v47, 0);
        v20 = 1;
      }
      else
      {
        v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Attempting to update a member who is not a part of the group", 0x3CuLL, 1);
        v10 = static os_log_type_t.error.getter();
        v11 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GroupKit/GPKUpdateGroupRequest.swift", 0x24uLL, 1);
        default argument 4 of gpklog(_:type:fileID:line:subsystem:)(&v46);
        v45 = v46 & 1;
        gpklog(_:type:fileID:line:subsystem:)(v7, v10, v11, 435, (GroupKit::LogSubsystem)&v45);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v20 = 0;
      }
    }
  }
  return v20 & 1;
}

Swift::Bool __swiftcall GPKUpdateGroupRequest.setRole(_:handle:)(GroupKit::GPKMemberRole _, Swift::String handle)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Swift::String v7;
  Swift::String v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  uint64_t v12;
  Swift::String v13;
  Swift::String v14;
  void *v15;
  Swift::String v16;
  uint64_t v18;
  os_log_type_t v19;
  Swift::String v20;
  void *v21;
  os_log_type_t v22;
  Swift::String v23;
  uint64_t v24;
  os_log_type_t v25;
  Swift::String fileID;
  void *_a;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)();
  char v38;
  uint64_t v39;
  char *v40;
  char v41;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  unint64_t v49;
  char v50[32];
  Swift::String v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  _QWORD v59[2];
  char v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  unint64_t v64;
  char v65;
  char v66;
  Swift::String v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  _QWORD v76[7];
  char v77;
  _BYTE v78[3];
  char v79;
  uint64_t v80;
  char v81;
  char v82;
  Swift::String v83;
  uint64_t v84;
  uint64_t v85;
  Swift::String v86;
  uint64_t v87;
  Swift::String v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  _QWORD __b[7];
  uint64_t v97;
  Swift::String v98;
  char v99;

  v40 = (char *)_;
  v99 = 0;
  v98 = (Swift::String)0;
  v97 = 0;
  memset(__b, 0, sizeof(__b));
  v80 = 0;
  memset(v76, 0, sizeof(v76));
  v41 = *v40;
  v99 = *v40 & 1;
  v98 = handle;
  v97 = v2;
  v3 = swift_bridgeObjectRetain();
  (*(void (**)(uint64_t))(*(_QWORD *)v2 + 248))(v3);
  v88 = handle;
  MEMORY[0x24263250C](&v89);
  outlined destroy of String();
  v43 = v89;
  v44 = v90;
  v45 = v91;
  v46 = v92;
  v47 = v93;
  v48 = v94;
  v49 = v95;
  if (v90)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    outlined copy of GPKUserID?(v48, v49);
    __b[0] = v43;
    __b[1] = v44;
    LOBYTE(__b[2]) = v45 & 1;
    __b[3] = v46;
    LOBYTE(__b[4]) = v47 & 1;
    __b[5] = v48;
    __b[6] = v49;
    swift_bridgeObjectRelease();
    LOBYTE(__b[2]) = v41 & 1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    outlined copy of GPKUserID?(v48, v49);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    outlined copy of GPKUserID?(v48, v49);
    outlined consume of GPKUserID?(v48, v49);
    outlined consume of GPKUserID?(v48, v49);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v52 = v43;
    v53 = v44;
    v54 = v41 & 1;
    v55 = v46;
    v56 = v47 & 1;
    v57 = v48;
    v58 = v49;
    v51 = handle;
    v37 = GPKUpdateGroupRequest.updatedMembers.modify();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : GPKUpdateGroupRequest.Member]);
    Dictionary.subscript.setter();
    ((void (*)(char *, _QWORD))v37)(v50, 0);
    outlined destroy of GPKUpdateGroupRequest.Member((uint64_t)__b);
    v38 = 1;
  }
  else
  {
    swift_bridgeObjectRelease();
    v35 = *(_QWORD *)(v39 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_existingMemberByHandle);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v86 = handle;
    v4 = type metadata accessor for GPKMember();
    MEMORY[0x24263250C](&v87, &v86, v35, MEMORY[0x24BEE0D00], v4, MEMORY[0x24BEE0D10]);
    outlined destroy of String();
    v36 = v87;
    if (v87)
    {
      v80 = v87;
      v5 = swift_bridgeObjectRelease();
      (*(void (**)(char *__return_ptr, uint64_t))(*(_QWORD *)v36 + 184))(&v79, v5);
      v78[2] = v79 & 1;
      v78[1] = v41 & 1;
      lazy protocol witness table accessor for type GPKMemberRole and conformance GPKMemberRole();
      if ((dispatch thunk of static Equatable.== infix(_:_:)() & 1) != 0)
      {
        v11 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Member role is not changed, so nothing to do here.", 0x32uLL, 1);
        v22 = static os_log_type_t.error.getter();
        v23 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GroupKit/GPKUpdateGroupRequest.swift", 0x24uLL, 1);
        default argument 4 of gpklog(_:type:fileID:line:subsystem:)(v78);
        v77 = v78[0] & 1;
        gpklog(_:type:fileID:line:subsystem:)(v11, v22, v23, 476, (GroupKit::LogSubsystem)&v77);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        v38 = 0;
      }
      else
      {
        swift_retain();
        GPKUpdateGroupRequest.Member.init(member:)(v36, &v70);
        v29 = v70;
        v30 = v71;
        v31 = v72;
        v32 = v73;
        v33 = v74;
        v34 = v75;
        if (v71)
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          outlined copy of GPKUserID?(v33, v34);
          v76[0] = v29;
          v76[1] = v30;
          v76[3] = v31;
          LOBYTE(v76[4]) = v32 & 1;
          v76[5] = v33;
          v76[6] = v34;
          LOBYTE(v76[2]) = v41 & 1;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          outlined copy of GPKUserID?(v33, v34);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          outlined copy of GPKUserID?(v33, v34);
          outlined consume of GPKUserID?(v33, v34);
          outlined consume of GPKUserID?(v33, v34);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v59[0] = v29;
          v59[1] = v30;
          v60 = v41 & 1;
          v61 = v31;
          v62 = v32 & 1;
          v63 = v33;
          v64 = v34;
          v28 = (*(uint64_t (**)(void))(*(_QWORD *)v39 + 448))();
          outlined destroy of GPKUpdateGroupRequest.Member((uint64_t)v59);
          outlined destroy of GPKUpdateGroupRequest.Member((uint64_t)v76);
          swift_release();
          v38 = v28;
        }
        else
        {
          v68 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
          v69 = v6;
          v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Unexpected found invalid member in the group: ", 0x2EuLL, 1);
          DefaultStringInterpolation.appendLiteral(_:)(v7);
          swift_bridgeObjectRelease();
          v67 = handle;
          DefaultStringInterpolation.appendInterpolation<A>(_:)();
          v8 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(", couldn't added update list.", 0x1DuLL, 1);
          DefaultStringInterpolation.appendLiteral(_:)(v8);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          outlined destroy of DefaultStringInterpolation();
          v24 = String.init(stringInterpolation:)();
          _a = v9;
          v25 = static os_log_type_t.error.getter();
          fileID = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GroupKit/GPKUpdateGroupRequest.swift", 0x24uLL, 1);
          default argument 4 of gpklog(_:type:fileID:line:subsystem:)(&v66);
          v10._countAndFlagsBits = v24;
          v10._object = _a;
          v65 = v66 & 1;
          gpklog(_:type:fileID:line:subsystem:)(v10, v25, fileID, 481, (GroupKit::LogSubsystem)&v65);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          v38 = 0;
        }
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      v84 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
      v85 = v12;
      v13 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Attempting to change role of a member who is not a part of group: ", 0x42uLL, 1);
      DefaultStringInterpolation.appendLiteral(_:)(v13);
      swift_bridgeObjectRelease();
      v83 = handle;
      DefaultStringInterpolation.appendInterpolation<A>(_:)();
      v14 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
      DefaultStringInterpolation.appendLiteral(_:)(v14);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      outlined destroy of DefaultStringInterpolation();
      v18 = String.init(stringInterpolation:)();
      v21 = v15;
      v19 = static os_log_type_t.error.getter();
      v20 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GroupKit/GPKUpdateGroupRequest.swift", 0x24uLL, 1);
      default argument 4 of gpklog(_:type:fileID:line:subsystem:)(&v82);
      v16._countAndFlagsBits = v18;
      v16._object = v21;
      v81 = v82 & 1;
      gpklog(_:type:fileID:line:subsystem:)(v16, v19, v20, 471, (GroupKit::LogSubsystem)&v81);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v38 = 0;
    }
  }
  return v38 & 1;
}

uint64_t GPKUpdateGroupRequest.updateManagedMember(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  Swift::String v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Swift::String v13;
  os_log_type_t v15;
  Swift::String v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)();
  os_log_type_t v20;
  Swift::String fileID;
  char v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v31;
  char v32;
  _BYTE v33[32];
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[2];
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v43 = 0;
  v53 = a1;
  v52 = v1;
  v28 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 160))(a1);
  v27 = v2;
  v29 = (*(uint64_t (**)(void))(*(_QWORD *)v1 + 296))();
  v49[0] = v28;
  v49[1] = v27;
  type metadata accessor for GPKMember();
  MEMORY[0x24263250C](&v50, v49, v29, MEMORY[0x24BEE0D00]);
  outlined destroy of String();
  v48 = v50;
  swift_retain();
  swift_retain();
  if (v48)
  {
    v51 = v48;
  }
  else
  {
    v3 = swift_bridgeObjectRetain();
    v46 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 160))(v3);
    v47 = v4;
    MEMORY[0x24263250C](&v51);
    outlined destroy of String();
    swift_bridgeObjectRelease();
    outlined destroy of GPKMember?();
  }
  swift_release();
  swift_release();
  v5 = swift_bridgeObjectRelease();
  v26 = v51;
  if (v51)
  {
    v43 = v51;
    v24 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 160))(v5);
    v25 = v6;
    (*(void (**)(void))(*(_QWORD *)v1 + 272))();
    v40 = v24;
    v41 = v25;
    MEMORY[0x24263250C](&v42);
    outlined destroy of String();
    v39 = v42;
    v23 = v42 != 0;
    outlined destroy of GPKMember?();
    v7 = swift_bridgeObjectRelease();
    if (v23)
    {
      v8 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Attempting update the managed member how is on removed list, not added to update list", 0x55uLL, 1);
      v20 = static os_log_type_t.error.getter();
      fileID = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GroupKit/GPKUpdateGroupRequest.swift", 0x24uLL, 1);
      default argument 4 of gpklog(_:type:fileID:line:subsystem:)(&v32);
      v31 = v32 & 1;
      gpklog(_:type:fileID:line:subsystem:)(v8, v20, fileID, 515, (GroupKit::LogSubsystem)&v31);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      v22 = 0;
    }
    else
    {
      (*(void (**)(char *__return_ptr, uint64_t))(*(_QWORD *)a1 + 184))(&v38, v7);
      v37 = v38 & 1;
      v9 = (*(uint64_t (**)(char *))(*(_QWORD *)v26 + 192))(&v37);
      v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 208))(v9);
      v11 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v26 + 216))(v10);
      v17 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 160))(v11);
      v18 = v12;
      swift_retain();
      v36 = a1;
      v34 = v17;
      v35 = v18;
      v19 = GPKUpdateGroupRequest.updatedManagedMembers.modify();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : GPKMember]);
      Dictionary.subscript.setter();
      ((void (*)(_BYTE *, _QWORD))v19)(v33, 0);
      swift_release();
      v22 = 1;
    }
  }
  else
  {
    v13 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Attempting to update a managed member who is not a part of the group", 0x44uLL, 1);
    v15 = static os_log_type_t.error.getter();
    v16 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GroupKit/GPKUpdateGroupRequest.swift", 0x24uLL, 1);
    default argument 4 of gpklog(_:type:fileID:line:subsystem:)(&v45);
    v44 = v45 & 1;
    gpklog(_:type:fileID:line:subsystem:)(v13, v15, v16, 510, (GroupKit::LogSubsystem)&v44);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v22 = 0;
  }
  return v22 & 1;
}

Swift::Bool __swiftcall GPKUpdateGroupRequest.setManagedMemberRole(_:handle:)(GroupKit::GPKMemberRole _, Swift::String handle)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  Swift::String v5;
  uint64_t v6;
  Swift::String v7;
  Swift::String v8;
  void *v9;
  Swift::String v10;
  uint64_t v12;
  os_log_type_t v13;
  Swift::String v14;
  void *v15;
  os_log_type_t v16;
  Swift::String fileID;
  char v18;
  char v19;
  uint64_t v20;
  char v21;
  uint64_t countAndFlagsBits;
  uint64_t v23;
  uint64_t v24;
  void *object;
  char v26;
  char v27;
  _BYTE v28[3];
  char v29;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  _QWORD v40[2];
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  Swift::String v44;
  char v45;

  countAndFlagsBits = handle._countAndFlagsBits;
  object = handle._object;
  v45 = 0;
  v44._countAndFlagsBits = 0;
  v44._object = 0;
  v43 = 0;
  v30 = 0;
  v21 = *(_BYTE *)_;
  v45 = *(_BYTE *)_ & 1;
  v44 = handle;
  v43 = v2;
  v3 = swift_bridgeObjectRetain();
  v23 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 296))(v3);
  v40[0] = countAndFlagsBits;
  v40[1] = object;
  type metadata accessor for GPKMember();
  MEMORY[0x24263250C](&v41, v40, v23, MEMORY[0x24BEE0D00]);
  outlined destroy of String();
  v39 = v41;
  swift_retain();
  swift_bridgeObjectRetain();
  if (v39)
  {
    v42 = v39;
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v37 = countAndFlagsBits;
    v38 = object;
    MEMORY[0x24263250C](&v42);
    outlined destroy of String();
    swift_bridgeObjectRelease();
    outlined destroy of GPKMember?();
  }
  swift_release();
  swift_bridgeObjectRelease();
  v4 = swift_bridgeObjectRelease();
  v20 = v42;
  if (v42)
  {
    v30 = v42;
    (*(void (**)(char *__return_ptr, uint64_t))(*(_QWORD *)v42 + 184))(&v29, v4);
    v28[2] = v29 & 1;
    v28[1] = v21 & 1;
    lazy protocol witness table accessor for type GPKMemberRole and conformance GPKMemberRole();
    if ((dispatch thunk of static Equatable.== infix(_:_:)() & 1) != 0)
    {
      v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Managed member's role is not changed, so nothing to do here.", 0x3CuLL, 1);
      v16 = static os_log_type_t.error.getter();
      fileID = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GroupKit/GPKUpdateGroupRequest.swift", 0x24uLL, 1);
      default argument 4 of gpklog(_:type:fileID:line:subsystem:)(v28);
      v27 = v28[0] & 1;
      gpklog(_:type:fileID:line:subsystem:)(v5, v16, fileID, 551, (GroupKit::LogSubsystem)&v27);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      v19 = 0;
    }
    else
    {
      v26 = v21 & 1;
      (*(void (**)(char *))(*(_QWORD *)v20 + 192))(&v26);
      v18 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v24 + 464))(v20);
      swift_release();
      v19 = v18;
    }
  }
  else
  {
    v35 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
    v36 = v6;
    v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Attempting to change role of a managed member who is not a part of group: ", 0x4AuLL, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v7);
    swift_bridgeObjectRelease();
    v33 = countAndFlagsBits;
    v34 = object;
    DefaultStringInterpolation.appendInterpolation<A>(_:)();
    v8 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    outlined destroy of DefaultStringInterpolation();
    v12 = String.init(stringInterpolation:)();
    v15 = v9;
    v13 = static os_log_type_t.error.getter();
    v14 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("GroupKit/GPKUpdateGroupRequest.swift", 0x24uLL, 1);
    default argument 4 of gpklog(_:type:fileID:line:subsystem:)(&v32);
    v10._countAndFlagsBits = v12;
    v10._object = v15;
    v31 = v32 & 1;
    gpklog(_:type:fileID:line:subsystem:)(v10, v13, v14, 546, (GroupKit::LogSubsystem)&v31);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v19 = 0;
  }
  return v19 & 1;
}

uint64_t GPKUpdateGroupRequest.deinit()
{
  uint64_t v0;
  uint64_t v2;

  outlined destroy of GPKGroupID(v0 + OBJC_IVAR____TtC8GroupKit21GPKUpdateGroupRequest_groupID);
  outlined destroy of [String : String]();
  outlined destroy of [String : GPKUpdateGroupRequest.Member]();
  outlined destroy of [String : GPKUpdateGroupRequest.Member]();
  outlined destroy of [String : GPKUpdateGroupRequest.Member]();
  outlined destroy of [String : GPKMember]();
  outlined destroy of [String : GPKMember]();
  outlined destroy of String?();
  outlined destroy of String?();
  swift_release();
  outlined destroy of [String : GPKMember]();
  outlined destroy of [String : GPKMember]();
  return v2;
}

uint64_t GPKUpdateGroupRequest.__deallocating_deinit()
{
  GPKUpdateGroupRequest.deinit();
  return swift_deallocClassInstance();
}

uint64_t protocol witness for Decodable.init(from:) in conformance GPKUpdateGroupRequest@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 376))();
  if (!v2)
    *a1 = result;
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GPKUpdateGroupRequest()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 384))();
}

unint64_t base witness table accessor for Equatable in GPKUpdateGroupRequest.Member()
{
  return lazy protocol witness table accessor for type GPKUpdateGroupRequest.Member and conformance GPKUpdateGroupRequest.Member();
}

unint64_t base witness table accessor for Equatable in GPKUpdateGroupRequest.CodingKeys()
{
  return lazy protocol witness table accessor for type GPKUpdateGroupRequest.CodingKeys and conformance GPKUpdateGroupRequest.CodingKeys();
}

unint64_t base witness table accessor for CustomDebugStringConvertible in GPKUpdateGroupRequest.CodingKeys()
{
  return lazy protocol witness table accessor for type GPKUpdateGroupRequest.CodingKeys and conformance GPKUpdateGroupRequest.CodingKeys();
}

unint64_t base witness table accessor for CustomStringConvertible in GPKUpdateGroupRequest.CodingKeys()
{
  return lazy protocol witness table accessor for type GPKUpdateGroupRequest.CodingKeys and conformance GPKUpdateGroupRequest.CodingKeys();
}

uint64_t ObjC metadata update function for GPKUpdateGroupRequest()
{
  return type metadata accessor for GPKUpdateGroupRequest();
}

uint64_t type metadata completion function for GPKUpdateGroupRequest()
{
  unint64_t v0;
  uint64_t updated;

  updated = type metadata accessor for UUID();
  if (v0 <= 0x3F)
  {
    updated = swift_updateClassMetadata2();
    if (!updated)
      return 0;
  }
  return updated;
}

uint64_t method lookup function for GPKUpdateGroupRequest()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of GPKUpdateGroupRequest.groupMetadata.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of GPKUpdateGroupRequest.addedMembers.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of GPKUpdateGroupRequest.removedMembers.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of GPKUpdateGroupRequest.updatedMembers.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of GPKUpdateGroupRequest.removedManagedMembers.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of GPKUpdateGroupRequest.updatedManagedMembers.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of GPKUpdateGroupRequest.serviceName.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of GPKUpdateGroupRequest.serviceName.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t dispatch thunk of GPKUpdateGroupRequest.serviceName.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 336))();
}

uint64_t dispatch thunk of GPKUpdateGroupRequest.groupDomain.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of GPKUpdateGroupRequest.groupDomain.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of GPKUpdateGroupRequest.groupDomain.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of GPKUpdateGroupRequest.__allocating_init(group:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 368))();
}

uint64_t dispatch thunk of GPKUpdateGroupRequest.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 376))();
}

uint64_t dispatch thunk of GPKUpdateGroupRequest.encode(to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 384))();
}

uint64_t dispatch thunk of GPKUpdateGroupRequest.existingMember(forHandle:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 392))();
}

uint64_t dispatch thunk of GPKUpdateGroupRequest.setGroupMetadataValue(_:forKey:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 400))();
}

uint64_t dispatch thunk of GPKUpdateGroupRequest.addMember(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 408))() & 1;
}

uint64_t dispatch thunk of GPKUpdateGroupRequest.removeMember(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 416))() & 1;
}

uint64_t dispatch thunk of GPKUpdateGroupRequest.removeMember(handle:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 424))() & 1;
}

uint64_t dispatch thunk of GPKUpdateGroupRequest.removeManagedMember(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 432))() & 1;
}

uint64_t dispatch thunk of GPKUpdateGroupRequest.removeManagedMember(handle:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 440))() & 1;
}

uint64_t dispatch thunk of GPKUpdateGroupRequest.updateMember(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 448))() & 1;
}

uint64_t dispatch thunk of GPKUpdateGroupRequest.setRole(_:handle:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 456))() & 1;
}

uint64_t dispatch thunk of GPKUpdateGroupRequest.updateManagedMember(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 464))() & 1;
}

uint64_t dispatch thunk of GPKUpdateGroupRequest.setManagedMemberRole(_:handle:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 472))() & 1;
}

uint64_t initializeBufferWithCopyOfBuffer for GPKUpdateGroupRequest.Member(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;

  v4 = *a2;
  swift_retain();
  *a1 = v4;
  return *a1 + 16;
}

uint64_t destroy for GPKUpdateGroupRequest.Member(uint64_t a1)
{
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = a1;
  if ((*(_QWORD *)(a1 + 48) & 0xF000000000000000) != 0xF000000000000000)
    return outlined consume of Data._Representation(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

uint64_t initializeWithCopy for GPKUpdateGroupRequest.Member(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16) & 1;
  v7 = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 24) = v7;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32) & 1;
  if ((*(_QWORD *)(a2 + 48) & 0xF000000000000000) == 0xF000000000000000)
  {
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  }
  else
  {
    v3 = *(_QWORD *)(a2 + 40);
    v4 = *(_QWORD *)(a2 + 48);
    outlined copy of Data._Representation(v3, v4);
    *(_QWORD *)(a1 + 40) = v3;
    *(_QWORD *)(a1 + 48) = v4;
  }
  return a1;
}

uint64_t assignWithCopy for GPKUpdateGroupRequest.Member(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v9 = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 8) = v9;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16) & 1;
  v10 = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 24) = v10;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32) & 1;
  if ((*(_QWORD *)(a1 + 48) & 0xF000000000000000) == 0xF000000000000000)
  {
    if ((*(_QWORD *)(a2 + 48) & 0xF000000000000000) == 0xF000000000000000)
    {
      *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    }
    else
    {
      v5 = *(_QWORD *)(a2 + 40);
      v6 = *(_QWORD *)(a2 + 48);
      outlined copy of Data._Representation(v5, v6);
      *(_QWORD *)(a1 + 40) = v5;
      *(_QWORD *)(a1 + 48) = v6;
    }
  }
  else if ((*(_QWORD *)(a2 + 48) & 0xF000000000000000) == 0xF000000000000000)
  {
    outlined destroy of GPKUserID(a1 + 40);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  }
  else
  {
    v7 = *(_QWORD *)(a2 + 40);
    v8 = *(_QWORD *)(a2 + 48);
    outlined copy of Data._Representation(v7, v8);
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(_QWORD *)(a1 + 48);
    *(_QWORD *)(a1 + 40) = v7;
    *(_QWORD *)(a1 + 48) = v8;
    outlined consume of Data._Representation(v2, v3);
  }
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> __swift_memcpy56_8(void *a1, const void *a2)
{
  memcpy(a1, a2, 0x38uLL);
}

uint64_t assignWithTake for GPKUpdateGroupRequest.Member(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16) & 1;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32) & 1;
  if ((*(_QWORD *)(a1 + 48) & 0xF000000000000000) == 0xF000000000000000)
  {
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  }
  else if ((*(_QWORD *)(a2 + 48) & 0xF000000000000000) == 0xF000000000000000)
  {
    outlined destroy of GPKUserID(a1 + 40);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  }
  else
  {
    v2 = *(_QWORD *)(a2 + 48);
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 48) = v2;
    outlined consume of Data._Representation(v3, v4);
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for GPKUpdateGroupRequest.Member(uint64_t a1, int a2)
{
  int v3;
  int v4;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 56))
    {
      v4 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v3 = -1;
      if (!HIDWORD(*(_QWORD *)(a1 + 8)))
        v3 = *(_QWORD *)(a1 + 8);
      v4 = v3;
    }
  }
  else
  {
    v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for GPKUpdateGroupRequest.Member(uint64_t result, unsigned int a2, unsigned int a3)
{
  _BOOL4 v3;

  v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(_QWORD *)result = a2 + 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)(result + 32) = 0;
    *(_QWORD *)(result + 40) = 0;
    *(_QWORD *)(result + 48) = 0;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3)
        *(_BYTE *)(result + 56) = 1;
      else
        __break(1u);
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3)
        *(_BYTE *)(result + 56) = 0;
      else
        __break(1u);
    }
    if (a2)
      *(_QWORD *)(result + 8) = a2 - 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for GPKUpdateGroupRequest.Member()
{
  return &type metadata for GPKUpdateGroupRequest.Member;
}

uint64_t getEnumTagSinglePayload for GPKUpdateGroupRequest.Member.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v5;
  int v6;
  unsigned int v7;
  int v8;

  if (a2)
  {
    if (a2 <= 0xFB)
      goto LABEL_15;
    v7 = ((a2 + 4) >> 8) + 1;
    v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000)
        v2 = 4;
      else
        v2 = 2;
      v8 = v2;
    }
    if (v8 == 1)
      v6 = a1[1];
    else
      v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    if (v6)
    {
      v5 = (*a1 | ((v6 - 1) << 8)) + 251;
    }
    else
    {
LABEL_15:
      v3 = *a1 - 5;
      if (v3 < 0)
        v3 = -1;
      v5 = v3;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

_BYTE *storeEnumTagSinglePayload for GPKUpdateGroupRequest.Member.CodingKeys(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  v7 = 0;
  if (a3 > 0xFB)
  {
    v5 = ((a3 + 4) >> 8) + 1;
    v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000)
        v3 = 4;
      else
        v3 = 2;
      v6 = v3;
    }
    v7 = v6;
  }
  if (a2 > 0xFB)
  {
    v4 = ((a2 - 252) >> 8) + 1;
    *result = a2 + 4;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2)
      *result = a2 + 4;
  }
  return result;
}

uint64_t getEnumTag for GPKUpdateGroupRequest.Member.CodingKeys(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for GPKUpdateGroupRequest.Member.CodingKeys(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for GPKUpdateGroupRequest.Member.CodingKeys()
{
  return &type metadata for GPKUpdateGroupRequest.Member.CodingKeys;
}

uint64_t getEnumTagSinglePayload for GPKUpdateGroupRequest.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v5;
  int v6;
  unsigned int v7;
  int v8;

  if (a2)
  {
    if (a2 <= 0xF7)
      goto LABEL_15;
    v7 = ((a2 + 8) >> 8) + 1;
    v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000)
        v2 = 4;
      else
        v2 = 2;
      v8 = v2;
    }
    if (v8 == 1)
      v6 = a1[1];
    else
      v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    if (v6)
    {
      v5 = (*a1 | ((v6 - 1) << 8)) + 247;
    }
    else
    {
LABEL_15:
      v3 = *a1 - 9;
      if (v3 < 0)
        v3 = -1;
      v5 = v3;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

_BYTE *storeEnumTagSinglePayload for GPKUpdateGroupRequest.CodingKeys(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  v7 = 0;
  if (a3 > 0xF7)
  {
    v5 = ((a3 + 8) >> 8) + 1;
    v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000)
        v3 = 4;
      else
        v3 = 2;
      v6 = v3;
    }
    v7 = v6;
  }
  if (a2 > 0xF7)
  {
    v4 = ((a2 - 248) >> 8) + 1;
    *result = a2 + 8;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2)
      *result = a2 + 8;
  }
  return result;
}

uint64_t getEnumTag for GPKUpdateGroupRequest.CodingKeys(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for GPKUpdateGroupRequest.CodingKeys(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for GPKUpdateGroupRequest.CodingKeys()
{
  return &type metadata for GPKUpdateGroupRequest.CodingKeys;
}

unint64_t base witness table accessor for CustomDebugStringConvertible in GPKUpdateGroupRequest.Member.CodingKeys()
{
  return lazy protocol witness table accessor for type GPKUpdateGroupRequest.Member.CodingKeys and conformance GPKUpdateGroupRequest.Member.CodingKeys();
}

unint64_t base witness table accessor for CustomStringConvertible in GPKUpdateGroupRequest.Member.CodingKeys()
{
  return lazy protocol witness table accessor for type GPKUpdateGroupRequest.Member.CodingKeys and conformance GPKUpdateGroupRequest.Member.CodingKeys();
}

unint64_t base witness table accessor for Equatable in GPKUpdateGroupRequest.Member.CodingKeys()
{
  return lazy protocol witness table accessor for type GPKUpdateGroupRequest.Member.CodingKeys and conformance GPKUpdateGroupRequest.Member.CodingKeys();
}

uint64_t GPKGroup.__allocating_init(members:groupDomain:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v8;

  swift_bridgeObjectRetain();
  v8 = (*(uint64_t (**)(uint64_t))(v3 + 744))(a1);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_beginAccess();
  *(_QWORD *)(v8 + 48) = a2;
  *(_QWORD *)(v8 + 56) = a3;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v8;
}

Swift::Void __swiftcall GPKGroup.setValue(_:forKey:)(Swift::String_optional _, Swift::String forKey)
{
  uint64_t v2;
  void (*v5)(_BYTE *, _QWORD);
  _BYTE v6[32];
  Swift::String v7;
  Swift::String_optional v8;
  uint64_t v9;
  Swift::String v10;
  Swift::String_optional v11;

  v11 = _;
  v10 = forKey;
  v9 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8 = _;
  v7 = forKey;
  v5 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(void))(*(_QWORD *)v2 + 624))();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : String]);
  Dictionary.subscript.setter();
  v5(v6, 0);
}

Swift::String_optional __swiftcall GPKGroup.valueForKey(_:)(Swift::String a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  Swift::String_optional result;
  uint64_t v6;
  void *v7;
  _QWORD v8[2];
  uint64_t v9;
  Swift::String v10;

  v10 = a1;
  v9 = v1;
  v2 = swift_bridgeObjectRetain();
  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 608))(v2);
  MEMORY[0x24263250C](v8);
  outlined destroy of String();
  v6 = v8[0];
  v7 = (void *)v8[1];
  swift_bridgeObjectRelease();
  v3 = v6;
  v4 = v7;
  result.value._object = v4;
  result.value._countAndFlagsBits = v3;
  return result;
}

uint64_t GPKMember.canModifyMembers.getter()
{
  uint64_t v0;
  char v2;
  uint64_t v3;

  v3 = v0;
  (*(void (**)(char *__return_ptr))(*(_QWORD *)v0 + 184))(&v2);
  lazy protocol witness table accessor for type GPKMemberRole and conformance GPKMemberRole();
  return == infix<A>(_:_:)() & 1;
}

uint64_t GPKMember.__allocating_init(handle:role:inviteStatus:user:)(uint64_t a1, uint64_t a2, _BYTE *a3, char *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v9;
  char v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v17;
  uint64_t v18;
  char v20;
  char v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v24 = 0;
  v23 = 0;
  v22 = 0;
  v25 = a1;
  v26 = a2;
  v24 = *a3 & 1;
  v23 = *a4;
  v17 = v23;
  v22 = a5;
  swift_bridgeObjectRetain();
  v21 = v24;
  v18 = (*(uint64_t (**)(uint64_t, uint64_t, char *))(v5 + 408))(a1, a2, &v21);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v27 = v18;
  swift_beginAccess();
  *(_BYTE *)(v18 + 48) = v17;
  swift_endAccess();
  swift_release();
  swift_retain();
  if (a5)
  {
    v11 = *(_QWORD *)(a5 + 16);
    v12 = *(_QWORD *)(a5 + 24);
    outlined copy of Data._Representation(v11, v12);
    swift_release();
    v13 = v11;
    v14 = v12;
  }
  else
  {
    v13 = 0;
    v14 = 0xF000000000000000;
  }
  swift_beginAccess();
  v6 = *(_QWORD *)(v18 + 64);
  v7 = *(_QWORD *)(v18 + 72);
  *(_QWORD *)(v18 + 64) = v13;
  *(_QWORD *)(v18 + 72) = v14;
  outlined consume of GPKUserID?(v6, v7);
  swift_endAccess();
  swift_release();
  swift_retain();
  if (a5)
  {
    v9 = *(_BYTE *)(a5 + 40);
    swift_release();
    v10 = v9 & 1;
  }
  else
  {
    v10 = 2;
  }
  if (v10 == 2)
    v20 = 0;
  else
    v20 = v10 & 1;
  swift_beginAccess();
  *(_BYTE *)(v18 + 49) = v20 & 1;
  swift_endAccess();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return v18;
}

uint64_t GPKMember.__allocating_init(member:)(_BYTE *a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  _BYTE *v20;
  uint64_t v21;

  v17 = 0;
  v14 = 0;
  v20 = a1;
  GPKMemberRole.init(rawValue:)(*(_QWORD *)&a1[OBJC_IVAR____TtC8GroupKit19DatabaseParticipant_permission]);
  if (v19 == 2)
  {
    type metadata accessor for InternalError();
    v18 = 31;
    InternalError.__allocating_init(_:internalInfo:)(&v18, 0);
    swift_willThrow();
  }
  else
  {
    v17 = v19 & 1;
    GPKMember.InviteStatus.init(rawValue:)(*(_QWORD *)&a1[OBJC_IVAR____TtC8GroupKit19DatabaseParticipant_inviteStatus]);
    if (v16 != 6)
    {
      v14 = v16;
      v4 = *(_QWORD *)&a1[OBJC_IVAR____TtC8GroupKit19DatabaseParticipant_handle];
      v5 = *(_QWORD *)&a1[OBJC_IVAR____TtC8GroupKit19DatabaseParticipant_handle + 8];
      swift_bridgeObjectRetain();
      v13 = v19 & 1;
      v12 = v16;
      v9 = GPKMember.__allocating_init(handle:role:inviteStatus:user:)(v4, v5, &v13, &v12, 0);
      swift_retain();
      swift_retain();
      swift_retain();
      v21 = v9;
      v6 = *(_QWORD *)&a1[OBJC_IVAR____TtC8GroupKit19DatabaseParticipant_userID];
      v7 = *(_QWORD *)&a1[OBJC_IVAR____TtC8GroupKit19DatabaseParticipant_userID + 8];
      outlined copy of Data._Representation(v6, v7);
      swift_beginAccess();
      v1 = *(_QWORD *)(v9 + 64);
      v2 = *(_QWORD *)(v9 + 72);
      *(_QWORD *)(v9 + 64) = v6;
      *(_QWORD *)(v9 + 72) = v7;
      outlined consume of GPKUserID?(v1, v2);
      swift_endAccess();
      swift_release();
      v8 = a1[OBJC_IVAR____TtC8GroupKit19DatabaseParticipant_isMe];
      swift_beginAccess();
      *(_BYTE *)(v9 + 49) = v8 & 1;
      swift_endAccess();
      swift_release();

      swift_release();
      return v9;
    }
    type metadata accessor for InternalError();
    v15 = 32;
    InternalError.__allocating_init(_:internalInfo:)(&v15, 0);
    swift_willThrow();
  }

  return v10;
}

Swift::Void __swiftcall GPKMember.setHandle(_:)(Swift::String a1)
{
  uint64_t v1;

  swift_bridgeObjectRetain();
  (*(void (**)(uint64_t, void *))(*(_QWORD *)v1 + 168))(a1._countAndFlagsBits, a1._object);
}

Swift::Void __swiftcall GPKMember.setInviteStatus(_:)(GroupKit::GPKMember::InviteStatus a1)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  char v4;

  v4 = 0;
  v3 = 0;
  v4 = *(_BYTE *)a1;
  v3 = v1;
  v2 = v4;
  (*(void (**)(char *))(*(_QWORD *)v1 + 240))(&v2);
}

Swift::Void __swiftcall GPKMember.setIsMe(_:)(Swift::Bool a1)
{
  uint64_t v1;

  (*(void (**)(Swift::Bool))(*(_QWORD *)v1 + 264))(a1);
}

id static CachedGroup.fetchRequest()()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSFetchRequest);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("CachedGroup", 0xBuLL, 1);
  type metadata accessor for CachedGroup();
  return NSFetchRequest.__allocating_init(entityName:)();
}

id NSFetchRequest.__allocating_init(entityName:)()
{
  id v0;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return @nonobjc NSFetchRequest.init(entityName:)();
}

void key path getter for CachedGroup.clientModelVersion : CachedGroup(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id v2;
  int v3;
  id v4;

  v4 = *a1;
  v2 = *a1;
  objc_msgSend(v4, sel_clientModelVersion);
  *a2 = v3;

}

void key path setter for CachedGroup.clientModelVersion : CachedGroup(int *a1, id *a2)
{
  id v2;
  double v3;
  id v4;
  int v5;

  v5 = *a1;
  v4 = *a2;
  v2 = *a2;
  LODWORD(v3) = v5;
  objc_msgSend(v4, sel_setClientModelVersion_, v3);

}

void key path getter for CachedGroup.groupBlob : CachedGroup(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v9;
  id v10;

  v9 = *a1;
  v2 = *a1;
  v10 = objc_msgSend(v9, sel_groupBlob);
  if (v10)
  {
    v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v5 = v3;

    v6 = v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0xF000000000000000;
  }
  *a2 = v6;
  a2[1] = v7;

}

void key path setter for CachedGroup.groupBlob : CachedGroup(uint64_t *a1, id *a2)
{
  id v2;
  Class isa;
  Class v4;
  uint64_t v6;
  id v7;
  unint64_t v8;
  _QWORD v9[2];

  outlined init with copy of Data?(a1, (uint64_t)v9);
  v6 = v9[0];
  v8 = v9[1];
  v7 = *a2;
  v2 = *a2;
  if ((v8 & 0xF000000000000000) == 0xF000000000000000)
  {
    v4 = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data._Representation(v6, v8);
    v4 = isa;
  }
  objc_msgSend(v7, sel_setGroupBlob_);

}

void key path getter for CachedGroup.groupID : CachedGroup(uint64_t a1@<X0>, void *a2@<X8>)
{
  id *v2;
  id v3;
  id v4[2];
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v10 = a1;
  v6 = type metadata accessor for UUID();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v4 - v8;
  v11 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = (id *)MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v4 - v11;
  v13 = *v2;
  v3 = v13;
  v16 = v13;
  v14 = v13;
  v15 = objc_msgSend(v13, sel_groupID);
  if (v15)
  {
    v4[1] = v15;
    v4[0] = v15;
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v9, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v12, 0, 1, v6);

  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v12, 1, 1, v6);
  }
  outlined init with take of UUID?(v12, v5);

}

void key path setter for CachedGroup.groupID : CachedGroup(uint64_t a1, id *a2)
{
  const void *v2;
  id v3;
  id v4;
  Class isa;
  Class v6;
  uint64_t v7;
  unint64_t v8;
  id *v9;
  id v10;
  id v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v7 = a1;
  v9 = a2;
  v8 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?)
                              - 8)
                  + 64)
      + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = (const void *)MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v4 - v8;
  outlined init with copy of UUID?(v2, (char *)&v4 - v8);
  v10 = *v9;
  v3 = v10;
  v15 = v10;
  v11 = v10;
  v13 = type metadata accessor for UUID();
  v14 = *(_QWORD *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v14 + 48))(v12, 1) == 1)
  {
    v6 = 0;
  }
  else
  {
    isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v13);
    v6 = isa;
  }
  objc_msgSend(v11, sel_setGroupID_, v6);

}

void key path getter for CachedGroup.invitationGroupVersion : CachedGroup(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v2;
  id v3;

  v3 = *a1;
  v2 = *a1;
  *a2 = objc_msgSend(v3, sel_invitationGroupVersion);

}

void key path setter for CachedGroup.invitationGroupVersion : CachedGroup(uint64_t *a1, id *a2)
{
  id v2;
  id v3;
  uint64_t v4;

  v4 = *a1;
  v3 = *a2;
  v2 = *a2;
  objc_msgSend(v3, sel_setInvitationGroupVersion_, v4);

}

uint64_t protocol witness for Identifiable.id.getter in conformance CachedGroup@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for CachedGroup();
  result = Identifiable<>.id.getter();
  *a1 = result;
  return result;
}

uint64_t associated type witness table accessor for Identifiable.ID : Hashable in CachedGroup()
{
  return MEMORY[0x24BEE0948];
}

char *keypath_get_selector_clientModelVersion()
{
  return sel_clientModelVersion;
}

char *keypath_get_selector_groupBlob()
{
  return sel_groupBlob;
}

char *keypath_get_selector_groupID()
{
  return sel_groupID;
}

char *keypath_get_selector_invitationGroupVersion()
{
  return sel_invitationGroupVersion;
}

id @nonobjc NSFetchRequest.init(entityName:)()
{
  id v1;
  id v2;
  id v3;

  v2 = (id)MEMORY[0x242632560]();
  v3 = objc_msgSend(v1, sel_initWithEntityName_);

  swift_bridgeObjectRelease();
  return v3;
}

id static Group.fetchRequest()()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSFetchRequest);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Group", 5uLL, 1);
  type metadata accessor for Group();
  return NSFetchRequest.__allocating_init(entityName:)();
}

void key path getter for Group.clientModelVersion : Group(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id v2;
  int v3;
  id v4;

  v4 = *a1;
  v2 = *a1;
  objc_msgSend(v4, sel_clientModelVersion);
  *a2 = v3;

}

void key path setter for Group.clientModelVersion : Group(int *a1, id *a2)
{
  id v2;
  double v3;
  id v4;
  int v5;

  v5 = *a1;
  v4 = *a2;
  v2 = *a2;
  LODWORD(v3) = v5;
  objc_msgSend(v4, sel_setClientModelVersion_, v3);

}

void key path getter for Group.creationDate : Group(uint64_t a1@<X0>, void *a2@<X8>)
{
  id *v2;
  id v3;
  id v4[2];
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v10 = a1;
  v6 = type metadata accessor for Date();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v4 - v8;
  v11 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = (id *)MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v4 - v11;
  v13 = *v2;
  v3 = v13;
  v16 = v13;
  v14 = v13;
  v15 = objc_msgSend(v13, sel_creationDate);
  if (v15)
  {
    v4[1] = v15;
    v4[0] = v15;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v9, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v12, 0, 1, v6);

  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v12, 1, 1, v6);
  }
  outlined init with take of Date?(v12, v5);

}

void key path setter for Group.creationDate : Group(uint64_t a1, id *a2)
{
  const void *v2;
  id v3;
  id v4;
  Class isa;
  Class v6;
  uint64_t v7;
  unint64_t v8;
  id *v9;
  id v10;
  id v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v7 = a1;
  v9 = a2;
  v8 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?)
                              - 8)
                  + 64)
      + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = (const void *)MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v4 - v8;
  outlined init with copy of Date?(v2, (char *)&v4 - v8);
  v10 = *v9;
  v3 = v10;
  v15 = v10;
  v11 = v10;
  v13 = type metadata accessor for Date();
  v14 = *(_QWORD *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v14 + 48))(v12, 1) == 1)
  {
    v6 = 0;
  }
  else
  {
    isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v13);
    v6 = isa;
  }
  objc_msgSend(v11, sel_setCreationDate_, v6);

}

void key path getter for Group.dedupeID : Group(uint64_t a1@<X0>, void *a2@<X8>)
{
  id *v2;
  id v3;
  id v4[2];
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v10 = a1;
  v6 = type metadata accessor for UUID();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v4 - v8;
  v11 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = (id *)MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v4 - v11;
  v13 = *v2;
  v3 = v13;
  v16 = v13;
  v14 = v13;
  v15 = objc_msgSend(v13, sel_dedupeID);
  if (v15)
  {
    v4[1] = v15;
    v4[0] = v15;
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v9, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v12, 0, 1, v6);

  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v12, 1, 1, v6);
  }
  outlined init with take of UUID?(v12, v5);

}

void key path setter for Group.dedupeID : Group(uint64_t a1, id *a2)
{
  const void *v2;
  id v3;
  id v4;
  Class isa;
  Class v6;
  uint64_t v7;
  unint64_t v8;
  id *v9;
  id v10;
  id v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v7 = a1;
  v9 = a2;
  v8 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?)
                              - 8)
                  + 64)
      + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = (const void *)MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v4 - v8;
  outlined init with copy of UUID?(v2, (char *)&v4 - v8);
  v10 = *v9;
  v3 = v10;
  v15 = v10;
  v11 = v10;
  v13 = type metadata accessor for UUID();
  v14 = *(_QWORD *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v14 + 48))(v12, 1) == 1)
  {
    v6 = 0;
  }
  else
  {
    isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v13);
    v6 = isa;
  }
  objc_msgSend(v11, sel_setDedupeID_, v6);

}

void key path getter for Group.groupDomain : Group(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v9;
  id v10;

  v9 = *a1;
  v2 = *a1;
  v10 = objc_msgSend(v9, sel_groupDomain);
  if (v10)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v5 = v3;

    v6 = v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  *a2 = v6;
  a2[1] = v7;

}

void key path setter for Group.groupDomain : Group(_QWORD *a1, id *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[2];

  outlined init with copy of String?(a1, v9);
  v6 = v9[0];
  v8 = v9[1];
  v7 = *a2;
  v2 = *a2;
  if (v8)
  {
    v4 = MEMORY[0x242632560](v6);
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_setGroupDomain_, v4);
  }
  else
  {
    objc_msgSend(v7, sel_setGroupDomain_, 0);
  }

}

void key path getter for Group.groupID : Group(uint64_t a1@<X0>, void *a2@<X8>)
{
  id *v2;
  id v3;
  id v4[2];
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v10 = a1;
  v6 = type metadata accessor for UUID();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v4 - v8;
  v11 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = (id *)MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v4 - v11;
  v13 = *v2;
  v3 = v13;
  v16 = v13;
  v14 = v13;
  v15 = objc_msgSend(v13, sel_groupID);
  if (v15)
  {
    v4[1] = v15;
    v4[0] = v15;
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v9, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v12, 0, 1, v6);

  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v12, 1, 1, v6);
  }
  outlined init with take of UUID?(v12, v5);

}

void key path setter for Group.groupID : Group(uint64_t a1, id *a2)
{
  const void *v2;
  id v3;
  id v4;
  Class isa;
  Class v6;
  uint64_t v7;
  unint64_t v8;
  id *v9;
  id v10;
  id v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v7 = a1;
  v9 = a2;
  v8 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?)
                              - 8)
                  + 64)
      + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = (const void *)MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v4 - v8;
  outlined init with copy of UUID?(v2, (char *)&v4 - v8);
  v10 = *v9;
  v3 = v10;
  v15 = v10;
  v11 = v10;
  v13 = type metadata accessor for UUID();
  v14 = *(_QWORD *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v14 + 48))(v12, 1) == 1)
  {
    v6 = 0;
  }
  else
  {
    isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v13);
    v6 = isa;
  }
  objc_msgSend(v11, sel_setGroupID_, v6);

}

void key path getter for Group.groupMode : Group(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v2;
  id v3;

  v3 = *a1;
  v2 = *a1;
  *a2 = objc_msgSend(v3, sel_groupMode);

}

void key path setter for Group.groupMode : Group(uint64_t *a1, id *a2)
{
  id v2;
  id v3;
  uint64_t v4;

  v4 = *a1;
  v3 = *a2;
  v2 = *a2;
  objc_msgSend(v3, sel_setGroupMode_, v4);

}

void key path getter for Group.invitationBlob : Group(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v9;
  id v10;

  v9 = *a1;
  v2 = *a1;
  v10 = objc_msgSend(v9, sel_invitationBlob);
  if (v10)
  {
    v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v5 = v3;

    v6 = v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0xF000000000000000;
  }
  *a2 = v6;
  a2[1] = v7;

}

void key path setter for Group.invitationBlob : Group(uint64_t *a1, id *a2)
{
  id v2;
  Class isa;
  Class v4;
  uint64_t v6;
  id v7;
  unint64_t v8;
  _QWORD v9[2];

  outlined init with copy of Data?(a1, (uint64_t)v9);
  v6 = v9[0];
  v8 = v9[1];
  v7 = *a2;
  v2 = *a2;
  if ((v8 & 0xF000000000000000) == 0xF000000000000000)
  {
    v4 = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data._Representation(v6, v8);
    v4 = isa;
  }
  objc_msgSend(v7, sel_setInvitationBlob_);

}

void key path getter for Group.invitationID : Group(uint64_t a1@<X0>, void *a2@<X8>)
{
  id *v2;
  id v3;
  id v4[2];
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v10 = a1;
  v6 = type metadata accessor for UUID();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v4 - v8;
  v11 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = (id *)MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v4 - v11;
  v13 = *v2;
  v3 = v13;
  v16 = v13;
  v14 = v13;
  v15 = objc_msgSend(v13, sel_invitationID);
  if (v15)
  {
    v4[1] = v15;
    v4[0] = v15;
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v9, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v12, 0, 1, v6);

  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v12, 1, 1, v6);
  }
  outlined init with take of UUID?(v12, v5);

}

void key path setter for Group.invitationID : Group(uint64_t a1, id *a2)
{
  const void *v2;
  id v3;
  id v4;
  Class isa;
  Class v6;
  uint64_t v7;
  unint64_t v8;
  id *v9;
  id v10;
  id v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v7 = a1;
  v9 = a2;
  v8 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?)
                              - 8)
                  + 64)
      + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = (const void *)MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v4 - v8;
  outlined init with copy of UUID?(v2, (char *)&v4 - v8);
  v10 = *v9;
  v3 = v10;
  v15 = v10;
  v11 = v10;
  v13 = type metadata accessor for UUID();
  v14 = *(_QWORD *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v14 + 48))(v12, 1) == 1)
  {
    v6 = 0;
  }
  else
  {
    isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v13);
    v6 = isa;
  }
  objc_msgSend(v11, sel_setInvitationID_, v6);

}

void key path getter for Group.invitationSenderHandle : Group(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v9;
  id v10;

  v9 = *a1;
  v2 = *a1;
  v10 = objc_msgSend(v9, sel_invitationSenderHandle);
  if (v10)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v5 = v3;

    v6 = v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  *a2 = v6;
  a2[1] = v7;

}

void key path setter for Group.invitationSenderHandle : Group(_QWORD *a1, id *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[2];

  outlined init with copy of String?(a1, v9);
  v6 = v9[0];
  v8 = v9[1];
  v7 = *a2;
  v2 = *a2;
  if (v8)
  {
    v4 = MEMORY[0x242632560](v6);
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_setInvitationSenderHandle_, v4);
  }
  else
  {
    objc_msgSend(v7, sel_setInvitationSenderHandle_, 0);
  }

}

void key path getter for Group.joinState : Group(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v2;
  id v3;

  v3 = *a1;
  v2 = *a1;
  *a2 = objc_msgSend(v3, sel_joinState);

}

void key path setter for Group.joinState : Group(uint64_t *a1, id *a2)
{
  id v2;
  id v3;
  uint64_t v4;

  v4 = *a1;
  v3 = *a2;
  v2 = *a2;
  objc_msgSend(v3, sel_setJoinState_, v4);

}

void key path getter for Group.lastKnownRSVPQueueSeqNumber : Group(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v2;
  id v3;

  v3 = *a1;
  v2 = *a1;
  *a2 = objc_msgSend(v3, sel_lastKnownRSVPQueueSeqNumber);

}

void key path setter for Group.lastKnownRSVPQueueSeqNumber : Group(uint64_t *a1, id *a2)
{
  id v2;
  id v3;
  uint64_t v4;

  v4 = *a1;
  v3 = *a2;
  v2 = *a2;
  objc_msgSend(v3, sel_setLastKnownRSVPQueueSeqNumber_, v4);

}

void key path getter for Group.participants : Group(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v6;
  id v7;

  v6 = *a1;
  v2 = *a1;
  v7 = objc_msgSend(v6, sel_participants);
  if (v7)
  {
    type metadata accessor for DatabaseParticipant();
    v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    v4 = v3;
  }
  else
  {
    v4 = 0;
  }
  *a2 = v4;

}

void key path setter for Group.participants : Group(uint64_t *a1, id *a2)
{
  id v2;
  Class isa;
  Class v4;
  id v6;
  uint64_t v7;
  uint64_t v8;

  outlined init with copy of [DatabaseParticipant]?(a1, &v8);
  v7 = v8;
  v6 = *a2;
  v2 = *a2;
  if (v7)
  {
    type metadata accessor for DatabaseParticipant();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v4 = isa;
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v6, sel_setParticipants_);

}

void key path getter for Group.version : Group(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v2;
  id v3;

  v3 = *a1;
  v2 = *a1;
  *a2 = objc_msgSend(v3, sel_version);

}

void key path setter for Group.version : Group(uint64_t *a1, id *a2)
{
  id v2;
  id v3;
  uint64_t v4;

  v4 = *a1;
  v3 = *a2;
  v2 = *a2;
  objc_msgSend(v3, sel_setVersion_, v4);

}

uint64_t protocol witness for Identifiable.id.getter in conformance Group@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for Group();
  result = Identifiable<>.id.getter();
  *a1 = result;
  return result;
}

uint64_t associated type witness table accessor for Identifiable.ID : Hashable in Group()
{
  return MEMORY[0x24BEE0948];
}

char *keypath_get_selector_creationDate()
{
  return sel_creationDate;
}

char *keypath_get_selector_dedupeID()
{
  return sel_dedupeID;
}

char *keypath_get_selector_groupDomain()
{
  return sel_groupDomain;
}

char *keypath_get_selector_groupMode()
{
  return sel_groupMode;
}

char *keypath_get_selector_invitationBlob()
{
  return sel_invitationBlob;
}

char *keypath_get_selector_invitationID()
{
  return sel_invitationID;
}

char *keypath_get_selector_invitationSenderHandle()
{
  return sel_invitationSenderHandle;
}

char *keypath_get_selector_joinState()
{
  return sel_joinState;
}

char *keypath_get_selector_lastKnownRSVPQueueSeqNumber()
{
  return sel_lastKnownRSVPQueueSeqNumber;
}

char *keypath_get_selector_participants()
{
  return sel_participants;
}

char *keypath_get_selector_version()
{
  return sel_version;
}

_QWORD *outlined init with copy of [DatabaseParticipant]?(uint64_t *a1, _QWORD *a2)
{
  _QWORD *result;
  uint64_t v4;

  v4 = *a1;
  swift_bridgeObjectRetain();
  result = a2;
  *a2 = v4;
  return result;
}

void *outlined init with copy of Date?(const void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v6;
  uint64_t v7;

  v6 = type metadata accessor for Date();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

void *outlined init with take of Date?(const void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v6;
  uint64_t v7;

  v6 = type metadata accessor for Date();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a2, a1, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

id static Handle.fetchRequest()()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSFetchRequest);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Handle", 6uLL, 1);
  type metadata accessor for Handle();
  return NSFetchRequest.__allocating_init(entityName:)();
}

void key path getter for Handle.clientModelVersion : Handle(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id v2;
  int v3;
  id v4;

  v4 = *a1;
  v2 = *a1;
  objc_msgSend(v4, sel_clientModelVersion);
  *a2 = v3;

}

void key path setter for Handle.clientModelVersion : Handle(int *a1, id *a2)
{
  id v2;
  double v3;
  id v4;
  int v5;

  v5 = *a1;
  v4 = *a2;
  v2 = *a2;
  LODWORD(v3) = v5;
  objc_msgSend(v4, sel_setClientModelVersion_, v3);

}

void key path getter for Handle.handleString : Handle(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v9;
  id v10;

  v9 = *a1;
  v2 = *a1;
  v10 = objc_msgSend(v9, sel_handleString);
  if (v10)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v5 = v3;

    v6 = v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  *a2 = v6;
  a2[1] = v7;

}

void key path setter for Handle.handleString : Handle(_QWORD *a1, id *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[2];

  outlined init with copy of String?(a1, v9);
  v6 = v9[0];
  v8 = v9[1];
  v7 = *a2;
  v2 = *a2;
  if (v8)
  {
    v4 = MEMORY[0x242632560](v6);
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_setHandleString_, v4);
  }
  else
  {
    objc_msgSend(v7, sel_setHandleString_, 0);
  }

}

void key path getter for Handle.lastFetchDate : Handle(uint64_t a1@<X0>, void *a2@<X8>)
{
  id *v2;
  id v3;
  id v4[2];
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v10 = a1;
  v6 = type metadata accessor for Date();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v4 - v8;
  v11 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = (id *)MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v4 - v11;
  v13 = *v2;
  v3 = v13;
  v16 = v13;
  v14 = v13;
  v15 = objc_msgSend(v13, sel_lastFetchDate);
  if (v15)
  {
    v4[1] = v15;
    v4[0] = v15;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v9, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v12, 0, 1, v6);

  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v12, 1, 1, v6);
  }
  outlined init with take of Date?(v12, v5);

}

void key path setter for Handle.lastFetchDate : Handle(uint64_t a1, id *a2)
{
  const void *v2;
  id v3;
  id v4;
  Class isa;
  Class v6;
  uint64_t v7;
  unint64_t v8;
  id *v9;
  id v10;
  id v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v7 = a1;
  v9 = a2;
  v8 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?)
                              - 8)
                  + 64)
      + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = (const void *)MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v4 - v8;
  outlined init with copy of Date?(v2, (char *)&v4 - v8);
  v10 = *v9;
  v3 = v10;
  v15 = v10;
  v11 = v10;
  v13 = type metadata accessor for Date();
  v14 = *(_QWORD *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v14 + 48))(v12, 1) == 1)
  {
    v6 = 0;
  }
  else
  {
    isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v13);
    v6 = isa;
  }
  objc_msgSend(v11, sel_setLastFetchDate_, v6);

}

void key path getter for Handle.user : Handle(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v2;
  id v3;

  v3 = *a1;
  v2 = *a1;
  *a2 = objc_msgSend(v3, sel_user);

}

void key path setter for Handle.user : Handle(id *a1, id *a2)
{
  id v2;
  id v4;
  id v5;
  void *v6;

  outlined init with copy of User?(a1, &v6);
  v5 = v6;
  v4 = *a2;
  v2 = *a2;
  objc_msgSend(v4, sel_setUser_, v5);

}

uint64_t protocol witness for Identifiable.id.getter in conformance Handle@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for Handle();
  result = Identifiable<>.id.getter();
  *a1 = result;
  return result;
}

uint64_t associated type witness table accessor for Identifiable.ID : Hashable in Handle()
{
  return MEMORY[0x24BEE0948];
}

char *keypath_get_selector_handleString()
{
  return sel_handleString;
}

char *keypath_get_selector_lastFetchDate()
{
  return sel_lastFetchDate;
}

char *keypath_get_selector_user()
{
  return sel_user;
}

_QWORD *outlined init with copy of User?(id *a1, _QWORD *a2)
{
  id v2;
  _QWORD *result;
  id v4;

  v4 = *a1;
  v2 = *a1;
  result = a2;
  *a2 = v4;
  return result;
}

id static Invitation.fetchRequest()()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSFetchRequest);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Invitation", 0xAuLL, 1);
  type metadata accessor for Invitation();
  return NSFetchRequest.__allocating_init(entityName:)();
}

void key path getter for Invitation.clientModelVersion : Invitation(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id v2;
  int v3;
  id v4;

  v4 = *a1;
  v2 = *a1;
  objc_msgSend(v4, sel_clientModelVersion);
  *a2 = v3;

}

void key path setter for Invitation.clientModelVersion : Invitation(int *a1, id *a2)
{
  id v2;
  double v3;
  id v4;
  int v5;

  v5 = *a1;
  v4 = *a2;
  v2 = *a2;
  LODWORD(v3) = v5;
  objc_msgSend(v4, sel_setClientModelVersion_, v3);

}

void key path getter for Invitation.groupBlob : Invitation(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v9;
  id v10;

  v9 = *a1;
  v2 = *a1;
  v10 = objc_msgSend(v9, sel_groupBlob);
  if (v10)
  {
    v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v5 = v3;

    v6 = v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0xF000000000000000;
  }
  *a2 = v6;
  a2[1] = v7;

}

void key path setter for Invitation.groupBlob : Invitation(uint64_t *a1, id *a2)
{
  id v2;
  Class isa;
  Class v4;
  uint64_t v6;
  id v7;
  unint64_t v8;
  _QWORD v9[2];

  outlined init with copy of Data?(a1, (uint64_t)v9);
  v6 = v9[0];
  v8 = v9[1];
  v7 = *a2;
  v2 = *a2;
  if ((v8 & 0xF000000000000000) == 0xF000000000000000)
  {
    v4 = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data._Representation(v6, v8);
    v4 = isa;
  }
  objc_msgSend(v7, sel_setGroupBlob_);

}

void key path getter for Invitation.groupDomain : Invitation(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v9;
  id v10;

  v9 = *a1;
  v2 = *a1;
  v10 = objc_msgSend(v9, sel_groupDomain);
  if (v10)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v5 = v3;

    v6 = v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  *a2 = v6;
  a2[1] = v7;

}

void key path setter for Invitation.groupDomain : Invitation(_QWORD *a1, id *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[2];

  outlined init with copy of String?(a1, v9);
  v6 = v9[0];
  v8 = v9[1];
  v7 = *a2;
  v2 = *a2;
  if (v8)
  {
    v4 = MEMORY[0x242632560](v6);
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_setGroupDomain_, v4);
  }
  else
  {
    objc_msgSend(v7, sel_setGroupDomain_, 0);
  }

}

void key path getter for Invitation.groupID : Invitation(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v9;
  id v10;

  v9 = *a1;
  v2 = *a1;
  v10 = objc_msgSend(v9, sel_groupID);
  if (v10)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v5 = v3;

    v6 = v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  *a2 = v6;
  a2[1] = v7;

}

void key path setter for Invitation.groupID : Invitation(_QWORD *a1, id *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[2];

  outlined init with copy of String?(a1, v9);
  v6 = v9[0];
  v8 = v9[1];
  v7 = *a2;
  v2 = *a2;
  if (v8)
  {
    v4 = MEMORY[0x242632560](v6);
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_setGroupID_, v4);
  }
  else
  {
    objc_msgSend(v7, sel_setGroupID_, 0);
  }

}

void key path getter for Invitation.groupMode : Invitation(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v2;
  id v3;

  v3 = *a1;
  v2 = *a1;
  *a2 = objc_msgSend(v3, sel_groupMode);

}

void key path setter for Invitation.groupMode : Invitation(uint64_t *a1, id *a2)
{
  id v2;
  id v3;
  uint64_t v4;

  v4 = *a1;
  v3 = *a2;
  v2 = *a2;
  objc_msgSend(v3, sel_setGroupMode_, v4);

}

void key path getter for Invitation.invitationBlob : Invitation(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v9;
  id v10;

  v9 = *a1;
  v2 = *a1;
  v10 = objc_msgSend(v9, sel_invitationBlob);
  if (v10)
  {
    v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v5 = v3;

    v6 = v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0xF000000000000000;
  }
  *a2 = v6;
  a2[1] = v7;

}

void key path setter for Invitation.invitationBlob : Invitation(uint64_t *a1, id *a2)
{
  id v2;
  Class isa;
  Class v4;
  uint64_t v6;
  id v7;
  unint64_t v8;
  _QWORD v9[2];

  outlined init with copy of Data?(a1, (uint64_t)v9);
  v6 = v9[0];
  v8 = v9[1];
  v7 = *a2;
  v2 = *a2;
  if ((v8 & 0xF000000000000000) == 0xF000000000000000)
  {
    v4 = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data._Representation(v6, v8);
    v4 = isa;
  }
  objc_msgSend(v7, sel_setInvitationBlob_);

}

void key path getter for Invitation.invitationGroupVersion : Invitation(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v2;
  id v3;

  v3 = *a1;
  v2 = *a1;
  *a2 = objc_msgSend(v3, sel_invitationGroupVersion);

}

void key path setter for Invitation.invitationGroupVersion : Invitation(uint64_t *a1, id *a2)
{
  id v2;
  id v3;
  uint64_t v4;

  v4 = *a1;
  v3 = *a2;
  v2 = *a2;
  objc_msgSend(v3, sel_setInvitationGroupVersion_, v4);

}

void key path getter for Invitation.invitationID : Invitation(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v9;
  id v10;

  v9 = *a1;
  v2 = *a1;
  v10 = objc_msgSend(v9, sel_invitationID);
  if (v10)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v5 = v3;

    v6 = v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  *a2 = v6;
  a2[1] = v7;

}

void key path setter for Invitation.invitationID : Invitation(_QWORD *a1, id *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[2];

  outlined init with copy of String?(a1, v9);
  v6 = v9[0];
  v8 = v9[1];
  v7 = *a2;
  v2 = *a2;
  if (v8)
  {
    v4 = MEMORY[0x242632560](v6);
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_setInvitationID_, v4);
  }
  else
  {
    objc_msgSend(v7, sel_setInvitationID_, 0);
  }

}

void key path getter for Invitation.participants : Invitation(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v6;
  id v7;

  v6 = *a1;
  v2 = *a1;
  v7 = objc_msgSend(v6, sel_participants);
  if (v7)
  {
    type metadata accessor for DatabaseParticipant();
    v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    v4 = v3;
  }
  else
  {
    v4 = 0;
  }
  *a2 = v4;

}

void key path setter for Invitation.participants : Invitation(uint64_t *a1, id *a2)
{
  id v2;
  Class isa;
  Class v4;
  id v6;
  uint64_t v7;
  uint64_t v8;

  outlined init with copy of [DatabaseParticipant]?(a1, &v8);
  v7 = v8;
  v6 = *a2;
  v2 = *a2;
  if (v7)
  {
    type metadata accessor for DatabaseParticipant();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v4 = isa;
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v6, sel_setParticipants_);

}

void key path getter for Invitation.senderHandle : Invitation(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v9;
  id v10;

  v9 = *a1;
  v2 = *a1;
  v10 = objc_msgSend(v9, sel_senderHandle);
  if (v10)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v5 = v3;

    v6 = v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  *a2 = v6;
  a2[1] = v7;

}

void key path setter for Invitation.senderHandle : Invitation(_QWORD *a1, id *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[2];

  outlined init with copy of String?(a1, v9);
  v6 = v9[0];
  v8 = v9[1];
  v7 = *a2;
  v2 = *a2;
  if (v8)
  {
    v4 = MEMORY[0x242632560](v6);
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_setSenderHandle_, v4);
  }
  else
  {
    objc_msgSend(v7, sel_setSenderHandle_, 0);
  }

}

uint64_t protocol witness for Identifiable.id.getter in conformance Invitation@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for Invitation();
  result = Identifiable<>.id.getter();
  *a1 = result;
  return result;
}

uint64_t associated type witness table accessor for Identifiable.ID : Hashable in Invitation()
{
  return MEMORY[0x24BEE0948];
}

char *keypath_get_selector_senderHandle()
{
  return sel_senderHandle;
}

id static MetaData.fetchRequest()()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSFetchRequest);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("MetaData", 8uLL, 1);
  type metadata accessor for MetaData();
  return NSFetchRequest.__allocating_init(entityName:)();
}

void key path getter for MetaData.clientModelVersion : MetaData(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id v2;
  int v3;
  id v4;

  v4 = *a1;
  v2 = *a1;
  objc_msgSend(v4, sel_clientModelVersion);
  *a2 = v3;

}

void key path setter for MetaData.clientModelVersion : MetaData(int *a1, id *a2)
{
  id v2;
  double v3;
  id v4;
  int v5;

  v5 = *a1;
  v4 = *a2;
  v2 = *a2;
  LODWORD(v3) = v5;
  objc_msgSend(v4, sel_setClientModelVersion_, v3);

}

void key path getter for MetaData.groupID : MetaData(uint64_t a1@<X0>, void *a2@<X8>)
{
  id *v2;
  id v3;
  id v4[2];
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v10 = a1;
  v6 = type metadata accessor for UUID();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v4 - v8;
  v11 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = (id *)MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v4 - v11;
  v13 = *v2;
  v3 = v13;
  v16 = v13;
  v14 = v13;
  v15 = objc_msgSend(v13, sel_groupID);
  if (v15)
  {
    v4[1] = v15;
    v4[0] = v15;
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v9, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v12, 0, 1, v6);

  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v12, 1, 1, v6);
  }
  outlined init with take of UUID?(v12, v5);

}

void key path setter for MetaData.groupID : MetaData(uint64_t a1, id *a2)
{
  const void *v2;
  id v3;
  id v4;
  Class isa;
  Class v6;
  uint64_t v7;
  unint64_t v8;
  id *v9;
  id v10;
  id v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v7 = a1;
  v9 = a2;
  v8 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?)
                              - 8)
                  + 64)
      + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = (const void *)MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v4 - v8;
  outlined init with copy of UUID?(v2, (char *)&v4 - v8);
  v10 = *v9;
  v3 = v10;
  v15 = v10;
  v11 = v10;
  v13 = type metadata accessor for UUID();
  v14 = *(_QWORD *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v14 + 48))(v12, 1) == 1)
  {
    v6 = 0;
  }
  else
  {
    isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v13);
    v6 = isa;
  }
  objc_msgSend(v11, sel_setGroupID_, v6);

}

void key path getter for MetaData.key : MetaData(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v9;
  id v10;

  v9 = *a1;
  v2 = *a1;
  v10 = objc_msgSend(v9, sel_key);
  if (v10)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v5 = v3;

    v6 = v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  *a2 = v6;
  a2[1] = v7;

}

void key path setter for MetaData.key : MetaData(_QWORD *a1, id *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[2];

  outlined init with copy of String?(a1, v9);
  v6 = v9[0];
  v8 = v9[1];
  v7 = *a2;
  v2 = *a2;
  if (v8)
  {
    v4 = MEMORY[0x242632560](v6);
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_setKey_, v4);
  }
  else
  {
    objc_msgSend(v7, sel_setKey_, 0);
  }

}

void key path getter for MetaData.value : MetaData(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v9;
  id v10;

  v9 = *a1;
  v2 = *a1;
  v10 = objc_msgSend(v9, sel_value);
  if (v10)
  {
    v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v5 = v3;

    v6 = v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0xF000000000000000;
  }
  *a2 = v6;
  a2[1] = v7;

}

void key path setter for MetaData.value : MetaData(uint64_t *a1, id *a2)
{
  id v2;
  Class isa;
  Class v4;
  uint64_t v6;
  id v7;
  unint64_t v8;
  _QWORD v9[2];

  outlined init with copy of Data?(a1, (uint64_t)v9);
  v6 = v9[0];
  v8 = v9[1];
  v7 = *a2;
  v2 = *a2;
  if ((v8 & 0xF000000000000000) == 0xF000000000000000)
  {
    v4 = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data._Representation(v6, v8);
    v4 = isa;
  }
  objc_msgSend(v7, sel_setValue_);

}

void key path getter for MetaData.version : MetaData(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id v2;
  id v3;

  v3 = *a1;
  v2 = *a1;
  *a2 = objc_msgSend(v3, sel_version);

}

void key path setter for MetaData.version : MetaData(unsigned int *a1, id *a2)
{
  id v2;
  id v3;
  unsigned int v4;

  v4 = *a1;
  v3 = *a2;
  v2 = *a2;
  objc_msgSend(v3, sel_setVersion_, v4);

}

uint64_t protocol witness for Identifiable.id.getter in conformance MetaData@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for MetaData();
  result = Identifiable<>.id.getter();
  *a1 = result;
  return result;
}

uint64_t associated type witness table accessor for Identifiable.ID : Hashable in MetaData()
{
  return MEMORY[0x24BEE0948];
}

char *keypath_get_selector_key()
{
  return sel_key;
}

char *keypath_get_selector_value()
{
  return sel_value;
}

id static User.fetchRequest()()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSFetchRequest);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("User", 4uLL, 1);
  type metadata accessor for User();
  return NSFetchRequest.__allocating_init(entityName:)();
}

void key path getter for User.clientModelVersion : User(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id v2;
  int v3;
  id v4;

  v4 = *a1;
  v2 = *a1;
  objc_msgSend(v4, sel_clientModelVersion);
  *a2 = v3;

}

void key path setter for User.clientModelVersion : User(int *a1, id *a2)
{
  id v2;
  double v3;
  id v4;
  int v5;

  v5 = *a1;
  v4 = *a2;
  v2 = *a2;
  LODWORD(v3) = v5;
  objc_msgSend(v4, sel_setClientModelVersion_, v3);

}

void key path getter for User.isMe : User(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v2;
  id v3;

  v3 = *a1;
  v2 = *a1;
  objc_msgSend(v3, sel_isMe);
  *a2 = _convertObjCBoolToBool(_:)() & 1;

}

void key path setter for User.isMe : User(uint64_t a1, id *a2)
{
  id v2;
  id v3;

  v3 = *a2;
  v2 = *a2;
  objc_msgSend(v3, sel_setIsMe_, _convertBoolToObjCBool(_:)() & 1);

}

void key path getter for User.keyBlob : User(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v9;
  id v10;

  v9 = *a1;
  v2 = *a1;
  v10 = objc_msgSend(v9, sel_keyBlob);
  if (v10)
  {
    v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v5 = v3;

    v6 = v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0xF000000000000000;
  }
  *a2 = v6;
  a2[1] = v7;

}

void key path setter for User.keyBlob : User(uint64_t *a1, id *a2)
{
  id v2;
  Class isa;
  Class v4;
  uint64_t v6;
  id v7;
  unint64_t v8;
  _QWORD v9[2];

  outlined init with copy of Data?(a1, (uint64_t)v9);
  v6 = v9[0];
  v8 = v9[1];
  v7 = *a2;
  v2 = *a2;
  if ((v8 & 0xF000000000000000) == 0xF000000000000000)
  {
    v4 = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data._Representation(v6, v8);
    v4 = isa;
  }
  objc_msgSend(v7, sel_setKeyBlob_);

}

void key path getter for User.lastFetchDate : User(uint64_t a1@<X0>, void *a2@<X8>)
{
  id *v2;
  id v3;
  id v4[2];
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v10 = a1;
  v6 = type metadata accessor for Date();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v4 - v8;
  v11 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = (id *)MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v4 - v11;
  v13 = *v2;
  v3 = v13;
  v16 = v13;
  v14 = v13;
  v15 = objc_msgSend(v13, sel_lastFetchDate);
  if (v15)
  {
    v4[1] = v15;
    v4[0] = v15;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v9, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v12, 0, 1, v6);

  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v12, 1, 1, v6);
  }
  outlined init with take of Date?(v12, v5);

}

void key path setter for User.lastFetchDate : User(uint64_t a1, id *a2)
{
  const void *v2;
  id v3;
  id v4;
  Class isa;
  Class v6;
  uint64_t v7;
  unint64_t v8;
  id *v9;
  id v10;
  id v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v7 = a1;
  v9 = a2;
  v8 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?)
                              - 8)
                  + 64)
      + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = (const void *)MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v4 - v8;
  outlined init with copy of Date?(v2, (char *)&v4 - v8);
  v10 = *v9;
  v3 = v10;
  v15 = v10;
  v11 = v10;
  v13 = type metadata accessor for Date();
  v14 = *(_QWORD *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v14 + 48))(v12, 1) == 1)
  {
    v6 = 0;
  }
  else
  {
    isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v13);
    v6 = isa;
  }
  objc_msgSend(v11, sel_setLastFetchDate_, v6);

}

void key path getter for User.userID : User(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v9;
  id v10;

  v9 = *a1;
  v2 = *a1;
  v10 = objc_msgSend(v9, sel_userID);
  if (v10)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v5 = v3;

    v6 = v4;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  *a2 = v6;
  a2[1] = v7;

}

void key path setter for User.userID : User(_QWORD *a1, id *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[2];

  outlined init with copy of String?(a1, v9);
  v6 = v9[0];
  v8 = v9[1];
  v7 = *a2;
  v2 = *a2;
  if (v8)
  {
    v4 = MEMORY[0x242632560](v6);
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_setUserID_, v4);
  }
  else
  {
    objc_msgSend(v7, sel_setUserID_, 0);
  }

}

void key path getter for User.handles : User(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v2;
  id v3;

  v3 = *a1;
  v2 = *a1;
  *a2 = objc_msgSend(v3, sel_handles);

}

void key path setter for User.handles : User(id *a1, id *a2)
{
  id v2;
  id v4;
  id v5;
  void *v6;

  outlined init with copy of NSSet?(a1, &v6);
  v5 = v6;
  v4 = *a2;
  v2 = *a2;
  objc_msgSend(v4, sel_setHandles_, v5);

}

uint64_t protocol witness for Identifiable.id.getter in conformance User@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for User();
  result = Identifiable<>.id.getter();
  *a1 = result;
  return result;
}

uint64_t associated type witness table accessor for Identifiable.ID : Hashable in User()
{
  return MEMORY[0x24BEE0948];
}

char *keypath_get_selector_isMe()
{
  return sel_isMe;
}

char *keypath_get_selector_keyBlob()
{
  return sel_keyBlob;
}

char *keypath_get_selector_userID()
{
  return sel_userID;
}

char *keypath_get_selector_handles()
{
  return sel_handles;
}

_QWORD *outlined init with copy of NSSet?(id *a1, _QWORD *a2)
{
  id v2;
  _QWORD *result;
  id v4;

  v4 = *a1;
  v2 = *a1;
  result = a2;
  *a2 = v4;
  return result;
}

uint64_t dispatch thunk of LocalizedError.failureReason.getter()
{
  return MEMORY[0x24BDCBE40]();
}

uint64_t LocalizedError.helpAnchor.getter()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t LocalizedError.failureReason.getter()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t LocalizedError.recoverySuggestion.getter()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t type metadata accessor for PersonNameComponents()
{
  return MEMORY[0x24BDCCC10]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t Data.init(base64Encoded:options:)()
{
  return MEMORY[0x24BDCDC08]();
}

uint64_t Data.replaceSubrange(_:with:)()
{
  return MEMORY[0x24BDCDC70]();
}

uint64_t Data.hexString.getter()
{
  return MEMORY[0x24BDFC370]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x24BDCDCA0]();
}

Swift::String __swiftcall Data.base64EncodedString(options:)(NSDataBase64EncodingOptions options)
{
  uint64_t v1;
  void *v2;
  Swift::String result;

  v1 = MEMORY[0x24BDCDCA8](options);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t static Data.== infix(_:_:)()
{
  return MEMORY[0x24BDCDCC8]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t Data.init(bytes:count:)()
{
  return MEMORY[0x24BDCDD00]();
}

uint64_t Data.init(count:)()
{
  return MEMORY[0x24BDCDD08]();
}

uint64_t Data.count.getter()
{
  return MEMORY[0x24BDCDD10]();
}

uint64_t Data.append(_:)()
{
  return MEMORY[0x24BDCDD40]();
}

uint64_t Data.init()()
{
  return MEMORY[0x24BDCDDD0]();
}

uint64_t Data.init<A>(_:)()
{
  return MEMORY[0x24BDCDE68]();
}

uint64_t Date.description.getter()
{
  return MEMORY[0x24BDCE2D0]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x24BDCE5D8]();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t Date.init()()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t UUID.init(uuidString:)()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x24BDCE9B0]();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)MEMORY[0x24BDCE9D0]();
}

uint64_t static UUID.== infix(_:_:)()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t UUID.uuid.getter()
{
  return MEMORY[0x24BDCEA18]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t _convertBoolToObjCBool(_:)()
{
  return MEMORY[0x24BEE5B78]();
}

uint64_t _convertObjCBoolToBool(_:)()
{
  return MEMORY[0x24BEE5B80]();
}

uint64_t isFeatureEnabled(_:)()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t GroupID.rawValue.getter()
{
  return MEMORY[0x24BE3E738]();
}

uint64_t type metadata accessor for GroupID()
{
  return MEMORY[0x24BE3E740]();
}

uint64_t GroupID.init(_:)()
{
  return MEMORY[0x24BE3E748]();
}

uint64_t type metadata accessor for GroupRole()
{
  return MEMORY[0x24BE3E760]();
}

uint64_t GroupKitUserID.rawValue.getter()
{
  return MEMORY[0x24BE3E768]();
}

uint64_t type metadata accessor for GroupKitUserID()
{
  return MEMORY[0x24BE3E770]();
}

uint64_t GroupKitUserID.init(_:)()
{
  return MEMORY[0x24BE3E778]();
}

uint64_t XPCDecoder.__allocating_init()()
{
  return MEMORY[0x24BDFC390]();
}

uint64_t type metadata accessor for XPCDecoder()
{
  return MEMORY[0x24BDFC398]();
}

uint64_t XPCEncoder.__allocating_init()()
{
  return MEMORY[0x24BDFC3B0]();
}

uint64_t type metadata accessor for XPCEncoder()
{
  return MEMORY[0x24BDFC3B8]();
}

uint64_t MessageSender.__allocating_init<A, B, C>(encoder:decoder:transport:)()
{
  return MEMORY[0x24BDFC480]();
}

uint64_t type metadata accessor for MessageSender()
{
  return MEMORY[0x24BDFC488]();
}

uint64_t OSTransaction.__allocating_init(name:)()
{
  return MEMORY[0x24BDFC498]();
}

Swift::Void __swiftcall OSTransaction.complete()()
{
  MEMORY[0x24BDFC4B8]();
}

uint64_t type metadata accessor for OSTransaction()
{
  return MEMORY[0x24BDFC4C0]();
}

uint64_t dispatch thunk of SyncMessageSender.send<A>(_:)()
{
  return MEMORY[0x24BDFC588]();
}

uint64_t SyncMessageSender.__allocating_init<A, B, C>(encoder:decoder:transport:)()
{
  return MEMORY[0x24BDFC590]();
}

uint64_t type metadata accessor for SyncMessageSender()
{
  return MEMORY[0x24BDFC598]();
}

uint64_t dispatch thunk of BroadcastDispatcher.handleBroadcastMessage(_:)()
{
  return MEMORY[0x24BDFC5A8]();
}

uint64_t dispatch thunk of BroadcastDispatcher.registerHandler<A>(for:_:)()
{
  return MEMORY[0x24BDFC5B0]();
}

uint64_t BroadcastDispatcher.__allocating_init<A>(decoder:)()
{
  return MEMORY[0x24BDFC5B8]();
}

uint64_t UnknownStorage.traverse<A>(visitor:)()
{
  return MEMORY[0x24BE5BF00]();
}

uint64_t UnknownStorage.init()()
{
  return MEMORY[0x24BE5BF08]();
}

uint64_t type metadata accessor for UnknownStorage()
{
  return MEMORY[0x24BE5BF10]();
}

uint64_t BinaryDecodingOptions.init()()
{
  return MEMORY[0x24BE5BFC0]();
}

uint64_t type metadata accessor for BinaryDecodingOptions()
{
  return MEMORY[0x24BE5BFC8]();
}

uint64_t _MessageImplementationBase._protobuf_generated_isEqualTo(other:)()
{
  return MEMORY[0x24BE5C008]();
}

uint64_t _MessageImplementationBase.isEqualTo(message:)()
{
  return MEMORY[0x24BE5C010]();
}

uint64_t dispatch thunk of Decoder.nextFieldNumber()()
{
  return MEMORY[0x24BE5C038]();
}

uint64_t dispatch thunk of Decoder.decodeSingularBoolField(value:)()
{
  return MEMORY[0x24BE5C068]();
}

uint64_t dispatch thunk of Decoder.decodeSingularBytesField(value:)()
{
  return MEMORY[0x24BE5C0A8]();
}

uint64_t dispatch thunk of Decoder.decodeSingularInt64Field(value:)()
{
  return MEMORY[0x24BE5C0D8]();
}

uint64_t dispatch thunk of Decoder.decodeSingularStringField(value:)()
{
  return MEMORY[0x24BE5C120]();
}

uint64_t dispatch thunk of Decoder.decodeRepeatedMessageField<A>(value:)()
{
  return MEMORY[0x24BE5C148]();
}

uint64_t Message.isInitialized.getter()
{
  return MEMORY[0x24BE5C1B0]();
}

uint64_t Message.init(serializedData:extensions:partial:options:)()
{
  return MEMORY[0x24BE5C1B8]();
}

uint64_t Message.serializedData(partial:)()
{
  return MEMORY[0x24BE5C1C0]();
}

uint64_t Message.debugDescription.getter()
{
  return MEMORY[0x24BE5C1D0]();
}

uint64_t Message.hash(into:)()
{
  return MEMORY[0x24BE5C1E8]();
}

uint64_t static Message.with(_:)()
{
  return MEMORY[0x24BE5C1F0]();
}

uint64_t dispatch thunk of Visitor.visitSingularBoolField(value:fieldNumber:)()
{
  return MEMORY[0x24BE5C270]();
}

uint64_t dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)()
{
  return MEMORY[0x24BE5C298]();
}

uint64_t dispatch thunk of Visitor.visitSingularInt64Field(value:fieldNumber:)()
{
  return MEMORY[0x24BE5C2B0]();
}

uint64_t dispatch thunk of Visitor.visitSingularStringField(value:fieldNumber:)()
{
  return MEMORY[0x24BE5C2E8]();
}

uint64_t dispatch thunk of Visitor.visitRepeatedMessageField<A>(value:fieldNumber:)()
{
  return MEMORY[0x24BE5C300]();
}

uint64_t type metadata accessor for _NameMap.NameDescription()
{
  return MEMORY[0x24BE5C330]();
}

uint64_t _NameMap.init(dictionaryLiteral:)()
{
  return MEMORY[0x24BE5C340]();
}

uint64_t type metadata accessor for _NameMap()
{
  return MEMORY[0x24BE5C350]();
}

uint64_t os_signpost(_:dso:log:name:signpostID:_:_:)()
{
  return MEMORY[0x24BEE76F8]();
}

uint64_t OSSignpostID.init(log:)()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x24BEE7758]();
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

uint64_t Dictionary.init()()
{
  return MEMORY[0x24BEE01A8]();
}

Swift::String __swiftcall String.init()()
{
  uint64_t v0;
  void *v1;
  Swift::String result;

  v0 = MEMORY[0x24BEE01B0]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x24BDCF808]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t Dictionary.removeValue(forKey:)()
{
  return MEMORY[0x24BEE0278]();
}

uint64_t Dictionary.makeIterator()()
{
  return MEMORY[0x24BEE0288]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t Dictionary.init<A>(uniqueKeysWithValues:)()
{
  return MEMORY[0x24BEE02B8]();
}

uint64_t Dictionary.values.getter()
{
  return MEMORY[0x24BEE03E0]();
}

uint64_t Dictionary.isEmpty.getter()
{
  return MEMORY[0x24BEE03E8]();
}

uint64_t Dictionary.Iterator.next()()
{
  return MEMORY[0x24BEE03F0]();
}

uint64_t Dictionary<>.hashValue.getter()
{
  return MEMORY[0x24BEE0488]();
}

uint64_t Dictionary.subscript.getter()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t Dictionary.subscript.setter()
{
  return MEMORY[0x24BEE04B0]();
}

Swift::Int __swiftcall Hashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x24BEE0630](seed);
}

Swift::String __swiftcall Character.init(_builtinExtendedGraphemeClusterLiteral:utf8CodeUnitCount:isASCII:)(Builtin::RawPointer _builtinExtendedGraphemeClusterLiteral, Builtin::Word utf8CodeUnitCount, Builtin::Int1 isASCII)
{
  uint64_t v3;
  void *v4;
  Swift::String result;

  v3 = MEMORY[0x24BEE06D8](_builtinExtendedGraphemeClusterLiteral, utf8CodeUnitCount, isASCII);
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

uint64_t BidirectionalCollection.last.getter()
{
  return MEMORY[0x24BEE0780]();
}

uint64_t specialized BidirectionalCollection.reversed()()
{
  return MEMORY[0x24BEE5ED0]();
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

uint64_t String.init<A>(reflecting:)()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t String.startIndex.getter()
{
  return MEMORY[0x24BEE0A18]();
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t String.init(stringInterpolation:)()
{
  return MEMORY[0x24BEE0AE0]();
}

uint64_t static String.+ infix(_:_:)()
{
  return MEMORY[0x24BEE0AF0]();
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

uint64_t static String.== infix(_:_:)()
{
  return MEMORY[0x24BEE0B08]();
}

uint64_t static String.+= infix(_:_:)()
{
  return MEMORY[0x24BEE0B10]();
}

uint64_t String.utf8.getter()
{
  return MEMORY[0x24BEE0B28]();
}

uint64_t String.count.getter()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t String.index(_:offsetBy:)()
{
  return MEMORY[0x24BEE0B88]();
}

uint64_t String.insert(_:at:)()
{
  return MEMORY[0x24BEE0BD8]();
}

uint64_t String.isEmpty.getter()
{
  return MEMORY[0x24BEE0BF8]();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

Swift::String __swiftcall String.init(_:)(Swift::String a1)
{
  uint64_t v1;
  void *v2;
  Swift::String result;

  v1 = MEMORY[0x24BEE0DA0](a1._countAndFlagsBits, a1._object);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t String.init(_:)()
{
  return MEMORY[0x24BEE0DC0]();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t dispatch thunk of Sequence.underestimatedCount.getter()
{
  return MEMORY[0x24BEE0DF8]();
}

uint64_t Sequence.compactMap<A>(_:)()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t Sequence.first(where:)()
{
  return MEMORY[0x24BEE0E98]();
}

uint64_t Sequence.forEach(_:)()
{
  return MEMORY[0x24BEE0EE0]();
}

uint64_t Sequence<>.lexicographicallyPrecedes<A>(_:)()
{
  return MEMORY[0x24BEE0F00]();
}

uint64_t UnsignedInteger<>.init<A>(_:)()
{
  return MEMORY[0x24BEE0F48]();
}

uint64_t static RangeExpression.~= infix(_:_:)()
{
  return MEMORY[0x24BEE0FD0]();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return MEMORY[0x24BEE1000]();
}

{
  return MEMORY[0x24BEE1018]();
}

{
  return MEMORY[0x24BEE1040]();
}

uint64_t RawRepresentable<>.hashValue.getter()
{
  return MEMORY[0x24BEE1068]();
}

uint64_t RawRepresentable<>._rawHashValue(seed:)()
{
  return MEMORY[0x24BEE1070]();
}

uint64_t RawRepresentable<>.hash(into:)()
{
  return MEMORY[0x24BEE1078]();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return MEMORY[0x24BEE1080]();
}

{
  return MEMORY[0x24BEE1098]();
}

{
  return MEMORY[0x24BEE10C0]();
}

uint64_t SignedInteger<>.init<A>(_:)()
{
  return MEMORY[0x24BEE1108]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x24BDCFBA8]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t specialized Array.startIndex.getter()
{
  return MEMORY[0x24BEE5ED8]();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t Array.count.getter()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t specialized Array.count.getter()
{
  return MEMORY[0x24BEE5EF8]();
}

uint64_t Array.append(_:)()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t specialized Array.endIndex.getter()
{
  return MEMORY[0x24BEE5F18]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t static Array<A>.== infix(_:_:)()
{
  return MEMORY[0x24BEE1278]();
}

uint64_t Array.init<A>(_:)()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t Array.subscript.getter()
{
  return MEMORY[0x24BEE1290]();
}

uint64_t specialized Array.subscript.getter()
{
  return MEMORY[0x24BEE5F20]();
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

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)MEMORY[0x24BDCFCC0]();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t Set.subtracting(_:)()
{
  return MEMORY[0x24BEE15A8]();
}

uint64_t Set.subtracting<A>(_:)()
{
  return MEMORY[0x24BEE15B0]();
}

uint64_t Set.init(arrayLiteral:)()
{
  return MEMORY[0x24BEE15B8]();
}

uint64_t Set.makeIterator()()
{
  return MEMORY[0x24BEE15D0]();
}

uint64_t Set.count.getter()
{
  return MEMORY[0x24BEE1628]();
}

uint64_t Set.filter(_:)()
{
  return MEMORY[0x24BEE1640]();
}

uint64_t Set.insert(_:)()
{
  return MEMORY[0x24BEE1648]();
}

uint64_t Set.remove(at:)()
{
  return MEMORY[0x24BEE1650]();
}

uint64_t Set.remove(_:)()
{
  return MEMORY[0x24BEE1658]();
}

uint64_t Set.Iterator.next()()
{
  return MEMORY[0x24BEE1670]();
}

uint64_t Set.contains(_:)()
{
  return MEMORY[0x24BEE1690]();
}

uint64_t Set.hashValue.getter()
{
  return MEMORY[0x24BEE16C8]();
}

uint64_t Set.init<A>(_:)()
{
  return MEMORY[0x24BEE16F8]();
}

uint64_t Set.subscript.getter()
{
  return MEMORY[0x24BEE1738]();
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

uint64_t Collection<>.popFirst()()
{
  return MEMORY[0x24BEE1930]();
}

uint64_t Collection.firstIndex(where:)()
{
  return MEMORY[0x24BEE1938]();
}

uint64_t Collection.first.getter()
{
  return MEMORY[0x24BEE1980]();
}

uint64_t Collection.isEmpty.getter()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t Collection<>.split(separator:maxSplits:omittingEmptySubsequences:)()
{
  return MEMORY[0x24BEE1A08]();
}

uint64_t Collection<>.makeIterator()()
{
  return MEMORY[0x24BEE1A10]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t RangeReplaceableCollection<>.removeAll(where:)()
{
  return MEMORY[0x24BEE1B28]();
}

uint64_t NSPredicate.init(format:_:)()
{
  return MEMORY[0x24BDCFDD8]();
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

uint64_t NSManagedObjectContext.fetch<A>(_:)()
{
  return MEMORY[0x24BDBB390]();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return MEMORY[0x24BEE79A0]();
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

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t Substring.init(stringLiteral:)()
{
  return MEMORY[0x24BEE1D68]();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t type metadata accessor for ArraySlice()
{
  return MEMORY[0x24BEE2150]();
}

uint64_t ArraySlice.init<A>(_:)()
{
  return MEMORY[0x24BEE2168]();
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

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t _expectEnd<A>(of:is:)()
{
  return MEMORY[0x24BEE2378]();
}

uint64_t _hashValue<A>(for:)()
{
  return MEMORY[0x24BEE2380]();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t Identifiable<>.id.getter()
{
  return MEMORY[0x24BEE2578]();
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

uint64_t _ArrayProtocol.filter(_:)()
{
  return MEMORY[0x24BEE28C0]();
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

uint64_t _arrayForceCast<A, B>(_:)()
{
  return MEMORY[0x24BEE2BD8]();
}

uint64_t IndexingIterator.next()()
{
  return MEMORY[0x24BEE2BF8]();
}

uint64_t FixedWidthInteger.bigEndian.getter()
{
  return MEMORY[0x24BEE2DF0]();
}

uint64_t FixedWidthInteger.init<A>(_:radix:)()
{
  return MEMORY[0x24BEE2DF8]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t _dictionaryUpCast<A, B, C, D>(_:)()
{
  return MEMORY[0x24BEE2F60]();
}

uint64_t ReversedCollection.makeIterator()()
{
  return MEMORY[0x24BEE3010]();
}

uint64_t ReversedCollection.Iterator.next()()
{
  return MEMORY[0x24BEE3020]();
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

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x24BEE3350]();
}

{
  return MEMORY[0x24BEE3358]();
}

{
  return MEMORY[0x24BEE3370]();
}

{
  return MEMORY[0x24BEE33A0]();
}

{
  return MEMORY[0x24BEE33B8]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t type metadata accessor for KeyedDecodingContainer()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x24BEE34A0]();
}

{
  return MEMORY[0x24BEE34A8]();
}

{
  return MEMORY[0x24BEE34C0]();
}

{
  return MEMORY[0x24BEE34F0]();
}

{
  return MEMORY[0x24BEE3508]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t type metadata accessor for KeyedEncodingContainer()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x24BEE3930]();
}

{
  return MEMORY[0x24BEE3938]();
}

{
  return MEMORY[0x24BEE3940]();
}

Swift::Void __swiftcall DefaultStringInterpolation.appendLiteral(_:)(Swift::String a1)
{
  MEMORY[0x24BEE3948](a1._countAndFlagsBits, a1._object);
}

uint64_t DefaultStringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return MEMORY[0x24BEE3950]();
}

uint64_t _allocateUninitializedArray<A>(_:)()
{
  return MEMORY[0x24BEE3A18]();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.codingPath.getter()
{
  return MEMORY[0x24BEE3A50]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode(_:)()
{
  return MEMORY[0x24BEE3A58]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode(_:)()
{
  return MEMORY[0x24BEE3AF0]();
}

uint64_t == infix<A>(_:_:)()
{
  return MEMORY[0x24BEE3BB8]();
}

uint64_t === infix(_:_:)()
{
  return MEMORY[0x24BEE3DF0]();
}

uint64_t min<A>(_:_:)()
{
  return MEMORY[0x24BEE3E08]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x24BDD0708]();
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

uint64_t Hasher.combine<A>(_:)()
{
  return MEMORY[0x24BEE42F0]();
}

uint64_t type metadata accessor for Result()
{
  return MEMORY[0x24BEE4408]();
}

uint64_t stride<A>(from:to:by:)()
{
  return MEMORY[0x24BEE45C0]();
}

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return MEMORY[0x24BEE45F8]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return MEMORY[0x24BEE4628]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t type metadata accessor for KeyPath()
{
  return MEMORY[0x24BEE4698]();
}

uint64_t CodingKey.description.getter()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t CodingKey.debugDescription.getter()
{
  return MEMORY[0x24BEE4A10]();
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

uint64_t CUTWeakLinkClass()
{
  return MEMORY[0x24BE18E00]();
}

uint64_t CUTWeakLinkSymbol()
{
  return MEMORY[0x24BE18E08]();
}

uint64_t PCSIdentityCreateFromRaw()
{
  return MEMORY[0x24BE7ADB0]();
}

uint64_t PCSIdentitySetAddIdentity()
{
  return MEMORY[0x24BE7ADD0]();
}

uint64_t PCSIdentitySetCreateMutable()
{
  return MEMORY[0x24BE7ADF0]();
}

uint64_t PCSIdentitySetSetCurrentIdentity()
{
  return MEMORY[0x24BE7AE18]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializerInFile()
{
  return MEMORY[0x24BEE4B40]();
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
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

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x24BDAF4B0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
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

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
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

uint64_t swift_weakAssign()
{
  return MEMORY[0x24BEE5010]();
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

