@implementation IdentityProofingReviewSubmissionViewController

- (_TtC9CoreIDVUI46IdentityProofingReviewSubmissionViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_213FBDBF0();
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC9CoreIDVUI46IdentityProofingReviewSubmissionViewController *v4;

  v4 = self;
  sub_213FB8EDC(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  _BYTE *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for IdentityProofingReviewSubmissionViewController();
  v4 = v6.receiver;
  -[IdentityProofingReviewSubmissionViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, v3);
  v5 = sub_213FD8640();
  sub_213FA7CBC(0);

}

- (void)viewDidLoad
{
  _TtC9CoreIDVUI46IdentityProofingReviewSubmissionViewController *v2;

  v2 = self;
  sub_213FB91BC();

}

- (void)updateViewLayout:(id)a3 previousTraitCollection:(id)a4
{
  id v6;
  id v7;
  _TtC9CoreIDVUI46IdentityProofingReviewSubmissionViewController *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_213FDD958(a4);
  v9 = sub_213FB8D88();
  sub_213FDBCCC(v9);

}

- (void)updateUI
{
  _TtC9CoreIDVUI46IdentityProofingReviewSubmissionViewController *v2;

  v2 = self;
  sub_213FB9E20();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super._responderFlags
                     + OBJC_IVAR____TtC9CoreIDVUI46IdentityProofingReviewSubmissionViewController_viewConfiguration));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI46IdentityProofingReviewSubmissionViewController_context));
  swift_release();
  sub_213F4CF08(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC9CoreIDVUI46IdentityProofingReviewSubmissionViewController_unboundACL), *(_QWORD *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC9CoreIDVUI46IdentityProofingReviewSubmissionViewController_unboundACL));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI46IdentityProofingReviewSubmissionViewController____lazy_storage___tableView));
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4;

  v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC9CoreIDVUI46IdentityProofingReviewSubmissionViewController_documentsToBeReviewed);
  if (v4)
    return *(_QWORD *)(v4 + 16);
  else
    return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC9CoreIDVUI46IdentityProofingReviewSubmissionViewController *v11;
  id v12;
  uint64_t v14;

  v6 = sub_213FF7574();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213FF7550();
  v10 = a3;
  v11 = self;
  v12 = sub_213FBCFD4(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = sub_213FF7574();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213FF7550();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 60.0;
}

@end
