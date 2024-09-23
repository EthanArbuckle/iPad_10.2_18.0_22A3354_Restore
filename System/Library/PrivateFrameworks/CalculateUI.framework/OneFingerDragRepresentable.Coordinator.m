@implementation OneFingerDragRepresentable.Coordinator

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtCV11CalculateUI26OneFingerDragRepresentable11Coordinator *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_23767A26C(v7);

  return v9;
}

- (_TtCV11CalculateUI26OneFingerDragRepresentable11Coordinator)init
{
  _TtCV11CalculateUI26OneFingerDragRepresentable11Coordinator *result;

  result = (_TtCV11CalculateUI26OneFingerDragRepresentable11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtCV11CalculateUI26OneFingerDragRepresentable11Coordinator_converter;
  v3 = sub_2376A32A8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_release();
}

@end
