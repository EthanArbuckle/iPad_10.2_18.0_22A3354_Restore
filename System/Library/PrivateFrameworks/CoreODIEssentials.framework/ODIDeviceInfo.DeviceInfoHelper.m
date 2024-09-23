@implementation ODIDeviceInfo.DeviceInfoHelper

- (_TtCC17CoreODIEssentials13ODIDeviceInfoP33_B07CCE03E02CC77E93497B1A0FAD96D316DeviceInfoHelper)init
{
  _TtCC17CoreODIEssentials13ODIDeviceInfoP33_B07CCE03E02CC77E93497B1A0FAD96D316DeviceInfoHelper *result;

  result = (_TtCC17CoreODIEssentials13ODIDeviceInfoP33_B07CCE03E02CC77E93497B1A0FAD96D316DeviceInfoHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy();
}

- (void)phoneNumberChanged:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  _TtCC17CoreODIEssentials13ODIDeviceInfoP33_B07CCE03E02CC77E93497B1A0FAD96D316DeviceInfoHelper *v12;
  id v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253EB5180);
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_20A5B8B64();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = self;
  v10[5] = a3;
  v11 = a3;
  v12 = self;
  v13 = v11;
  sub_20A4C6C74((uint64_t)v8, (uint64_t)&unk_2545FA8D8, (uint64_t)v10);

  swift_release();
}

@end
