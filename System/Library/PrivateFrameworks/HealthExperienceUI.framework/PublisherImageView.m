@implementation PublisherImageView

- (_TtC18HealthExperienceUI18PublisherImageView)initWithImage:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI18PublisherImageView *v5;
  unint64_t v6;
  _TtC18HealthExperienceUI18PublisherImageView *v7;
  objc_super v9;

  v4 = a3;
  v5 = self;
  if ((MEMORY[0x1E0DEE9D8] & 0xC000000000000000) != 0 && sub_1A9A96988())
    v6 = sub_1A96411C0(MEMORY[0x1E0DEE9D8]);
  else
    v6 = MEMORY[0x1E0DEE9E8];
  *(Class *)((char *)&v5->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI18PublisherImageView_cancellables) = (Class)v6;

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for PublisherImageView();
  v7 = -[PublisherImageView initWithImage:](&v9, sel_initWithImage_, v4);

  return v7;
}

- (_TtC18HealthExperienceUI18PublisherImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v6;
  id v7;
  _TtC18HealthExperienceUI18PublisherImageView *v8;
  unint64_t v9;
  _TtC18HealthExperienceUI18PublisherImageView *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v8 = self;
  if ((MEMORY[0x1E0DEE9D8] & 0xC000000000000000) != 0 && sub_1A9A96988())
    v9 = sub_1A96411C0(MEMORY[0x1E0DEE9D8]);
  else
    v9 = MEMORY[0x1E0DEE9E8];
  *(Class *)((char *)&v8->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI18PublisherImageView_cancellables) = (Class)v9;

  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for PublisherImageView();
  v10 = -[PublisherImageView initWithImage:highlightedImage:](&v12, sel_initWithImage_highlightedImage_, v6, v7);

  return v10;
}

- (_TtC18HealthExperienceUI18PublisherImageView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC18HealthExperienceUI18PublisherImageView *v7;
  unint64_t v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  if ((MEMORY[0x1E0DEE9D8] & 0xC000000000000000) != 0 && sub_1A9A96988())
    v8 = sub_1A96411C0(MEMORY[0x1E0DEE9D8]);
  else
    v8 = MEMORY[0x1E0DEE9E8];
  *(Class *)((char *)&v7->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI18PublisherImageView_cancellables) = (Class)v8;

  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for PublisherImageView();
  return -[PublisherImageView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtC18HealthExperienceUI18PublisherImageView)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI18PublisherImageView *)PublisherImageView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
