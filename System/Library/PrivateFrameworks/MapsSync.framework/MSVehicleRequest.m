@implementation MSVehicleRequest

- (MSVehicleRequest)init
{
  if (qword_1ED1AB880 != -1)
    swift_once();
  return -[MSVehicleRequest initWithStore:](self, sel_initWithStore_, qword_1ED1AB9F0);
}

- (MSVehicleRequest)initWithStore:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  id v7;
  objc_super v9;

  v5 = type metadata accessor for Vehicle();
  type metadata accessor for MapsSyncRequest();
  v6 = (objc_class *)swift_allocObject();
  *((_QWORD *)v6 + 2) = a3;
  *((_QWORD *)v6 + 3) = v5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MSVehicleRequest__request) = v6;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for VehicleRequest();
  v7 = a3;
  return -[MSVehicleRequest init](&v9, sel_init);
}

- (id)fetchSyncAndReturnError:(id *)a3
{
  MSVehicleRequest *v3;
  void *v4;

  v3 = self;
  sub_1A4214A28();

  type metadata accessor for Vehicle();
  v4 = (void *)sub_1A423C1B8();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)fetchSyncWithOptions:(id)a3 error:(id *)a4
{
  id v5;
  MSVehicleRequest *v6;
  void *v7;

  v5 = a3;
  v6 = self;
  sub_1A4214A28();

  type metadata accessor for Vehicle();
  v7 = (void *)sub_1A423C1B8();
  swift_bridgeObjectRelease();
  return v7;
}

- (void)fetchWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  MSVehicleRequest *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ABA28);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1A423C29C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EE710858;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EE70E520;
  v12[5] = v11;
  v13 = self;
  sub_1A423B080((uint64_t)v7, (uint64_t)&unk_1EE70E528, (uint64_t)v12);
  swift_release();
}

- (void)fetchWithOptions:(_TtC8MapsSync20MapsSyncQueryOptions *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC8MapsSync20MapsSyncQueryOptions *v15;
  MSVehicleRequest *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ABA28);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_1A423C29C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EE710848;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EE70E500;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1A423B080((uint64_t)v9, (uint64_t)&unk_1EE70E508, (uint64_t)v14);
  swift_release();
}

- (void)countWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  MSVehicleRequest *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ABA28);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1A423C29C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EE710838;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EE70E4E0;
  v12[5] = v11;
  v13 = self;
  sub_1A423B080((uint64_t)v7, (uint64_t)&unk_1EE70E4E8, (uint64_t)v12);
  swift_release();
}

- (void)countWithOptions:(_TtC8MapsSync20MapsSyncQueryOptions *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC8MapsSync20MapsSyncQueryOptions *v15;
  MSVehicleRequest *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ABA28);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_1A423C29C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EE710828;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EE70E650;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1A423B080((uint64_t)v9, (uint64_t)&unk_1EE70E4C8, (uint64_t)v14);
  swift_release();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
