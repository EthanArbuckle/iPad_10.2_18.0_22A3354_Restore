@implementation _NSFileManagerBridge

- (_NSFileManagerBridge)initWithFileManager:(id)a3
{
  objc_class *ObjectType;
  _NSFileManagerBridge *v5;
  objc_super v7;
  _BYTE v8[16];
  _BYTE v9[16];

  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  outlined init with take of _FileManagerImpl((uint64_t)v8, (uint64_t)v9);
  swift_unknownObjectWeakAssign();
  outlined init with copy of _FileManagerImpl((uint64_t)v9, (uint64_t)self + OBJC_IVAR____NSFileManagerBridge__impl);
  v7.receiver = self;
  v7.super_class = ObjectType;
  v5 = -[_NSFileManagerBridge init](&v7, sel_init);
  outlined destroy of _FileManagerImpl((uint64_t)v9);
  return v5;
}

- (id)urlsFor:(unint64_t)a3 in:(unint64_t)a4
{
  unint64_t v6;
  _NSFileManagerBridge *v7;

  v6 = a4 & 0xC0F;
  *(_BYTE *)(swift_allocObject() + 16) = 1;
  v7 = self;
  specialized _copySequenceToContiguousArray<A>(_:)(a3, v6, (void (*)(uint64_t *__return_ptr, _QWORD *))partial apply for closure #1 in _SearchPathURLs(for:in:expandTilde:));

  swift_release();
  return (id)_ContiguousArrayBuffer._asCocoaArray()();
}

- (id)urlFor:(unint64_t)a3 in:(unint64_t)a4 appropriateFor:(id)a5 create:(BOOL)a6 error:(id *)a7
{
  void *countAndFlagsBits;
  void *object;
  void *v13;
  _NSFileManagerBridge *v14;
  void *v15;
  id v17[3];
  Swift::String v18;
  void *v19;

  if (a5)
  {
    URL.init(reference:)(a5, &v18);
    countAndFlagsBits = (void *)v18._countAndFlagsBits;
    object = v18._object;
    v13 = v19;
  }
  else
  {
    countAndFlagsBits = 0;
    object = 0;
    v13 = 0;
  }
  v17[0] = countAndFlagsBits;
  v17[1] = object;
  v17[2] = v13;
  v14 = self;
  _FileManagerImpl.url(for:in:appropriateFor:create:)(a3, a4, v17, a6, &v18);
  outlined consume of URL?(countAndFlagsBits);

  v15 = (void *)v18._countAndFlagsBits;
  swift_release();
  swift_release();
  return v15;
}

- (BOOL)getRelationship:(int64_t *)a3 ofDirectoryAt:(id)a4 toItemAt:(id)a5 error:(id *)a6
{
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _NSFileManagerBridge *v15;
  id v17[3];
  id v18;
  void *v19;
  void *v20;

  URL.init(reference:)(a4, &v18);
  v10 = v18;
  v9 = v19;
  v11 = v20;
  URL.init(reference:)(a5, &v18);
  v13 = v18;
  v12 = v19;
  v14 = v20;
  v18 = v10;
  v19 = v9;
  v20 = v11;
  v17[0] = v13;
  v17[1] = v12;
  v17[2] = v14;
  v15 = self;
  _FileManagerImpl.getRelationship(_:ofDirectoryAt:toItemAt:)(a3, &v18, v17);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return 1;
}

- (BOOL)getRelationship:(int64_t *)a3 of:(unint64_t)a4 in:(unint64_t)a5 toItemAt:(id)a6 error:(id *)a7
{
  void *v11;
  _NSFileManagerBridge *v12;
  void *v14;

  URL.init(reference:)(a6, &v14);
  v11 = v14;
  v12 = self;
  _FileManagerImpl.getRelationship(_:of:in:toItemAt:)((uint64_t)a3, a4, a5, &v14);

  swift_release();
  swift_release();
  return 1;
}

- (BOOL)createDirectoryAt:(id)a3 withIntermediateDirectories:(BOOL)a4 attributes:(id)a5 error:(id *)a6
{
  _BOOL4 v7;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _NSFileManagerBridge *v12;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  v7 = a4;
  URL.init(reference:)(a3, &v14);
  v10 = v14;
  v9 = v15;
  v11 = v16;
  if (a5)
    a5 = (id)specialized static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v14 = v10;
  v15 = v9;
  v16 = v11;
  v12 = self;
  _FileManagerImpl.createDirectory(at:withIntermediateDirectories:attributes:)((uint64_t)&v14, v7, (uint64_t)a5);

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)createSymbolicLinkAt:(id)a3 withDestinationURL:(id)a4 error:(id *)a5
{
  return @objc _NSFileManagerBridge.createSymbolicLink(at:withDestinationURL:)(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(void **, _QWORD *))_FileManagerImpl.createSymbolicLink(at:withDestinationURL:));
}

