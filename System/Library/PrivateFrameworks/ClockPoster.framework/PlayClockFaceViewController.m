@implementation PlayClockFaceViewController

- (_TtC11ClockPoster27PlayClockFaceViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC11ClockPoster27PlayClockFaceViewController *result;

  v5 = OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_clockFace;
  type metadata accessor for PlayClockFaceView();
  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC11ClockPoster27PlayClockFaceViewController *)sub_237EE309C();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  _TtC11ClockPoster27PlayClockFaceViewController *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  objc_super v13;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256897E20);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for PlayClockFaceViewController();
  v13.receiver = self;
  v13.super_class = v6;
  v7 = self;
  -[ClockFaceViewController viewDidLoad](&v13, sel_viewDidLoad);
  v8 = sub_237EE2C64();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_237EE2C4C();
  swift_retain();
  v10 = sub_237EE2C40();
  v11 = (_QWORD *)swift_allocObject();
  v12 = MEMORY[0x24BEE6930];
  v11[2] = v10;
  v11[3] = v12;
  v11[4] = v9;
  swift_release();
  sub_237EDA9E4((uint64_t)v5, (uint64_t)&unk_25689CE88, (uint64_t)v11);

  swift_release();
}

- (void).cxx_destruct
{
  sub_237E2846C((uint64_t)self + OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_look);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_clockFace));
}

@end
