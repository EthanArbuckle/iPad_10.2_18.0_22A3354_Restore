@implementation SiriNLUOverrideProxy

- (SiriNLUOverrideProxy)initWithUseTrie:(BOOL)a3 useMemory:(BOOL)a4
{
  SiriNLUOverrideProxy *result;

  OUTLINED_FUNCTION_28_18();
  OUTLINED_FUNCTION_60_0();
  return result;
}

- (BOOL)isOverrideStoreValid
{
  SiriNLUOverrideProxy *v2;
  char v3;
  char v4;

  v2 = self;
  sub_21A373D54();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)loadGlobalOverrideTrieStoreWithTrieFilePath:(id)a3
{
  BOOL result;

  sub_21A374150(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_21A373E88);
  return result;
}

- (BOOL)loadComponentOverrideTrieStoreWithTrieFilePath:(id)a3
{
  BOOL result;

  sub_21A374150(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_21A373F84);
  return result;
}

- (id)matchWithInputs:(id)a3 overrideNamespace:(int)a4
{
  unint64_t v5;
  SiriNLUOverrideProxy *v6;
  void *v7;
  void *v8;

  OUTLINED_FUNCTION_8_3((uint64_t)self, (unint64_t *)&unk_253E44680);
  v5 = OUTLINED_FUNCTION_30_14();
  v6 = self;
  sub_21A3743C0(v5);
  v8 = v7;

  OUTLINED_FUNCTION_70_0();
  return OUTLINED_FUNCTION_11_16(v8);
}

- (void)preheatWithLanguageCode:(id)a3
{
  uint64_t v4;
  SiriNLUOverrideProxy *v5;

  v4 = sub_21A450644();
  v5 = self;
  sub_21A374A78(v4);

  swift_bridgeObjectRelease();
}

- (id)matchWithInputs:(id)a3 shouldAppend:(BOOL *)a4
{
  unint64_t v6;
  SiriNLUOverrideProxy *v7;
  uint64_t v8;
  void *v9;

  OUTLINED_FUNCTION_8_3((uint64_t)self, (unint64_t *)&unk_253E44680);
  v6 = OUTLINED_FUNCTION_30_14();
  v7 = self;
  sub_21A374C6C(v6, a4);

  v8 = OUTLINED_FUNCTION_70_0();
  OUTLINED_FUNCTION_8_3(v8, &qword_253E427C0);
  v9 = (void *)sub_21A450830();
  OUTLINED_FUNCTION_3_2();
  return OUTLINED_FUNCTION_11_16(v9);
}

- (SiriNLUOverrideProxy)init
{
  SiriNLUOverrideProxy.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
