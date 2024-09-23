@implementation DropletBoundaryView

- (_TtC9DropletUI19DropletBoundaryView)initWithCoder:(id)a3
{
  _OWORD *v4;
  id v5;
  _TtC9DropletUI19DropletBoundaryView *result;

  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_boundaryReferenceBounds);
  *v4 = 0u;
  v4[1] = 0u;
  v5 = a3;

  result = (_TtC9DropletUI19DropletBoundaryView *)sub_23A84C39C();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;
  _OWORD v4[13];
  uint64_t v5;
  _BYTE v6[216];
  _OWORD v7[13];
  uint64_t v8;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DropletBoundaryView();
  v2 = v3.receiver;
  -[DropletBoundaryView layoutSubviews](&v3, sel_layoutSubviews);
  sub_23A82F90C((uint64_t)v2 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry, (uint64_t)v6);
  sub_23A82F90C((uint64_t)v6, (uint64_t)v7);
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
    sub_23A84BA94((double *)v4);
  }

}

@end
