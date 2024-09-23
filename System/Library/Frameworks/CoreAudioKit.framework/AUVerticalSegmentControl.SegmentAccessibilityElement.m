@implementation AUVerticalSegmentControl.SegmentAccessibilityElement

- (_TtCC12CoreAudioKit24AUVerticalSegmentControl27SegmentAccessibilityElement)initWithAccessibilityContainer:(id)a3
{
  _QWORD v4[4];

  swift_unknownObjectRetain();
  sub_2131E1CB0();
  swift_unknownObjectRelease();
  return (_TtCC12CoreAudioKit24AUVerticalSegmentControl27SegmentAccessibilityElement *)sub_21316678C(v4);
}

- (BOOL)accessibilityActivate
{
  _TtCC12CoreAudioKit24AUVerticalSegmentControl27SegmentAccessibilityElement *v2;

  v2 = self;
  sub_2131671E4();

  return 1;
}

- (BOOL)selectAccessibilitySegmentWithAction:(id)a3
{
  id v4;
  _TtCC12CoreAudioKit24AUVerticalSegmentControl27SegmentAccessibilityElement *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_21316A628();

  return self & 1;
}

- (_TtCC12CoreAudioKit24AUVerticalSegmentControl27SegmentAccessibilityElement)init
{
  _TtCC12CoreAudioKit24AUVerticalSegmentControl27SegmentAccessibilityElement *result;

  result = (_TtCC12CoreAudioKit24AUVerticalSegmentControl27SegmentAccessibilityElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12CoreAudioKit24AUVerticalSegmentControl27SegmentAccessibilityElement_owner));
}

@end
