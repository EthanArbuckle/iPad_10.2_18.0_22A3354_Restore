@implementation LocationService

- (_TtC15FocusSettingsUI15LocationService)init
{
  _TtC15FocusSettingsUI15LocationService *result;

  sub_2154EF314();
  return result;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  unint64_t v6;
  id v7;
  _TtC15FocusSettingsUI15LocationService *v8;

  sub_2154CFE3C(0, &qword_254DC9348);
  v6 = sub_215688B64();
  v7 = a3;
  v8 = self;
  sub_2154EFEE8(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC15FocusSettingsUI15LocationService *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_2154F009C(v6, v8);

}

- (void)completerDidUpdateResults:(id)a3
{
  id v4;
  _TtC15FocusSettingsUI15LocationService *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, sel_results);
  sub_2154CFE3C(0, &qword_254DC9340);
  sub_215688B64();

  swift_getKeyPath();
  swift_getKeyPath();
  sub_215687484();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;

  v3 = (char *)self + OBJC_IVAR____TtC15FocusSettingsUI15LocationService__queryFragment;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC9320);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC15FocusSettingsUI15LocationService__status;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC9390);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC15FocusSettingsUI15LocationService__searchResults;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC9388);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  swift_release();
  swift_release();

  v9 = (char *)self + OBJC_IVAR____TtC15FocusSettingsUI15LocationService__completions;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC9380);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v11 = (char *)self + OBJC_IVAR____TtC15FocusSettingsUI15LocationService__searchCompletion;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC9378);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);

}

@end
