@implementation HeaderView

- (_TtC24MenstrualCyclesAppPluginP33_DC9BCD437CC527D7196E44AD97FF4AE010HeaderView)initWithReuseIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
  {
    v3 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return (_TtC24MenstrualCyclesAppPluginP33_DC9BCD437CC527D7196E44AD97FF4AE010HeaderView *)sub_23197DFF8(v3, v4);
}

- (_TtC24MenstrualCyclesAppPluginP33_DC9BCD437CC527D7196E44AD97FF4AE010HeaderView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC24MenstrualCyclesAppPluginP33_DC9BCD437CC527D7196E44AD97FF4AE010HeaderView *result;

  v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_DC9BCD437CC527D7196E44AD97FF4AE010HeaderView_label;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC24MenstrualCyclesAppPluginP33_DC9BCD437CC527D7196E44AD97FF4AE010HeaderView *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_DC9BCD437CC527D7196E44AD97FF4AE010HeaderView_label));
}

@end
