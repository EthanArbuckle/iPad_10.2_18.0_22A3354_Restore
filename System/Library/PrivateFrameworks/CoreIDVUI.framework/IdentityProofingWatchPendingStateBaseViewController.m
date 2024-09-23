@implementation IdentityProofingWatchPendingStateBaseViewController

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for IdentityProofingWatchPendingStateBaseViewController();
  v2 = v6.receiver;
  -[IdentityProofingWatchPendingStateBaseViewController viewDidLoad](&v6, sel_viewDidLoad);
  objc_msgSend(v2, sel_setOverrideUserInterfaceStyle_, 2, v6.receiver, v6.super_class);
  v3 = objc_msgSend(v2, sel_view);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
    objc_msgSend(v4, sel_setBackgroundColor_, v5);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IdentityProofingWatchPendingStateBaseViewController();
  v2 = v3.receiver;
  -[IdentityProofingWatchPendingStateBaseViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  sub_213FCE6E0();

}

- (void)updateUI:(id)a3 previousTraitCollection:(id)a4
{
  id v6;
  id v7;
  _TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_213FCFFB0(a4);

}

- (_TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_213FF9458();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController *)sub_213FCF2BC(v5, v7, a4);
}

- (_TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController)initWithCoder:(id)a3
{
  return (_TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController *)sub_213FCF5A0(a3);
}

- (void).cxx_destruct
{
  sub_213F46038((uint64_t)self + OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_config);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_primaryStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_tableView));
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4;
  _TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = sub_213FD0148();

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_213FD0260(a4);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController *v11;
  id v12;
  uint64_t v14;

  v6 = sub_213FF7574();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213FF7550();
  v10 = a3;
  v11 = self;
  v12 = sub_213FCF978(v10, v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

@end
