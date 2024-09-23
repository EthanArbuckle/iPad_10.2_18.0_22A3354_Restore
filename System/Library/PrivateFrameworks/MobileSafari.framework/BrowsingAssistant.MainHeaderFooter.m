@implementation BrowsingAssistant.MainHeaderFooter

- (_TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18BABD198();
}

- (_TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter)initWithFrame:(CGRect)a3
{
  return (_TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter *)sub_18BABBB78(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)isLeadingButtonEnabled
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_leadingButton), sel_isEnabled);
}

- (void)setLeadingButtonEnabled:(BOOL)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_leadingButton), sel_setEnabled_, a3);
}

- (id)leadingButtonActionHandler
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  if (!*(Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_leadingButtonActionHandler))
    return 0;
  v2 = *(_QWORD *)((char *)&self->super.super.super._responderFlags
                 + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_leadingButtonActionHandler);
  v5[4] = *(Class *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_leadingButtonActionHandler);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 1107296256;
  v5[2] = sub_18BA5AA30;
  v5[3] = &block_descriptor_48;
  v3 = _Block_copy(v5);
  sub_18BABFBB4();
  swift_release();
  return v3;
}

- (void)setLeadingButtonActionHandler:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t (**v7)();
  uint64_t v8;

  v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v5;
    v6 = sub_18BABCE54;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self
                      + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_leadingButtonActionHandler);
  v8 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_leadingButtonActionHandler);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_18B8D1DAC(v8);
}

- (SFStepper)stepper
{
  return (SFStepper *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                              + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_stepper));
}

- (void)setStepper:(id)a3
{
  id v5;
  _TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter *v6;

  v5 = a3;
  v6 = self;
  sub_18BABC5E4(a3);

}

- (void).cxx_destruct
{
  sub_18B8D1DAC(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_leadingButtonActionHandler));
  sub_18B8D1DAC(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_trailingButtonActionHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_leadingButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_trailingButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_stepper));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_backgroundView));
}

@end
