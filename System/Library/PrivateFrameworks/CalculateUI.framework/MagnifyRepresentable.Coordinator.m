@implementation MagnifyRepresentable.Coordinator

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  _TtCV11CalculateUI20MagnifyRepresentable11Coordinator *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_23765BE24(v7);

  return v9;
}

- (_TtCV11CalculateUI20MagnifyRepresentable11Coordinator)init
{
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCV11CalculateUI20MagnifyRepresentable11Coordinator_initialLocation);
  v4 = (objc_class *)type metadata accessor for MagnifyRepresentable.Coordinator();
  *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[MagnifyRepresentable.Coordinator init](&v6, sel_init);
}

@end
