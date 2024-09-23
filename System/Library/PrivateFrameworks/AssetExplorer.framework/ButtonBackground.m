@implementation ButtonBackground

- (_TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground)initWithFrame:(CGRect)a3
{
  return (_TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground *)sub_21E23E4B8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_21E23EB08();
}

- (void)layoutSubviews
{
  _TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground *v2;

  v2 = self;
  sub_21E23EC18();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_backdropLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_maskLayer));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedPlusLighterLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedPlusDarkerLayer));
}

@end
