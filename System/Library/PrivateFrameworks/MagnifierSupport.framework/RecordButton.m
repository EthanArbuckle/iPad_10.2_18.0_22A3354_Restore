@implementation RecordButton

- (_TtC16MagnifierSupport12RecordButton)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport12RecordButton *)sub_22753A958(a3);
}

- (_TtC16MagnifierSupport12RecordButton)initWithFrame:(CGRect)a3
{
  return (_TtC16MagnifierSupport12RecordButton *)sub_22753AA84(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)awakeFromNib
{
  id v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RecordButton();
  v2 = v4.receiver;
  -[RecordButton awakeFromNib](&v4, sel_awakeFromNib);
  v3 = (void *)sub_22758E1B4();
  objc_msgSend(v2, sel_setTitle_forState_, v3, 0, v4.receiver, v4.super_class);

}

- (void)drawRect:(CGRect)a3
{
  _TtC16MagnifierSupport12RecordButton *v3;

  v3 = self;
  sub_22753B1A8();

}

- (BOOL)isEnabled
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RecordButton();
  return -[RecordButton isEnabled](&v3, sel_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  _TtC16MagnifierSupport12RecordButton *v4;

  v4 = self;
  sub_22753ACE8(a3);

}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport12RecordButton__centerShapeFillColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport12RecordButton____lazy_storage___squareBezierPath));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport12RecordButton____lazy_storage___circleBezierPath));
}

@end
