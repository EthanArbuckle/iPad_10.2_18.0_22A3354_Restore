@implementation NativeModalActionHandler

- (void)userDidCompleteAction:(id)a3
{
  id v4;
  _TtC21CloudRecommendationUI24NativeModalActionHandler *v5;

  v4 = a3;
  v5 = self;
  sub_23814B14C(v4);

}

- (void)userDidCancelAction
{
  _TtC21CloudRecommendationUI24NativeModalActionHandler *v2;

  v2 = self;
  sub_23814B25C();

}

- (_TtC21CloudRecommendationUI24NativeModalActionHandler)init
{
  _TtC21CloudRecommendationUI24NativeModalActionHandler *result;

  result = (_TtC21CloudRecommendationUI24NativeModalActionHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI24NativeModalActionHandler_presenter));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI24NativeModalActionHandler_activeRecommendation));
  swift_unknownObjectRelease();
}

@end
