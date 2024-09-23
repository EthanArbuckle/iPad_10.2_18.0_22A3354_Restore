@implementation LinkAcceleratorHostingController

- (_TtC11NotesEditor32LinkAcceleratorHostingController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  char *v8;
  id v9;
  char *v10;
  id v11;
  _TtC11NotesEditor32LinkAcceleratorHostingController *v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_1DD9D2170();
    v8 = (char *)self + OBJC_IVAR____TtC11NotesEditor32LinkAcceleratorHostingController_acceleratorHostingDelegate;
    *(_OWORD *)v8 = 0u;
    *((_OWORD *)v8 + 1) = 0u;
    *((_QWORD *)v8 + 4) = 0;
    v9 = a4;
    a3 = (id)sub_1DD9D2140();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = (char *)self + OBJC_IVAR____TtC11NotesEditor32LinkAcceleratorHostingController_acceleratorHostingDelegate;
    *(_OWORD *)v10 = 0u;
    *((_OWORD *)v10 + 1) = 0u;
    *((_QWORD *)v10 + 4) = 0;
    v11 = a4;
  }
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = -[LinkAcceleratorHostingController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, a3, a4);

  return v12;
}

- (_TtC11NotesEditor32LinkAcceleratorHostingController)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  char *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (char *)self + OBJC_IVAR____TtC11NotesEditor32LinkAcceleratorHostingController_acceleratorHostingDelegate;
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_QWORD *)v6 + 4) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[LinkAcceleratorHostingController initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_1DD8FF244((uint64_t)self + OBJC_IVAR____TtC11NotesEditor32LinkAcceleratorHostingController_acceleratorHostingDelegate, &qword_1F03FA368);
}

@end
