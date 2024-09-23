@implementation MUPlacePhotoObfuscationView

- (NSAttributedString)attributedText
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUPlacePhotoObfuscationView_attributedText);
  swift_beginAccess();
  return (NSAttributedString *)*v2;
}

- (void)setAttributedText:(id)a3
{
  id *v5;
  id v6;
  id v7;
  MUPlacePhotoObfuscationView *v8;

  v5 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUPlacePhotoObfuscationView_attributedText);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  objc_msgSend(*(id *)((char *)&v8->super.super.super.isa + OBJC_IVAR___MUPlacePhotoObfuscationView_label), sel_setAttributedText_, *v5);
}

- (MUPlacePhotoObfuscationView)initWithFrame:(CGRect)a3
{
  MUPlacePhotoObfuscationView *result;

  PlacePhotoObfuscationView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (MUPlacePhotoObfuscationView)initWithCoder:(id)a3
{
  id v4;
  MUPlacePhotoObfuscationView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUPlacePhotoObfuscationView_attributedText) = 0;
  v4 = a3;

  result = (MUPlacePhotoObfuscationView *)sub_191EEB2C0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
