@implementation TapbackPickerButtonView

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)longPressRecognized:(id)a3
{
  id v4;
  _TtC7ChatKit23TapbackPickerButtonView *v5;

  v4 = a3;
  v5 = self;
  sub_18E6F5190(v4);

}

- (void)interfaceStyleChanged
{
  _TtC7ChatKit23TapbackPickerButtonView *v2;
  id v3;

  v2 = self;
  v3 = -[TapbackPickerButtonView traitCollection](v2, sel_traitCollection);
  (*(void (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v2->super.super.super.super.super.isa) + 0xE8))();

}

@end
