@implementation ShortcutsConfigurationViewController

- (_TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController)initWithConfigurationContext:(id)a3
{
  return (_TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController *)sub_235E53058(a3);
}

- (_TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController)initWithCoder:(id)a3
{
  _QWORD *v5;
  id v6;
  _TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController *result;

  swift_unknownObjectWeakInit();
  v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController_completionHandler);
  *v5 = 0;
  v5[1] = 0;
  v6 = a3;

  result = (_TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController *)sub_235E615F8();
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController *v4;

  v4 = self;
  sub_235E531AC(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController *v4;

  v4 = self;
  sub_235E53378(a3);

}

- (void)configurationController:(id)a3 didFinishWithAction:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_235E5359C(a4, a5);

}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_235E34DD0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController_completionHandler));
}

@end
