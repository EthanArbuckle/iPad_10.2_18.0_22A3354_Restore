@implementation TextCorrectionMarkerView

- (_TtC11NotesEditor24TextCorrectionMarkerView)initWithFrame:(CGRect)a3
{
  return (_TtC11NotesEditor24TextCorrectionMarkerView *)sub_1DD95215C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11NotesEditor24TextCorrectionMarkerView)initWithCoder:(id)a3
{
  id v5;
  _TtC11NotesEditor24TextCorrectionMarkerView *result;

  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11NotesEditor24TextCorrectionMarkerView_markers) = (Class)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor24TextCorrectionMarkerView_minimumMarkerWidth) = (Class)0x4034000000000000;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11NotesEditor24TextCorrectionMarkerView_markerYOffset) = (Class)0xC020000000000000;
  v5 = a3;

  result = (_TtC11NotesEditor24TextCorrectionMarkerView *)sub_1DD9D2CEC();
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
  v6.super_class = (Class)swift_getObjectType();
  -[TextCorrectionMarkerView frame](&v6, sel_frame);
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
  v8.super_class = (Class)swift_getObjectType();
  v7 = v8.receiver;
  -[TextCorrectionMarkerView setFrame:](&v8, sel_setFrame_, x, y, width, height);
  objc_msgSend(v7, sel_setNeedsDisplay, v8.receiver, v8.super_class);

}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC11NotesEditor24TextCorrectionMarkerView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_1DD952564(x, y, width, height);

}

- (void)textViewLayoutDidChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC11NotesEditor24TextCorrectionMarkerView *v8;
  uint64_t v9;

  v4 = sub_1DD9D0538();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD9D0514();
  v8 = self;
  sub_1DD9523A0();
  -[TextCorrectionMarkerView setNeedsDisplay](v8, sel_setNeedsDisplay);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
}

@end