- (BOOL)setAttributes:(id)a3 ofItemAtPath:(id)a4 error:(id *)a5
{
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  _NSFileManagerBridge *v12;
  Swift::String v13;
  void *v14;
  void *v15;
  id v16;

  v8 = specialized static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;
  v12 = self;
  v13._countAndFlagsBits = (uint64_t)v9;
  v13._object = v11;
  _FileManagerImpl.setAttributes(_:ofItemAtPath:)((Swift::OpaquePointer)v8, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (v14)
  {
    if (a5)
    {
      v15 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v16 = v15;
      *a5 = v15;
    }
    else
    {

    }
  }
  return v14 == 0;
}

- (BOOL)createDirectoryAtPath:(id)a3 withIntermediateDirectories:(BOOL)a4 attributes:(id)a5 error:(id *)a6
{
  id v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void *v15;
  _NSFileManagerBridge *v16;
  BOOL result;
  _QWORD v18[4];
  BOOL v19;
  uint64_t v20;
  char *v21;

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  if (a5)
    v12 = specialized static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5);
  else
    v12 = 0;
  v13 = (char *)self + OBJC_IVAR____NSFileManagerBridge__impl;
  v14 = MEMORY[0x186DA9F5C]((char *)self + OBJC_IVAR____NSFileManagerBridge__impl);
  if (v14)
  {
    v15 = (void *)v14;
    MEMORY[0x1E0C80A78](v14);
    v18[2] = v9;
    v18[3] = v11;
    v19 = a4;
    v20 = v12;
    v21 = v13;
    v16 = self;
    specialized NSFileManager.withFileSystemRepresentation<A>(for:_:)((uint64_t)v9, v11, (uint64_t (*)(char *))partial apply for closure #1 in _FileManagerImpl.createDirectory(atPath:withIntermediateDirectories:attributes:), (uint64_t)v18);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

- (id)contentsOfDirectoryAtPath:(id)a3 error:(id *)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  _NSFileManagerBridge *v8;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v8 = self;
  specialized _NSFileManagerBridge.contentsOfDirectory(atPath:)((uint64_t)v5, v7);
  swift_bridgeObjectRelease();

  return (id)_ContiguousArrayBuffer._asCocoaArray()();
}

- (id)subpathsOfDirectoryAtPath:(id)a3 error:(id *)a4
{
  id v5;
  __int128 *v6;
  __int128 *v7;
  _NSFileManagerBridge *v8;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  swift_bridgeObjectRetain();
  v8 = self;
  specialized String.withFileSystemRepresentation<A>(_:)((unint64_t)v5, (unint64_t)v7, (uint64_t)v5, v7);
  swift_bridgeObjectRelease();

  return (id)_ContiguousArrayBuffer._asCocoaArray()();
}

- (id)attributesOfItemAtPath:(id)a3 error:(id *)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  _NSFileManagerBridge *v11;
  id result;
  _QWORD v13[5];

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v8 = (char *)self + OBJC_IVAR____NSFileManagerBridge__impl;
  v9 = MEMORY[0x186DA9F5C]((char *)self + OBJC_IVAR____NSFileManagerBridge__impl);
  if (v9)
  {
    v10 = (void *)v9;
    MEMORY[0x1E0C80A78](v9);
    v13[2] = v5;
    v13[3] = v7;
    v13[4] = v8;
    v11 = self;
    specialized NSFileManager.withFileSystemRepresentation<A>(for:_:)((uint64_t)v5, v7, (void (*)(char *))partial apply for closure #1 in _FileManagerImpl.attributesOfItem(atPath:), (uint64_t)v13);
    swift_bridgeObjectRelease();

    type metadata accessor for NSFileAttributeKey(0);
    lazy protocol witness table accessor for type NSFileAttributeKey and conformance NSFileAttributeKey();
    return (id)_NativeDictionary.bridged()();
  }
  else
  {
    result = (id)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

- (id)attributesOfFileSystemForPath:(id)a3 error:(id *)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  _NSFileManagerBridge *v10;
  id result;
  _QWORD v12[6];

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v8 = MEMORY[0x186DA9F5C]((char *)self + OBJC_IVAR____NSFileManagerBridge__impl);
  if (v8)
  {
    v9 = (void *)v8;
    MEMORY[0x1E0C80A78](v8);
    v12[2] = v5;
    v12[3] = v7;
    v10 = self;
    specialized NSFileManager.withFileSystemRepresentation<A>(for:_:)((uint64_t)v5, v7, (void (*)(char *))partial apply for closure #1 in _FileManagerImpl.attributesOfFileSystem(forPath:), (uint64_t)v12);
    swift_bridgeObjectRelease();

    type metadata accessor for NSFileAttributeKey(0);
    lazy protocol witness table accessor for type NSFileAttributeKey and conformance NSFileAttributeKey();
    return (id)_NativeDictionary.bridged()();
  }
  else
  {
    result = (id)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

- (BOOL)createSymbolicLinkAtPath:(id)a3 withDestinationPath:(id)a4 error:(id *)a5
{
  id v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void *v15;
  _NSFileManagerBridge *v16;
  BOOL result;
  _QWORD v18[7];

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = v11;
  v13 = (char *)self + OBJC_IVAR____NSFileManagerBridge__impl;
  v14 = MEMORY[0x186DA9F5C]((char *)self + OBJC_IVAR____NSFileManagerBridge__impl);
  if (v14)
  {
    v15 = (void *)v14;
    MEMORY[0x1E0C80A78](v14);
    v18[2] = v7;
    v18[3] = v9;
    v18[4] = v13;
    v18[5] = v10;
    v18[6] = v12;
    v16 = self;
    specialized NSFileManager.withFileSystemRepresentation<A>(for:_:)((uint64_t)v7, v9, (uint64_t (*)(char *))partial apply for closure #1 in _FileManagerImpl.createSymbolicLink(atPath:withDestinationPath:), (uint64_t)v18);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return 1;
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

- (id)destinationOfSymbolicLinkAtPath:(id)a3 error:(id *)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  _NSFileManagerBridge *v11;
  void *v12;
  id result;
  _QWORD v14[5];

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v8 = (char *)self + OBJC_IVAR____NSFileManagerBridge__impl;
  v9 = MEMORY[0x186DA9F5C]((char *)self + OBJC_IVAR____NSFileManagerBridge__impl);
  if (v9)
  {
    v10 = (void *)v9;
    MEMORY[0x1E0C80A78](v9);
    v14[2] = v5;
    v14[3] = v7;
    v14[4] = v8;
    v11 = self;
    specialized NSFileManager.withFileSystemRepresentation<A>(for:_:)((uint64_t)v5, v7, (void (*)(char *))partial apply for closure #1 in _FileManagerImpl.destinationOfSymbolicLink(atPath:), (uint64_t)v14);
    swift_bridgeObjectRelease();

    v12 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
    return v12;
  }
  else
  {
    result = (id)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

- (BOOL)copyItemAtPath:(id)a3 toPath:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  int v6;
  id v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _NSFileManagerBridge *v15;

  v6 = a5;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = v13;
  v15 = self;
  _FileManagerImpl.copyItem(atPath:toPath:options:)((uint64_t)v9, v11, (uint64_t)v12, v14, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)moveItemAtPath:(id)a3 toPath:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  _NSFileManagerBridge *v14;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;
  v14 = self;
  specialized _FileManagerImpl.moveItem(atPath:toPath:options:)((uint64_t)v8, v10, (uint64_t)v11, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)linkItemAtPath:(id)a3 toPath:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _NSFileManagerBridge *v14;
  Swift::String v15;
  Swift::String v16;
  void *v17;
  void *v18;
  id v19;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;
  v14 = self;
  v15._countAndFlagsBits = (uint64_t)v8;
  v15._object = v10;
  v16._countAndFlagsBits = (uint64_t)v11;
  v16._object = v13;
  _FileManagerImpl.linkItem(atPath:toPath:)(v15, v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (v17)
  {
    if (a5)
    {
      v18 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v19 = v18;
      *a5 = v18;
    }
    else
    {

    }
  }
  return v17 == 0;
}

- (BOOL)removeItemAtPath:(id)a3 error:(id *)a4
{
  id v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _NSFileManagerBridge *v11;
  BOOL result;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v8 = MEMORY[0x186DA9F5C]((char *)self + OBJC_IVAR____NSFileManagerBridge__impl);
  if (v8)
  {
    v9 = (void *)v8;
    swift_bridgeObjectRetain();
    v10 = v9;
    v11 = self;
    specialized String.withFileSystemRepresentation<A>(_:)((uint64_t)v5, (unint64_t)v7, (uint64_t)v5, v7, (__int128 *)v9);
    swift_bridgeObjectRelease();

    return 1;
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

- (BOOL)copyItemAt:(id)a3 to:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _NSFileManagerBridge *v15;
  _QWORD v17[3];
  void *v18;
  uint64_t v19;
  uint64_t v20;

  URL.init(reference:)(a3, &v18);
  v10 = v18;
  v9 = v19;
  v11 = v20;
  URL.init(reference:)(a4, &v18);
  v12 = v18;
  v13 = v19;
  v14 = v20;
  v18 = v10;
  v19 = v9;
  v20 = v11;
  v17[0] = v12;
  v17[1] = v13;
  v17[2] = v14;
  v15 = self;
  _FileManagerImpl.copyItem(at:to:options:)((uint64_t)&v18, (uint64_t)v17, a5);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return 1;
}

- (BOOL)moveItemAt:(id)a3 to:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _NSFileManagerBridge *v14;
  _QWORD v16[3];
  void *v17;
  uint64_t v18;
  uint64_t v19;

  URL.init(reference:)(a3, &v17);
  v9 = v17;
  v8 = v18;
  v10 = v19;
  URL.init(reference:)(a4, &v17);
  v12 = v17;
  v11 = v18;
  v13 = v19;
  v17 = v9;
  v18 = v8;
  v19 = v10;
  v16[0] = v12;
  v16[1] = v11;
  v16[2] = v13;
  v14 = self;
  specialized _FileManagerImpl.moveItem(at:to:options:)((uint64_t)&v17, (uint64_t)v16);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return 1;
}

- (BOOL)linkItemAt:(id)a3 to:(id)a4 error:(id *)a5
{
  return @objc _NSFileManagerBridge.createSymbolicLink(at:withDestinationURL:)(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(void **, _QWORD *))_FileManagerImpl.linkItem(at:to:));
}

- (BOOL)removeItemAt:(id)a3 error:(id *)a4
{
  void *v5;
  _NSFileManagerBridge *v6;
  void *v8;

  URL.init(reference:)(a3, &v8);
  v5 = v8;
  v6 = self;
  _FileManagerImpl.removeItem(at:)((uint64_t)&v8);

  swift_release();
  swift_release();
  return 1;
}

- (NSString)currentDirectoryPath
{
  _NSFileManagerBridge *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  _FileManagerImpl.currentDirectoryPath.getter();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (BOOL)changeCurrentDirectoryPath:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  _NSFileManagerBridge *v9;
  char v10;
  BOOL result;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = MEMORY[0x186DA9F5C]((char *)self + OBJC_IVAR____NSFileManagerBridge__impl);
  if (v7)
  {
    v8 = (void *)v7;
    v9 = self;
    v10 = specialized NSFileManager.withFileSystemRepresentation<A>(for:_:)((uint64_t)v4, v6, (void (*)(_BYTE *))closure #1 in _FileManagerImpl.changeCurrentDirectoryPath(_:), 0);

    swift_bridgeObjectRelease();
    return v10 & 1;
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

- (BOOL)fileExistsAtPath:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  _NSFileManagerBridge *v7;
  char v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8 = _FileManagerImpl._fileExists(_:)((uint64_t)v4, v6);

  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (BOOL)fileExistsAtPath:(id)a3 isDirectory:(BOOL *)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  _NSFileManagerBridge *v9;
  __int16 v10;
  char v11;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = self;
  v10 = _FileManagerImpl._fileExists(_:)((uint64_t)v6, v8);
  v11 = v10;
  if ((v10 & 1) != 0 && a4)
    *a4 = HIBYTE(v10) & 1;

  swift_bridgeObjectRelease();
  return v11 & 1;
}

- (BOOL)isReadableFileAtPath:(id)a3
{
  return @objc _NSFileManagerBridge.isReadableFile(atPath:)(self, (uint64_t)a2, a3, 4);
}

- (BOOL)isWritableFileAtPath:(id)a3
{
  return @objc _NSFileManagerBridge.isReadableFile(atPath:)(self, (uint64_t)a2, a3, 2);
}

- (BOOL)isExecutableFileAtPath:(id)a3
{
  return @objc _NSFileManagerBridge.isReadableFile(atPath:)(self, (uint64_t)a2, a3, 1);
}

- (BOOL)isDeletableFileAtPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _NSFileManagerBridge *v7;
  Swift::String v8;
  Swift::Bool v9;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = (uint64_t)v4;
  v8._object = v6;
  v9 = _FileManagerImpl.isDeletableFile(atPath:)(v8);

  swift_bridgeObjectRelease();
  return v9;
}

- (BOOL)contentsEqualAtPath:(id)a3 andPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _NSFileManagerBridge *v12;
  Swift::String v13;
  Swift::String v14;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = (uint64_t)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;
  v12 = self;
  v13._countAndFlagsBits = (uint64_t)v6;
  v13._object = v8;
  v14._countAndFlagsBits = v9;
  v14._object = v11;
  LOBYTE(v9) = _FileManagerImpl.contentsEqual(atPath:andPath:)(v13, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

- (id)displayNameAtPath:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  _NSFileManagerBridge *v7;
  void *v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  specialized _NSFileManagerBridge.displayName(atPath:)((uint64_t)v4, v6);

  swift_bridgeObjectRelease();
  v8 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return v8;
}

- (id)contentsAtPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  _NSFileManagerBridge *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  Class isa;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8 = specialized _NSFileManagerBridge.contents(atPath:)((uint64_t)v4, v6);
  v10 = v9;

  swift_bridgeObjectRelease();
  if (v10 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    isa = Data._Representation.bridgedReference()().super.isa;
    outlined consume of Data?(v8, v10);
  }
  return isa;
}

- (BOOL)createFileAtPath:(id)a3 contents:(id)a4 attributes:(id)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  _NSFileManagerBridge *v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char v17;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  v11 = a5;
  v12 = self;
  if (!a4)
  {
    v15 = 0xF000000000000000;
    if (v11)
      goto LABEL_3;
LABEL_5:
    v16 = 0;
    goto LABEL_6;
  }
  v13 = a4;
  a4 = specialized Data.init(referencing:)(v13);
  v15 = v14;

  if (!v11)
    goto LABEL_5;
LABEL_3:
  v16 = specialized static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5);

LABEL_6:
  v17 = _NSFileManagerBridge.createFile(atPath:contents:attributes:)((uint64_t)v8, v10, (uint64_t)a4, v15, v16);
  swift_bridgeObjectRelease();
  outlined consume of Data?((uint64_t)a4, v15);

  swift_bridgeObjectRelease();
  return v17 & 1;
}

- (id)stringWithFileSystemRepresentation:(const char *)a3 length:(int64_t)a4
{
  _NSFileManagerBridge *v4;
  void *v5;

  v4 = self;
  static String._fromUTF8Repairing(_:)();

  v5 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return v5;
}

- (NSURL)homeDirectoryForCurrentUser
{
  _NSFileManagerBridge *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  _QWORD v7[3];
  unsigned __int8 v8;
  void *v9;

  v2 = self;
  v3 = static String.homeDirectoryPath(forUser:)(0, 0);
  v8 = 0;
  memset(v7, 0, sizeof(v7));
  URL.init(filePath:directoryHint:relativeTo:)(v3, v4, &v8, (uint64_t)v7, (uint64_t *)&v9);

  v5 = v9;
  swift_release();
  swift_release();
  return (NSURL *)v5;
}

- (NSURL)temporaryDirectory
{
  _NSFileManagerBridge *v2;
  uint64_t v3;
  unint64_t v4;
  void *v5;
  _QWORD v7[3];
  unsigned __int8 v8;
  void *v9;

  v2 = self;
  v3 = static String.temporaryDirectoryPath.getter();
  v8 = 0;
  memset(v7, 0, sizeof(v7));
  URL.init(filePath:directoryHint:relativeTo:)(v3, v4, &v8, (uint64_t)v7, (uint64_t *)&v9);

  v5 = v9;
  swift_release();
  swift_release();
  return (NSURL *)v5;
}

- (id)homeDirectoryForUser:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  _NSFileManagerBridge *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  _QWORD v12[3];
  unsigned __int8 v13;
  void *v14;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8 = static String.homeDirectoryPath(forUser:)((uint64_t)v4, v6);
  v13 = 0;
  memset(v12, 0, sizeof(v12));
  URL.init(filePath:directoryHint:relativeTo:)(v8, v9, &v13, (uint64_t)v12, (uint64_t *)&v14);

  swift_bridgeObjectRelease();
  v10 = v14;
  swift_release();
  swift_release();
  return v10;
}

- (_NSFileManagerBridge)init
{
  _NSFileManagerBridge *result;

  result = (_NSFileManagerBridge *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of _FileManagerImpl((uint64_t)self + OBJC_IVAR____NSFileManagerBridge__impl);
}

@end
