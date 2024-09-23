@implementation HKAudiogramCurrentValueViewDataSource

- (HKAudiogramCurrentValueViewDataSource)initWithApplicationItems:(id)a3
{
  id v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___HKAudiogramCurrentValueViewDataSource____lazy_storage___chartFormatter) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HKAudiogramCurrentValueViewDataSource_audiogram) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HKAudiogramCurrentValueViewDataSource_applicationItems) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HKAudiogramCurrentValueViewDataSource_keyValueLabels) = (Class)MEMORY[0x1E0DEE9D8];
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AudiogramCurrentValueViewDataSource();
  v4 = a3;
  return -[HKAudiogramCurrentValueViewDataSource init](&v6, sel_init);
}

- (void)updateWithAudiogram:(id)a3
{
  void *v4;
  id v5;
  HKAudiogramCurrentValueViewDataSource *v6;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___HKAudiogramCurrentValueViewDataSource_audiogram);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HKAudiogramCurrentValueViewDataSource_audiogram) = (Class)a3;
  v5 = a3;
  v6 = self;

  sub_1D7AC33F8();
}

- (id)dateViewWithOrientation:(int64_t)a3
{
  HKAudiogramCurrentValueViewDataSource *v3;
  void *v4;

  v3 = self;
  v4 = (void *)sub_1D7AC3CF4();

  return v4;
}

- (id)leftMarginViewWithOrientation:(int64_t)a3
{
  return 0;
}

- (int64_t)numberOfValuesForAnnotationView:(id)a3
{
  unint64_t *v5;
  unint64_t v6;
  int64_t v7;
  id v9;
  HKAudiogramCurrentValueViewDataSource *v10;

  v5 = (unint64_t *)((char *)self + OBJC_IVAR___HKAudiogramCurrentValueViewDataSource_keyValueLabels);
  swift_beginAccess();
  v6 = *v5;
  if (!(v6 >> 62))
    return *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  v9 = a3;
  v10 = self;
  swift_bridgeObjectRetain();
  v7 = sub_1D7B4A8A8();

  swift_bridgeObjectRelease();
  return v7;
}

- (id)valueViewForColumnAtIndex:(int64_t)a3 orientation:(int64_t)a4
{
  uint64_t *v7;
  id result;
  uint64_t v9;
  void *v10;
  HKAudiogramCurrentValueViewDataSource *v11;
  id v12;
  uint64_t v13;
  HKAudiogramCurrentValueViewDataSource *v14;

  v7 = (uint64_t *)((char *)self + OBJC_IVAR___HKAudiogramCurrentValueViewDataSource_keyValueLabels);
  result = (id)swift_beginAccess();
  v9 = *v7;
  if ((v9 & 0xC000000000000001) != 0)
  {
    v14 = self;
    swift_bridgeObjectRetain();
    v12 = (id)MEMORY[0x1D829E758](a3, v9);
    swift_bridgeObjectRelease();
    if (a4)
      goto LABEL_5;
    goto LABEL_7;
  }
  if (a3 < 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > (unint64_t)a3)
  {
    v10 = *(void **)(v9 + 8 * a3 + 32);
    v11 = self;
    v12 = v10;
    if (a4)
    {
LABEL_5:
      v13 = 0;
LABEL_8:
      objc_msgSend(v12, sel_setOrientation_, v13);

      return v12;
    }
LABEL_7:
    v13 = 1;
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

- (BOOL)showSeparators
{
  return 0;
}

- (HKAudiogramCurrentValueViewDataSource)init
{
  HKAudiogramCurrentValueViewDataSource *result;

  result = (HKAudiogramCurrentValueViewDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___HKAudiogramCurrentValueViewDataSource____lazy_storage___chartFormatter));

}

@end
