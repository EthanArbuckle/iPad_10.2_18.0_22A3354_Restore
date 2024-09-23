@implementation HKAudiogramAnnotationViewDataSource

- (HKAudiogramAnnotationViewDataSource)initWithApplicationItems:(id)a3
{
  id v3;
  HKAudiogramAnnotationViewDataSource *v4;

  v3 = a3;
  v4 = (HKAudiogramAnnotationViewDataSource *)sub_1D7ADE704(v3);

  return v4;
}

- (void)updateWithPointSelectionContexts:(id)a3 date:(id)a4 isAverage:(BOOL)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  HKAudiogramAnnotationViewDataSource *v12;
  uint64_t v13;

  v7 = sub_1D7B49198();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D7AAF6EC(0, (unint64_t *)&unk_1F014E7B0);
  v11 = sub_1D7B4A4AC();
  sub_1D7B49168();
  v12 = self;
  sub_1D7ADDBE8(v11, (uint64_t)v10, a5);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (id)dateViewWithOrientation:(int64_t)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR___HKAudiogramAnnotationViewDataSource_currentDateView));
}

- (id)leftMarginViewWithOrientation:(int64_t)a3
{
  return 0;
}

- (int64_t)numberOfValuesForAnnotationView:(id)a3
{
  unint64_t v3;
  id v6;
  HKAudiogramAnnotationViewDataSource *v7;
  int64_t v8;

  v3 = *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___HKAudiogramAnnotationViewDataSource_keyValuePairs);
  if (!(v3 >> 62))
    return *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = a3;
  v7 = self;
  swift_bridgeObjectRetain();
  v8 = sub_1D7B4A8A8();

  swift_bridgeObjectRelease();
  return v8;
}

- (id)valueViewForColumnAtIndex:(int64_t)a3 orientation:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v6 = self;
  v7 = *(_QWORD *)((char *)self + OBJC_IVAR___HKAudiogramAnnotationViewDataSource_keyValuePairs);
  if ((v7 & 0xC000000000000001) != 0)
  {
    v12 = self;
    swift_bridgeObjectRetain();
    v10 = (id)MEMORY[0x1D829E758](a3, v7);
    swift_bridgeObjectRelease();
    if (a4)
      goto LABEL_5;
    goto LABEL_7;
  }
  if (a3 < 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10) > (unint64_t)a3)
  {
    v8 = *(void **)(v7 + 8 * a3 + 32);
    v9 = self;
    v10 = v8;
    if (a4)
    {
LABEL_5:
      v11 = 0;
LABEL_8:
      objc_msgSend(v10, sel_setOrientation_, v11);

      return v10;
    }
LABEL_7:
    v11 = 1;
    goto LABEL_8;
  }
  __break(1u);
  return self;
}

- (BOOL)showSeparators
{
  return 0;
}

- (BOOL)reverseColumnsInRightToLeftLayoutDirection
{
  return 0;
}

- (HKAudiogramAnnotationViewDataSource)init
{
  HKAudiogramAnnotationViewDataSource *result;

  result = (HKAudiogramAnnotationViewDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___HKAudiogramAnnotationViewDataSource_hearingSensitivityFormatter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___HKAudiogramAnnotationViewDataSource_averageSensitivityFormatter));
}

@end
