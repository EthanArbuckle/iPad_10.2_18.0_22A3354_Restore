@implementation CAFUITileBaseCell

- (_TtC5CAFUI17CAFUITileBaseCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC5CAFUI17CAFUITileBaseCell *result;

  *((_BYTE *)&self->super.super.super.super.super.super.isa + OBJC_IVAR____TtC5CAFUI17CAFUITileBaseCell_isParentCell) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC5CAFUI17CAFUITileBaseCell_automakerSettingConfiguration;
  v6 = type metadata accessor for CAFUIAutomakerSettingConfiguration(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = a3;

  result = (_TtC5CAFUI17CAFUITileBaseCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC5CAFUI17CAFUITileBaseCell)initWithFrame:(CGRect)a3
{
  return (_TtC5CAFUI17CAFUITileBaseCell *)CAFUITileBaseCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC5CAFUI17CAFUITileBaseCell *v8;
  uint64_t v9;

  v4 = type metadata accessor for UICellConfigurationState();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  CAFUITileBaseCell.updateConfiguration(using:)((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)prepareForReuse
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CAFUITileBaseCell();
  v2 = v3.receiver;
  -[CAFUITileBaseCell prepareForReuse](&v3, sel_prepareForReuse);
  UICollectionViewListCell.accessories.setter();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI17CAFUITileBaseCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI17CAFUITileBaseCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI17CAFUITileBaseCell_symbolView));
  outlined destroy of UIContentConfiguration?((uint64_t)self + OBJC_IVAR____TtC5CAFUI17CAFUITileBaseCell_automakerSettingConfiguration, (uint64_t *)&demangling cache variable for type metadata for CAFUIAutomakerSettingConfiguration?);
}

@end
