@implementation FMIncorrectOrientationView

- (_TtC11FMFindingUI26FMIncorrectOrientationView)init
{
  return (_TtC11FMFindingUI26FMIncorrectOrientationView *)sub_23AA10D88();
}

- (_TtC11FMFindingUI26FMIncorrectOrientationView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_23AA11960();
}

- (_TtC11FMFindingUI26FMIncorrectOrientationView)initWithFrame:(CGRect)a3
{
  _TtC11FMFindingUI26FMIncorrectOrientationView *result;

  result = (_TtC11FMFindingUI26FMIncorrectOrientationView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[11];
  uint64_t v9;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_subtitleLabel));
  v3 = *(_OWORD *)((char *)&self->super._minimumSafeAreaInsets.left
                 + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_style);
  v8[8] = *(_OWORD *)((char *)&self->super._viewFlags
                    + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_style
                    + 24);
  v8[9] = v3;
  v8[10] = *(_OWORD *)((char *)&self->super._minimumSafeAreaInsets.right
                     + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_style);
  v9 = *(uint64_t *)((char *)&self->super._viewBackingAux
                  + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_style);
  v4 = *(_OWORD *)((char *)&self->super._window + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_style);
  v8[4] = *(_OWORD *)((char *)&self->super._layerRetained
                    + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_style);
  v8[5] = v4;
  v5 = *(_OWORD *)((char *)&self->super._viewFlags + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_style + 8);
  v8[6] = *(_OWORD *)((char *)&self->super._viewDelegate
                    + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_style);
  v8[7] = v5;
  v6 = *(_OWORD *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_style);
  v8[0] = *(_OWORD *)((char *)&self->super.super.super.isa
                    + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_style);
  v8[1] = v6;
  v7 = *(_OWORD *)((char *)&self->super._swiftAnimationInfo
                 + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_style);
  v8[2] = *(_OWORD *)((char *)&self->super._cachedTraitCollection
                    + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_style);
  v8[3] = v7;
  sub_23A9E4A18((uint64_t)v8);
}

@end
