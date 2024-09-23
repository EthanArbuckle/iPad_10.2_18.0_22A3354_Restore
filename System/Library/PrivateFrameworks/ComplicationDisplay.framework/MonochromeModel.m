@implementation MonochromeModel

- (_TtC19ComplicationDisplay15MonochromeModel)init
{
  return (_TtC19ComplicationDisplay15MonochromeModel *)MonochromeModel.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t);
  char *v8;
  uint64_t v9;

  v3 = (char *)self + OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__fraction;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F2E8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__accent;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F300);
  v7 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((char *)self + OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__background, v6);
  v8 = (char *)self + OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__style;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F320);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
}

- (id)filtersForView:(id)a3 style:(int64_t)a4
{
  id v5;
  _TtC19ComplicationDisplay15MonochromeModel *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = self;
  v7 = sub_213054DB0();

  if (v7)
  {
    sub_2130520D8(0, &qword_254B6F380);
    v8 = (void *)sub_213068B7C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  id v6;
  _TtC19ComplicationDisplay15MonochromeModel *v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = self;
  v8 = sub_213054F08();

  if (v8)
  {
    sub_2130520D8(0, &qword_254B6F380);
    v9 = (void *)sub_213068B7C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)filterForView:(id)a3 style:(int64_t)a4
{
  return 0;
}

- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  return 0;
}

- (id)colorForView:(id)a3 accented:(BOOL)a4
{
  id v5;
  _TtC19ComplicationDisplay15MonochromeModel *v6;
  void *v7;

  v5 = a3;
  v6 = self;
  v7 = (void *)sub_21305506C();

  return v7;
}

- (id)backgroundColorForView:(id)a3
{
  return 0;
}

@end
