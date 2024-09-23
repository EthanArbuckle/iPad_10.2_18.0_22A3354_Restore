@implementation EmptyStatePlatterView

- (_TtC12GameCenterUI21EmptyStatePlatterView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB4DB204();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12GameCenterUI21EmptyStatePlatterView *v6;

  v5 = a3;
  v6 = self;
  sub_1AB4DB59C((uint64_t)a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI21EmptyStatePlatterView_arcadeImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI21EmptyStatePlatterView_emptyStateView));
}

@end
