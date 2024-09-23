@implementation InteractionHandlingView.UIViewType

- (void)handleDragGesture:(id)a3
{
  _BYTE *v4;
  _TtCV6Charts23InteractionHandlingView10UIViewType *v5;

  v4 = a3;
  v5 = self;
  sub_2141E3320(v4);

}

- (void)handleHover:(id)a3
{
  id v4;
  _TtCV6Charts23InteractionHandlingView10UIViewType *v5;

  v4 = a3;
  v5 = self;
  sub_2141E352C(v4);

}

- (_TtCV6Charts23InteractionHandlingView10UIViewType)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  id v11;
  _TtCV6Charts23InteractionHandlingView10UIViewType *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtCV6Charts23InteractionHandlingView10UIViewType_onChanged);
  *v8 = 0;
  v8[1] = 0;
  v9 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtCV6Charts23InteractionHandlingView10UIViewType_onEnd);
  *v9 = 0;
  v9[1] = 0;
  v10 = OBJC_IVAR____TtCV6Charts23InteractionHandlingView10UIViewType_panDelegate;
  v11 = objc_allocWithZone((Class)type metadata accessor for InteractionHandlingView.UIViewType.PanDelegate());
  v12 = self;
  *(Class *)((char *)&self->super.super.super.isa + v10) = (Class)objc_msgSend(v11, sel_init);

  v14.receiver = v12;
  v14.super_class = (Class)type metadata accessor for InteractionHandlingView.UIViewType();
  return -[InteractionHandlingView.UIViewType initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
}

- (_TtCV6Charts23InteractionHandlingView10UIViewType)initWithCoder:(id)a3
{
  return (_TtCV6Charts23InteractionHandlingView10UIViewType *)sub_2141E3750(a3);
}

- (void).cxx_destruct
{
  sub_2141D972C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtCV6Charts23InteractionHandlingView10UIViewType_onChanged));
  sub_2141D972C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtCV6Charts23InteractionHandlingView10UIViewType_onEnd));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV6Charts23InteractionHandlingView10UIViewType_panDelegate));
}

@end
