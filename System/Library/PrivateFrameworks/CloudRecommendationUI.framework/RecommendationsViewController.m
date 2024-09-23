@implementation RecommendationsViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for RecommendationsViewController();
  v4 = v7.receiver;
  -[RecommendationsViewController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
  v5 = objc_msgSend(v4, sel_navigationController, v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setNavigationBarHidden_animated_, 1, 0);

    v4 = v6;
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for RecommendationsViewController();
  v4 = v7.receiver;
  -[RecommendationsViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);
  v5 = objc_msgSend(v4, sel_navigationController, v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setNavigationBarHidden_animated_, 0, v3);

    v4 = v6;
  }

}

- (void)viewDidLoad
{
  _TtC21CloudRecommendationUI29RecommendationsViewController *v2;

  v2 = self;
  sub_238145578();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RecommendationsViewController();
  v4 = (char *)v5.receiver;
  -[RecommendationsViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  if (*(_QWORD *)&v4[OBJC_IVAR____TtC21CloudRecommendationUI29RecommendationsViewController_recommendationsController])
  {
    swift_retain();
    sub_238128B70();

    swift_release();
  }
  else
  {

  }
}

- (_TtC21CloudRecommendationUI29RecommendationsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_23818A110();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC21CloudRecommendationUI29RecommendationsViewController *)sub_238146278(v5, v7, a4);
}

- (_TtC21CloudRecommendationUI29RecommendationsViewController)initWithCoder:(id)a3
{
  return (_TtC21CloudRecommendationUI29RecommendationsViewController *)sub_238146398(a3);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI29RecommendationsViewController_mailAccountProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI29RecommendationsViewController_accountManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI29RecommendationsViewController_account));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI29RecommendationsViewController_activeRecommendation));
  swift_release();
}

@end
