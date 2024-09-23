@implementation IdentityProofingFedStatsOptinViewController

- (_TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_213F73498();
}

- (void)learnMoreButtonClicked
{
  _TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController *v2;

  v2 = self;
  sub_213F70350();

}

- (void)sizeHeaderToFit
{
  _TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController *v2;

  v2 = self;
  sub_213F70610();

}

- (void)configureFonts
{
  _TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController *v2;

  v2 = self;
  sub_213F70810();

}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IdentityProofingFedStatsOptinViewController();
  v2 = v3.receiver;
  -[IdentityProofingFedStatsOptinViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  sub_213F70610();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController *v4;

  v4 = self;
  sub_213F70B3C(a3, (SEL *)&selRef_viewDidAppear_, (void (*)(id))MEMORY[0x24BE1D8F0]);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController *v4;

  v4 = self;
  sub_213F70B3C(a3, (SEL *)&selRef_viewDidDisappear_, MEMORY[0x24BE1D8F8]);

}

- (void)confirmButtonClicked
{
  _TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController *v2;

  v2 = self;
  sub_213F71FDC();

}

- (void)viewDidLoad
{
  _TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController *v2;

  v2 = self;
  sub_213F72230();

}

- (_TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController *result;

  v4 = a4;
  result = (_TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController_uiConfig));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController_primaryStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController_confirmButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController_learnMoreButton));
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  char *v7;
  unint64_t v8;
  int64_t v9;
  id v11;
  _TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController *v12;

  v7 = (char *)self + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController_viewModels;
  swift_beginAccess();
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (*(_QWORD *)(*(_QWORD *)v7 + 16) <= (unint64_t)a4)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v8 = *(_QWORD *)(*(_QWORD *)v7 + 8 * a4 + 32);
  if (v8 >> 62)
  {
LABEL_8:
    v11 = a3;
    v12 = self;
    swift_bridgeObjectRetain();
    v9 = sub_213FF9884();

    swift_bridgeObjectRelease();
    return v9;
  }
  return *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  char *v3;

  v3 = (char *)self + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController_viewModels;
  swift_beginAccess();
  return *(_QWORD *)(*(_QWORD *)v3 + 16);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController *v11;
  id v12;
  uint64_t v14;

  v6 = sub_213FF7574();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213FF7550();
  v10 = a3;
  v11 = self;
  v12 = sub_213F7292C(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController *v11;
  uint64_t v12;

  v6 = sub_213FF7574();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213FF7550();
  v10 = a3;
  v11 = self;
  sub_213F72B80(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController *v11;
  uint64_t v12;

  v6 = sub_213FF7574();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213FF7550();
  v10 = a3;
  v11 = self;
  sub_213F73844(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController *v5;

  v4 = a3;
  v5 = self;
  sub_213F70610();

}

@end
