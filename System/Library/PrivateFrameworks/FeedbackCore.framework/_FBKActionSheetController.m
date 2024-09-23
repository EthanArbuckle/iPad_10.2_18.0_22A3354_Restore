@implementation _FBKActionSheetController

- (_TtC12FeedbackCore25_FBKActionSheetController)initWithTitle:(id)a3 subtitle:(id)a4 actions:(id)a5
{
  return (_TtC12FeedbackCore25_FBKActionSheetController *)sub_21DA621EC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_21DA61F0C);
}

- (void)viewDidLoad
{
  _TtC12FeedbackCore25_FBKActionSheetController *v2;

  v2 = self;
  sub_21DA6229C();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC12FeedbackCore25_FBKActionSheetController *v5;

  v4 = a3;
  v5 = self;
  sub_21DA63478();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC12FeedbackCore25_FBKActionSheetController *v4;

  v4 = self;
  sub_21DA6244C(a3);

}

- (void)addActionWithTitle:(id)a3 image:(id)a4 actionHandler:(id)a5
{
  sub_21DA62918(self, (int)a2, (int)a3, a4, a5, (uint64_t)&unk_24E15CA28, (uint64_t)sub_21DA63728, sub_21DA627FC);
}

- (void)addAction:(id)a3
{
  id v4;
  _TtC12FeedbackCore25_FBKActionSheetController *v5;

  v4 = a3;
  v5 = self;
  sub_21DA629D4(v4);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  unint64_t *v5;
  unint64_t v6;
  int64_t v7;
  id v9;
  _TtC12FeedbackCore25_FBKActionSheetController *v10;

  v5 = (unint64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore25_FBKActionSheetController_actions);
  swift_beginAccess();
  v6 = *v5;
  if (!(v6 >> 62))
    return *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  v9 = a3;
  v10 = self;
  swift_bridgeObjectRetain();
  v7 = sub_21DAC4DBC();

  swift_bridgeObjectRelease();
  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:viewForHeaderInSection:
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  result = 5.0;
  if (!a4)
    return 15.0;
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 5.0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC12FeedbackCore25_FBKActionSheetController *v12;
  uint64_t v13;

  v6 = sub_21DAC3F28();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DAC3EF8();
  v11 = a3;
  v12 = self;
  sub_21DA635B0();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC12FeedbackCore25_FBKActionSheetController *v12;
  void *v13;
  uint64_t v15;

  v6 = sub_21DAC3F28();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DAC3EF8();
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_21DA62D58(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return v13;
}

- (void)dismissSelf
{
  -[_FBKActionSheetController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (_TtC12FeedbackCore25_FBKActionSheetController)initWithStyle:(int64_t)a3
{
  _QWORD *v4;
  _QWORD *v5;
  objc_super v7;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12FeedbackCore25_FBKActionSheetController_actions) = (Class)MEMORY[0x24BEE4AF8];
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC12FeedbackCore25_FBKActionSheetController_headerTitle);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC12FeedbackCore25_FBKActionSheetController_headerSubtitle);
  *v5 = 0;
  v5[1] = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC12FeedbackCore25_FBKActionSheetController_dismissesOnAction) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for _FBKActionSheetController();
  return -[_FBKActionSheetController initWithStyle:](&v7, sel_initWithStyle_, a3);
}

- (_TtC12FeedbackCore25_FBKActionSheetController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_21DAC481C();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC12FeedbackCore25_FBKActionSheetController *)sub_21DA63160(v5, v7, a4);
}

- (_TtC12FeedbackCore25_FBKActionSheetController)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  objc_super v7;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12FeedbackCore25_FBKActionSheetController_actions) = (Class)MEMORY[0x24BEE4AF8];
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC12FeedbackCore25_FBKActionSheetController_headerTitle);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC12FeedbackCore25_FBKActionSheetController_headerSubtitle);
  *v5 = 0;
  v5[1] = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC12FeedbackCore25_FBKActionSheetController_dismissesOnAction) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for _FBKActionSheetController();
  return -[_FBKActionSheetController initWithCoder:](&v7, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_21DA63354();
}

@end
