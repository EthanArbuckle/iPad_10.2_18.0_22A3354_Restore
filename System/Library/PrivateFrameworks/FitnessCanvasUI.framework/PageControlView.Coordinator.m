@implementation PageControlView.Coordinator

- (void)updateCurrentPageWithSender:(id)a3
{
  id v5;
  _TtCV15FitnessCanvasUI15PageControlView11Coordinator *v6;

  swift_retain();
  swift_retain();
  v5 = a3;
  v6 = self;
  objc_msgSend(v5, sel_currentPage);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256AE9048);
  sub_23BFF90DC();

  swift_release();
  swift_release();
}

- (_TtCV15FitnessCanvasUI15PageControlView11Coordinator)init
{
  _TtCV15FitnessCanvasUI15PageControlView11Coordinator *result;

  result = (_TtCV15FitnessCanvasUI15PageControlView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
