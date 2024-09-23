@implementation SFStepper

- (SFStepper)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _sSo9SFStepperC12MobileSafariE5coderABSgSo7NSCoderC_tcfc_0();
}

- (SFStepper)initWithFrame:(CGRect)a3
{
  return (SFStepper *)SFStepper.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (double)_continuousCornerRadius
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFStepper;
  -[SFStepper _continuousCornerRadius](&v3, sel__continuousCornerRadius);
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  SFStepper *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFStepper;
  v4 = self;
  -[SFStepper _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_, a3);
  objc_msgSend(*(id *)((char *)&v4->super.super.super.isa + OBJC_IVAR___SFStepper_containerView), sel__setContinuousCornerRadius_, a3, v5.receiver, v5.super_class);
  objc_msgSend(*(id *)((char *)&v4->super.super.super.isa + OBJC_IVAR___SFStepper_shadowView), sel__setContinuousCornerRadius_, a3);

}

- (_TtC12MobileSafari10MainButton)leadingButton
{
  return (_TtC12MobileSafari10MainButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                   + OBJC_IVAR___SFStepper_leadingButton));
}

- (_TtC12MobileSafari10MainButton)trailingButton
{
  return (_TtC12MobileSafari10MainButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                   + OBJC_IVAR___SFStepper_trailingButton));
}

- (id)decrementButtonActionHandler
{
  return sub_18B9289D0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFStepper_decrementButtonActionHandler, (uint64_t)&block_descriptor_33);
}

- (void)setDecrementButtonActionHandler:(id)a3
{
  uint64_t (*v4)();
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = (uint64_t (*)())_Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_18B92A178;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___SFStepper_decrementButtonActionHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_18B8D1DAC(v7);
}

- (id)incrementButtonActionHandler
{
  return sub_18B9289D0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFStepper_incrementButtonActionHandler, (uint64_t)&block_descriptor_26);
}

- (void)setIncrementButtonActionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_18B92A118;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___SFStepper_incrementButtonActionHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_18B8D1DAC(v7);
}

- (BOOL)isFocusedInPageMenu
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SFStepper_isFocusedInPageMenu;
  swift_beginAccess();
  return *v2;
}

- (void)setIsFocusedInPageMenu:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SFStepper_isFocusedInPageMenu;
  swift_beginAccess();
  *v4 = a3;
}

- (NSString)hintText
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___SFStepper_hintText;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  sub_18BABFD34();
  v3 = (void *)sub_18BAC0DCC();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setHintText:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  SFStepper *v7;

  if (a3)
  {
    v4 = sub_18BAC0DFC();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  SFStepper.hintText.setter(v4, v6);

}

- (BOOL)needsInitialBlink
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SFStepper_needsInitialBlink;
  swift_beginAccess();
  return *v2;
}

- (void)setNeedsInitialBlink:(BOOL)a3
{
  int v3;
  _BYTE *v5;
  int v6;
  SFStepper *v7;

  v3 = a3;
  v5 = (char *)self + OBJC_IVAR___SFStepper_needsInitialBlink;
  swift_beginAccess();
  v6 = *v5;
  *v5 = v3;
  if (v6 != v3)
  {
    v7 = self;
    if (-[SFStepper needsInitialBlink](v7, sel_needsInitialBlink))
      -[SFStepper blink](v7, sel_blink);

  }
}

- (void)blink
{
  SFStepper *v2;

  v2 = self;
  SFStepper.blink()();

}

- (void)pulse
{
  SFStepper *v2;

  v2 = self;
  sub_18B929628();

}

- (void)prepareForFocus
{
  SFStepper *v2;

  v2 = self;
  SFStepper.prepareForFocus()();

}

- (void)setEnabled:(BOOL)a3 forButton:(int64_t)a4
{
  _BOOL8 v4;
  char **v5;
  SFStepper *v6;
  id v7;

  v4 = a3;
  if (a4 == 1)
  {
    v5 = &selRef_leadingButton;
  }
  else
  {
    if (a4)
      return;
    v5 = &selRef_trailingButton;
  }
  v6 = self;
  v7 = objc_msgSend(v6, *v5);
  objc_msgSend(v7, sel_setEnabled_, v4);

}

- (void).cxx_destruct
{

  sub_18B8D1DAC(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFStepper_decrementButtonActionHandler));
  sub_18B8D1DAC(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFStepper_incrementButtonActionHandler));
  swift_bridgeObjectRelease();
}

@end
