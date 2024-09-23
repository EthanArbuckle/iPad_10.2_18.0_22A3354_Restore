@implementation CDMClientNotification

- (void)processCDMNluRequestErrorCallback:(id)a3 error:(id)a4
{
  id v6;
  _TtC13CDMFoundation21CDMClientNotification *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_21A315A6C();

  OUTLINED_FUNCTION_152_0(v8);
}

- (void)processCDMNluRequestCallback:(id)a3
{
  id v4;
  _TtC13CDMFoundation21CDMClientNotification *v5;

  v4 = a3;
  v5 = self;
  sub_21A315EEC();

  OUTLINED_FUNCTION_152_0(v5);
}

- (void)assetsAvailable
{
  _TtC13CDMFoundation21CDMClientNotification *v2;

  v2 = self;
  sub_21A316258();
  OUTLINED_FUNCTION_20_8(v2);
}

- (void)assetsAvailableForLocale:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  _TtC13CDMFoundation21CDMClientNotification *v7;

  OUTLINED_FUNCTION_22_3();
  OUTLINED_FUNCTION_73();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_137_1();
  v7 = self;
  sub_21A316294();

  OUTLINED_FUNCTION_46_5(v3, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  OUTLINED_FUNCTION_62_0();
}

- (void)assetsUnavailable
{
  _TtC13CDMFoundation21CDMClientNotification *v2;

  v2 = self;
  sub_21A316494();
  OUTLINED_FUNCTION_20_8(v2);
}

- (void)assetsAvailableForLocale:(id)a3 withType:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  _TtC13CDMFoundation21CDMClientNotification *v8;

  OUTLINED_FUNCTION_22_3();
  OUTLINED_FUNCTION_73();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_137_1();
  v8 = self;
  sub_21A3165B0();

  OUTLINED_FUNCTION_46_5(v4, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  OUTLINED_FUNCTION_62_0();
}

- (void)assetsUnavailableWithType:(int64_t)a3
{
  _TtC13CDMFoundation21CDMClientNotification *v3;

  v3 = self;
  sub_21A3167B0();
  OUTLINED_FUNCTION_20_8(v3);
}

- (_TtC13CDMFoundation21CDMClientNotification)init
{
  _TtC13CDMFoundation21CDMClientNotification *result;

  sub_21A3168AC();
  OUTLINED_FUNCTION_60_0();
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy();
}

@end
