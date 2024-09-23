@implementation HRConceptTitleTableHeaderView

- (NSString)title
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___HRConceptTitleTableHeaderView_title;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_1BC62C650();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  HRConceptTitleTableHeaderView *v8;

  if (a3)
  {
    v4 = sub_1BC62C680();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___HRConceptTitleTableHeaderView_title);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  v8 = self;
  swift_bridgeObjectRelease();
  sub_1BC624148();

}

- (HRConceptTitleTableHeaderView)initWithFrame:(CGRect)a3
{
  return (HRConceptTitleTableHeaderView *)ConceptTitleTableHeaderView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (HRConceptTitleTableHeaderView)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _QWORD *v6;
  HRConceptTitleTableHeaderView *result;

  v4 = OBJC_IVAR___HRConceptTitleTableHeaderView_titleLabel;
  v5 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)sub_1BC623DC4();
  v6 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___HRConceptTitleTableHeaderView_title);
  *v6 = 0;
  v6[1] = 0;

  result = (HRConceptTitleTableHeaderView *)sub_1BC62D394();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
