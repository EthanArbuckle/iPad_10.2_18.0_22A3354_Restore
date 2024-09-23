@implementation HKAVPlayerViewController

- (_TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController)init
{
  char *v2;
  _TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController *v3;
  void *v4;
  _TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController *v5;
  id v6;
  id v7;
  objc_super v9;

  v2 = (char *)self
     + OBJC_IVAR____TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController_timeControlStatusBeforeBackground;
  *(_QWORD *)v2 = 0;
  v2[8] = 1;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for HKAVPlayerViewController();
  v3 = -[HKAVPlayerViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v4 = (void *)objc_opt_self();
  v5 = v3;
  v6 = objc_msgSend(v4, sel_defaultCenter);
  objc_msgSend(v6, sel_addObserver_selector_name_object_, v5, sel_didBecomeActive, *MEMORY[0x1E0DC4750], 0);

  v7 = objc_msgSend(v4, sel_defaultCenter);
  objc_msgSend(v7, sel_addObserver_selector_name_object_, v5, sel_willResignActive, *MEMORY[0x1E0DC4868], 0);

  return v5;
}

- (_TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController *result;

  v4 = (char *)self
     + OBJC_IVAR____TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController_timeControlStatusBeforeBackground;
  *(_QWORD *)v4 = 0;
  v4[8] = 1;
  v5 = a3;

  result = (_TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController *)sub_1BC98028C();
  __break(1u);
  return result;
}

- (void)dealloc
{
  void *v3;
  _TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for HKAVPlayerViewController();
  -[HKAVPlayerViewController dealloc](&v6, sel_dealloc);
}

- (void)didBecomeActive
{
  _TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController *v2;

  v2 = self;
  sub_1BC97E2DC();

}

- (void)willResignActive
{
  _TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController *v2;

  v2 = self;
  sub_1BC97E388();

}

- (_TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController *result;

  v4 = a4;
  result = (_TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController)initWithPlayerLayerView:(id)a3
{
  id v3;
  _TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController *result;

  v3 = a3;
  result = (_TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
