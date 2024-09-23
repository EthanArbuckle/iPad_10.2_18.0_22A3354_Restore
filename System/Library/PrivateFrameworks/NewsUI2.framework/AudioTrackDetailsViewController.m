@implementation AudioTrackDetailsViewController

- (_TtC7NewsUI231AudioTrackDetailsViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC7NewsUI231AudioTrackDetailsViewController *result;

  v5 = OBJC_IVAR____TtC7NewsUI231AudioTrackDetailsViewController_trackView;
  type metadata accessor for AudioTrackDetailsView();
  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC7NewsUI231AudioTrackDetailsViewController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (_TtC7NewsUI231AudioTrackDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI231AudioTrackDetailsViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI231AudioTrackDetailsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI231AudioTrackDetailsViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI231AudioTrackDetailsViewController_trackView));
  sub_1D5E8D20C((uint64_t)self + OBJC_IVAR____TtC7NewsUI231AudioTrackDetailsViewController_track, type metadata accessor for AudioFeedTrack);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI231AudioTrackDetailsViewController_listeningProgressManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI231AudioTrackDetailsViewController_logoCache);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI231AudioTrackDetailsViewController_artworkCache);
}

- (void)loadView
{
  _TtC7NewsUI231AudioTrackDetailsViewController *v2;

  v2 = self;
  AudioTrackDetailsViewController.loadView()();

}

- (void)viewDidLoad
{
  _TtC7NewsUI231AudioTrackDetailsViewController *v2;

  v2 = self;
  AudioTrackDetailsViewController.viewDidLoad()();

}

- (void)viewDidLayoutSubviews
{
  _TtC7NewsUI231AudioTrackDetailsViewController *v2;

  v2 = self;
  AudioTrackDetailsViewController.viewDidLayoutSubviews()();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v7.receiver;
  -[AudioTrackDetailsViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1D6618508();

}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC7NewsUI231AudioTrackDetailsViewController *v11;
  _BYTE *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = _s7NewsUI231AudioTrackDetailsViewControllerC012presentationG012forPresented10presenting6sourceSo014UIPresentationG0CSgSo06UIViewG0C_ALSgALtF_0(v8, a4);

  return v12;
}

- (void)didTapPlayPauseButton
{
  uint64_t v3;
  void *v4;
  _TtC7NewsUI231AudioTrackDetailsViewController *v5;
  _QWORD v6[6];

  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v6[4] = sub_1D6619324;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1D5EB52E8;
  v6[3] = &block_descriptor_15_3;
  v4 = _Block_copy(v6);
  v5 = self;
  swift_release();
  -[AudioTrackDetailsViewController dismissViewControllerAnimated:completion:](v5, sel_dismissViewControllerAnimated_completion_, 1, v4);
  _Block_release(v4);

}

- (void)didTapReadButton
{
  uint64_t v3;
  void *v4;
  _TtC7NewsUI231AudioTrackDetailsViewController *v5;
  _QWORD v6[6];

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = self;
  v6[4] = sub_1D66192C8;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1D5EB52E8;
  v6[3] = &block_descriptor_98;
  v4 = _Block_copy(v6);
  v5 = self;
  swift_release();
  -[AudioTrackDetailsViewController dismissViewControllerAnimated:completion:](v5, sel_dismissViewControllerAnimated_completion_, 1, v4);
  _Block_release(v4);

}

- (void)didTapCloseButton
{
  -[AudioTrackDetailsViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (BOOL)accessibilityPerformEscape
{
  -[AudioTrackDetailsViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
  return 1;
}

@end
