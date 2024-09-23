@implementation SelfServiceSuitePickerViewController

- (void)viewDidLoad
{
  char *v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SelfServiceSuitePickerViewController();
  v2 = (char *)v4.receiver;
  -[SelfServiceBaseNavigationController viewDidLoad](&v4, "viewDidLoad");
  sub_1000826A8();
  v3 = objc_msgSend(v2, "contentView", v4.receiver, v4.super_class);
  objc_msgSend(v3, "addSubview:", *(_QWORD *)&v2[OBJC_IVAR____TtC11Diagnostics36SelfServiceSuitePickerViewController_tableView]);

  sub_100082854();
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SelfServiceSuitePickerViewController();
  v4 = (char *)v6.receiver;
  -[SelfServiceSuitePickerViewController viewDidAppear:](&v6, "viewDidAppear:", v3);
  v5 = *(_QWORD *)&v4[OBJC_IVAR____TtC11Diagnostics36SelfServiceSuitePickerViewController_suiteManager]
     + OBJC_IVAR____TtC11Diagnostics12SuiteManager_delegate;
  *(_QWORD *)(v5 + 8) = &off_100138FB8;
  swift_unknownObjectWeakAssign(v5, v4);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC11Diagnostics36SelfServiceSuitePickerViewController_tableView], "invalidateIntrinsicContentSize", v6.receiver, v6.super_class);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SelfServiceSuitePickerViewController();
  v4 = (char *)v6.receiver;
  -[SelfServiceSuitePickerViewController viewWillDisappear:](&v6, "viewWillDisappear:", v3);
  v5 = *(_QWORD *)&v4[OBJC_IVAR____TtC11Diagnostics36SelfServiceSuitePickerViewController_suiteManager]
     + OBJC_IVAR____TtC11Diagnostics12SuiteManager_delegate;
  *(_QWORD *)(v5 + 8) = 0;
  swift_unknownObjectWeakAssign(v5, 0);

}

- (_TtC11Diagnostics36SelfServiceSuitePickerViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC11Diagnostics36SelfServiceSuitePickerViewController *result;

  result = (_TtC11Diagnostics36SelfServiceSuitePickerViewController *)_swift_stdlib_reportUnimplementedInitializer("Diagnostics.SelfServiceSuitePickerViewController", 48, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (_TtC11Diagnostics36SelfServiceSuitePickerViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC11Diagnostics36SelfServiceSuitePickerViewController *result;

  v6 = a5;
  result = (_TtC11Diagnostics36SelfServiceSuitePickerViewController *)_swift_stdlib_reportUnimplementedInitializer("Diagnostics.SelfServiceSuitePickerViewController", 48, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super
                     + OBJC_IVAR____TtC11Diagnostics36SelfServiceSuitePickerViewController_suiteManager));
  objc_release(*(id *)((char *)&self->super
                     + OBJC_IVAR____TtC11Diagnostics36SelfServiceSuitePickerViewController_tableView));
}

@end
