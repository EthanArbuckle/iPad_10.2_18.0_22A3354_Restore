@implementation FIUIWheelchairStatusProvider

- (void)wheelchairUseCharacteristicCache:(id)a3 wheelchairUsageDidChange:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B74B98);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_213106430();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v10 = swift_allocObject();
  swift_weakInit();
  sub_213106418();
  v11 = a3;
  swift_retain();
  swift_retain();
  v12 = sub_21310640C();
  v13 = swift_allocObject();
  v14 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v13 + 16) = v12;
  *(_QWORD *)(v13 + 24) = v14;
  *(_QWORD *)(v13 + 32) = v10;
  *(_BYTE *)(v13 + 40) = a4;
  swift_release();
  sub_2130C7398((uint64_t)v8, (uint64_t)&unk_254B74D30, v13);

  swift_release();
  swift_release();
}

@end
