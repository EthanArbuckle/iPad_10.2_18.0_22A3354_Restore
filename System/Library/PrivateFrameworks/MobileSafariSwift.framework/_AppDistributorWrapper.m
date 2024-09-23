@implementation _AppDistributorWrapper

+ (void)handlePunchoutWithBundleID:(NSString *)a3 adamID:(NSNumber *)a4 externalVersionID:(NSNumber *)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NSString *v19;
  NSNumber *v20;
  NSNumber *v21;
  uint64_t v22;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1A470);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = a1;
  v16 = sub_1D7FB6F58();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1F0161EA0;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1F0161EB0;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  sub_1D7FB40EC((uint64_t)v13, (uint64_t)&unk_1F0161EC0, (uint64_t)v18);
  swift_release();
}

- (_AppDistributorWrapper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppDistributorWrapper();
  return -[_AppDistributorWrapper init](&v3, sel_init);
}

@end
