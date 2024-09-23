@implementation PlatformViewController

- (BOOL)_canShowWhileLocked
{
  return sub_237671878() & 1;
}

- (void)loadView
{
  id v3;
  _TtC11CalculateUI22PlatformViewController *v4;
  id v5;

  type metadata accessor for PlatformView();
  v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v4 = self;
  v5 = objc_msgSend(v3, sel_init);
  -[PlatformViewController setView:](v4, sel_setView_, v5);

}

- (void)viewDidLoad
{
  _TtC11CalculateUI22PlatformViewController *v2;

  v2 = self;
  sub_237670294();

}

- (void)longPress:(id)a3
{
  id v4;
  _TtC11CalculateUI22PlatformViewController *v5;

  v4 = a3;
  v5 = self;
  if (objc_msgSend(v4, sel_state) == (id)1)
    sub_2376704D8(v4);

}

- (void)buildMenuWithBuilder:(id)a3
{
  uint64_t v5;
  _TtC11CalculateUI22PlatformViewController *v6;
  objc_super v7;

  v5 = *MEMORY[0x24BEBE598];
  swift_unknownObjectRetain();
  v6 = self;
  objc_msgSend(a3, sel_removeMenuForIdentifier_, v5);
  v7.receiver = v6;
  v7.super_class = (Class)type metadata accessor for PlatformViewController();
  -[PlatformViewController buildMenuWithBuilder:](&v7, sel_buildMenuWithBuilder_, a3);
  swift_unknownObjectRelease();

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC11CalculateUI22PlatformViewController *v5;
  _TtC11CalculateUI22PlatformViewController *v6;
  char v7;
  _OWORD v9[2];

  if (a4)
  {
    v5 = self;
    swift_unknownObjectRetain();
    sub_2376A3DDC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v6 = self;
  }
  v7 = sub_237671A44();

  sub_2376690F8((uint64_t)v9);
  return v7 & 1;
}

- (void)copy:(id)a3
{
  _TtC11CalculateUI22PlatformViewController *v4;
  _TtC11CalculateUI22PlatformViewController *v5;
  void (*v6)(_QWORD, _QWORD);
  _OWORD v7[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_2376A3DDC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    v5 = self;
  }
  v6 = *(void (**)(_QWORD, _QWORD))((char *)&self->super.super.super.isa
                                             + OBJC_IVAR____TtC11CalculateUI22PlatformViewController_handlePasteboard);
  if (v6)
  {
    swift_retain();
    v6(0, 0);
    sub_23765C974((uint64_t)v6);
  }

  sub_2376690F8((uint64_t)v7);
}

- (void)paste:(id)a3
{
  _TtC11CalculateUI22PlatformViewController *v4;
  _TtC11CalculateUI22PlatformViewController *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_2376A3DDC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_2376707E4((uint64_t)v6);

  sub_2376690F8((uint64_t)v6);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC11CalculateUI22PlatformViewController *v8;

  sub_23765B0F0(0, (unint64_t *)&qword_256804A90);
  sub_237671548();
  v6 = sub_2376A3CEC();
  v7 = a4;
  v8 = self;
  sub_237670B3C(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (_TtC11CalculateUI22PlatformViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_2376A3B90();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC11CalculateUI22PlatformViewController *)sub_237670CDC(v5, v7, a4);
}

- (_TtC11CalculateUI22PlatformViewController)initWithCoder:(id)a3
{
  return (_TtC11CalculateUI22PlatformViewController *)sub_237670DFC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11CalculateUI22PlatformViewController_editMenuInteraction));
  sub_23765C974(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11CalculateUI22PlatformViewController_handleKeypress));
  sub_23765C974(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11CalculateUI22PlatformViewController_handlePasteboard));
  sub_23765C974(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11CalculateUI22PlatformViewController_allowHighPrecision));
}

@end
