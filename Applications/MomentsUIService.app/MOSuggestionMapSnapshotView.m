@implementation MOSuggestionMapSnapshotView

- (void)handleTraitChange
{
  _TtC16MomentsUIService27MOSuggestionMapSnapshotView *v2;

  v2 = self;
  MOSuggestionMapSnapshotView.handleTraitChange()();

}

- (void)layoutSubviews
{
  _TtC16MomentsUIService27MOSuggestionMapSnapshotView *v2;

  v2 = self;
  MOSuggestionMapSnapshotView.layoutSubviews()();

}

- (void)dealloc
{
  _TtC16MomentsUIService27MOSuggestionMapSnapshotView *v2;

  v2 = self;
  MOSuggestionMapSnapshotView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService27MOSuggestionMapSnapshotView_imageView));
  swift_bridgeObjectRelease(*(_QWORD *)&self->imageView[OBJC_IVAR____TtC16MomentsUIService27MOSuggestionMapSnapshotView_prominentField]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->imageView[OBJC_IVAR____TtC16MomentsUIService27MOSuggestionMapSnapshotView_secondaryField]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService27MOSuggestionMapSnapshotView_platterBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService27MOSuggestionMapSnapshotView_labelView));
}

- (_TtC16MomentsUIService27MOSuggestionMapSnapshotView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized MOSuggestionMapSnapshotView.init(coder:)();
}

- (_TtC16MomentsUIService27MOSuggestionMapSnapshotView)initWithFrame:(CGRect)a3
{
  _TtC16MomentsUIService27MOSuggestionMapSnapshotView *result;

  result = (_TtC16MomentsUIService27MOSuggestionMapSnapshotView *)_swift_stdlib_reportUnimplementedInitializer("MomentsUIService.MOSuggestionMapSnapshotView", 44, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

@end
