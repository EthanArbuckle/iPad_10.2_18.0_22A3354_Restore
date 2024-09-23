@implementation NFCTagReaderSessionDelegateSwiftWrapper

- (void)tagReaderSessionDidBecomeActive:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  void (*v8)(id, uint64_t, uint64_t);
  id v9;
  _TtC7CoreNFC39NFCTagReaderSessionDelegateSwiftWrapper *v10;

  v5 = (char *)self + OBJC_IVAR____TtC7CoreNFC39NFCTagReaderSessionDelegateSwiftWrapper_swiftDelegate;
  if (MEMORY[0x2199EE174]((char *)self + OBJC_IVAR____TtC7CoreNFC39NFCTagReaderSessionDelegateSwiftWrapper_swiftDelegate, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    v8 = *(void (**)(id, uint64_t, uint64_t))(v6 + 8);
    v9 = a3;
    v10 = self;
    v8(v9, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (void)tagReaderSession:(id)a3 didInvalidateWithError:(id)a4
{
  char *v7;
  uint64_t v8;
  uint64_t ObjectType;
  void (*v10)(id, id, uint64_t, uint64_t);
  id v11;
  id v12;
  _TtC7CoreNFC39NFCTagReaderSessionDelegateSwiftWrapper *v13;

  v7 = (char *)self + OBJC_IVAR____TtC7CoreNFC39NFCTagReaderSessionDelegateSwiftWrapper_swiftDelegate;
  if (MEMORY[0x2199EE174]((char *)self + OBJC_IVAR____TtC7CoreNFC39NFCTagReaderSessionDelegateSwiftWrapper_swiftDelegate, a2))
  {
    v8 = *((_QWORD *)v7 + 1);
    ObjectType = swift_getObjectType();
    v10 = *(void (**)(id, id, uint64_t, uint64_t))(v8 + 16);
    v11 = a3;
    v12 = a4;
    v13 = self;
    v10(v11, v12, ObjectType, v8);

    swift_unknownObjectRelease();
  }
}

- (void)tagReaderSession:(id)a3 didDetectTags:(id)a4
{
  unint64_t v6;
  id v7;
  _TtC7CoreNFC39NFCTagReaderSessionDelegateSwiftWrapper *v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFB650);
  v6 = sub_215BFACA4();
  v7 = a3;
  v8 = self;
  sub_215BE7338((unint64_t)v7, v6);

  swift_bridgeObjectRelease();
}

- (_TtC7CoreNFC39NFCTagReaderSessionDelegateSwiftWrapper)init
{
  _TtC7CoreNFC39NFCTagReaderSessionDelegateSwiftWrapper *result;

  result = (_TtC7CoreNFC39NFCTagReaderSessionDelegateSwiftWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_215BE7940((uint64_t)self + OBJC_IVAR____TtC7CoreNFC39NFCTagReaderSessionDelegateSwiftWrapper_swiftDelegate);
}

@end
