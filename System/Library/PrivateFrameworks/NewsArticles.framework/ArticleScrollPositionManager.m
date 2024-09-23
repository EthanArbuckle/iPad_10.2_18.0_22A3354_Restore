@implementation ArticleScrollPositionManager

- (void)setPosition:(id)a3 headline:(id)a4
{
  id v5;

  v5 = a3;
  swift_unknownObjectRetain();
  swift_retain();
  sub_1B9FF96E0(v5, a4);

  swift_unknownObjectRelease();
  swift_release();
}

- (id)scrollPositionForHeadline:(id)a3
{
  id v4;

  swift_unknownObjectRetain();
  swift_retain();
  v4 = sub_1B9FF9B78(a3);
  swift_unknownObjectRelease();
  swift_release();
  return v4;
}

@end
