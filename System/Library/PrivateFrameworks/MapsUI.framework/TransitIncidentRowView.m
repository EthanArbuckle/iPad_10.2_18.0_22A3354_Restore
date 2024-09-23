@implementation TransitIncidentRowView

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _TtC6MapsUI22TransitIncidentRowView *v6;

  v6 = self;
  sub_191DD51DC(a3, a4);

}

- (_TtC6MapsUI22TransitIncidentRowView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI22TransitIncidentRowView_incidentViewModel) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[MUDisclosureActionRowView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtC6MapsUI22TransitIncidentRowView)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI22TransitIncidentRowView_incidentViewModel) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[TransitIncidentRowView initWithCoder:](&v7, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MapsUI22TransitIncidentRowView_incidentViewModel));
}

@end
