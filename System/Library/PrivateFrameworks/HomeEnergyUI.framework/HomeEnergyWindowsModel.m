@implementation HomeEnergyWindowsModel

- (_TtC12HomeEnergyUI22HomeEnergyWindowsModel)init
{
  _TtC12HomeEnergyUI22HomeEnergyWindowsModel *result;

  result = (_TtC12HomeEnergyUI22HomeEnergyWindowsModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t);
  char *v10;
  uint64_t v11;

  v3 = (char *)self + OBJC_IVAR____TtC12HomeEnergyUI22HomeEnergyWindowsModel__energyWindows;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AD70);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC12HomeEnergyUI22HomeEnergyWindowsModel__state;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D968E8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC12HomeEnergyUI22HomeEnergyWindowsModel__gridID;
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433AD88);
  v9 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
  v9(v7, v8);
  v9((char *)self + OBJC_IVAR____TtC12HomeEnergyUI22HomeEnergyWindowsModel__locationCity, v8);
  v10 = (char *)self + OBJC_IVAR____TtC12HomeEnergyUI22HomeEnergyWindowsModel__cleanWindowNotificationState;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D96918);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  sub_23E75496C((uint64_t)self + OBJC_IVAR____TtC12HomeEnergyUI22HomeEnergyWindowsModel_type, (uint64_t *)&unk_25433A958);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12HomeEnergyUI22HomeEnergyWindowsModel_nextWindowTypeChangeTimer));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12HomeEnergyUI22HomeEnergyWindowsModel____lazy_storage___locationManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12HomeEnergyUI22HomeEnergyWindowsModel____lazy_storage___geoCoder));
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  id v6;
  _TtC12HomeEnergyUI22HomeEnergyWindowsModel *v7;

  v6 = a3;
  v7 = self;
  sub_23E81B6A0(a4);

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  unint64_t v6;
  id v7;
  _TtC12HomeEnergyUI22HomeEnergyWindowsModel *v8;

  sub_23E777990(0, &qword_25433B3E0);
  v6 = sub_23E8A39F8();
  v7 = a3;
  v8 = self;
  sub_23E81BE74(v6);

  swift_bridgeObjectRelease();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC12HomeEnergyUI22HomeEnergyWindowsModel *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_23E81C608(v8);

}

- (NSString)description
{
  _TtC12HomeEnergyUI22HomeEnergyWindowsModel *v2;
  void *v3;

  v2 = self;
  HomeEnergyWindowsModel.description.getter();

  v3 = (void *)sub_23E8A3908();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)processNextWindowTypeChangeTimeout
{
  _TtC12HomeEnergyUI22HomeEnergyWindowsModel *v2;

  v2 = self;
  sub_23E819990();

}

@end
