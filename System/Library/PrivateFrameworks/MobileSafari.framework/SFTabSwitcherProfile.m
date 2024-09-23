@implementation SFTabSwitcherProfile

- (SFTabSwitcherProfile)initWithTitle:(id)a3
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  objc_super v8;

  v4 = sub_18BAC0DFC();
  v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherProfile_wrapped);
  *v5 = 0;
  v5[1] = 0;
  v5[2] = v4;
  v5[3] = v6;
  v8.receiver = self;
  v8.super_class = (Class)SFTabSwitcherProfile;
  return -[SFTabSwitcherProfile init](&v8, sel_init);
}

- (SFTabSwitcherProfile)init
{
  _QWORD *v2;
  objc_super v4;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherProfile_wrapped);
  *v2 = 0;
  v2[1] = 0;
  v2[2] = 0;
  v2[3] = 0xE000000000000000;
  v4.receiver = self;
  v4.super_class = (Class)SFTabSwitcherProfile;
  return -[SFTabSwitcherProfile init](&v4, sel_init);
}

- (UIImage)image
{
  return (UIImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR___SFTabSwitcherProfile_wrapped));
}

- (void)setImage:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherProfile_wrapped);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherProfile_wrapped) = (Class)a3;
  v3 = a3;

}

- (UIColor)tintColor
{
  return (UIColor *)*(id *)&self->wrapped[OBJC_IVAR___SFTabSwitcherProfile_wrapped];
}

- (void)setTintColor:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->wrapped[OBJC_IVAR___SFTabSwitcherProfile_wrapped];
  *(_QWORD *)&self->wrapped[OBJC_IVAR___SFTabSwitcherProfile_wrapped] = a3;
  v3 = a3;

}

- (NSString)title
{
  void *v2;

  sub_18BABFD34();
  v2 = (void *)sub_18BAC0DCC();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v4 = sub_18BAC0DFC();
  v5 = (char *)self + OBJC_IVAR___SFTabSwitcherProfile_wrapped;
  *((_QWORD *)v5 + 2) = v4;
  *((_QWORD *)v5 + 3) = v6;
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  sub_18B9912F8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherProfile_wrapped, (void (*)(_QWORD))MEMORY[0x1E0DEEB08]);
}

@end
