@implementation ContactsButtonSlotView

- (_TtC10ContactsUI22ContactsButtonSlotView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  id v9;
  _TtC10ContactsUI22ContactsButtonSlotView *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtC10ContactsUI22ContactsButtonSlotView_internalSlotView;
  v9 = objc_allocWithZone(MEMORY[0x1E0DC4360]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);
  v11 = OBJC_IVAR____TtC10ContactsUI22ContactsButtonSlotView_logger;
  if (qword_1EDF98248 != -1)
    swift_once();
  v12 = sub_18AF4E900();
  v13 = __swift_project_value_buffer(v12, (uint64_t)qword_1EDFA8B40);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16))((char *)v10 + v11, v13, v12);
  *(Class *)((char *)&v10->super.super.super.isa + OBJC_IVAR____TtC10ContactsUI22ContactsButtonSlotView_slotMaker) = 0;

  v15.receiver = v10;
  v15.super_class = (Class)type metadata accessor for ContactsButtonSlotView(0);
  return -[ContactsButtonSlotView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
}

- (_TtC10ContactsUI22ContactsButtonSlotView)init
{
  uint64_t v3;
  id v4;
  _TtC10ContactsUI22ContactsButtonSlotView *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v3 = OBJC_IVAR____TtC10ContactsUI22ContactsButtonSlotView_internalSlotView;
  v4 = objc_allocWithZone(MEMORY[0x1E0DC4360]);
  v5 = self;
  *(Class *)((char *)&self->super.super.super.isa + v3) = (Class)objc_msgSend(v4, sel_init);
  v6 = OBJC_IVAR____TtC10ContactsUI22ContactsButtonSlotView_logger;
  if (qword_1EDF98248 != -1)
    swift_once();
  v7 = sub_18AF4E900();
  v8 = __swift_project_value_buffer(v7, (uint64_t)qword_1EDFA8B40);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))((char *)v5 + v6, v8, v7);
  *(Class *)((char *)&v5->super.super.super.isa + OBJC_IVAR____TtC10ContactsUI22ContactsButtonSlotView_slotMaker) = 0;

  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for ContactsButtonSlotView(0);
  return -[ContactsButtonSlotView initWithFrame:](&v10, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

- (_TtC10ContactsUI22ContactsButtonSlotView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC10ContactsUI22ContactsButtonSlotView *result;

  v5 = OBJC_IVAR____TtC10ContactsUI22ContactsButtonSlotView_internalSlotView;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC4360]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = OBJC_IVAR____TtC10ContactsUI22ContactsButtonSlotView_logger;
  if (qword_1EDF98248 != -1)
    swift_once();
  v9 = sub_18AF4E900();
  v10 = __swift_project_value_buffer(v9, (uint64_t)qword_1EDFA8B40);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))((char *)self + v8, v10, v9);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10ContactsUI22ContactsButtonSlotView_slotMaker) = 0;

  result = (_TtC10ContactsUI22ContactsButtonSlotView *)sub_18AF50310();
  __break(1u);
  return result;
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ContactsButtonSlotView(0);
  -[ContactsButtonSlotView frame](&v6, sel_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ContactsButtonSlotView(0);
  v7 = v8.receiver;
  -[ContactsButtonSlotView setFrame:](&v8, sel_setFrame_, x, y, width, height);
  sub_18AD050C4();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI22ContactsButtonSlotView_internalSlotView));
  v3 = (char *)self + OBJC_IVAR____TtC10ContactsUI22ContactsButtonSlotView_logger;
  v4 = sub_18AF4E900();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
}

@end
