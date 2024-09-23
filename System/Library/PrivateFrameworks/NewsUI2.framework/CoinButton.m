@implementation CoinButton

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1D60B323C(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesBegan_withEvent_, sub_1D60B2C48);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1D60B323C(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesEnded_withEvent_, sub_1D60B2F14);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_1D60B323C(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesCancelled_withEvent_, sub_1D60B2F14);
}

- (_TtC7NewsUI210CoinButton)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI210CoinButton *)sub_1D60B333C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI210CoinButton)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Class v9;
  id v10;
  id v11;
  _TtC7NewsUI210CoinButton *result;

  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags + OBJC_IVAR____TtC7NewsUI210CoinButton_linkedToggle) = 0;
  swift_unknownObjectWeakInit();
  v5 = (char *)self + OBJC_IVAR____TtC7NewsUI210CoinButton_toggleState;
  v6 = *MEMORY[0x1E0DB6BE8];
  v7 = sub_1D6E1CAF0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v5, v6, v7);
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7NewsUI210CoinButton_isBouncingEnabled) = 1;
  v8 = OBJC_IVAR____TtC7NewsUI210CoinButton_onTap;
  sub_1D60B4250();
  v10 = objc_allocWithZone(v9);
  v11 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)objc_msgSend(v10, sel_init);

  result = (_TtC7NewsUI210CoinButton *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1D60B39EC(self, (uint64_t)a2, (void (*)(void))sub_1D60B3614);
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_1D60B39EC(self, (uint64_t)a2, (void (*)(void))sub_1D60B3808);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_1D60B39EC(self, (uint64_t)a2, (void (*)(void))sub_1D60B3A54);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI210CoinButton_linkedToggle);
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI210CoinButton_toggleState;
  v4 = sub_1D6E1CAF0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

@end
