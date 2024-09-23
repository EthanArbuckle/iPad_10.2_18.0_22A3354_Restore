@implementation WeatherAction

- (void)runWithInput:(WFContentCollection *)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  WFContentCollection *v8;
  _TtC9ActionKit13WeatherAction *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_22D3DC654((uint64_t)&unk_255D80960, (uint64_t)v7);
}

- (_TtC9ActionKit13WeatherAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v7 = sub_22D6665A8();
  v9 = v8;
  if (a5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D80020);
    a5 = (id)sub_22D6664B8();
  }
  v10 = a4;
  return (_TtC9ActionKit13WeatherAction *)WeatherAction.init(identifier:definition:serializedParameters:)(v7, v9, a4, (uint64_t)a5);
}

- (_TtC9ActionKit13WeatherAction)init
{
  return (_TtC9ActionKit13WeatherAction *)WeatherAction.init()();
}

- (void).cxx_destruct
{

}

@end
