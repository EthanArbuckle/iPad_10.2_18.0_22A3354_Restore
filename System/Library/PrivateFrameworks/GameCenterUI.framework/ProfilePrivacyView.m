@implementation ProfilePrivacyView

- (_TtC12GameCenterUI18ProfilePrivacyView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB6C2968();
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI18ProfilePrivacyView *v2;

  v2 = self;
  sub_1AB6C2A5C();

}

- (void)primaryAction
{
  _TtC12GameCenterUI18ProfilePrivacyView *v2;

  v2 = self;
  sub_1AB6C2E24();

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5;
  _TtC12GameCenterUI18ProfilePrivacyView *v6;
  int64_t v7;

  v5 = a3;
  v6 = self;
  v7 = sub_1AB6C33D0();

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC12GameCenterUI18ProfilePrivacyView *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_1AB7D7D68();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB7D7D14();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_1AB6C3440(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC12GameCenterUI18ProfilePrivacyView *v11;
  uint64_t v12;

  v6 = sub_1AB7D7D68();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB7D7D14();
  v10 = a3;
  v11 = self;
  sub_1AB6C3C5C();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void).cxx_destruct
{
  sub_1AB4CB5BC((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI18ProfilePrivacyView_delegate);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI18ProfilePrivacyView_iconImage);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI18ProfilePrivacyView_primaryTrayButton);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI18ProfilePrivacyView_tableView);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18ProfilePrivacyView____lazy_storage___tableHeightAnchor));
}

@end
