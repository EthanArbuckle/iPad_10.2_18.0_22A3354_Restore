@implementation NHOHomeUserCapabilities

- (BOOL)shouldShowElectricity
{
  char v2;
  NHOHomeUserCapabilities *v3;

  if ((*((_BYTE *)&self->super.isa + OBJC_IVAR___NHOHomeUserCapabilities_isOnboarded) & 1) != 0
    || *((_BYTE *)&self->super.isa + OBJC_IVAR___NHOHomeUserCapabilities_hasMockData) == 1)
  {
    v2 = 1;
  }
  else
  {
    v3 = self;
    v2 = sub_24295C6C0();

  }
  return v2 & 1;
}

+ (BOOL)currentLocationEnergyForecastEnabled
{
  return sub_24295DC44(0xD000000000000024, 0x8000000242966D40) & 1;
}

- (BOOL)energyForecastEnabled
{
  return sub_24295DC44(0xD000000000000015, 0x8000000242966DE0) & 1;
}

- (BOOL)restrictedGuest
{
  NHOHomeUserCapabilities *v2;
  char v3;

  v2 = self;
  v3 = sub_24295C6C0();

  return v3 & 1;
}

- (NHOHomeUserCapabilities)initWithHome:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  NHOHomeUserCapabilities *v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  NHOHomeUserCapabilities *v11;
  objc_super v13;

  v4 = OBJC_IVAR___NHOHomeUserCapabilities_logger;
  v5 = qword_257207740;
  v6 = (objc_class *)a3;
  v7 = self;
  if (v5 != -1)
    swift_once();
  v8 = sub_2429639D4();
  v9 = __swift_project_value_buffer(v8, (uint64_t)qword_257207B70);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))((char *)v7 + v4, v9, v8);
  *((_BYTE *)&v7->super.isa + OBJC_IVAR___NHOHomeUserCapabilities_isOnboarded) = 0;
  *((_BYTE *)&v7->super.isa + OBJC_IVAR___NHOHomeUserCapabilities_hasMockData) = 0;
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR___NHOHomeUserCapabilities_home) = v6;
  v10 = v6;

  v13.receiver = v7;
  v13.super_class = (Class)type metadata accessor for NHOHomeUserCapabilities();
  v11 = -[NHOHomeUserCapabilities init](&v13, sel_init);

  return v11;
}

- (void)updateCapabilitiesWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  NHOHomeUserCapabilities *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207E20);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_242963B90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2572081B0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2572081C0;
  v12[5] = v11;
  v13 = self;
  sub_24295D498((uint64_t)v7, (uint64_t)&unk_2572081D0, (uint64_t)v12);
  swift_release();
}

- (NHOHomeUserCapabilities)init
{
  NHOHomeUserCapabilities *result;

  result = (NHOHomeUserCapabilities *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___NHOHomeUserCapabilities_logger;
  v4 = sub_2429639D4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

@end
