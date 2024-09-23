@implementation GKMultiplayerPickerPlayerCell

+ (NSString)reuseIdentifier
{
  void *v2;

  static GKMultiplayerPickerPlayerCell.reuseIdentifier.getter();
  v2 = (void *)sub_1AB7DAF60();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC12GameCenterUI29GKMultiplayerPickerPlayerCell)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI29GKMultiplayerPickerPlayerCell *)GKMultiplayerPickerPlayerCell.init(frame:)();
}

- (_TtC12GameCenterUI29GKMultiplayerPickerPlayerCell)initWithCoder:(id)a3
{
  sub_1AB5841A8();
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI29GKMultiplayerPickerPlayerCell *v2;

  v2 = self;
  GKMultiplayerPickerPlayerCell.layoutSubviews()();

}

- (void)applyWithPlayer:(id)a3 isCoreRecent:(BOOL)a4
{
  id v6;
  _TtC12GameCenterUI29GKMultiplayerPickerPlayerCell *v7;

  v6 = a3;
  v7 = self;
  GKMultiplayerPickerPlayerCell.apply(player:isCoreRecent:)((GKPlayer)v6, a4);

}

+ (CGSize)preferredSizeFitting:(CGSize)a3 inTraitEnvironment:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  swift_unknownObjectRetain();
  static GKMultiplayerPickerPlayerCell.preferredSize(fitting:in:)(a4);
  v6 = v5;
  v8 = v7;
  swift_unknownObjectRelease();
  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12GameCenterUI29GKMultiplayerPickerPlayerCell *v6;
  _TtC12GameCenterUI29GKMultiplayerPickerPlayerCell *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  GKMultiplayerPickerPlayerCell.traitCollectionDidChange(_:)(v8);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI29GKMultiplayerPickerPlayerCell_lockupView));
}

@end
