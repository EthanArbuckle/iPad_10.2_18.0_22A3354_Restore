@implementation AUVerticalTabView.TabAccessibilityElement

- (_TtCC12CoreAudioKit17AUVerticalTabView23TabAccessibilityElement)initWithAccessibilityContainer:(id)a3
{
  _QWORD v4[4];

  swift_unknownObjectRetain();
  sub_2131E1CB0();
  swift_unknownObjectRelease();
  return (_TtCC12CoreAudioKit17AUVerticalTabView23TabAccessibilityElement *)sub_213176AD0(v4);
}

- (BOOL)accessibilityActivate
{
  _TtCC12CoreAudioKit17AUVerticalTabView23TabAccessibilityElement *v2;

  v2 = self;
  sub_213176BF8();

  return 1;
}

- (_TtCC12CoreAudioKit17AUVerticalTabView23TabAccessibilityElement)init
{
  _TtCC12CoreAudioKit17AUVerticalTabView23TabAccessibilityElement *result;

  result = (_TtCC12CoreAudioKit17AUVerticalTabView23TabAccessibilityElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12CoreAudioKit17AUVerticalTabView23TabAccessibilityElement_owner));
}

@end
