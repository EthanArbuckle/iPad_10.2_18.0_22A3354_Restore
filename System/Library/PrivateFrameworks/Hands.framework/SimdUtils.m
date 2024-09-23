@implementation SimdUtils

+ (void)printSimdFloat4x4:(__n128)a3
{
  float v4;
  unint64_t v5;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a1.n128_u64[1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f %f %f %f"), a1.n128_f32[0], a2.n128_f32[0], a3.n128_f32[0], a4.n128_f32[0], a1.n128_u64[0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HandyLoggerNeo logAtLevel:withPrivacy:withLogArea:inFile:onLine:message:](_TtC5Hands14HandyLoggerNeo, "logAtLevel:withPrivacy:withLogArea:inFile:onLine:message:", 2, 1, CFSTR("Default"), CFSTR("/Library/Caches/com.apple.xbs/Sources/Hands/HandsKit/HandsKitData/HandsKitIO/SimdObjects.mm"), 18);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f %f %f %f"), v4, a2.n128_f32[1], a3.n128_f32[1], a4.n128_f32[1]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HandyLoggerNeo logAtLevel:withPrivacy:withLogArea:inFile:onLine:message:](_TtC5Hands14HandyLoggerNeo, "logAtLevel:withPrivacy:withLogArea:inFile:onLine:message:", 2, 1, CFSTR("Default"), CFSTR("/Library/Caches/com.apple.xbs/Sources/Hands/HandsKit/HandsKitData/HandsKitIO/SimdObjects.mm"), 19);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f %f %f %f"), *(float *)&v5, a2.n128_f32[2], a3.n128_f32[2], a4.n128_f32[2]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HandyLoggerNeo logAtLevel:withPrivacy:withLogArea:inFile:onLine:message:](_TtC5Hands14HandyLoggerNeo, "logAtLevel:withPrivacy:withLogArea:inFile:onLine:message:", 2, 1, CFSTR("Default"), CFSTR("/Library/Caches/com.apple.xbs/Sources/Hands/HandsKit/HandsKitData/HandsKitIO/SimdObjects.mm"), 20);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f %f %f %f"), *((float *)&v5 + 1), a2.n128_f32[3], a3.n128_f32[3], a4.n128_f32[3]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HandyLoggerNeo logAtLevel:withPrivacy:withLogArea:inFile:onLine:message:](_TtC5Hands14HandyLoggerNeo, "logAtLevel:withPrivacy:withLogArea:inFile:onLine:message:", 2, 1, CFSTR("Default"), CFSTR("/Library/Caches/com.apple.xbs/Sources/Hands/HandsKit/HandsKitData/HandsKitIO/SimdObjects.mm"), 21);

}

+ (uint64_t)isSimdFloat4x4Nan:
{
  uint64_t i;
  int j;

  for (i = 0; i != 4; ++i)
  {
    for (j = 0; j != 4; ++j)
      ;
  }
  return 0;
}

@end
