@implementation DetectionModeView

- (_TtC16MagnifierSupport17DetectionModeView)initWithCoder:(id)a3
{
  sub_227548A48(a3);
  return 0;
}

- (void)pauseSpeech
{
  uint64_t v2;
  _TtC16MagnifierSupport17DetectionModeView *v3;

  v2 = qword_2540B87B8;
  v3 = self;
  if (v2 != -1)
    swift_once();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22758D194();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_22758D1A0();

}

- (NSArray)accessibilityCustomActions
{
  _TtC16MagnifierSupport17DetectionModeView *v2;
  unint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_227549884();

  if (v3)
  {
    sub_22730BA80(0, (unint64_t *)&unk_2540B9F70);
    v4 = (void *)sub_22758E3C4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)setAccessibilityCustomActions:(id)a3
{
  objc_class *ObjectType;
  _TtC16MagnifierSupport17DetectionModeView *v6;
  _TtC16MagnifierSupport17DetectionModeView *v7;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_22730BA80(0, (unint64_t *)&unk_2540B9F70);
    sub_22758E3DC();
    v6 = self;
    a3 = (id)sub_22758E3C4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  -[DetectionModeView setAccessibilityCustomActions:](&v8, sel_setAccessibilityCustomActions_, a3);

}

- (BOOL)accessibilityPerformMagicTap
{
  -[DetectionModeView toggleDetection]_0();
  return 1;
}

- (id)_accessibilitySupplementaryFooterViews
{
  _TtC16MagnifierSupport17DetectionModeView *v2;
  id v3;
  void *v4;

  v2 = self;
  v3 = sub_22754A6E4();

  if (v3)
  {
    v4 = (void *)sub_22758E3C4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)didTapRecordButton:(id)a3
{
  id v4;
  _TtC16MagnifierSupport17DetectionModeView *v5;

  v4 = a3;
  v5 = self;
  sub_22754B278();

}

- (void)didTapTapToRadarButton:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  _TtC16MagnifierSupport17DetectionModeView *v10;

  v5 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport17DetectionModeView_arDelegate;
  if (MEMORY[0x2276B3E34]((char *)self + OBJC_IVAR____TtC16MagnifierSupport17DetectionModeView_arDelegate, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    v8 = *(void (**)(uint64_t, uint64_t))(v6 + 24);
    v9 = a3;
    v10 = self;
    v8(ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (void)didTapRestartButton:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  _TtC16MagnifierSupport17DetectionModeView *v10;

  v5 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport17DetectionModeView_arDelegate;
  if (MEMORY[0x2276B3E34]((char *)self + OBJC_IVAR____TtC16MagnifierSupport17DetectionModeView_arDelegate, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    v8 = *(void (**)(uint64_t, uint64_t))(v6 + 32);
    v9 = a3;
    v10 = self;
    v8(ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (_TtC16MagnifierSupport17DetectionModeView)initWithFrame:(CGRect)a3
{
  _TtC16MagnifierSupport17DetectionModeView *result;

  result = (_TtC16MagnifierSupport17DetectionModeView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22731A0F0((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport17DetectionModeView_arDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17DetectionModeView__recordButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17DetectionModeView__tapToRadarButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17DetectionModeView__restartButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17DetectionModeView_detectionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17DetectionModeView_kDetectionFont));
}

- (uint64_t)toggleDetection
{
  uint64_t result;
  char v1;
  char v2;

  if (qword_2540B87B8 != -1)
    swift_once();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22758D194();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_22758D1A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22758D194();
  swift_release();
  result = swift_release();
  if (v2 == 1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_22758D194();
    swift_release();
    result = swift_release();
    if ((v1 & 1) == 0)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_22758D1A0();
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      return sub_22758D1A0();
    }
  }
  return result;
}

@end
