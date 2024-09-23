@implementation RecommendationsController

- (_TtP21CloudRecommendationUI40RecommendationSubtitleControllerDelegate_)subtitleControllerDelegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC21CloudRecommendationUI25RecommendationsController_subtitleControllerDelegate;
  swift_beginAccess();
  return (_TtP21CloudRecommendationUI40RecommendationSubtitleControllerDelegate_ *)(id)MEMORY[0x23B82DCB4](v2);
}

- (void)setSubtitleControllerDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (_TtC21CloudRecommendationUI25RecommendationsController)initWithAccount:(id)a3
{
  id v4;
  void *v5;
  _TtC21CloudRecommendationUI25RecommendationsController *v6;

  sub_238189810();
  v4 = a3;
  v5 = (void *)sub_238189804();
  type metadata accessor for RecommendationsController();
  swift_allocObject();
  v6 = (_TtC21CloudRecommendationUI25RecommendationsController *)sub_238131438(v4, v5);

  swift_deallocPartialClassInstance();
  return v6;
}

- (void)fetchAllWithShouldRefreshBreakout:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  swift_retain();
  sub_238121368();
  sub_238120DD0(0, v3);
  swift_retain();
  sub_23811456C();
  swift_release();
  swift_release();
}

- (void)refresh
{
  swift_retain();
  sub_238120DD0(0, 1);
  swift_retain();
  sub_23811456C();
  swift_release();
  swift_release();
}

- (void)refreshEligibleRecommendationsWithShouldSendDisplayedStatus:(BOOL)a3 shouldRefreshBreakout:(BOOL)a4
{
  swift_retain();
  sub_238120C18(a3, a4);
  swift_release();
}

- (void)accountDidChange:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v3 = sub_2381895C4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2381895AC();
  swift_retain();
  sub_23812EE60((uint64_t)v6);
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end
