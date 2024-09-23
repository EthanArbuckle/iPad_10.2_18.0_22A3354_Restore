@implementation AMSBagUnderlyingDataPersistence

- (id)underlyingDataFor:(id)a3 error:(id *)a4
{
  AMSBagUnderlyingDataPersistence *v5;
  void *v6;

  sub_18CEC181C();
  v5 = self;
  v6 = (void *)BagUnderlyingDataPersistence.underlyingData(for:)();
  swift_bridgeObjectRelease();

  return v6;
}

- (BOOL)persist:(id)a3 error:(id *)a4
{
  id v5;
  AMSBagUnderlyingDataPersistence *v6;

  v5 = a3;
  v6 = self;
  BagUnderlyingDataPersistence.persist(_:)();

  return 1;
}

+ (id)persistenceWithDefaultDirectory
{
  id v2;

  swift_getObjCClassMetadata();
  static BagUnderlyingDataPersistence.persistenceWithDefaultDirectory()();
  return v2;
}

- (AMSBagUnderlyingDataPersistence)initWithDirectoryURL:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  AMSBagUnderlyingDataPersistence *result;
  uint64_t v7;

  v3 = sub_18CEC142C();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18CEC13C0();
  BagUnderlyingDataPersistence.init(directoryURL:)(v5);
  return result;
}

- (BOOL)removeUnderlyingDataFor:(id)a3 error:(id *)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  AMSBagUnderlyingDataPersistence *v9;
  Swift::String v10;
  void *v11;
  void *v12;
  id v13;

  v6 = sub_18CEC181C();
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  BagUnderlyingDataPersistence.removeUnderlyingData(for:)(v10);
  swift_bridgeObjectRelease();

  if (v11)
  {
    if (a4)
    {
      v12 = (void *)sub_18CEC1354();

      v13 = v12;
      *a4 = v12;
    }
    else
    {

    }
  }
  return v11 == 0;
}

- (AMSBagUnderlyingDataPersistence)init
{
  BagUnderlyingDataPersistence.init()();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___AMSBagUnderlyingDataPersistence_directoryURL;
  v3 = OUTLINED_FUNCTION_69();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
