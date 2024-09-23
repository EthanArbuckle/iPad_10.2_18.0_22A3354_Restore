@implementation AMSBagUnderlyingData

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___AMSBagUnderlyingData_expirationDate;
  v4 = OUTLINED_FUNCTION_142();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (NSDate)expirationDate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v8;

  v2 = sub_18CEC14E0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  BagUnderlyingData.expirationDate.getter((uint64_t)v5);
  v6 = (void *)sub_18CEC1480();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSDate *)v6;
}

- (NSSet)aliasKeys
{
  void *v2;

  BagUnderlyingData.aliasKeys.getter();
  v2 = (void *)sub_18CEC1B40();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (AMSBagUnderlyingData)initWithFileKey:(id)a3 aliasKeys:(id)a4 bagDictionary:(id)a5 expirationDate:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v7 = sub_18CEC14E0();
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_18CEC181C();
  v12 = v11;
  v13 = sub_18CEC1B4C();
  sub_18CEC14A4();
  return (AMSBagUnderlyingData *)BagUnderlyingData.init(fileKey:aliasKeys:bagDictionary:expirationDate:)(v10, v12, v13, (uint64_t)a5, (uint64_t)v9);
}

- (NSDictionary)bagDictionary
{
  return (NSDictionary *)BagUnderlyingData.bagDictionary.getter();
}

- (NSString)fileKey
{
  void *v2;

  BagUnderlyingData.fileKey.getter();
  v2 = (void *)sub_18CEC17F8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (AMSBagUnderlyingData)init
{
  BagUnderlyingData.init()();
}

@end
