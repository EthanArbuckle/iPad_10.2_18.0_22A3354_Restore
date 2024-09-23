@implementation CKGenerateButtonBackground

- (_TtC7ChatKitP33_48E4CE588C5118AF31EDCFDBF5B7EAE826CKGenerateButtonBackground)initWithFrame:(CGRect)a3
{
  _TtC7ChatKitP33_48E4CE588C5118AF31EDCFDBF5B7EAE826CKGenerateButtonBackground *result;

  sub_18E6075FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC7ChatKitP33_48E4CE588C5118AF31EDCFDBF5B7EAE826CKGenerateButtonBackground)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18E607E54();
}

- (void)layoutSubviews
{
  _TtC7ChatKitP33_48E4CE588C5118AF31EDCFDBF5B7EAE826CKGenerateButtonBackground *v2;

  v2 = self;
  sub_18E607C6C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKitP33_48E4CE588C5118AF31EDCFDBF5B7EAE826CKGenerateButtonBackground_backdropLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKitP33_48E4CE588C5118AF31EDCFDBF5B7EAE826CKGenerateButtonBackground_maskLayer));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKitP33_48E4CE588C5118AF31EDCFDBF5B7EAE826CKGenerateButtonBackground_illuminatedPlusLighterLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKitP33_48E4CE588C5118AF31EDCFDBF5B7EAE826CKGenerateButtonBackground_illuminatedPlusDarkerLayer));
}

@end
