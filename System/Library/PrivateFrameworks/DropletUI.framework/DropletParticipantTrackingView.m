@implementation DropletParticipantTrackingView

- (_TtC9DropletUI30DropletParticipantTrackingView)initWithCoder:(id)a3
{
  char *v5;
  id v6;
  _TtC9DropletUI30DropletParticipantTrackingView *result;
  _BYTE v8[216];

  v5 = (char *)self + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry;
  sub_23A82E3C4((uint64_t)v8);
  sub_23A82E744((uint64_t)v8, (uint64_t)v5, &qword_2569C2C00);
  v6 = a3;

  result = (_TtC9DropletUI30DropletParticipantTrackingView *)sub_23A84C39C();
  __break(1u);
  return result;
}

- (void)didMoveToSuperview
{
  _QWORD *v2;
  objc_super v3;
  _OWORD v4[13];
  uint64_t v5;
  _BYTE v6[216];
  _OWORD v7[13];
  uint64_t v8;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DropletParticipantTrackingView();
  v2 = v3.receiver;
  -[DropletParticipantTrackingView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  sub_23A82E744((uint64_t)v2 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry, (uint64_t)v6, &qword_2569C2C00);
  sub_23A82E744((uint64_t)v6, (uint64_t)v7, &qword_2569C2C00);
  if (!sub_23A82E734(v7))
  {
    v4[10] = v7[10];
    v4[11] = v7[11];
    v4[12] = v7[12];
    v5 = v8;
    v4[6] = v7[6];
    v4[7] = v7[7];
    v4[8] = v7[8];
    v4[9] = v7[9];
    v4[2] = v7[2];
    v4[3] = v7[3];
    v4[4] = v7[4];
    v4[5] = v7[5];
    v4[0] = v7[0];
    v4[1] = v7[1];
    (*(void (**)(_OWORD *))((*MEMORY[0x24BEE4EA0] & *v2) + 0x90))(v4);
  }

}

- (_TtC9DropletUI30DropletParticipantTrackingView)initWithFrame:(CGRect)a3
{
  _TtC9DropletUI30DropletParticipantTrackingView *result;

  result = (_TtC9DropletUI30DropletParticipantTrackingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
