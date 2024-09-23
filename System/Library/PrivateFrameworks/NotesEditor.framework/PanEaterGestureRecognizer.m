@implementation PanEaterGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1DD8F31C8(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t))sub_1DD8FC4FC);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_1DD8F31C8(self, (uint64_t)a2, (uint64_t)a3, a4, sub_1DD8FC594);
}

- (uint64_t)touchesEnded:(uint64_t)a3 withEvent:(void *)a4
{
  uint64_t v6;
  id v7;
  id v8;

  sub_1DD7C0C74(0, &qword_1F03F69C0);
  sub_1DD8FBD0C((unint64_t *)&qword_1F03F9270, &qword_1F03F69C0, 0x1E0DC3E78, MEMORY[0x1E0DEFCF8]);
  v6 = sub_1DD9D2398();
  v7 = a4;
  v8 = a1;
  sub_1DD8FC68C(v6);

  return swift_bridgeObjectRelease();
}

- (void)reset
{
  char *v2;
  void *v3;
  char *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PanEaterGestureRecognizer();
  v2 = (char *)v5.receiver;
  -[PanEaterGestureRecognizer reset](&v5, sel_reset);
  v3 = *(void **)&v2[OBJC_IVAR____TtC11NotesEditor25PanEaterGestureRecognizer_touch];
  *(_QWORD *)&v2[OBJC_IVAR____TtC11NotesEditor25PanEaterGestureRecognizer_touch] = 0;

  v4 = &v2[OBJC_IVAR____TtC11NotesEditor25PanEaterGestureRecognizer_startPoint];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;

}

- (_TtC11NotesEditor25PanEaterGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _OWORD v6[2];

  if (a3)
  {
    swift_unknownObjectRetain();
    sub_1DD9D2AC4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtC11NotesEditor25PanEaterGestureRecognizer *)sub_1DD8F33A4((uint64_t)v6, (uint64_t)a4);
}

- (void).cxx_destruct
{

}

@end
