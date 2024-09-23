@implementation SoftwareUpdateRequiredViewController

- (void)viewDidLoad
{
  _TtC14HDSViewService36SoftwareUpdateRequiredViewController *v2;

  v2 = self;
  sub_100056C58();

}

- (_TtC14HDSViewService36SoftwareUpdateRequiredViewController)initWithContentView:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService36SoftwareUpdateRequiredViewController_offsetIcon] = 1;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[SoftwareUpdateRequiredViewController initWithContentView:](&v7, "initWithContentView:", a3);
}

@end
