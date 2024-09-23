@implementation BandCollectionViewCell

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BandCollectionViewCell();
  v2 = v3.receiver;
  -[BandCollectionViewCell layoutSubviews](&v3, sel_layoutSubviews);
  sub_2131CB444();

}

- (_TtC12CoreAudioKit22BandCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit22BandCollectionViewCell *)sub_2131CB7A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit22BandCollectionViewCell)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit22BandCollectionViewCell *)sub_2131CB8F4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit22BandCollectionViewCell_label));
}

@end
