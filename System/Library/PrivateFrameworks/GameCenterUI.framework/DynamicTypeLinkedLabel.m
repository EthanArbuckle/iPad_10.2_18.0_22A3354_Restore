@implementation DynamicTypeLinkedLabel

- (NSAttributedString)attributedText
{
  _TtC12GameCenterUI22DynamicTypeLinkedLabel *v2;
  id v3;

  v2 = self;
  v3 = sub_1AB531A2C();

  return (NSAttributedString *)v3;
}

- (void)setAttributedText:(id)a3
{
  id v5;
  _TtC12GameCenterUI22DynamicTypeLinkedLabel *v6;

  v5 = a3;
  v6 = self;
  sub_1AB531AA8(a3);

}

- (void)labelTapped:(id)a3
{
  id v4;
  _TtC12GameCenterUI22DynamicTypeLinkedLabel *v5;

  v4 = a3;
  v5 = self;
  sub_1AB532328(v4);

}

- (_TtC12GameCenterUI22DynamicTypeLinkedLabel)initWithCoder:(id)a3
{
  return (_TtC12GameCenterUI22DynamicTypeLinkedLabel *)sub_1AB5327FC(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI22DynamicTypeLinkedLabel_tapGestureRecognizer));
  sub_1AB473FBC((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI22DynamicTypeLinkedLabel_linkInteractionDelegate, &qword_1EEC02720);
  OUTLINED_FUNCTION_0_10();
}

@end
