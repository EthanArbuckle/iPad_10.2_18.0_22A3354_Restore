@implementation NTKBundleComplicationMigrationTypeLookupGenerator

+ (void)generateLookupUsingService:(NTKBundleComplicationMigrationService *)a3 device:(CLKDevice *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NTKBundleComplicationMigrationService *v19;
  CLKDevice *v20;
  uint64_t v21;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF171E48);
  MEMORY[0x1E0C80A78](v9, v10, v11);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a5);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = v14;
  v15[5] = a1;
  v16 = sub_1B752FDFC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1EF171FF0;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EF171E60;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  sub_1B751FFCC((uint64_t)v13, (uint64_t)&unk_1EF171E68, (uint64_t)v18);
  swift_release();
}

- (NTKBundleComplicationMigrationTypeLookupGenerator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKBundleComplicationMigrationTypeLookupGenerator;
  return -[NTKBundleComplicationMigrationTypeLookupGenerator init](&v3, sel_init);
}

@end
