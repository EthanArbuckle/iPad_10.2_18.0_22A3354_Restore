@implementation APOnBoardingWelcomeController

- (void)viewDidLayoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  char *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for APOnBoardingWelcomeController();
  v2 = (char *)v6.receiver;
  -[OBBaseWelcomeController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC15AppProtectionUI29APOnBoardingWelcomeController_assistant];
  if (v3)
  {
    v4 = v3;
    v5 = (char *)objc_msgSend(v2, sel_scrollView, v6.receiver, v6.super_class);
    objc_msgSend(v4, sel_performAdjustmentsForScrollView_, v5);

    v2 = v5;
  }

}

- (_TtC15AppProtectionUI29APOnBoardingWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v9 = sub_2362FF944();
  v11 = v10;
  if (!a4)
  {
    v13 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v14 = 0;
    v16 = 0;
    return (_TtC15AppProtectionUI29APOnBoardingWelcomeController *)sub_2362F8F70(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)sub_2362FF944();
  v13 = v12;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v14 = sub_2362FF944();
  v16 = v15;
  return (_TtC15AppProtectionUI29APOnBoardingWelcomeController *)sub_2362F8F70(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC15AppProtectionUI29APOnBoardingWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _TtC15AppProtectionUI29APOnBoardingWelcomeController *v14;
  objc_super v16;

  sub_2362FF944();
  if (a4)
  {
    sub_2362FF944();
    a4 = v10;
  }
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC15AppProtectionUI29APOnBoardingWelcomeController_assistant) = 0;
  v11 = a5;
  v12 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v13 = (void *)sub_2362FF938();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for APOnBoardingWelcomeController();
  v14 = -[APOnBoardingWelcomeController initWithTitle:detailText:icon:contentLayout:](&v16, sel_initWithTitle_detailText_icon_contentLayout_, v12, v13, v11, a6);

  return v14;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15AppProtectionUI29APOnBoardingWelcomeController_assistant));
}

@end
